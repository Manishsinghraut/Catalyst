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
                "target/test-classes/iwms/Project/Details/Forms/1D_PrintableViewForm.feature",
                "target/test-classes/iwms/Project/Details/Forms/1E_ReplyToForm.feature",
                "target/test-classes/iwms/Project/Details/Forms/1F_CloseForm.feature",
                "target/test-classes/iwms/Project/Details/Forms/1G_ReOpenForm.feature",
                "target/test-classes/iwms/Project/Details/Forms/FormsSpreadsheet.feature"
        },
        format = {"json:target/cucumber.json", "html:Batchb1ManageForms"}
)
public class Batchb1ManageFormsTests {
}
