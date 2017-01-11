package com.lucernex.qa.steps.iwms.contract;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.*;
import com.lucernex.qa.utils.CucumberContext;
import com.lucernex.qa.utils.GridUtils;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.admin.AdminGridView;
import com.lucernex.qa.views.components.PortfolioNavigationView;
import com.lucernex.qa.views.entity.GenericEntityView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.costmanagement.BudgetTemplateView;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.site.details.summary.SiteSurveyView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.net.URL;
import java.util.List;
import java.util.logging.Logger;

import static com.lucernex.qa.utils.GridUtils.verifyRowValues;
import static com.lucernex.qa.views.iwms.adminpages.companyadministration.managecustomlist.CustomListView.addLineItemsToForm;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;


/**
 * Created by RLE0239 on 05/14/2015.
 */
public class AllContractPagesSteps {
    private static final Logger logger = Logger.getLogger(AllContractPagesSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @Then("^I verify page title \"([^\"]*)\" after navigation$")
    public void I_verify_page_title(String title) throws Throwable {
        AllContractPagesView.iAmAtTermsTab(title);
    }

    @Then("^I verify title \"([^\"]*)\" in a frame page$")
    public void I_verify_title_in_a_frame_page(String title) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        AllContractPagesView.verifyPageTitle(title);
    }

    @And("^I click on the \"([^\"]*)\" button in message box$")
    public void I_click_on_the_button_in_message_box(String arg1) throws Throwable {
        AllContractPagesView.clickButtonInMessageBox(arg1, false);
    }

    @And("^I click on the \"([^\"]*)\" button in message box \"([^\"]*)\"$")
    public void I_click_on_the_button_in_message_box_named(String buttonName, String msgBoxName) throws Throwable {
        AllContractPagesView.clickButtonInMessageBox(buttonName, msgBoxName);
    }

    @Then("^I verify \"([^\"]*)\" message appear in top left corner of page$")
    public void I_verify_message_will_appear_in_top_left_corner_of_page(String arg1) throws Throwable {
        AllContractPagesView.successMessage(arg1);
    }

    @Then("^I verify \"([^\"]*)\" message appear after generating rent$")
    public void I_verify_message_message_appear_after_generating_rent(String arg1) throws Throwable {
        AllContractPagesView.generateRentMessage(arg1);
    }

    @Then("^I verify \"([^\"]*)\" message$")
    public void I_verify_message_message(String arg1) throws Throwable {
        AllContractPagesView.generateRentMessage(arg1);
    }

    @Then("^I verify \"([^\"]*)\" message after copying transaction$")
    public void I_verify_message_message_appear_after_copying_transaction(String arg1) throws Throwable {
        AllContractPagesView.generateRentMessage(arg1);
    }

    @Then("^I verify \"([^\"]*)\" error message appear in top left corner of page$")
    public void I_verify_error_message_will_appear_in_top_left_corner_of_page(String arg1) throws Throwable {
        AllContractPagesView.errorMessage(arg1);
    }

    @Then("^I close error message pop up$")
    public void I_close_error_message_pop_up() throws Throwable {
        AllContractPagesView.closeErrorMessage();
    }

    @Then("^I verify row from grid \"([^\"]*)\" having unique value \"([^\"]*)\"$")
    public void I_verify_row_from_grid_having_unique_value(String gridID, String uniqueValue, List<Field> fields) throws Throwable {
        AllContractPagesView.verifyGridRow(gridID, uniqueValue, fields);
    }

    @Then("^I verify row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_row_from_grid_having_unique_value_under_column_header(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        AllContractPagesView.verifyUniqueGridRow(gridID, uniqueValue, header, fields);
    }

    @Then("^I verify grid row \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_grid_row_having_unique_value_under_column_header_generic(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        AllContractPagesView.verifyGridValues(gridID, uniqueValue, header, fields);
    }

    @Then("^I click row from grid \"([^\"]*)\" having unique value \"([^\"]*)\"$")
    public void I_click_row_from_grid_having_unique_value(String gridID, String uniqueValue) throws Throwable {
        AllContractPagesView.clickGridRow(gridID, uniqueValue);
    }

    @Then("^I click row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_click_row_from_grid_having_unique_value_under_header(String gridID, String uniqueValue, String header) throws Throwable {
        AllContractPagesView.clickUniqueGridRow(gridID, uniqueValue, header);
    }

    @And("^I click on row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_click_row_from_grid_having_unique_value_under_header_generic(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickUniqueGrid(gridID, uniqueValue, header, fields);
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I click on row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\" in non frame page$")
    public void I_click_row_from_grid_having_unique_value_under_header_generic_in_non_frame_page(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickUniqueGrid(gridID, uniqueValue, header, fields);
        CommonMethods.waitTillDivisionLoads();
    }


    @And("^I select a row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_select_row_from_grid_having_unique_value_under_header_generic(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickUniqueGrid(gridID, uniqueValue, header, fields);
    }

    @And("^I verify a row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_row_from_grid_having_unique_value_under_header_generic(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        PortfolioNavigationView.collapsePortfolioNavigationTab();
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickUniqueGrid(gridID, uniqueValue, header, fields);
    }

    @And("^I verify a unique row in grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_row_from_grid_having_unique_value_under_header_generic_no_switching_to_frame(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickUniqueGrid(gridID, GenericEntityView.convertToFormatPattern(uniqueValue), header, fields);
    }

    @And("^I view a unique row in grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_view_row_from_grid_having_unique_value_under_header_generic_no_switching_to_frame(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.viewUniqueGrid(gridID, GenericEntityView.convertToFormatPattern(uniqueValue), header, fields);
    }


    @And("^I switch to third level tab$")
    public void I_switch_to_third_level_tab() throws Throwable {
        AllContractPagesView.switchToFrame();
    }

    @And("^I switch to visible frame$")
    public void I_switch_to_visible_frame() throws Throwable {
        AllContractPagesView.switchToFrame();
    }

