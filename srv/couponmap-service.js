const cds = require('@sap/cds');
const axios = require("axios");

module.exports = cds.service.impl(async function() {

const BigCommerce = await cds.connect.to('BigCommerceAPI')

  const { BCCoupons } = this.entities;

  this.on('READ', 'BCCoupons', async req => {
    try {
      const coupons = await BigCommerce.send({
        method: 'GET',
        path: '/coupons'
      })

      return coupons.map(c => ({
        id: c.id,
        name: c.name,
        code: c.code,        
        type: c.type,
        enabled: c.enabled        
      }))
    } catch (e) {
      console.error('BigCommerce API error:', e)
      req.error(500, 'Failed to fetch coupons from BigCommerce')
    }
  })
});
  // const { Coupons } = this.entities;
  // this.before(['CREATE','UPDATE'], 'Coupons', (req) => {
  //   const { StartDate, EndDate } = req.data;
  //   if (StartDate && EndDate && new Date(EndDate) < new Date(StartDate)) {
  //     req.error(400, 'EndDate must be after StartDate');
  //   }
  // });

  // Example custom action (optional)
  // this.on('deactivate', 'CouponsMap', async req => {
  //   const id = req.data.ID;
  //   await UPDATE(Coupons).set({ IsActive: false }).where({ ID: id });
  //   return { success: true };
  // });


// Expose a custom action to fetch coupons from BigCommerce
//   this.on("getBigCommCoupons", async (req) => {
//     const { orderId } = req.data;

//     const storeHash = process.env.BC_STORE_HASH;
//     const token = process.env.BC_ACCESS_TOKEN;
//     const clientId = process.env.BC_CLIENT_ID;

//     try {
//       const response = await axios.get(
//         `https://api.bigcommerce.com/stores/${storeHash}/v2/orders/${orderId}/coupons`,
//         {
//           headers: {
//             "X-Auth-Token": token,
//             "X-Auth-Client": clientId,
//             "Accept": "application/json"
//           }
//         }
//       );

//       const coupons = response.data.map(c => ({
//         APIName: "BigCommerce",
//         BigCommCoupon: c.code,
//         SAPCoupon: "",  // can map later if needed
//         SKU: "",
//         MaxQuan: c.discounted_items_count || 0,
//         IsActive: true,
//         StartDate: new Date().toISOString().split("T")[0],
//         EndDate: new Date().toISOString().split("T")[0],
//         Description: c.name
//       }));

//       return coupons;

//     } catch (err) {
//       console.error("BigCommerce API error:", err.message);
//       req.error(500, "Failed to fetch coupons from BigCommerce.");
//     }
//   });


// });
