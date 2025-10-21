using CouponsMapService as service from '../../srv/couponmap-service';
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
);




