package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of OrgChart oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Portfolio/OrgChart/1A_AddParentRegion.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1B_AddSubRegion.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1C_AddMarketToSubRegion.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1D_OrgChartDisplay.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1E_DeleteMarketAddedToSubRegion.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1F_AddMarketToParentRegion.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1G_DeleteMarketAddedToParentRegion.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1H_EditSubRegion.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1I_DeleteSubRegion.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1J_MigrateOrgChartToReferenceAndRestore.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1K_MigrateOrgChartToRestoreOriginal.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1L_MigratingOrgChartDifferentRegionsNegativeTest.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1M_EditParentRegion.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1N_DeleteParentRegion.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1O_MigratingOrgChartCreatenewRegionsuponMigration.feature",
    },
    format = {"json:target/cucumber.json","html:OrgChart"}
)
public class OrgChartTests {
}
