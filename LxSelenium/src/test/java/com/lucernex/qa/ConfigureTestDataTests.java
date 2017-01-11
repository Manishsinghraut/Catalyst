package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 6/17/2015.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/ManageDefinedFields/1AManageFirmDropDowns.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManagePageLayouts/2ASetupPages.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageCompany/EntityBanners/CleanEntityBannerValues.feature",
                "target/test-classes/3ADataImport.feature"
        },
        format = {"json:target/cucumber.json","html:ConfigureTestDataTests"}
)
public class ConfigureTestDataTests {
}
