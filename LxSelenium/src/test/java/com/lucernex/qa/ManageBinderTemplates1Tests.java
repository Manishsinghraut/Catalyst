package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Form oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageBinderTemplates/CreateAdHocBinder.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageBinderTemplates/ReOrderDocumentsInAdHocBinder.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageBinderTemplates/ReplaceAndUnassignFilesFromBinder.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageBinderTemplates/RegenerateBinder.feature"
        },
        format = {"json:target/cucumber.json", "html:ManageBinderTemplates1"}
)
public class ManageBinderTemplates1Tests {
}