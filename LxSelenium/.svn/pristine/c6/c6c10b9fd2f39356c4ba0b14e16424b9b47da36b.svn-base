package com.lucernex.qa.steps.iwms.adminpages.MemberAdministration.ManageSecurity;

import com.lucernex.qa.data.Field;
import com.lucernex.qa.data.SecurityAccessFields;
import com.lucernex.qa.views.admin.MemberAdministration.ManageSecurity.ManageSecurity.GCBiddingBidView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;

import java.util.List;

/**
 * Created by RLE0097 on 11/10/2015.
 */
public class GCBiddingBidSteps {

    @And("^I validate \"([^\"]*)\" Security access$")
    public void I_validate_Security_access(String strUserRole,List<SecurityAccessFields> fields) throws Throwable {
        GCBiddingBidView.securityAccess(strUserRole, fields);
    }

    @And("^I verify the \"([^\"]*)\" Lock status$")
    public void I_verify_the_Lock_status(String strName) throws Throwable {
        GCBiddingBidView.verifyLockStatus(strName);
    }

    @And("^I verify the \"([^\"]*)\" selected status \"([^\"]*)\"$")
    public void I_verify_the_selected_status(String strName, String strSelectedStatus) throws Throwable {
        GCBiddingBidView.verifySelectedStatus(strName, strSelectedStatus);
    }

    @And("^I click on Assign Budget Template$")
    public void I_click_on_Assign_Budget_Template() throws Throwable {
        GCBiddingBidView.assignBudgetTemplate();
    }

    @And("^I click \"([^\"]*)\" on \"([^\"]*)\" and verify Bid Invitation Email Subject \"([^\"]*)\",Field Label \"([^\"]*)\",Lx Script Name \"([^\"]*)\"$")
    public void I_click_on_and_verify_Bid_Invitation_Email_Subject_Field_Label_Lx_Script_Name(String strThreeDot, String strName, String strEmailSubject, String strFieldLabel, String strLxScriptName) throws Throwable {
        GCBiddingBidView.VerifyBidInvitationEmailSubject(strThreeDot, strName, strEmailSubject, strFieldLabel, strLxScriptName);
    }

    @And("^I Expand the \"([^\"]*)\" work flow to expose the first step to invite bidders$")
    public void I_Expand_the_work_flow_to_expose_the_first_step_to_invite_bidders(String strName) throws Throwable {
        GCBiddingBidView.inviteBidders(strName);
    }

    @And("^I click on Check Out button$")
    public void I_click_on_Check_Out_button() throws Throwable {
        GCBiddingBidView.checkOutButton();
    }

    @And("^I click on Invite Bidders button$")
    public void I_click_on_Invite_Bidders_button() throws Throwable {
        GCBiddingBidView.inviteBiddersButton();
    }

    @And("^I Drag and Drop module \"([^\"]*)\"$")
    public void I_Drag_and_Drop_module(String strModule) throws Throwable {
        GCBiddingBidView.dragAndDropModule(strModule);
    }

    @And("^I click on Submit Bid button$")
    public void I_click_on_Submit_Bid_button() throws Throwable {
        GCBiddingBidView.submitBidButton();
    }

    @And("^I click on \"([^\"]*)\" Link from \"([^\"]*)\"$")
    public void I_click_on_Link_from(String strLink, String strEntityName) throws Throwable {
        GCBiddingBidView.clickOnLinkFrom(strLink,strEntityName);
    }

    @And("^I click on Create Empty Bid button$")
    public void I_click_on_Create_Empty_Bid_button() throws Throwable {
        GCBiddingBidView.clickOnCreateEmptyBidButton();
    }

    @And("^I click on upload button$")
    public void I_click_on_upload_button() throws Throwable {
        GCBiddingBidView.uploadButton();
    }

    @And("^I click on close window button$")
    public void I_click_on_close_window_button() throws Throwable {
        GCBiddingBidView.clickOnCloseWindowButton();
    }

    @And("^I navigate to url \"([^\"]*)\"$")
    public void I_navigate_to_url(String strURL) throws Throwable {
        GCBiddingBidView.navigateToUrl(strURL);
    }

