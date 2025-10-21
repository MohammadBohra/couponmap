namespace ro.bigcomm.dtc;

using { cuid,managed } from '@sap/cds/common';

entity Coupons : cuid,managed{
  APIName       : String(128);
  BigCommCoupon : String(40);
  SAPCoupon     : String(40);
  SKU           : String(64);
  MaxQuan       : Integer;
  IsActive      : Boolean;
  StartDate     : Date;
  EndDate       : Date;
  Description   : String(500);
}
