using CouponsMapService as service from '../../srv/couponmap-service';
annotate service.Stores with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : StoreHash,
            },
            {
                $Type : 'UI.DataField',
                Value : APIName,
            },
            {
                $Type : 'UI.DataField',
                Value : WebServiceID,
            },
            {
                $Type : 'UI.DataField',
                Value : SoldToParty,
            },
            {
                $Type : 'UI.DataField',
                Value : ShipToParty,
            },
            {
                $Type : 'UI.DataField',
                Value : BillToParty,
            },
            {
                $Type : 'UI.DataField',
                Value : AuthToken,
            },
            {
                $Type : 'UI.DataField',
                Value : URL,
            },
            {
                $Type : 'UI.DataField',
                Value : SalesOrg,
            },
            {
                $Type : 'UI.DataField',
                Value : DistChannel,
            },
            {
                $Type : 'UI.DataField',
                Value : Division,
            },
            {
                $Type : 'UI.DataField',
                Value : DocType,
            },
            {
                $Type : 'UI.DataField',
                Value : CustAccGrp,
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
            Value : StoreHash,
        },
        {
            $Type : 'UI.DataField',
            Value : APIName,
        },
        {
            $Type : 'UI.DataField',
            Value : WebServiceID,
        },
        {
            $Type : 'UI.DataField',
            Value : SoldToParty,
        },
        {
            $Type : 'UI.DataField',
            Value : ShipToParty,
        },
    ],
);