    @And("^I click on Run Nightly Bid Process button$")
    public void I_click_on_Run_Nightly_Bid_Process_button() throws Throwable {
        GCBiddingBidView.runNightlyBidProcessButton();
    }

    @And("^I click on Condition Bids button$")
    public void I_click_on_Condition_Bids_button() throws Throwable {
        GCBiddingBidView.clickOnConditionBidsButton();
    }

    @And("^I click on Notify Winning Bidder button$")
    public void I_click_on_Notify_Winning_Bidder_button() throws Throwable {
        GCBiddingBidView.notifyWinningBidderButton();
    }

    @And("^I change the Bid Close date to yesterday date$")
    public void I_change_the_Bid_Close_date_to_yesterday_date() throws Throwable {
        GCBiddingBidView.changeBidCloseDateToYesterdayDate();
    }

    @And("^I add current date as Bid open date$")
    public void I_add_current_date_as_Bid_open_date() throws Throwable {
        GCBiddingBidView.addCurrentDateAsBidOpenDate();
    }

    @And("^I add current date plus one day as Bid close date$")
    public void I_add_current_date_plus_one_day_as_Bid_close_date() throws Throwable {
        GCBiddingBidView.addCurrentDatePlus1DayAsBidCloseDate();
    }

    @And("^I add current date plus two days as construction start date$")
    public void I_add_current_date_plus_two_days_as_construction_start_date() throws Throwable {
        GCBiddingBidView.addCurrentDatePlus2DaysAsConstructionStartDate();
    }

    @And("^I click on the close button on pop window$")
    public void I_click_on_the_close_button_on_pop_window() throws Throwable {
        GCBiddingBidView.clickOnTheCloseButtonOnPopWindow();
    }

    @And("^I click on Start processing button$")
    public void I_click_on_Start_processing_button() throws Throwable {
        GCBiddingBidView.clickOnStartProcessingButton();
    }

    @And("^I processing of General contractor bid is done$")
    public void I_processing_of_General_contractor_bid_is_done() throws Throwable {
        GCBiddingBidView.processingOfGeneralContractorBidIsDone();
    }

    @And("^I click on \"([^\"]*)\" Conditioning default link$")
    public void I_click_on_Conditioning_default_link(String strVendor) throws Throwable {
        GCBiddingBidView.clickOnConditioningDefaultLink(strVendor);
    }

    @And("^I click on \"([^\"]*)\" default status link$")
    public void I_click_on_default_status_link(String strStatus) throws Throwable {
        GCBiddingBidView.clickOnDefaultStatusLink(strStatus);
    }

    @And("^I click on download Blank Spreadsheet button$")
    public void I_click_on_download_Blank_Spreadsheet_button() throws Throwable {
        GCBiddingBidView.clickOnDownloadBlankSpreadsheetButton();
    }

    @And("^I Upload Bid spreadsheet \"([^\"]*)\":$")
    public void I_Upload_Bid_spreadsheet_(String dataDir, List<String> files) {
        GCBiddingBidView.uploadBidSpreadsheet(dataDir, files);
    }

    @And("^I verify following Budget values in gird :$")
    public void I_verify_following_Budget_values_in_gird_(List<Field> fields) throws Throwable {
        GCBiddingBidView.verifyFollowingBudgetValuesInGird(fields);
    }

    @And("^I click on download button to download budget template Spreadsheet$")
    public void I_click_on_download_button_to_download_budget_template_Spreadsheet() throws Throwable {
        GCBiddingBidView.clickOnDownloadBudgetTemplateSpreadsheetButton();
    }


    @And("^I click on get notifications alerts link$")
    public void I_click_on_get_notifications_alerts_link() throws Throwable {
        GCBiddingBidView.clickGetNotificationsLink();
    }

    @And("^I click on download button to download \"([^\"]*)\" template Spreadsheet$")
    public void I_click_on_download_button_to_download_template_Spreadsheet(String strTemplateName) throws Throwable {
        GCBiddingBidView.clickOnDownloadBudgetTemplateSpreadsheetButton();
    }
}
