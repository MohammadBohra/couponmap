using ro.bigcomm.dtc as db from '../db/schema';

service CouponsMapService @(path: '/catalog') {
 @odata.draft.enabled
  entity CouponsMap as projection on db.Coupons;
  @odata.draft.enabled
  entity Stores as projection on db.Stores;

  //Add this helper entity for Fiori Feature Control 

  @cds.persistence.skip
  entity BCCoupons {
        id           : Integer;         
        BigCommCoupon : String @title : 'BigComm Coupon Name';
        key BigCommCode : String  @title : 'BigComm Coupon';        
        type         : String;
        enabled      : Boolean;
        StoreHash    : String(40);
        APIName      : String(25);
    };

@cds.persistence.skip
@odata.singleton
entity FeatureControl {
    operationHidden : Boolean;
    itadmin : Boolean;    
}
  
}

annotate CouponsMapService.CouponsMap with @(
  UI.CreateHidden: { $edmJson: { $Path: '/CouponsMapService.EntityContainer/FeatureControl/operationHidden' } },
  UI.UpdateHidden: { $edmJson: { $Path: '/CouponsMapService.EntityContainer/FeatureControl/operationHidden' } },
  UI.DeleteHidden: { $edmJson: { $Path: '/CouponsMapService.EntityContainer/FeatureControl/operationHidden' } }
);

annotate CouponsMapService.Stores with @(
  UI.CreateHidden: { $edmJson: { $Path: '/CouponsMapService.EntityContainer/FeatureControl/itadmin' } },
  UI.UpdateHidden: { $edmJson: { $Path: '/CouponsMapService.EntityContainer/FeatureControl/itadmin' } },
  UI.DeleteHidden: { $edmJson: { $Path: '/CouponsMapService.EntityContainer/FeatureControl/itadmin' } }
);