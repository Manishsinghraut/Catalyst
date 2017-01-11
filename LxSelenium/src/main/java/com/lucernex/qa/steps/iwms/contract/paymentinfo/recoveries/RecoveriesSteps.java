package com.lucernex.qa.steps.iwms.contract.paymentinfo.recoveries;

import com.lucernex.qa.data.Field;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.paymentinfo.recoveries.RecoveriesPageView;
import cucumber.api.java.en.And;

import java.util.List;
import java.util.logging.Logger;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;


/**
 * Created by RLE0239 on 05/14/2015.
 */
public class RecoveriesSteps {
    private static final Logger logger = Logger.getLogger(RecoveriesSteps.class.getName());

    @And("^I click on Grouped Expenses Reported link in Contract Expense Recovery \\(Net\\) List page$")
    public void I_click_on_Grouped_Expenses_Reported_link() throws Throwable {
        RecoveriesPageView.clickGroupedExpenseReportedLinkInNetPage();
    }

    @And("^I click on Grouped Expenses Approved link in Contract Expense Recovery \\(Net\\) List page$")
    public void I_click_on_Grouped_Expenses_Approved_link() throws Throwable {
        RecoveriesPageView.clickGroupedExpenseApprovedLinkInNetPage();
    }

    @And("^I click on Additional Expenses Reported link in Contract Expense Recovery \\(Net\\) List page$")
    public void I_click_on_Additional_Expenses_Reported_link() throws Throwable {
        RecoveriesPageView.clickAdditionalExpenseReportedLinkInNetPage();
    }

    @And("^I click on Additional Expenses Approved link in Contract Expense Recovery \\(Net\\) List page$")
    public void I_click_on_Additional_Expenses_Approved_link() throws Throwable {
        RecoveriesPageView.clickAdditionalExpenseApprovedLinkInNetPage();
    }

    @And("^I verify the following variance amount$")
    public void I_verify_the_following_variance_amount(List<String> variance) throws Throwable {
        RecoveriesPageView.verifyVarianceAmount(variance);
    }

    @And("^I verify the computed total amount \"([^\"]*)\"$")
    public void I_verify_the_computed_total_amount(String variance) throws Throwable {
        RecoveriesPageView.verifyComputedAmount(variance);
    }

    @And("^I verify the following deductions reported and approved values$")
    public void I_verify_the_following_deductions_reported_and_approved_values(List<Field> deductions) throws Throwable {
        RecoveriesPageView.verifyDeductionsReportedAndApprovedAmount(deductions);
    }

    @And("^I verify the following recoveries reported and approved values$")
    public void I_verify_the_following_recoveries_reported_and_approved_values(List<Field> recoveries) throws Throwable {
        RecoveriesPageView.verifyRecoveriesReportedAndApprovedAmount(recoveries);
    }

    @And("^I verify the following subtotal reported and approved values$")
    public void I_verify_the_following_subtotal_reported_and_approved_values(List<Field> subtotal) throws Throwable {
        RecoveriesPageView.verifySubtotalReportedAndApprovedAmount(subtotal);
    }

    @And("^I verify the following recoveries subtotal 1 values$")
    public void I_verify_the_following_subtotal1_values(List<Field> subtotal) throws Throwable {
        RecoveriesPageView.verifySubtotalReportedAndApprovedAmount1(subtotal);
    }

    @And("^I verify the following recoveries subtotal 2 values$")
    public void I_verify_the_following_subtotal2_values(List<Field> subtotal) throws Throwable {
        RecoveriesPageView.verifySubtotalReportedAndApprovedAmount(subtotal);
    }

    @And("^I verify the following label and value pair$")
    public void I_verify_the_following_label_and_value_pair(List<Field> labelValuePair) throws Throwable {
        RecoveriesPageView.verifyLabelValuePair(labelValuePair);
    }

    @And("^I verify the following checkboxes by label$")
    public void I_set_following_checkboxes_by_label(List<Field> fields) {

        for (Field f : fields) {
            CommonMethods.verifyCheckBoxByLabel(f.getName(), f.getValue());
        }
    }

