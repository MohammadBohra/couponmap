using CouponsMapService as service from '../srv/couponmap-service';

annotate service.CouponsMap with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'APIName',
                Value : APIName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'BigCommCoupon',
                Value : BigCommCoupon,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SAPCoupon',
                Value : SAPCoupon,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SKU',
                Value : SKU,
            },
            {
                $Type : 'UI.DataField',
                Label : 'MaxQuan',
                Value : MaxQuan,
            },
            {
                $Type : 'UI.DataField',
                Label : 'IsActive',
                Value : IsActive,
            },
            {
                $Type : 'UI.DataField',
                Label : 'StartDate',
                Value : StartDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'EndDate',
                Value : EndDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : Description,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'APIName',
            Value : APIName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'BigCommCoupon',
            Value : BigCommCoupon,
        },
        {
            $Type : 'UI.DataField',
            Label : 'SAPCoupon',
            Value : SAPCoupon,
        },
        {
            $Type : 'UI.DataField',
            Label : 'SKU',
            Value : SKU,
        },
        {
            $Type : 'UI.DataField',
            Label : 'MaxQuan',
            Value : MaxQuan,
        },
    ],
    UI.SelectionFields: [
    APIName,
    BigCommCoupon,
    SAPCoupon,
    SKU
  ]
);

annotate service.CouponsMap with {

    
    
  BigCommCoupon @(Common : {
            ValueList      : {
                Label : 'Big Comm Coupon',
                CollectionPath : 'BCCoupons',
                Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : name,
                ValueListProperty : 'name',
                
            }
            ]
    //         Parameters: [
    //     { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'code' },
    //     { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'name' }
    //   ]
        }       
    });

    APIName @(Common : {
            ValueList      : {
                Label : 'API Name',
                CollectionPath : 'CouponsMap',
                Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : APIName,
                ValueListProperty : 'APIName'
            }
            ]
        }       
    });

    SAPCoupon @(Common : {
            ValueList      : {
                Label : 'SAP Coupon',
                CollectionPath : 'CouponsMap',
                Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : SAPCoupon,
                ValueListProperty : 'SAPCoupon'
            }
            ]
        }       
    });

    SKU @(Common : {
            ValueList      : {
                Label : 'SKU',
                CollectionPath : 'CouponsMap',
                Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : SKU,
                ValueListProperty : 'SKU'
            }
            ]
        }       
    });  
  
};


// annotate service.CouponsMap with {
//   BigCommCoupon @Common.ValueList: {
//     CollectionPath: 'CouponsMap',
//     Parameters: [
//       {
//         $Type: 'Common.ValueListParameterOut',
//         LocalDataProperty: BigCommCoupon,
//         ValueListProperty: BigCommCoupon
//       }
//     ]
//   };
// };