package com.lucernex.qa;

import com.lucernex.qa.data.Field;
import com.lucernex.qa.pages.components.NonEditableFormOrPage;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import cucumber.api.java.en.And;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

import static com.google.common.base.Preconditions.checkArgument;


public class PageFormNonEditSteps {
    private NonEditableFormOrPage nonEditableLayout = PageFactory.initElements(BrowserDriver.getCurrentDriver(), NonEditableFormOrPage.class);



    @And("^I validate these field values on noneditable page$")
    public void I_validate_these_field_values_on_noneditable_page(List<Field> fields) throws Throwable {
        BaseView.switchToFrame();
        checkArgument(fields != null, "Required argument 'fields' is null!");


        nonEditableLayout.getAllFieldLabels();

        for (Field f : fields) {

            nonEditableLayout.assertFieldValue(f.getValue(), nonEditableLayout.getLabelToValueMap().get(f.getName()));
        }
    }
}

