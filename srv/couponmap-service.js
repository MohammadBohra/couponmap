const cds = require('@sap/cds');
const fetch = require('node-fetch'); // Node >=18 has fetch globally

module.exports = cds.service.impl(async function () {
    const BigCommerceAPI = await cds.connect.to("BigCommerceAPI");   // <== destination client

    const { Stores, CouponsMap } = cds.entities('CouponsMapService');
    // -------------------------
    // Authorization for Coupons
    // -------------------------    

    this.before(['CREATE'], 'CouponsMap', async (req) => {
        if (!req.user.is('Admin')) {
            req.reject(403, 'You are not authorized to modify coupon data.');
        }

        const { APIName, BigCommCode } = req.data;

        const exists = await SELECT.one
            .from('ro.bigcomm.dtc.Coupons')
            .where({ APIName, BigCommCode });

        if (exists) {
            req.error(
                409,
                `A record with store name '${APIName}' and BigCommerce coupon '${BigCommCode}' already exists. Please use a different coupon to continue.`
            );
        }
    });

    this.before(['DELETE'], 'CouponsMap', async (req) => {
        if (!req.user.is('Admin')) {
            req.reject(403, 'You are not authorized to modify coupon data.');
        }
    });

    this.before(['CREATE'], 'Stores', async (req) => {
        if (!req.user.is('BigCommStAdmin')) {
            req.reject(403, 'You are not authorized to modify stores data.');
        }

        const { StoreHash,APIName} = req.data;

        const exists = await SELECT.one
            .from('ro.bigcomm.dtc.Stores')
            .where({ StoreHash});

        if (exists) {
            req.error(
                409,
                `A record with store hash '${StoreHash}' already exists. Please use a different store hash continue.`
            );
        }

        // const apinameexists = await SELECT.one
        //     .from('ro.bigcomm.dtc.Stores')
        //     .where({ APIName});

        // if (apinameexists) {
        //     req.error(
        //         409,
        //         `A record with Store Name '${APIName}' already exists. Please use a different Store Name to continue.`
        //     );
        // }
    });

     this.before('DELETE', 'Stores', async (req) => {
        if (!req.user.is('BigCommStAdmin')) {
            req.reject(403, 'You are not authorized to modify stores data.');
        }
    });

    


    // -------------------------
    // Feature Control for Fiori
    // -------------------------
    this.on('READ', 'FeatureControl', async (req) => {
        const isAdmin = req.user.is('Admin');
        const isITAdmin = req.user.is('BigCommStAdmin');
        return [{
            operationHidden: !isAdmin,
            itadmin: !isITAdmin
        }]
    });

    // -------------------------
    // BCCoupons: Fetch from BigCommerce
    // -------------------------
    this.on('READ', 'BCCoupons', async (req) => {
        try {
            const where = req.query?.SELECT?.where;
            let APIName;

            // if (where) {
            //     const apiNameIndex = where.findIndex(c => c.ref && c.ref[0] === 'APIName');
            //     if (apiNameIndex !== -1 && where[apiNameIndex + 2]?.val) {
            //         APIName = where[apiNameIndex + 2].val;
            //     }
            // }
            let StoreHash;
            if (where) {
                const apiNameIndex = where.findIndex(c => c.ref && c.ref[0] === 'StoreHash');
                if (apiNameIndex !== -1 && where[apiNameIndex + 2]?.val) {
                    StoreHash = where[apiNameIndex + 2].val;
                }
            }

            // if (!APIName) {
            //     return req.reject(400, 'Please provide an APIName filter.');
            // }

            if (!StoreHash) {
                return req.reject(400, 'Please provide an APIName filter.');
            }

            // Look up StoreHash based on APIName (which maps to WebServiceID)
            const store = await SELECT.one.from(Stores).where({ StoreHash: StoreHash });
            if (!store) {
                return req.reject(404, `No store found for APIName '${APIName}'`);
            }



            const storeHash = store.StoreHash;  // dynamic
            const authToken = store.AuthToken;  // dynamic

            const response = await BigCommerceAPI.send({
                method: "GET",
                path: `/stores/${storeHash}/v2/coupons`,
                headers: {
                    "X-Auth-Token": authToken,
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                }
            });
            if (!response) {
                const errorText = await response.text();
                console.error("BigCommerce API Error:", errorText);
                return;
            }

            // Map BigCommerce coupons to CAP entity
            return response.map(coupon => ({
                id: coupon.id,
                BigCommCoupon: coupon.name,
                BigCommCode: coupon.code,
                type: coupon.type,
                enabled: coupon.enabled,
                StoreHash: store.StoreHash,
                APIName: store.APIName
            }));

        } catch (e) {            
            console.error('BCCoupons error:', e);
            return [];
            return req.error(500, 'Failed to fetch coupons from BigCommerce.');
        }
    });
});
