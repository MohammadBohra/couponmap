const cds = require('@sap/cds');
const fetch = require('node-fetch'); // Node >=18 has fetch globally

module.exports = cds.service.impl(async function () {    
    const BigCommerceAPI = await cds.connect.to("BigCommerceAPI");   // <== destination client

    const { Stores, CouponsMap } = cds.entities('CouponsMapService');
    // -------------------------
    // Authorization for Coupons
    // -------------------------
    this.before(['CREATE', 'UPDATE', 'DELETE'], 'CouponsMap', (req) => {
        if (!req.user.is('Admin')) {
            req.reject(403, 'You are not authorized to modify coupon data.');
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

            if (where) {
                const apiNameIndex = where.findIndex(c => c.ref && c.ref[0] === 'APIName');
                if (apiNameIndex !== -1 && where[apiNameIndex + 2]?.val) {
                    APIName = where[apiNameIndex + 2].val;
                }
            }

            if (!APIName) {
                return req.reject(400, 'Please provide an APIName filter.');
            }

            // Look up StoreHash based on APIName (which maps to WebServiceID)
            const store = await SELECT.one.from(Stores).where({ APIName: APIName });            
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
            req.error(500, 'Failed to fetch coupons from BigCommerce');
        }
    });
});
