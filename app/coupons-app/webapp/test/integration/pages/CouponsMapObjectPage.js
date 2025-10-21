sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'ro.dtc.couponsapp',
            componentId: 'CouponsMapObjectPage',
            contextPath: '/CouponsMap'
        },
        CustomPageDefinitions
    );
});