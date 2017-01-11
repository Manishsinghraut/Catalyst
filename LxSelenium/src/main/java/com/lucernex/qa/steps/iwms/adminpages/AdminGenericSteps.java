package com.lucernex.qa.steps.iwms.adminpages;

import com.lucernex.qa.data.ClickFields;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.views.admin.AdminGridView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.AdminGenericView;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.contract.details.summary.ExtendContractView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

import java.util.List;
import java.util.logging.Logger;

/**
 * Created by RLE0097 on 6/16/2015.
 */
public class AdminGenericSteps {
    private static final Logger logger = Logger.getLogger(AdminGenericSteps.class.getName());

    @Given("^I set the values \"([^\"]*)\" in search text field and hit the enter key$")
    public void I_set_the_values_in_search_text_field_and_hit_the_enter_key(String strSearchText) throws Throwable {
        AdminGenericView.setValuesInSearchField(strSearchText);
    }

    @And("^I select following entities checkbox from model window$")
    public void I_select_following_entities_checkbox_from_model_window(List<ClickFields> fields) {
        AdminGenericView.checkEntityCheckboxes(fields);
    }

    @And("^I select existing layout \"([^\"]*)\"$")
    public void I_select_existing_layout(String layoutName) throws Throwable {
        AdminGenericView.selectLayout(layoutName);
    }

    @And("^I verify a row from non frame grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_row_from_grid_having_unique_value_under_header_generic(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickUniqueGrid(gridID, uniqueValue, header, fields);
    }

    @And("^I select contract radio button grid$")
    public void I_select_contract_radio_button_grid() throws Throwable {
        AllContractPagesView.selectContractRadio();
    }

