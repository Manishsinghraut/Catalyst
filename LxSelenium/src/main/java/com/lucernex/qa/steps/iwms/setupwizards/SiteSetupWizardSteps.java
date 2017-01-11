package com.lucernex.qa.steps.iwms.setupwizards;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.PageFormNonEditableFields;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import junit.framework.Assert;

import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static junit.framework.TestCase.fail;


/**
 * Created by RLE0097 on 3/26/2015.
 */
public class SiteSetupWizardSteps {
    private static final Logger logger = Logger.getLogger(SiteSetupWizardSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I verify the General Information fields value on site entity non-editable summary tab$")
    public void I_verify_the_General_Information_fields_value_on_project_entity_non_editable_summary_tab(List<Field> fields) throws Throwable{
        try {
            PageFormNonEditableFields.fieldValueSameRow(fields);
        } catch (Exception e) {
            logger.info("Error :"+e.getMessage());
            fail(e.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the Location fields value on site entity non-editable summary tab$")
    public void I_verify_the_Location_fields_value_on_project_entity_non_editable_summary_tab(List<Field> fields) throws Throwable{
        try{
            PageFormNonEditableFields.fieldValueSameRow(fields);
        } catch (Exception e) {
            logger.info("Error :"+e.getMessage());
            fail(e.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }
}