    @Then("^I verify row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" not present$")
    public void I_verify_row_from_grid_having_unique_value(String gridID, String uniqueValue) throws Throwable {
        PortfolioNavigationView.collapsePortfolioNavigationTab();
        AllContractPagesView.verifyGridRowNotPresent(gridID, uniqueValue);
    }

    @Then("^I verify row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" not present under column header \"([^\"]*)\"$")
    public void I_verify_row_from_grid_having_unique_value_under_column_header(String gridID, String cellValue, String header) throws Throwable {
        AllContractPagesView.verifyGridRowNotPresentUnderHeader(gridID, cellValue, header);
    }

    @And("^I check \"([^\"]*)\" expense setup$")
    public void I_check_expense_setup(String expenseSetup) throws Throwable {
        AllContractPagesView.checkExpenseSetup(expenseSetup);
    }

    @And("^I check the following contracts$")
    public void I_check_the_following_contracts(List<String> contracts) throws Throwable {
        for (String contract : contracts) {
            AllContractPagesView.checkContracts(contract);
        }
    }

    @Then("^I hit enter key on search field$")
    public void I_hit_enter_key_on_search_field() throws Throwable {
        AllContractPagesView.hitEnterKey();
    }

    @Then("^I hit enter key on search field after entering value \"([^\"]*)\"$")
    public void I_hit_enter_key_on_search_field_entering_value(String value) throws Throwable {
        AllContractPagesView.hitEnterKey(value);
    }

    @And("^I enter search text \"([^\"]*)\" in search field$")
    public void I_enter_search_text_in_search_field(String searchText) throws Throwable {
        AllContractPagesView.enterSearchText(searchText);
    }

    @Then("^I verify the following table headers after navigation$")
    public void I_verify_page_title(List<String> headers) throws Throwable {
        for (String s : headers) {
            AllContractPagesView.getTableHeader(s);
        }
    }

    @And("^I enter rentable area value \"([^\"]*)\" in field$")
    public void I_enter_rentable_area_value_in_field(String rentableArea) throws Throwable {
        AllContractPagesView.enterRentableAreaInContractDetailsPage(rentableArea);
    }

    @And("^I clear rentable area value in the field$")
    public void I_clear_rentable_area_value_in_field() throws Throwable {
        AllContractPagesView.clearRentableAreaInContractDetailsPage();
    }

    @And("^I click on \"([^\"]*)\" grid button")
    public void I_click_on_grid_button(String btnName) throws Throwable {
        AllContractPagesView.switchToFrame();
        AllContractPagesView.clickOnGridButton(btnName);
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I click \"([^\"]*)\" row action in the grid \"([^\"]*)\" having the following header and cell values$")
    public void I_click_on_grid_row_action_button(String strAction, String gridID, List<Field> fields) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        for (Field f : fields) {
            AllContractPagesView.clickGridActionBtn(strAction, gridID, f.getName(), f.getValue());
        }
    }

