package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Form oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Project/Details/Forms/1A_AddFormToEntity.feature",
        "target/test-classes/iwms/Project/Details/Forms/1B_ViewForm.feature",
        "target/test-classes/iwms/Project/Details/Forms/1C_CheckOutForm.feature",
        "target/test-classes/iwms/Project/Details/Forms/1F_PrintableViewForm.feature",
        "target/test-classes/iwms/Project/Details/Forms/1G_ReplyToForm.feature",

        "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageForms/1E_AddFormLayout.feature",
        "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageForms/1B_EditFormLayout.feature",
        "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageForms/1C_ViewFormLayout.feature",
        "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageForms/1D_DeleteFormGroup.feature"
    },
        format = {"json:target/cucumber.json","html:ManageFormsTests"}
)
public class ManageFormsTests {
}
