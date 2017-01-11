package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by parameshwars on 6/20/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
        "target/test-classes/iwms/Portfolio/OrgChart/1J_MigrateOrgChartInitialOrgChartToReferenceAnotherOrgChart.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1K_MigrateOrgChartRestoreOriginalOrgChart.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1L_MigratingOrgChartDifferentRegionsNegativeTest.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/1O_MigratingOrgChartCreatenewRegionsuponMigration.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/OrgChartDisplay.feature",
        "target/test-classes/iwms/Portfolio/OrgChart/ApostropheCharacterInRegionOrSubRegionNameCausesInabilityToEditOrDeleteEntityInformation.feature"

        },
        format = {"json:target/cucumber.json","html:Batch12OrgChart"}
)
public class Batchb31OrgChartTests {
}
