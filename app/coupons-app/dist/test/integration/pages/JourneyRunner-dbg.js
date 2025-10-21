sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"ro/dtc/couponsapp/test/integration/pages/CouponsMapList",
	"ro/dtc/couponsapp/test/integration/pages/CouponsMapObjectPage"
], function (JourneyRunner, CouponsMapList, CouponsMapObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('ro/dtc/couponsapp') + '/test/flp.html#app-preview',
        pages: {
			onTheCouponsMapList: CouponsMapList,
			onTheCouponsMapObjectPage: CouponsMapObjectPage
        },
        async: true
    });

    return runner;
});

