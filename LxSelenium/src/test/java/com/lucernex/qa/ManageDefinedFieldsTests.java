package com.lucernex.qa;

/**
 * Created by RLE0097 on 18-05-2016.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of OrgChart oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                //Added to job Regression1FileUploadAndDownload
                //"target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/DefaultValues-Forms.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/DefaultValues-Pages.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/DefaultValues-SetupWizards.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/ManageDataFields-AddingNewDropdown.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/TablesThatDoNOTSupportClientDefinedFields.feature",
        },
        format = {"json:target/cucumber.json", "html:ManageDefinedFields"}
)
public class ManageDefinedFieldsTests {
}
