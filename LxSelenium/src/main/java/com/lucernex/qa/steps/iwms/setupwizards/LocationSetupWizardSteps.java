package com.lucernex.qa.steps.iwms.setupwizards;

import com.lucernex.qa.data.Field;
import com.lucernex.qa.steps.iwms.GenericSteps;
import com.lucernex.qa.utils.PageFormNonEditableFields;
import com.lucernex.qa.views.BaseView;

import cucumber.api.java.en.And;

import java.util.List;
import java.util.logging.Logger;

import static junit.framework.TestCase.fail;

public class LocationSetupWizardSteps {
    private static final Logger logger = Logger.getLogger(GenericSteps.class.getName());

    @And("^I verify the Location Summary fields value on non-editable summary tab$")
    public void I_verify_the_Location_Summary_fields_value_on_non_editable_summary_tab(List<Field> fields){
        try{
            PageFormNonEditableFields.fieldValueSplitInTwoColumn(fields);
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the Location General Info fields value on non-editable summary tab$")
    public void I_verify_the_Location_General_Info_fields_value_on_non_editable_summary_tab(List<Field> fields) throws Throwable{
        try{
            PageFormNonEditableFields.summaryFieldsValue(fields, "Location General Info");
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the Location Address fields value on non-editable summary tab$")
    public void I_verify_the_Location_Address_fields_value_on_non_editable_summary_tab(List<Field> fields) throws Throwable{
        try{
            PageFormNonEditableFields.fieldValueSameRow(fields) ;
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the Location Region / Area Groups fields value on non-editable summary tab$")
    public void I_verify_the_Location_Region_Area_Groups_fields_value_on_non_editable_summary_tab(List<Field> fields) throws Throwable{
        try{
            PageFormNonEditableFields.fieldValueSameRow(fields);
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the Location Distribution fields value on non-editable summary tab$")
    public void I_verify_the_Location_Distribution_fields_value_on_non_editable_summary_tab(List<Field> fields){
        try{
            PageFormNonEditableFields.fieldValueSplitInTwoColumn(fields);
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the Location Organization Information fields value on non-editable summary tab$")
    public void I_verify_the_Location_Organization_Information_fields_value_on_non_editable_summary_tab(List<Field> fields){
        try{
            PageFormNonEditableFields.fieldValueSplitInTwoColumn(fields);
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the Location Contracts fields value on non-editable summary tab$")
    public void I_verify_the_Location_Contracts_fields_value_on_non_editable_summary_tab(List<Field> fields){
        try{
            PageFormNonEditableFields.fieldValueSplitInTwoColumn(fields);
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }
}
