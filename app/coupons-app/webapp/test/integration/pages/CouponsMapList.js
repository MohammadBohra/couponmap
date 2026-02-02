sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'bigcomdtc_couponmap',
            componentId: 'CouponsMapList',
            contextPath: '/CouponsMap'
        },
        CustomPageDefinitions
    );
});