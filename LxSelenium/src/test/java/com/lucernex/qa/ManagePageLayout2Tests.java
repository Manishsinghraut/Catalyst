package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Form oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManagePageLayouts/AbilityToFormatNumbersToRedInNegativeValue.feature",
                "target/test-classes/iwms/SetupWizards/BuildSequenceNumberAndSiteSequenceNumberInPageLayout.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManagePageLayouts/GlobalChildDropdownFieldShouldWorkIfParentIsRead-Only.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManagePageLayouts/SmokeTestForRearrangingFieldsOnListLayoutAndViewingChangesOnPage.feature"
        },
        format = {"json:target/cucumber.json", "html:ManagePageLayout2"}
)
public class ManagePageLayout2Tests {
}
