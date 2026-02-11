using CouponsMapService as service from '../srv/couponmap-service';

annotate service.CouponsMap with @(
    
    UI.FieldGroup #CouponDetails : {
        $Type: 'UI.FieldGroupType',
        Data: [
          { Value : APIName },
          { Value : Description },
        //  { Value : StoreHash },
         
          { Value : BigCommCode },
          { Value : SAPCoupon },
          
          { Value : BigCommCoupon,
            @Common.FieldControl : #ReadOnly}
          
        ]
    },
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
        //{ Value : StoreHash },        
        { Value : SKU },
        { Value : MaxQuan },  

        { Value : StartDate },
        { Value : EndDate },

        { Value : IsActive }
        ],
    },
    UI.Facets : [
        
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'CouponDetails',
            Label: 'Coupon Details',
            Target: '@UI.FieldGroup#CouponDetails'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Other Details',
            Target : '@UI.FieldGroup#GeneratedGroup',
        }
    ],
    UI.LineItem : [
        //{ Value : StoreHash },
        { Value : APIName },
        { Value : BigCommCode },        
        { Value : SAPCoupon },
        { Value : SKU },
        { Value : MaxQuan },
        { Value : IsActive },
        { Value : StartDate },
        { Value : EndDate },
        { Value : Description },
        { Value : BigCommCoupon }
    ],
    UI.SelectionFields: [
    APIName,
    StoreHash,
    BigCommCode,
    SAPCoupon,
    SKU
  ]
);

annotate service.CouponsMap with {
  
    BigCommCode @(
    Common.ValueList: {
      Label: 'BigComm Coupon',
      CollectionPath: 'BCCoupons',
      Parameters: [
        // {
        //   // dependency: APIName must be passed as input
        //   $Type: 'Common.ValueListParameterIn',
        //   LocalDataProperty: APIName,
        //   ValueListProperty: 'APIName'
        // },
        {
          $Type: 'Common.ValueListParameterIn',
          LocalDataProperty: APIName,
          ValueListProperty: 'StoreHash'
        },
        {
          $Type: 'Common.ValueListParameterInOut',
          LocalDataProperty: BigCommCode,
          ValueListProperty: 'BigCommCode'
        },
        {
          $Type: 'Common.ValueListParameterOut',
          LocalDataProperty: BigCommCoupon,
          ValueListProperty: 'BigCommCoupon'
        }
      ]
    }
  );


  APIName @(
    Common.ValueListWithFixedValues: true,
    Common.ValueList: {
      Label: 'Store',
      CollectionPath: 'Stores',
      Parameters: [
        {
        $Type: 'Common.ValueListParameterInOut',
        LocalDataProperty: StoreHash,
        ValueListProperty: 'APIName'
      }
      ]
    },
  );


  

};

annotate service.CouponsMap with @(
    Capabilities: {
        FilterRestrictions: {
            FilterExpressionRestrictions: [
                {
                    Property: 'APIName',
                    AllowedExpressions: 'SingleValue'
                }
            ]
        }
    }
);