    @And("^I click \"([^\"]*)\" row action in the non frame grid \"([^\"]*)\" having the following header and cell values$")
    public void I_click_on_grid_non_frame_row_action_button(String strAction, String gridID, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        AdminGridView.searchRecordInGrid(fields.get(0).getValue());
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.clickGridActionBtn(strAction, gridID, fields.get(0).getName(), fields.get(0).getValue(), fields);
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I click \"([^\"]*)\" row action in the frame grid \"([^\"]*)\" having the following header and cell values$")
    public void I_click_on_grid_frame_row_action_button(String strAction, String gridID, List<Field> fields) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AdminGridView.searchRecordInGrid(fields.get(0).getValue());
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.clickGridActionBtn(strAction, gridID, fields.get(0).getName(), fields.get(0).getValue(), fields);
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I click on \"([^\"]*)\" row action in the grid \"([^\"]*)\" having the following header \"([^\"]*)\" and cell value \"([^\"]*)\"$")
    public void I_click_grid_row_action_button(String strAction, String gridID, String header, String cellValue, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.clickGridActionBtn(strAction, gridID, header, cellValue, fields);
    }

    @And("^I navigate to dashboard page$")
    public void I_navigate_to_dashboard_page() throws Throwable {
        URL url = CucumberContext.getURL();
        BrowserDriver.loadPage(url);
    }

    @Then("^I click sort in header \"([^\"]*)\" from grid \"([^\"]*)\" in \"([^\"]*)\"$")
    public void I_click_header_from_grid(String header, String gridID, String order) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.sortColumn(gridID, header, order);
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.sortColumn(gridID, header, order);
    }

    @Then("^I click sort in header \"([^\"]*)\" from non frame grid \"([^\"]*)\" in \"([^\"]*)\"$")
    public void I_click_header_from_non_frame_grid(String header, String gridID, String order) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.sortColumnGeneric(gridID, header, order);
    }

    @Then("^I verify the following sorted rows in grid \"([^\"]*)\"$")
    public void I_verify_the_following_sorted_rows_in_grid(String gridID, List<Field> fields) throws Throwable {
        for (Field f : fields) {
            AllContractPagesView.verifySort(gridID, f.getName(), f.getName());
        }
    }

    @And("^I click on the Grouped Expenses Reported value link$")
    public void I_click_on_the_Grouped_Expenses_Reported_value_link() throws Throwable {
        AllContractPagesView.expenseRecoveryReportedControllableExpensesGross();
    }

    @And("^I wait for the Loading text to disappear$")
    public void I_wait_for_the_Loading_text_to_disappear() throws Throwable {
        SeleniumUtil.handleUnexpectedAlerts();
        CommonMethods.switchToVisibleFrame();
        AllContractPagesView.waitTillDivisionLoads();
    }

    @And("^I check for complete frame 'loading...'$")
    public void I_check_for_complete_frame_load() throws Throwable {
        CommonMethods.switchToVisibleFrameQuick();
        AllContractPagesView.waitTillDivisionLoads();
    }

    @And("^I wait for the Loading text to disappear in grid$")
    public void I_wait_for_the_Loading_text_to_disappear_in_grid() throws Throwable {
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I fetch record number while generating rent$")
    public void I_fetch_record_number_while_generating_rent() throws Throwable {
        AllContractPagesView.recordBatchNumber();
    }

    @And("^I verify batch ID in transaction page$")
    public void I_verify_batch_ID_in_transaction_page() throws Throwable {
        AllContractPagesView.verifyBatchID();
    }

    @And("^I Select Contract Expense Forecast from Page dropdown$")
    public void I_Select_Contract_Expense_Forecast_from_Page_dropdown() throws Throwable {
        SeleniumUtil.switchTodefaultContent();
        AllContractPagesView.contractDropdown("Contract Expense Forecast");
    }

    @And("^I verify \"([^\"]*)\"$")
    public void I_verify(String desc, List<ValueField> valueField) {
        try {
            String rowValues = "";
            for (ValueField f : valueField) {
                rowValues = rowValues + f.getValueField() + "\n";
            }
            if (!verifyRowValues("id", "calEFGrid", rowValues.substring(0, (rowValues.length() - 1)))) {
                BaseView.takeScreenshot("I_verify.png");
                Assert.fail("Does not exist row values :" + rowValues);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("I_verify.png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("I_verify.png");
            logger.info("Error :" + throwable.getMessage());
            Assert.fail(throwable.getMessage());
        }
    }

    @Then("^I verify row count \"([^\"]*)\" in the grid \"([^\"]*)\" having value \"([^\"]*)\" under header \"([^\"]*)\"$")
    public void I_verify_row_count_in_the_grid(int count, String gridID, String cellValue, String header) throws Throwable {
        assertEquals("Expected row count " + count + " is not present in the grid", AllContractPagesView.getParticularGridRowCount(gridID, cellValue, header), count);
        logger.info("Expected row count " + count + " is present in the grid");
    }

    @Then("^I verify all rows count \"([^\"]*)\" in the grid \"([^\"]*)\"$")
    public void I_verify_all_rows_count_in_the_grid(int count, String gridID) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        assertEquals("Expected row count " + count + " is not present in the grid", AllContractPagesView.getGridAllRowsCount(gridID).size(), count);
        logger.info("Expected row count " + count + " is present in the grid");
    }

    @Then("^I verify all rows count \"([^\"]*)\" in the frame grid \"([^\"]*)\"$")
    public void I_verify_all_rows_count_in_the_frame_grid(int count, String gridID) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        assertEquals("Expected row count " + count + " is not present in the grid", AllContractPagesView.getGridAllRowsCountNew(gridID).size(), count);
        logger.info("Expected row count " + count + " is present in the grid");
    }

    @Then("^I verify all rows count \"([^\"]*)\" in the non frame grid \"([^\"]*)\"$")
    public void I_verify_all_rows_count_in_the_non_frame_grid(int count, String gridID) throws Throwable {
        SeleniumUtil.switchTodefaultContent();
        CommonMethods.waitTillDivisionLoads();
        assertEquals("Expected row count " + count + " is not present in the grid", AllContractPagesView.getGridAllRowsCount(gridID).size(), count);
        logger.info("Expected row count " + count + " is present in the grid");
    }

    @Then("^I verify all rows count \"([^\"]*)\" in non frame grid \"([^\"]*)\"$")
    public void I_verify_all_rows_count_in_non_frame_grid(int count, String gridID) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        assertEquals("Expected row count " + count + " is not present in the grid", AllContractPagesView.getGridAllRowsCountNew(gridID).size(), count);
        logger.info("Expected row count " + count + " is present in the grid");
    }

    @Then("^I verify atleast \"([^\"]*)\" row count in the grid \"([^\"]*)\" having value \"([^\"]*)\" under header \"([^\"]*)\"$")
    public void I_verify_atleaset_row_count_in_the_grid(int count, String gridID, String cellValue, String header) throws Throwable {
        assertTrue("Expected row count " + count + " is not present in the grid", AllContractPagesView.getParticularGridRowCount(gridID, cellValue, header) >= count);
        logger.info("Expected row count " + count + " is present in the grid");
    }


    @And("^I Enter \"([^\"]*)\" into the \"([^\"]*)\" field and hit tab$")
    public void I_Enter_into_the_field_and_hit_tab(String strValue, String strElement) throws Throwable {
        //delay(2000);
        AllContractPagesView.typeValueHitTab("name", "ExpenseSchedule_" + strElement, strValue);
    }

    @And("^I click on \"([^\"]*)\" Add Assignee button$")
    public void I_click_on_Add_Assignee_button(String arg1) {
        AllContractPagesView.addAssignee();
    }

    @And("^I click on the \"([^\"]*)\" button to add employer$")
    public void I_click_on_the_button_to_add_employer(String arg1) throws Throwable {
        addLineItemsToForm();
    }

    @And("^I verify tax values from the location will be populated in this section$")
    public void I_verify_tax_values_from_the_location_will_be_populated_in_this_section(List<Field> fields) throws Throwable {
        AllContractPagesView.verifyTaxValuePopulatedFromLocation(fields);
    }

    @And("^I delete rows in grid \"([^\"]*)\" having value \"([^\"]*)\" under header \"([^\"]*)\"$")
    public void I_delete_rows_from_grid(String gridID, String cellValue, String header) throws Throwable {
        AllContractPagesView.deleteRowsInGrid(gridID, cellValue, header);
    }

    @And("^I delete all rows from grid \"([^\"]*)\"$")
    public void I_delete_all_rows_from_grid(String gridID) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.deleteAllRowsRowsInGrid(gridID);
    }

    @And("^I verify Success Message Pop up should be displayed$")
    public void I_verify_Success_Message_Pop_up_should_be_displayed() {
        AllContractPagesView.verifySuccessMsg();
    }

    @And("^I select \"([^\"]*)\" from Page dropdown$")
    public void I_select_from_Page_dropdown(String strDropDownValue) throws Throwable {
        AllContractPagesView.contractDropdown(strDropDownValue);
    }

    @And("^I select \"([^\"]*)\" page layout from dropdown$")
    public void I_select_from_Page_layout_dropdown(String strDropDownValue) throws Throwable {
        AllContractPagesView.selectPageLayout(strDropDownValue);
    }

    @And("^I select \"([^\"]*)\" month and \"([^\"]*)\" year from dropdown in schedule details to view the details$")
    public void I_select_month_and_year_from_dropdown_in_schedule_details_to_view_the_details(String strMonth, String strYear) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.selectMonthAndYear(strMonth, strYear);
    }

    @And("^I select \"([^\"]*)\" month and \"([^\"]*)\" year from dropdown in schedule details$")
    public void I_select_month_and_year_from_dropdown_in_schedule_details(String strMonth, String strYear) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.selectMonthAndYearInSchedulePage(strMonth, strYear);
    }

    @And("^I verify the \"([^\"]*)\" grid loads$")
    public void I_verify_the_grid_loads(String arg1, List<String> columns) {
        AllContractPagesView.verifyGridLoading(arg1, columns);
    }

    @And("^I verify the values at the bottom of the page$")
    public void I_verify_the_values_at_the_bottom_of_the_page(List<Field> fields) throws Throwable {
        int count = 1;
        String strGrandTotal = "", strNetAmountDue = "", strOffsetAmount = "";
        for (Field f : fields) {
            if (count < 4) {
                strGrandTotal = strGrandTotal + f.getName() + "  " + f.getValue() + " ";
            }
            if (count == 4) {
                strOffsetAmount = strOffsetAmount + f.getName() + "  " + f.getValue() + " ";
            }
            if (count == 5) {
                strNetAmountDue = strNetAmountDue + f.getName() + "  " + f.getValue() + " ";
            }
            count++;
        }
        AllContractPagesView.verifySummaryTotal(6, strGrandTotal.trim());
        AllContractPagesView.verifySummaryTotal(7, strOffsetAmount.trim());
        AllContractPagesView.verifySummaryTotal(8, strNetAmountDue.trim());
    }

    @And("^I verify the following Percentage Rent \\(Multi BP\\) Schedule values at the bottom of the page$")
    public void I_verify_the_following_values_Percentage_Rent_Single_BP_Schedule_at_the_bottom_of_the_page(List<Field> fields) throws Throwable {
        PortfolioNavigationView.collapsePortfolioNavigationTab();
        CommonMethods.switchToVisibleFrameQuick();
        AllContractPagesView.verifyScheduleValuesBottomPage(fields);
    }


    @And("^I verify the Percentage Rent \\(Single BP\\) Schedule values at the bottom of the page$")
    public void I_verify_the_values_Percentage_Rent_Single_BP_Schedule_at_the_bottom_of_the_page(List<Field> fields) throws Throwable {
        PortfolioNavigationView.collapsePortfolioNavigationTab();
        CommonMethods.switchToVisibleFrameQuick();
        int count = 1;
        String strGrandTotal = "", strNetAmountDue = "", strOffsetAmount = "";
        for (Field f : fields) {
            if (count < 4) {
                strGrandTotal = strGrandTotal + f.getName() + "  " + f.getValue() + " ";
            }
            if (count == 4) {
                strOffsetAmount = strOffsetAmount + f.getName() + "  " + f.getValue() + " ";
            }
            if (count == 5) {
                strNetAmountDue = strNetAmountDue + f.getName() + "  " + f.getValue() + " ";
            }
            count++;
        }
        AllContractPagesView.verifySummaryTotal(6, strGrandTotal.trim());
        AllContractPagesView.verifySummaryTotal(7, strOffsetAmount.trim());
        AllContractPagesView.verifySummaryTotal(8, strNetAmountDue.trim());
    }

    @And("^I verify the \"([^\"]*)\" values at the bottom of the page$")
    public void I_verify_the_values_at_the_bottom_of_the_page(String args, List<Field> fields) throws Throwable {
        int count = 1;
        String strGrandTotal = "", strNetAmountDue = "", strOffsetAmount = "";
        for (Field f : fields) {
            if (count < 4) {
                strGrandTotal = strGrandTotal + f.getName() + "  " + f.getValue() + " ";
            }
            if (count == 4) {
                strOffsetAmount = strOffsetAmount + f.getName() + "  " + f.getValue() + " ";
            }
            if (count == 5) {
                strNetAmountDue = strNetAmountDue + f.getName() + "  " + f.getValue() + " ";
            }
            count++;
        }
        AllContractPagesView.verifySummaryTotal(6, strGrandTotal.trim());
        AllContractPagesView.verifySummaryTotal(7, strOffsetAmount.trim());
        AllContractPagesView.verifySummaryTotal(8, strNetAmountDue.trim());
//        int count=1;
//        String strGrandTotal = "",strNetAmountDue="",strOffsetAmount="";
//        for (Field f : fields) {
//            if(count<4){
//                strGrandTotal= strGrandTotal + f.getName()+"  "+f.getValue()+" ";
//            }
//            if(count==4){
//                strOffsetAmount= strOffsetAmount + f.getName()+"  "+f.getValue()+" ";
//            }
//            if(count==5){
//                strNetAmountDue= strNetAmountDue + f.getName()+"  "+f.getValue()+" ";
//            }
//            count++;
//        }
//        SeleniumUtil.getFrameIndex("xpath", "//table[@class=\"rowColor1\"]/tbody/tr");
//        AllContractPagesView.verifySummaryTotal(5,strGrandTotal.trim());
//        AllContractPagesView.verifySummaryTotal(6,strOffsetAmount.trim());
//        AllContractPagesView.verifySummaryTotal(7, strNetAmountDue.trim());
//        SeleniumUtil.switchTodefaultContent();
    }

    @Then("^I click on the Add Percentage Rent Breakpoint$")
    public void I_click_on_the_Add_Percentage_Rent_Breakpoint() throws Throwable {
        AllContractPagesView.clickAddPercentRentBP();
    }

    @And("^I verify Remaining Balance should be \"([^\"]*)\"$")
    public void I_verify_Remaining_Balance_should_be(String strRemainingBalance) throws Throwable {
        AllContractPagesView.verifyRemainingBalance(strRemainingBalance);
    }

    @And("^I verify line items in the grid \"([^\"]*)\"$")
    public void example(String gridID, List<Sales> fields) throws Throwable {
        PortfolioNavigationView.collapsePortfolioNavigationTab();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.salesGrid(gridID, fields);
    }

    @And("^I verify line items in the receipt grid \"([^\"]*)\"$")
    public void receiptGrid(String gridID, List<Receipts> fields) throws Throwable {
        PortfolioNavigationView.collapsePortfolioNavigationTab();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.receiptGrid(gridID, fields);
    }

    @And("^I verify line items in the straight line schedule grid \"([^\"]*)\"$")
    public void I_verify_line_items_in_DL_grid(String gridID, List<SLPeriodGrid> fields) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.slPeriodGrid(gridID, fields);
    }

    @And("^I click on \"([^\"]*)\" button in the grid$")
    public void I_click_in_the_grid(String pageName) throws Throwable {
        AllContractPagesView.clickPage(pageName);
        AllContractPagesView.waitTillDivisionLoads();
    }


    @And("^I verify line items in the single BP schedule grid \"([^\"]*)\"$")
    public void I_verify_line_items_in_the_single_BP_schedule_grid(String gridID, List<SingleBPSchedule> fields) throws Throwable {
        PortfolioNavigationView.collapsePortfolioNavigationTab();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.singleBPScheduleGrid(gridID, fields);
    }


    @And("^I verify line items in the single BP schedule page having grid id \"([^\"]*)\"$")
    public void I_verify_line_items_in_the_single_BP_schedule_page_grid(String gridID, List<SingleBPSchedule> fields) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.partitionList(gridID, fields);
    }

    @And("^I click on the '...' of the type field \"([^\"]*)\"$")
    public void I_click_on_the_of_the_type_field(String name) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickTypeField(name);
    }

    @And("^I set following fields value on editable page for straight line schedule$")
    public void I_set_following_fields_value_on_editable_page_for_straight_line_schedule(List<Field> fields) throws Throwable {
        AllContractPagesView.setFieldValuesOnStraightLineSchedulePopup(fields);
    }

    @And("^I Scroll down and click on the Grouped Expenses	-Reported$")
    public void I_Scroll_down_and_click_on_the_Grouped_Expenses_Reported() throws Throwable {
        AllContractPagesView.clickOnReported("id", "vis_ExpenseRecovery_ReportedControllableExpensesGross");
    }

    @And("^I Scroll down and click on the Additional Expenses- Reported$")
    public void I_Scroll_down_and_click_on_the_Additional_Expenses_Reported() throws Throwable {
        AllContractPagesView.clickOnReported("id", "vis_ExpenseRecovery_ReportedNonControllableExpensesGross");
    }

