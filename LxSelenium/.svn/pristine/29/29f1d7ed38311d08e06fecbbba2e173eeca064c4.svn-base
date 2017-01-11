package com.lucernex.qa.datamart;

import com.lucernex.qa.utils.CucumberContext;
import com.lucernex.qa.utils.TripleDesCipher;
import cucumber.api.java.en.And;

import java.util.List;

import static junit.framework.Assert.*;

public class MappingSteps {
    @And("^I enter these field values into the Create Mapping form$")
    public void I_enter_these_field_values_into_the_Create_Mapping_form(
            List<Mapping> mappings
    ) throws Throwable {
        assertEquals(1, mappings.size());

        CreateMapping createMapping = (CreateMapping) CucumberContext.getCucumberContext().get(CreateMapping.class.getSimpleName());

        assertNotNull(createMapping);

        TripleDesCipher cipher = new TripleDesCipher();
        Mapping mapping = mappings.get(0);

        createMapping.setMappingName(mapping.getName());

        // Populate IWMS Source fields.
        createMapping.setLxUrl(mapping.getLxUrl());
        createMapping.setLxUserID(mapping.getLxUserID());
        createMapping.setLxPassWD(cipher.decryptIfPrefixed(mapping.getLxPassWD()));
        createMapping.setLxFirm(mapping.getLxFirm());

        // Populate Database Target fields.
        createMapping.setDBHost(mapping.getDbHost());
        createMapping.setDBName(mapping.getDbName());
        createMapping.setDBUserID(mapping.getDbUserID());
        createMapping.setDBPassWD(cipher.decryptIfPrefixed(mapping.getDbPassWD()));
    }

    @And("^I click the Edit button to see the Execution Schedule dialog$")
    public void I_click_the_Edit_button_to_see_the_Execution_Schedule_dialog() throws Throwable {
        CreateMapping createMapping = (CreateMapping) CucumberContext.getCucumberContext().get(
                CreateMapping.class.getSimpleName()
        );
        assertNotNull(createMapping);

        ExecutionScheduleDialog dialog = createMapping.clickEditButton();

        assertNotNull(dialog);

        CucumberContext.getCucumberContext().put(ExecutionScheduleDialog.class.getSimpleName(), dialog);
    }

    @And("^I click the \"([^\"]*)\" button on the Execution Schedule dialog$")
    public void I_click_the_button_on_the_Execution_Schedule_dialog(String button) throws Throwable {
        ExecutionScheduleDialog dialog = (ExecutionScheduleDialog) CucumberContext.getCucumberContext().get(
                ExecutionScheduleDialog.class.getSimpleName()
        );
        assertNotNull(dialog);

        if (button.equals("Save")) {
            dialog.clickSaveButton();
        } else if (button.equals("Cancel")) {
            dialog.clickCancelButton();
        } else {
            fail(String.format("Unknown button '%s' specified!", button));
        }
    }

    @And("^I click on the Create button on the Create Mapping form$")
    public void I_click_on_the_Create_button_on_the_Create_Mapping_form() throws Throwable {
        CreateMapping createMapping = (CreateMapping) CucumberContext.getCucumberContext().get(
                CreateMapping.class.getSimpleName()
        );
        assertNotNull(createMapping);
        createMapping.clickCreateButton();
    }
}
