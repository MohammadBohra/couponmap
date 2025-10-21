using ro.bigcomm.dtc as db from '../db/schema';

service CouponsMapService @(path: '/catalog') {
  @odata.draft.enabled
  entity CouponsMap as projection on db.Coupons;
  entity BCCoupons {
        id           : Integer;
        key name         : String;
        code         : String;        
        type         : String;
        enabled      : Boolean;
    };
  
}