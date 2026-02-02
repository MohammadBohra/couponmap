sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'bigcomdtc_couponmap',
            componentId: 'CouponsMapObjectPage',
            contextPath: '/CouponsMap'
        },
        CustomPageDefinitions
    );
});