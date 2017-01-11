package com.lucernex.qa.steps.iwms.setupwizards;

import com.lucernex.qa.data.Field;
import com.lucernex.qa.steps.iwms.GenericSteps;
import com.lucernex.qa.utils.PageFormNonEditableFields;
import com.lucernex.qa.views.BaseView;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;

import java.util.List;
import java.util.logging.Logger;

import static junit.framework.TestCase.fail;

public class FacilitySetupWizardSteps {
    private static final Logger logger = Logger.getLogger(GenericSteps.class.getName());
    @And("^I verify the Facility Summary fields value on non-editable summary tab$")
    public void I_verify_the_Facility_Summary_fields_value_on_non_editable_summary_tab(List<Field> fields) throws Throwable{
        try{
        	PageFormNonEditableFields.fieldValueSameRow(fields);
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the Property Organization fields value on non-editable summary tab$")
    public void I_verify_the_Property_Organization_fields_value_on_non_editable_summary_tab(List<Field> fields) throws Throwable{
        try{
        	PageFormNonEditableFields.fieldValueSameRow(fields);
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the General Information fields value on facility non-editable summary tab$")
    public void I_verify_the_General_Information_fields_value_on_facility_non_editable_summary_tab(List<Field> fields) throws Throwable{
        try {
            PageFormNonEditableFields.fieldValueSameRow(fields);
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }
}
