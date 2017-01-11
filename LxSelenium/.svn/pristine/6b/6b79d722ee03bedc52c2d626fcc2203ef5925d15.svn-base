package com.lucernex.qa.steps.iwms.setupwizards;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.PageFormNonEditableFields;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;

import com.lucernex.qa.views.iwms.project.details.SummaryTabView;
import cucumber.api.PendingException;
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
public class ProjectSetupWizardSteps {
    private static final Logger logger = Logger.getLogger(ProjectSetupWizardSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I verify the General Information fields value on project entity non-editable summary tab$")
    public void I_verify_the_General_Information_fields_value_on_project_entity_non_editable_summary_tab(List<Field> fields) throws Throwable{
        try {
            PageFormNonEditableFields.fieldValueSameRow(fields);
        } catch (Exception e) {
            logger.info("Error :"+e.getMessage());
            fail(e.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the General Information fields value on project entity non-editable summary tab in non frame page$")
    public void I_verify_the_General_Information_fields_value_on_project_entity_non_editable_summary_tab_in_non_frame_page(List<Field> fields) throws Throwable{
        try {
            PageFormNonEditableFields.fieldValueSameRow(fields);
        } catch (Exception e) {
            logger.info("Error :"+e.getMessage());
            fail(e.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the Location fields value on project entity non-editable summary tab$")
    public void I_verify_the_Location_fields_value_on_project_entity_non_editable_summary_tab(List<Field> fields) throws Throwable{
        try{
            PageFormNonEditableFields.fieldValueSameRow(fields);
        } catch (Exception e) {
            logger.info("Error :"+e.getMessage());
            fail(e.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the fields value on entity non-editable summary tab$")
    public void I_verify_the_fields_value_on_entity_non_editable_summary_tab(List<Field> fields) throws Throwable{
        try{
            PageFormNonEditableFields.fieldValueSameColumn(fields);
        } catch (Exception e) {
            logger.info("Error :"+e.getMessage());
            fail(e.getMessage());
            BaseView.takeScreenshot("summarytab.png");
        }
    }

    @And("^I verify the \"([^\"]*)\" value \"([^\"]*)\" on view popup window$")
    public void I_verify_the_value_on_view_popup_window(String strLabel,String strValue) throws Throwable {
        SummaryTabView.verifyPopupWindowValues(strLabel,strValue);
    }

    @And("^I verify project members \"([^\"]*)\" of step \"([^\"]*)\" in work flow$")
    public void I_verify_project_members_of_step_in_work_flow(String strMember,String strSteps) throws Throwable {
        SummaryTabView.verifyMemberOnworkflow(6,strSteps,strMember);
    }

    @And("^I verify Approver Member \"([^\"]*)\" of step \"([^\"]*)\" in work flow$")
    public void I_verify_Approver_Member_of_step_in_work_flow(String strMember,String strSteps) throws Throwable {
        SummaryTabView.verifyMemberOnworkflow(7,strSteps,strMember);
    }

    @And("^I verify Notifiee members \"([^\"]*)\" of step \"([^\"]*)\" in work flow$")
    public void I_verify_Notifiee_members_of_step_in_work_flow(String strMember,String strSteps) throws Throwable {
        SummaryTabView.verifyMemberOnworkflow(8,strSteps,strMember);
    }
}