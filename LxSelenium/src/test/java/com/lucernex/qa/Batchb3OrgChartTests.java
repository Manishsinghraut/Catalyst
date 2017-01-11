package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of OrgChart oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Portfolio/OrgChart/AddingParentRegion.feature",
                "target/test-classes/iwms/Portfolio/OrgChart/AddingSubRegion.feature",
                "target/test-classes/iwms/Portfolio/OrgChart/AddingMarketArea.feature",
                "target/test-classes/iwms/Portfolio/OrgChart/ApostropheCharacterInRegionOrSubRegionNameCausesInabilityToEditOrDeleteEntityInformation.feature"

        },
        format = {"json:target/cucumber.json", "html:Batch12OrgChart"}
)
public class Batchb3OrgChartTests {
}