    @And("^I select user class \"([^\"]*)\"$")
    public void I_select_user_class(String value) throws Throwable {
        AdminGenericView.selectUserClass(value);
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I select security access for the following$")
    public void I_select_security_access_for_the_following(List<List<String>> access) throws Throwable {
        for (List<String> a : access) {
            AdminGenericView.selectSecurityAccess(a.get(0), a.get(1));
        }
    }

    @And("^I expand the following folders$")
    public void I_expand_the_following_folders(List<String> folders) throws Throwable {
        for (String folder : folders) {
            AdminGenericView.expandFolders(folder);
        }
    }

    @And("^I verify the contract type selected value$")
    public void I_verify_the_contract_type_selected_value(List<Field> fields) throws Throwable {
        CommonMethods.verifySelectedContractType(fields);
    }

    @And("^I verify a single photo uploaded successfully$")
    public void I_verify_a_single_photo_uploaded_successfully() throws Throwable {
        CommonMethods.verifyImageUpload();
    }

    @And("^I enter \"([^\"]*)\" of \"([^\"]*)\" \"([^\"]*)\" and \"([^\"]*)\" \"([^\"]*)\"$")
    public void I_enter_of_and(String strFiscalCalendar, String strYear, String strYearValue, String strTotalPeriods, String strTotalPeriodsValues) throws Throwable {
        AdminGenericView.enterValuesInMultiPeriodAddLength(strFiscalCalendar, strYear, strYearValue, strTotalPeriods, strTotalPeriodsValues);
    }

    @And("^I enter Multi-Period Add by weeks of \"([^\"]*)\" \"([^\"]*)\" and \"([^\"]*)\" \"([^\"]*)\"$")
    public void I_enter_Multi_Period_Add_by_weeks_of_and(String strYear, String strYearValue, String strTotalPeriods, String strTotalPeriodsValues) throws Throwable {
        AdminGenericView.enterValuesInMultiPeriodAddWeek(strYear, strYearValue, strTotalPeriods, strTotalPeriodsValues);
    }

    @And("^I enter year \"([^\"]*)\", Fiscal Year Start \"([^\"]*)\", Weeks each period \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
    public void I_enter_year_Fiscal_Year_Start_Weeks_each_period_(String strYear, String strFiscalYear, String strWKP1, String strWKP2, String strWKP3, String strWKP4, String strWKP5, String strWKP6, String strWKP7, String strWKP8, String strWKP9, String strWKP10, String strWKP11, String strWKP12) throws Throwable {
        AdminGenericView.enterValuesInYearFiscalYearStartAndWeeksEachPeriod(strYear, strFiscalYear, strWKP1, strWKP2, strWKP3, strWKP4, strWKP5, strWKP6, strWKP7, strWKP8, strWKP9, strWKP10, strWKP11, strWKP12);
    }

    @And("^I click on \"([^\"]*)\"$")
    public void I_click_on(String arg1) throws Throwable {
        AdminGenericView.clickOnCreatePeriodsForYear();
    }

    @And("^I verify date header on the week view page$")
    public void I_verify_date_header_on_the_week_view_page() throws Throwable {
        AdminGenericView.verifyCalendarDateHeader();
    }

    @And("^I verify date header on the month view page$")
    public void I_verify_date_header_on_the_month_view_page() throws Throwable {
        AdminGenericView.verifyCalendarDateMonthHeader();
    }

    @And("^I verify tab \"([^\"]*)\" is selected by default$")
    public void I_verify_tab_is_selected_by_default(String tab) throws Throwable {
        AdminGenericView.verifyTabSelectedByDefault(tab);
    }

    @Then("^I verify the following message$")
    public void I_verify_success_message(List<String> arg1) throws Throwable {
        AdminGenericView.validateContractExtendedSuccessMessage(arg1);
    }

    @And("^I verify row from non frame grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_row_from_non_frame_grid_having_unique_value_under_column_header(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.verifyRowValuesInGrid(gridID, uniqueValue, header, fields);
    }

    @And("^I select List Inactive radio button$")
    public void I_select_List_Inactive_radio_button() throws Throwable {
        AllContractPagesView.clickOnListInactive();
    }

    @And("^I click on \"([^\"]*)\" step (\\d+) of Form/Task \"([^\"]*)\" to assignee member$")
    public void I_click_on_step_of_Form_Task_to_assignee_member(String strLink, int arg2, String strFormTask) throws Throwable {
        AllContractPagesView.assignMemberToFormTask(strLink, strFormTask);
    }

    @And("^I select following Multi Value from dropdown$")
    public void I_select_following_Multi_Value_from_dropdown(List<String> arrFields) throws Throwable {
        AdminGenericView.selectMultiValue(arrFields);
    }

    @And("^I select the template line items \"([^\"]*)\" under \"([^\"]*)\"$")
    public void I_select_the_template_line_items_under(String strTreeItem, String strItem) throws Throwable {
        AdminGenericView.selectTemplateLineItems(strTreeItem, strItem);
    }

    @And("^I export the following$")
    public void I_export_the_following(List<String> items) throws Throwable {
        AdminGenericView.export(items);
    }

    @And("^I select the template line item \"([^\"]*)\" under \"([^\"]*)\"$")
    public void I_select_the_template_line_item_under(String strTreeItem, String strItem) throws Throwable {
        AdminGenericView.selectTemplateLineItem(strTreeItem, strItem);
    }

    @And("^I select \"([^\"]*)\" security access for \"([^\"]*)\" Forms$")
    public void I_select_security_access_for_(String accessType, String entity) throws Throwable {
        AdminGenericView.selectSecurityAccessForForms(accessType, entity);
    }

    @And("^I navigate to admin dashboard and discard changes \"([^\"]*)\"$")
    public void I_navigate_to_admin_dashboard_and_discard_changes(String alertMsg) throws Throwable {
        AdminGenericView.navigateToAdminPageAndDismissTheAlert(alertMsg);
    }

    @And("^I select \"([^\"]*)\" security access in the following hierarchy$")
    public void I_select_security_access_in_the_following_hierarchy(String accessType, List<String> entity) throws Throwable {
        AdminGenericView.selectSecurityAccess(accessType, entity);
    }
}
