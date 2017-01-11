package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of OrgChart oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Project/Details/Summary/SetUpFacilityFromProjectPagePopulatingRegionField.feature"
        },
        format = {"json:target/cucumber.json", "html:SetupFacilityFromProject"}
)
public class SetupFacilityFromProjectTests {
}