//    @And("^I verify the subtotal \"([^\"]*)\" will be recalculate based on the \"([^\"]*)\" of admin fee$")
//    public void I_verify_the_subtotal_will_be_recalculate_based_on_the_of_admin_fee(String strSubTotal, String strPercentage) throws Throwable {
//        AllContractPagesView.verifySubTotal("id","ReportedSubTotal2Gross",strSubTotal);
//    }

    @And("^I verify the Computed cap \"([^\"]*)\" on Controllable Expenses pop up$")
    public void I_verify_the_Computed_cap_on_Controllable_Expenses_pop_up(String strComputedCap) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "ComputedApprovedCapNoZeroDef", strComputedCap);
    }

    @And("^I verify the subtotal \"([^\"]*)\" will be recalculate based on the \"([^\"]*)\" of admin fee under reported$")
    public void I_verify_the_subtotal_will_be_recalculate_based_on_the_of_admin_fee_under_reported(String strSubTotal, String strPercentage) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "ReportedSubTotal2Gross", strSubTotal);
    }

    @And("^I click on the \"([^\"]*)\" button in \"([^\"]*)\" message box$")
    public void I_click_on_the_button_in_message_box(String strButton, String strWindowCaption) throws Throwable {
        AllContractPagesView.clickButtonInMessageBox(strButton, true);
    }

    @Then("^I Scroll down to the Pre-paid Amount and click on the magnifying glass under approved$")
    public void I_Scroll_down_to_the_Pre_paid_Amount_and_click_on_the_magnifying_glass_under_approved() throws Throwable {
        AllContractPagesView.prepaidAmount("cssselector", "img[src='/en/img/mag.gif']");
    }

    @And("^I Sort Effective dates by \"([^\"]*)\" order$")
    public void I_Sort_Effective_dates_by_order(String strSortType) throws Throwable {
        AllContractPagesView.sortSetPrepaidAmount(strSortType);
    }

    @And("^I verify Pop-up window grid row \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_Pop_up_window_grid_row_having_unique_value_under_column_header(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        AllContractPagesView.verifyGridWithoutFrameValues(gridID, uniqueValue, header, fields);
    }

    @And("^I verify pop-up window row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" not present$")
    public void I_verify_pop_up_window_row_from_grid_having_unique_value_not_present(String gridID, String uniqueValue) throws Throwable {
        AllContractPagesView.verifyGridWithoutSwitchToFrameRowNotPresent(gridID, uniqueValue);
    }

    @And("^I verify the Revised Amount Due \"([^\"]*)\" should be calculated according to \"([^\"]*)\" Adjustment Amount under reported$")
    public void I_verify_the_Revised_Amount_Due_should_be_calculated_according_to_Adjustment_Amount_under_reported(String strRevisedNetAmount, String strAdjAmount) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "ReportedRevisedNetAmountDueGross", strRevisedNetAmount);
    }

    @And("^I verify the Revised Amount Due \"([^\"]*)\" should be calculated according to \"([^\"]*)\" Adjustment Amount under approved$")
    public void I_verify_the_Revised_Amount_Due_should_be_calculated_according_to_Adjustment_Amount_under_approved(String strRevisedNetAmount, String strAdjAmount) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "ApprovedRevisedNetAmountDueGross", strRevisedNetAmount);
    }

    @And("^I verify the populated field values in the Reconcile Pop-up$")
    public void I_verify_the_populated_field_values_in_the_Reconcile_Pop_up(List<ValueField> fields) throws Throwable {
        for (ValueField f : fields) {
            SeleniumUtil.verifyTextValue("cssselector", "div[class='x-form-display-field x-form-display-field-default']", f.getValueField(), SeleniumUtilities.OBJWAITTIMEOUT);
        }
    }

    @And("^I check the send email check box$")
    public void I_check_the_send_email_check_box() throws Throwable {
        SeleniumUtil.click("id", "sendEmail-inputEl", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    @And("^I verify Amount Due-Current Period Values of \"([^\"]*)\" Pre-Paid Amount$")
    public void I_verify_Amount_Due_Current_Period_Values_of_Pre_Paid_Amount(String strRevisedNetAmount) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "ReportedRevisedNetAmountDueGross", strRevisedNetAmount);
    }

    @And("^I verify Amount Due-Current Period Values of \"([^\"]*)\" Net Amount Due$")
    public void I_verify_Amount_Due_Current_Period_Values_of_Net_Amount_Due(String strRevisedNetAmount) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "ApprovedRevisedNetAmountDueNet", strRevisedNetAmount);
    }

    @And("^I verify the Reported - Approved variance amount Net Pass-through variance should be \"([^\"]*)\"$")
    public void I_verify_the_Reported_Approved_variance_amount_Net_Pass_through_variance_should_be(String strRevisedNetAmount) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "RAVarianceNetPassThroughNet", strRevisedNetAmount);
    }

    @And("^I verify the Reported - Approved variance amount Pre-Paid Amount Variance should be \"([^\"]*)\"$")
    public void I_verify_the_Reported_Approved_variance_amount_Pre_Paid_Amount_Variance_should_be(String strRevisedNetAmount) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "RAVariancePrePaidAmountNet", strRevisedNetAmount);
    }

    @And("^I verify the Reported - Approved variance amount Net Amount Due Variance should be \"([^\"]*)\"$")
    public void I_verify_the_Reported_Approved_variance_amount_Net_Amount_Due_Variance_should_be(String strRevisedNetAmount) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "RAVarianceNetAmountDueNet", strRevisedNetAmount);
    }

    @And("^I verify under Amount Due - Current period - Approved - Net Pass-through Amounts \"([^\"]*)\"$")
    public void I_verify_under_Amount_Due_Current_period_Approved_Net_Pass_through_Amounts(String strRevisedNetAmount) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "ApprovedNetPassThroughNet", strRevisedNetAmount);
    }

    @And("^I verify under Amount Due - Current period - Budgeted - Net Pass-through Amounts \"([^\"]*)\"$")
    public void I_verify_under_Amount_Due_Current_period_Budgeted_Net_Pass_through_Amounts(String strRevisedNetAmount) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "BudgetedNetPassThroughNet", strRevisedNetAmount);
    }

    @And("^I verify under Amount Due - Current period - Budgeted - Net Amount Due \"([^\"]*)\"$")
    public void I_verify_under_Amount_Due_Current_period_Budgeted_Net_Amount_Due(String strRevisedNetAmount) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "BudgetedNetAmountDueNet", strRevisedNetAmount);
    }

    @And("^I verify under Amount Due - Current period - Budgeted - variance - Net Pass-through Amounts \"([^\"]*)\"$")
    public void I_verify_under_Amount_Due_Current_period_Budgeted_variance_Net_Pass_through_Amounts(String strRevisedNetAmount) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "ABVarianceNetPassThroughNet", strRevisedNetAmount);
    }

    @And("^I verify under Amount Due - Current period - Budgeted - variance - Pre-Paid Amounts \"([^\"]*)\"$")
    public void I_verify_under_Amount_Due_Current_period_Budgeted_variance_Pre_Paid_Amounts(String strRevisedNetAmount) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "ABVariancePrePaidAmountNet", strRevisedNetAmount);
    }

    @And("^I verify under Amount Due - Current period - Budgeted - variance - Net Amount Due \"([^\"]*)\"$")
    public void I_verify_under_Amount_Due_Current_period_Budgeted_variance_Net_Amount_Due(String strRevisedNetAmount) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "ABVarianceNetAmountDueNet", strRevisedNetAmount);
    }

    @And("^I select checkbox from grid \"([^\"]*)\" having unique value \"([^\"]*)\"$")
    public void I_select_checkbox_from_grid_having_unique_value(String gridID, String uniqueValue) throws Throwable {
        AllContractPagesView.selectGridRowcheckbox(gridID, uniqueValue);//clickGridRow(gridID, uniqueValue);
    }

    @And("^I Scroll down and click on the Grouped Expenses	-Reported Net$")
    public void I_Scroll_down_and_click_on_the_Grouped_Expenses_Reported_Net() throws Throwable {
        AllContractPagesView.clickOnReported("id", "vis_ExpenseRecovery_ReportedControllableExpensesNet");
    }

    @And("^I verify the Reported Amount Gross should be \"([^\"]*)\" under Current Period Net$")
    public void I_verify_the_Reported_Amount_Gross_should_be_under_Current_Period_Net(String strReportedAmountGross) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "ReportedAmountGross", strReportedAmountGross);
    }

    @And("^I verify the Computed Total Approved Amount Gross should be \"([^\"]*)\" under Current Period Net$")
    public void I_verify_the_Computed_Total_Approved_Amount_Gross_should_be_under_Current_Period_Net(String strComputedTotalApprovedAmountGross) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "ComputedApprovedTotalAmountGross", strComputedTotalApprovedAmountGross);
    }

    @And("^I verify the Budgeted Amount Gross should be \"([^\"]*)\" under Current Period Net$")
    public void I_verify_the_Budgeted_Amount_Gross_should_be_under_Current_Period_Net(String strBudgetedAmountGross) throws Throwable {
        AllContractPagesView.verifySubTotal("id", "BudgetedAmountGross", strBudgetedAmountGross);
    }

    @And("^I verify a important row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_important_row_from_grid_having_unique_value_under_header_generic(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickImportantGridRow(gridID, uniqueValue, header, fields);
    }

    @And("^I verify a row from \"([^\"]*)\" Gantt chart having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_row_grid_from_Gantt_chart_having_unique_value_under_header_(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        GridUtils.findUniqueRow(gridID, uniqueValue, header, fields);
    }

    @And("^I click on offset amount link \"([^\"]*)\"$")
    public void I_click_on_offset_amount_link(String amount) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickOffsetAmount(amount);
    }

    @And("^I verify action message \"([^\"]*)\" in the left top corner$")
    public void I_verify_action_message_in_the_left_top_corner(String arg1) throws Throwable {
        AllContractPagesView.verifyUserMsg(arg1);
    }

    @And("^I verify the Aggregate Total Amount \"([^\"]*)\" under summary tab financials section$")
    public void I_verify_the_Aggregate_Total_Amount_under_summary_tab_financials_section(String strValue) throws Throwable {
        SeleniumUtil.getFrameIndex("xpath", "//font[@id=\"AggregateTotalRent_label\"]/parent::td[1]/following-sibling::td[1]");
        SeleniumUtil.verifyTextValue("xpath", "//font[@id=\"AggregateTotalRent_label\"]/parent::td[1]/following-sibling::td[1]", strValue, SeleniumUtilities.OBJWAITTIMEOUT);
        SeleniumUtil.switchTodefaultContent();
    }

    @And("^I verify the Aggregate Base Rent Amount \"([^\"]*)\" under summary tab financials section$")
    public void I_verify_the_Aggregate_Base_Rent_Amount_under_summary_tab_financials_section(String strValue) throws Throwable {
        SeleniumUtil.getFrameIndex("xpath", "//font[@id=\"AggregateBaseRent_label\"]/parent::td[1]/following-sibling::td[1]");
        SeleniumUtil.verifyTextValue("xpath", "//font[@id=\"AggregateBaseRent_label\"]/parent::td[1]/following-sibling::td[1]", strValue, SeleniumUtilities.OBJWAITTIMEOUT);
        SeleniumUtil.switchTodefaultContent();
    }

    @And("^I verify the Annual Total Amount \"([^\"]*)\" under summary tab financials section$")
    public void I_verify_the_Annual_Total_Amount_under_summary_tab_financials_section(String strValue) throws Throwable {
        SeleniumUtil.getFrameIndex("xpath", "//font[@id=\"CurrentAnnualTotalRent_label\"]/parent::td[1]/following-sibling::td[1]");
        SeleniumUtil.verifyTextValue("xpath", "//font[@id=\"CurrentAnnualTotalRent_label\"]/parent::td[1]/following-sibling::td[1]", strValue, SeleniumUtilities.OBJWAITTIMEOUT);
        SeleniumUtil.switchTodefaultContent();
    }

    @And("^I verify the Annual Base Amount \"([^\"]*)\" under summary tab financials section$")
    public void I_verify_the_Annual_Base_Amount_under_summary_tab_financials_section(String strValue) throws Throwable {
        SeleniumUtil.getFrameIndex("xpath", "//font[@id=\"CurrentAnnualBaseRent_label\"]/parent::td[1]/following-sibling::td[1]");
        SeleniumUtil.verifyTextValue("xpath", "//font[@id=\"CurrentAnnualBaseRent_label\"]/parent::td[1]/following-sibling::td[1]", strValue, SeleniumUtilities.OBJWAITTIMEOUT);
        SeleniumUtil.switchTodefaultContent();
    }

    @And("^I click on row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\" by parsing many pages$")
    public void I_click_row_from_grid_having_unique_value_under_header_generic_by_parsing_many_pages(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickUniqueGridManyPage(gridID, uniqueValue, header, fields);
    }

    @And("^I enter \"([^\"]*)\" text in search box and hit enter key$")
    public void I_enter_text_in_search_box_and_hit_enter_key(String strSearchTxt) throws Throwable {
        AllContractPagesView.enterTextAndHitEnterKey(strSearchTxt);
    }

    @And("^I select transactions radio button$")
    public void I_select_transactions_radio_button() throws Throwable {
        AllContractPagesView.selectRadioButton("input[ name='onetime'][value='true']");
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I select expense schedules radio button$")
    public void I_select_expense_schedules_radio_button() throws Throwable {
        AllContractPagesView.selectRadioButton("input[ name='onetime'][value='false']");
    }

    @And("^I click on Disable Payment Approval$")
    public void I_click_on_Disable_Payment_Approval() throws Throwable {
        AllContractPagesView.disablePaymentApproval();
    }

    @And("^I click on the green check-mark for the line item for recurring expense to change it to approved on grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_click_on_the_green_check_mark_for_the_line_item_for_recurring_expense_to_change_it_to_approved_on_grid_having_unique_value_under_column_header(String gridID, String uniqueValue, String header) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickLineItem(gridID, uniqueValue, header, "", "");
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I click on the pencil in the status column for the Recurring Expense line item$")
      public void I_click_on_the_pencil_in_the_status_column_for_the_Recurring_Expense_line_item() throws Throwable {
        AllContractPagesView.clickOnPencil();
    }

    @And("^I click on the green check mark$")
    public void I_click_on_green_check_mark() throws Throwable {
        AllContractPagesView.clickOnGreenRightMark();
    }

    @And("^I verify a row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\" and \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_a_row_from_grid_having_unique_value_under_column_header_and_under_column_header(String gridID, String cellValue, String header, String cellValue1, String header1, List<Field> fields) throws Throwable {
        //delay(3000);
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.verifyGridValue(gridID, cellValue, header, cellValue1, header1, fields);
    }

    @And("^I verify a row from non frame grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\" and \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_verify_a_row_from_non_frame_grid_having_unique_value_under_column_header_and_under_column_header(String gridID, String cellValue, String header, String cellValue1, String header1, List<Field> fields) throws Throwable {
        //delay(3000);
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.verifyGridValue(gridID, cellValue, header, cellValue1, header1, fields);
    }

    @And("^I message should appear stating \"([^\"]*)\"$")
    public void I_message_should_appear_stating(String strMsg) throws Throwable {
        AllContractPagesView.verifyErrorMsg(strMsg);
    }

    @And("^I click on the green check-mark for the line item for recurring expense to change it to approved on grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\" and \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_click_on_the_green_check_mark_for_the_line_item_for_recurring_expense_to_change_it_to_approved_on_grid_having_unique_value_under_column_header_and_under_column_header(String gridID, String uniqueValue, String header, String uniqueValue1, String header1) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickLineItem(gridID, uniqueValue, header, uniqueValue1, header1);
    }

    @And("^I change status to \"([^\"]*)\" for all rows in grid \"([^\"]*)\"$")
    public void I_change_all_status_of_all_rows(String status, String gridID) throws Throwable {
        AllContractPagesView.changeStatusForAllRows(gridID, status);
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I click on the \"([^\"]*)\" action from non frame grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_click_on_the_action_in_the_status_column_for_the_Recurring_Expense_line_item(String action, String gridID, String cellValue, String header, List<Field> fields) throws Throwable {
        AllContractPagesView.changeStatus(gridID, cellValue, header, fields, action);
    }


    @Then("^I verify the following failure message$")
    public void I_verify_failure_message_message(List<String> arg1) throws Throwable {
        for (String msg : arg1) {
            AllContractPagesView.generateRentMessage(msg);
        }
    }

    @And("^I select Fiscal Details radio button$")
    public void I_select_Fiscal_Details_radio_button() throws Throwable {
        AllContractPagesView.selectFiscalDetailsRadio();
    }

    @And("^I Scroll down to the \"([^\"]*)\" section and click on the Prepaid Amount magnifying glass$")
    public void I_Scroll_down_to_the_section_and_click_on_the_Prepaid_Amount_magnifying_glass(String arg1) throws Throwable {
        AllContractPagesView.amountDue();
    }

    @And("^I verify Fiscal Year Contract Expense Forecast should be displayed for all expense type in the grid$")
    public void I_verify_Fiscal_Year_Contract_Expense_Forecast_should_be_displayed_for_all_expense_type_in_the_grid(List<ValueField> valueField) {
        try {
            String rowValues = "";
            for (ValueField f : valueField) {
                rowValues = rowValues + f.getValueField() + "\n";
            }
            if (!verifyRowValues("id", "fisEFGrid", rowValues.substring(0, (rowValues.length() - 1)))) {
                BaseView.takeScreenshot("I_verify.png");
                Assert.fail("Does not exist row values :" + rowValues);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("I_verify.png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("I_verify.png");
            logger.info("Error :" + throwable.getMessage());
            Assert.fail(throwable.getMessage());
        }
    }

    @And("^I click edit next to \"([^\"]*)\"$")
    public void I_click_edit_next_to(String strStepEditLink) throws Throwable {
        AllContractPagesView.clickOnStepNextEditLink(strStepEditLink);
    }

//    @And("^I select \"([^\"]*)\" from available fields$")
//    public void I_select_from_available_fields(String strSelectField) throws Throwable {
//        AllContractPagesView.selectAvailableField(strSelectField);
//    }

    @And("^I click on \"([^\"]*)\" button to move field$")
    public void I_click_on_button_to_move_field(String strMoveButton) throws Throwable {
        AllContractPagesView.clickOnMoveButton(strMoveButton);
    }

    @And("^I click on Finish button$")
    public void I_click_on_Finish_button() throws Throwable {
        AllContractPagesView.clickOnFinishButton();
    }

    @And("^I Save and Run Report successfully$")
    public void I_Save_and_Run_Report_successfully() throws Throwable {
        AllContractPagesView.clickOnSaveAndRunReport();
    }

    @And("^I verify report shall display all the contracts related to the specific location and facility successfully$")
    public void I_verify_report_shall_display_all_the_contracts_related_to_the_specific_location_and_facility_successfully(List<RelatedContractsReportFields> fields) throws Throwable {
        int col = 1;
        for (RelatedContractsReportFields f : fields) {
            AllContractPagesView.verifyRelatedContractAllReport(col, f.getLocation(), f.getContractName(), f.getFacility());
            col++;
        }

    }

    @And("^I select \"([^\"]*)\" from \"([^\"]*)\" available fields$")
    public void I_select_from_available_fields(String strSelectField, String strField) throws Throwable {
        AllContractPagesView.selectAvailableField(strSelectField, strField);
    }

    @And("^I select the following transactions$")
    public void I_select_the_following_transactions(List<String> transactions) throws Throwable {
        AllContractPagesView.selectTransactions(transactions);
    }

    @And("^I close the \"([^\"]*)\" item from portfolio drop down$")
    public void I_close_the_item_from_portfolio_drop_down(String arg1) throws Throwable {
        AllContractPagesView.closePortfolioItems();
    }

    @And("^I verify the Natural Breakpoint is false$")
    public void I_verify_the_Natural_Breakpoint_is_false() throws Throwable {
        AllContractPagesView.verifyRadioButton("input[name='PercentageRent_NaturalBreakpointFlag'][value='true']", "false");
    }

    @And("^I verify the Artificial Breakpoint is true$")
    public void I_verify_the_Artificial_Breakpoint_is_true() throws Throwable {
        AllContractPagesView.verifyRadioButton("input[name='PercentageRent_NaturalBreakpointFlag'][value='false']", "true");
    }

    @And("^I fetch Term Rec ID from report for entity \"([^\"]*)\"$")
    public void I_fetch_Term_Rec_ID_from_report_for_entity(String entityName) throws Throwable {
        AllContractPagesView.getTermEntityIDFromReport(entityName);
    }

    @And("^I fetch Variable Offset ID from report for entity \"([^\"]*)\"$")
    public void I_fetch_Variable_ID_from_report_for_entity(String entityName) throws Throwable {
        AllContractPagesView.getVariableOffsetIDFromReport(entityName);
    }

    @And("^I fetch entity ID from report under header \"([^\"]*)\" for entity \"([^\"]*)\" in row \"([^\"]*)\"$")
    public void I_fetch_entity_ID_from_report(String header, String entityName, int rowNum) throws Throwable {
        AllContractPagesView.getEntityIDFromReportForParticularColumn(header, entityName, rowNum);
    }

    @Then("^I verify rows count in multiple pages \"([^\"]*)\" in non frame grid \"([^\"]*)\"$")
    public void I_verify_all_rows_count_in_multiple_pages_in_non_frame_grid(int count, String gridID) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        assertEquals("Expected row count " + count + " is not present in the grid", AllContractPagesView.getRowsCountMultiplePage(gridID), count);
        logger.info("Expected row count " + count + " is present in the grid");
    }

    @Then("^I click on \"([^\"]*)\" action of header \"([^\"]*)\" in non frame grid \"([^\"]*)\"$")
    public void I_click_on_header_action_from_non_frame_grid(String action,String header, String gridID) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickColumnAction(gridID, header, action);
        CommonMethods.waitTillDivisionLoads();
    }

    @Then("^I click on the \"([^\"]*)\" action of header \"([^\"]*)\" in non frame grid \"([^\"]*)\"$")
    public void I_click_on_the_header_action_from_non_frame_grid(String action,String header, String gridID) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.clickColumnActionProjectManagement(gridID, header, action);
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I click on \"([^\"]*)\" button in the grid \"([^\"]*)\"$")
    public void I_click_in_the_grid_id(String pageName, String gridID) throws Throwable {
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        AllContractPagesView.clickPage(gridElement,pageName);
        AllContractPagesView.waitTillDivisionLoads();
    }

    @And("^I select Artificial Breakpoint radio button$")
    public void I_select_Artificial_Breakpoint_radio_button() throws Throwable {
        AllContractPagesView.artificialBreakpoint();
    }

    @And("^I click on the ... of \"([^\"]*)\" Field$")
    public void I_click_on_the_of_Field(String arg1) throws Throwable {
        BudgetTemplateView.clickOnThreeDot();
    }

}