    @And("^I check Send Mail? checkbox in Reconcile modal window$")
    public void I_check_send_mail_checkbox_in_reconcile_pop_up() throws Throwable {
        RecoveriesPageView.checkSendMailCheckboxInReconcilePopup();
    }

    @And("^I verify success message \"([^\"]*)\"$")
    public void I_verify_success_message(String msg) throws Throwable {
        CommonMethods.switchToVisibleFrameQuick();
        RecoveriesPageView.verifySuccessMessage(msg);
    }

    @And("^I verify success message \"([^\"]*)\" in non frame page$")
    public void I_verify_success_message_in_non_frame_page(String msg) throws Throwable {
        RecoveriesPageView.verifySuccessMessageInNonFramePage(msg);
    }

    @And("^I click on OK button in Reconcile pop up$")
    public void I_click_on_OK_button_in_Reconcile_pop_up() throws Throwable {
        RecoveriesPageView.clickSubmitBtn();
    }

    @And("^I click on Deductions Reported link in Contract Expense Recovery page$")
    public void I_click_on_Deductions_Reported_link() throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        RecoveriesPageView.clickDeductionsReportedLink();
    }

    @And("^I click on Recoveries Reported link in Contract Expense Recovery page$")
    public void I_click_on_Recoveries_Reported_link() throws Throwable {
        RecoveriesPageView.clickRecoveriesReportedLink();
    }

    @And("^I double click a row from grid \"([^\"]*)\" having unique value \"([^\"]*)\" under column header \"([^\"]*)\"$")
    public void I_double_click_row_from_grid_having_unique_value_under_header_generic(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        RecoveriesPageView.doubleUniqueClickGridRow(gridID, uniqueValue, header, fields);
    }


    @And("^I verify following editable row from grid \"([^\"]*)\"$")
    public void I_verify_editable_row_from_grid(String gridID, List<Field> fields) throws Throwable {
//        delay(5000);
        RecoveriesPageView.verifyEditableRowGridValues(gridID, fields);
    }

    @And("^I click on Deductions Reported link in Contract Expense Recovery Net page$")
    public void I_click_on_Deductions_Reported_net_link() throws Throwable {
        RecoveriesPageView.clickDeductionsReportedNetLink();
    }

    @And("^I click on Recoveries Reported link in Contract Expense Recovery Net page$")
    public void I_click_on_Recoveries_Reported_net_link() throws Throwable {
        RecoveriesPageView.clickRecoveriesReportedNetLink();
    }

    @And("^I verify the following deductions reported and approved values in recoveries net page$")
    public void I_verify_the_following_deductions_reported_and_approved_values_in_recoveries_net_page(List<Field> deductions) throws Throwable {
        RecoveriesPageView.verifyDeductionsReportedAndApprovedNetAmount(deductions);
    }

    @And("^I verify the following recoveries reported and approved values in recoveries net page$")
    public void I_verify_the_following_recoveries_reported_and_approved_values_in_recoveries_net_page(List<Field> recoveries) throws Throwable {
        RecoveriesPageView.verifyRecoveriesReportedAndApprovedNetAmount(recoveries);
    }

    @And("^I verify the following subtotal reported and approved values in recoveries net page$")
    public void I_verify_the_following_subtotal_reported_and_approved_values_in_recoveries_net_page(List<Field> subtotal) throws Throwable {
        RecoveriesPageView.verifySubtotalReportedAndApprovedNetAmount(subtotal);
    }

    @And("^I click on Grouped Expenses Approved Amount link in Contract Expense Recovery Net List page$")
    public void I_click_on_Grouped_Expenses_Approved_Amount_link_in_Contract_Expense_Recovery_Net_List_page() throws Throwable {
        RecoveriesPageView.clickGroupedExpenseApprovedLinkInNetPage();
    }

    @And("^I verify the following radio by label$")
    public void I_set_following_radio_by_label(List<Field> fields) {

        for (Field f : fields) {
            CommonMethods.verifyRadioByLabel(f.getName(), f.getValue());
        }
    }

    @And("^I click on Recoveries Addition Reported link in Contract Expense Recovery page$")
    public void I_click_on_Recoveries_Addition_Reported_link() throws Throwable {
        RecoveriesPageView.clickRecoveriesAdditionReportedLink();
    }
}