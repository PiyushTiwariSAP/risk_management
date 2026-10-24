sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project1/test/integration/pages/risk_setList.gen",
	"project1/test/integration/pages/risk_setObjectPage.gen",
	"project1/test/integration/pages/miti_setObjectPage.gen"
], function (JourneyRunner, risk_setListGenerated, risk_setObjectPageGenerated, miti_setObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project1') + '/test/flpSandbox.html#project1-tile',
        pages: {
			onTherisk_setListGenerated: risk_setListGenerated,
			onTherisk_setObjectPageGenerated: risk_setObjectPageGenerated,
			onThemiti_setObjectPageGenerated: miti_setObjectPageGenerated
        },
        async: true
    });

    return runner;
});

