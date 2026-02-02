sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"bigstores/test/integration/pages/StoresList",
	"bigstores/test/integration/pages/StoresObjectPage"
], function (JourneyRunner, StoresList, StoresObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('bigstores') + '/test/flp.html#app-preview',
        pages: {
			onTheStoresList: StoresList,
			onTheStoresObjectPage: StoresObjectPage
        },
        async: true
    });

    return runner;
});

