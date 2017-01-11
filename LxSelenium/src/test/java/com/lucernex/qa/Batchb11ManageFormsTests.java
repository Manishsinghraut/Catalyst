package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by parameshwars on 6/20/2015.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageForms/CreateAFormLayout.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageForms/EditFormLayout.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageForms/DeleteFormGroup.feature"
        },
        format = {"json:target/cucumber.json","html:Batch11ManageForms"}
)
public class Batchb11ManageFormsTests {
}
