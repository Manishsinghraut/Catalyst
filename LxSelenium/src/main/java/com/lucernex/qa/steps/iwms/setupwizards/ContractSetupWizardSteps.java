package com.lucernex.qa.steps.iwms.setupwizards;

import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.PageFormNonEditableFields;

import com.lucernex.qa.views.BaseView;
import cucumber.api.java.en.And;

import java.util.List;
import java.util.logging.Logger;

import static junit.framework.TestCase.fail;

public class ContractSetupWizardSteps {
    private static final Logger logger = Logger.getLogger(ContractSetupWizardSteps.class.getName());
    @And("^I verify the summary fields value on non-editable contract summary tab$")
    public void I_verify_the_summary_fields_value_on_non_editable_contract_summary_tab(List<Field> fields) throws Throwable{
        try{
            PageFormNonEditableFields.fieldValueSameRow(fields);
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the location fields value on non-editable contract summary tab$")
    public void I_verify_the_location_fields_value_on_non_editable_contract_summary_tab(List<Field> fields){
        try{
            PageFormNonEditableFields.fieldValueInTable(fields);
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the parcel fields value on non-editable contract summary tab$")
    public void I_verify_the_parcel_fields_value_on_non_editable_contract_summary_tab(List<Field> fields){
        try{
            PageFormNonEditableFields.fieldValueInTable(fields);
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the facility fields value on non-editable contract summary tab$")
    public void I_verify_the_facility_fields_value_on_non_editable_contract_summary_tab(List<Field> fields){
        try{
            PageFormNonEditableFields.fieldValueInTable(fields);
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the notes fields value on non-editable contract summary tab$")
    public void I_verify_the_notes_fields_value_on_non_editable_contract_summary_tab(List<Field> fields){
        try{
            PageFormNonEditableFields.fieldValueInTable(fields);
        }
        catch(Exception ex){
            logger.info("Error :"+ex.getMessage());
            fail(ex.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }
}
