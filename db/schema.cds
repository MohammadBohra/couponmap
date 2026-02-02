namespace ro.bigcomm.dtc;

using { cuid,managed } from '@sap/cds/common';

entity Coupons: managed {
  ID           : UUID        @title : 'Coupon ID';    
  StoreHash       : String(25) @UI.HiddenFilter : true @UI.Hidden : true;  
  key APIName          : String(25) @title : 'API Name' @mandatory;
  key BigCommCode       : String(25) @title : 'BigComm Coupon' @mandatory;
  BigCommCoupon    : String(25)  @title : 'BigComm Coupon Name' @mandatory;
  key SAPCoupon        : String(10)  @title : 'SAP Coupon' @mandatory;
  SKU              : String(20)  @title : 'SKU Number' @mandatory default '__ALL_SKUS__';
  MaxQuan          : Integer     @title : 'Maximum Quantity';
  IsActive         : Boolean     @title : 'Active';
  StartDate        : Date        @title : 'Start Date' default current_date;
  EndDate          : Date        @title : 'End Date' default '9999-12-31';
  Description      : String(50) @title : 'Description';
}


entity Stores {
  key StoreHash      : String(40) @title : 'Store Hash' @mandatory;
      APIName      : String(25) @title : 'Store Name' @mandatory;
      WebServiceID   : String(20) @title : 'WebService ID';
      SoldToParty    : String(20) @title : 'Sold To Party' ;
      ShipToParty    : String(20) @title : 'Ship To Party' ;
      BillToParty    : String(20) @title : 'Bill To Party' ;
      AuthToken      : String(40) @title : 'Auth Token' ;
      URL            : String(50) @title : 'URL' ;
      SalesOrg       : String(4) @title : 'Sales Organization' ;
      DistChannel    : String(2) @title : 'Distribution Channel' ;
      Division       : String(2) @title : 'Division Channel' ;
      DocType        : String(4) @title : 'Document Type' ;
      CustAccGrp     : String(4) @title : 'Customer Account Group' ;
}


