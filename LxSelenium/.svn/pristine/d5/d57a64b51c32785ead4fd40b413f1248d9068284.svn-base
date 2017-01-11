package com.lucernex.qa;

import com.lucernex.qa.data.Field;
import com.lucernex.qa.views.components.ModalDialogView;
import com.lucernex.qa.views.components.ModalDialogViewFactory;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class ModalDialogSteps {
    private ModalDialogView dialog = null;

    @And("^I see the \"([^\"]*)\" modal dialog$")
    public void I_see_the_modal_dialog(String dialogTitle) throws Throwable {
        dialog = ModalDialogViewFactory.createModalDialogView(dialogTitle);
        dialog.waitForModalWindow();
    }

    @And("^I see these fields in the modal dialog:$")
    public void I_see_these_fields_in_the_modal_dialog(List<String> fieldLabels) throws Throwable {
        assertNotNull(dialog);

        List<String> actualFieldLabels = dialog.getFieldLabels();

        assertNotNull(actualFieldLabels);
        assertEquals(fieldLabels.size(), actualFieldLabels.size());

        for (int i = 0; i < fieldLabels.size(); i++) {
            String expected = actualFieldLabels.get(i);
            String   actual = fieldLabels.get(i);

            assertEquals(expected, actual);
        }
    }

    @And("^I enter these field values in the modal dialog:$")
    public void I_enter_these_field_values_in_the_modal_dialog(List<Field> fields) throws Throwable {
        assertNotNull(dialog);

        for (com.lucernex.qa.data.Field f : fields) {
            dialog.setFieldValue(f.getName(), f.getValue());
        }
    }

    @And("^I click the \"([^\"]*)\" button in the modal dialog$")
    public void I_click_the_button_in_the_modal_dialog(String buttonLabel) throws Throwable {
        assertNotNull(dialog);

        dialog.clickButton(buttonLabel);
    }

    @And("^I wait for processing to finish with error \"([^\"]*)\"$")
    public void I_wait_for_processing_to_finish_with_error(String msg) throws Throwable {
        assertNotNull(dialog);

        dialog.waitForProcessingFinish(msg);
    }
}
