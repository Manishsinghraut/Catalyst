package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of OrgChart oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageCustomLists/AddCustomListToFormLayout.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageCustomLists/DeleteCustomList.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageCustomLists/PartsInCustomLists.feature"
        },
        format = {"json:target/cucumber.json", "html:Batchb5ManageCustomLists"}
)
public class Batchb5ManageCustomListsTests {
}
