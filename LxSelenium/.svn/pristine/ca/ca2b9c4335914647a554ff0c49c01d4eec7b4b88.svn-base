package com.lucernex.qa.steps.iwms.project.details.forms;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.GridUtils;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.parcel.ParcelSummaryView;
import com.lucernex.qa.views.iwms.project.details.forms.FormsTabView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
//import org.eclipse.jetty.util.log.Log;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.assertTrue;


/**
 * Created by RLE0097 on 4/16/2015.
 */
public class FormsSteps {
    private static final Logger logger = Logger.getLogger(FormsSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I expand all form lists$")
    public void I_expand_all_form_lists() throws Throwable {
        FormsTabView.clickExpandAll();
    }

    @And("^I collapse all form lists$")
    public void I_collapse_all_form_lists() throws Throwable {
        FormsTabView.clickCollapseAll();
    }

    @And("^I close form \"([^\"]*)\"$")
    public void I_close_form(String formName) throws Throwable {
        FormsTabView.clickCloseLink(formName);
        FormsTabView.confirmCloseForm();
    }

    @And("^I Reopen form \"([^\"]*)\"$")
    public void I_reopen_form(String formName) throws Throwable {
        FormsTabView.clickReopenLink(formName);
        FormsTabView.confirmReopenForm();
    }


    @And("^I verify I am at Form tab$")
    public void I_verify_I_am_at_form_tab() throws Throwable {
        FormsTabView.switchToFormTab();
    }

    @And("^I sort form list with status type \"([^\"]*)\"$")
    public void I_sort_form_list_with_status_type(String statusType) throws Throwable {
        FormsTabView.selectFormsStatusType(statusType);
        //FormsTabView.clickSubmit();
    }

    @And("^I click submit button$")
    public void I_click_submit_button() throws Throwable {
        FormsTabView.clickSubmit();
    }

    @And("^I click Print Preview link$")
    public void I_click_Print_Preview_link() throws Throwable {
        FormsTabView.clickPrintPreview();
    }

    @And("^I check 'Show Replies' checkbox$")
    public void I_check_show_replies_checkbox() throws Throwable {
        FormsTabView.checkShowRepliesCheckBox();
    }


    @Then("^I verify message \"([^\"]*)\"$")
    public void I_verify_message(String message) throws Throwable {
        assertTrue("The success message displayed after form action is not same as the input", FormsTabView.getSuccessMessage().contains(message));
        logger.info(message + " is displayed");
    }

    @And("^I verify form \"([^\"]*)\" is displayed in form list$")
    public void I_verify_form_displayed_in_form_list(String formName) throws Throwable {
        assertTrue("Form : '" + formName + "' is not displayed in form list", BaseView.isElementPresentNoWait(FormsTabView.getForm(formName)));
    }

    @Then("^I verify links available for form \"([^\"]*)\" will now be \"([^\"]*)\"$")
    public void I_verify_links_available_for_forms_will_now_be(String formName, String links) throws Throwable {
        FormsTabView.verifyFormLinks(formName, links);
    }

    @And("^I click \"([^\"]*)\" link for form \"([^\"]*)\"$")
    public void I_click_links_of_form(String links, String formName) throws Throwable {
        FormsTabView.clickLinks(links, formName);
    }

    @And("^I click \"([^\"]*)\" link for form layout \"([^\"]*)\"$")
    public void I_click_links_of_form_layout(String links, String formName) throws Throwable {
        FormsTabView.clickLink(links, formName);
    }


    @And("^I verify non editable form data in modal window$")
    public void I_click_links_of_form(List<String> files) throws Throwable {
        FormsTabView.verifyNonEditableData(files);
    }

    @And("^I verify non editable form data in print preview window$")
    public void I_verify_non_editable_form_data_in_print_preview_window(List<String> files) throws Throwable {
        FormsTabView.verifyPrintPreviewData(files);
    }

    @And("^I click \"([^\"]*)\" form button$")
    public void I_click_form_button(String buttonText) throws Throwable {
        FormsTabView.clickFormButtonsWhenReady(buttonText);
    }

    @And("^I select form type \"([^\"]*)\" in modal window$")
    public void I_select_form_type(String formType) throws Throwable {
        FormsTabView.selectFormType(formType);
    }

    @And("^I verify non editable data in row having unique value \"([^\"]*)\" in form grid$")
    public void I_verify_non_editable_data_in_form_grid(String uniqueRowValue,List<Field> fields) throws Throwable {
        for(Field f : fields){
            FormsTabView.formGrid(f.getName(), f.getValue(),uniqueRowValue,"table.linedTable");
        }
    }

    @And("^I verify non editable reply data in row having unique value \"([^\"]*)\" in form grid$")
    public void I_verify_non_editable_reply_data_in_form_grid(String uniqueRowValue,List<Field> fields) throws Throwable {
        for(Field f : fields){
            if (f.getValue().contains("[CURRENT DATE]")) {
                f.setValue(SeleniumUtil.addDaystoCurrentDate(0));
            }
            //FormsTabView.formGrid(f.getName(), f.getValue(),uniqueRowValue,".linedTable table.rowColor1");
            FormsTabView.formGrid(f.getName(), f.getValue(),uniqueRowValue,"table.rowColor1");
        }
    }

    @And("^I Download Sample CustomList Template$")
    public void I_Download_Sample_CustomList_Template() throws Throwable {
        FormsTabView.downloadSampleCustomListTemplate();
    }

    @And("^I verify spreed sheet imported Fields that are not editable will not appear in the UI.$")
    public void I_verify_spreed_sheet_imported_Fields_that_are_not_editable_will_not_appear_in_the_UI() throws Throwable {
        FormsTabView.verifyUploadedFields();
    }

    @And("^I fetch entity ID from form$")
    public void I_fetch_entity_ID_from_parcel_form() throws Throwable {
        FormsTabView.getFormRecID();
    }

    @And("^I verify Method Of Contact field \"([^\"]*)\" values on Form page is \"([^\"]*)\"$")
    public void I_verify_Method_Of_Contact_field_values_on_Form_page(int number, String value) throws Throwable {
        FormsTabView.verifyMethodOfContactField(number, value);
    }

    @And("^I verify exist issue field \"([^\"]*)\" values on Form page is \"([^\"]*)\"$")
    public void I_verify_issue_field_values_on_Form_page(int number,boolean value) throws Throwable {
        FormsTabView.verifyIssueExistField(number, value);
    }


    @And("^I click on the \"([^\"]*)\" link for title \"([^\"]*)\"$")
    public void I_click_on_the_link_for_title(String strLink, String strTitle) throws Throwable {
       FormsTabView.clickCheckOutLinks(strLink,strTitle);
    }

    @And("^I verify following sub row values of grid \"([^\"]*)\" and sub-grid \"([^\"]*)\" in frame page$")
    public void I_verify_following_sub_row_values_of_frame_grid(String grid, String subGridID,List<List<String>> values) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllSubGridTypes(grid, subGridID, values);
    }

    @And("^I verify following sub row values of grid \"([^\"]*)\" and sub-grid \"([^\"]*)\" in non frame page$")
    public void I_verify_following_sub_row_values_of_non_frame_grid(String grid, String subGridID,List<List<String>> values) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        GridUtils.assertAllSubGridTypes(grid, subGridID, values);
    }

    @And("^I verify form type \"([^\"]*)\" does not exist in dropdown in modal window$")
    public void I_verify_form_type_does_not_exist_in_dropdown_in_modal_window(String strOptionValue) throws Throwable {
        FormsTabView.verifyDropdownValueDoesNot(strOptionValue);
    }

    @And("^I click on > button to add \"([^\"]*)\"$")
    public void I_click_on_button_to_add(String arg1) throws Throwable {
        FormsTabView.clickAddApproverButton(arg1);
    }
}