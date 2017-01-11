package com.lucernex.qa.steps.iwms.contract.paymentinfo.recurring_expenses;

import com.lucernex.qa.views.iwms.contract.paymentinfo.recurring_expenses.RetroPaymentView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;

import java.util.logging.Logger;

/**
 * Created by RLE0239 on 02/26/2015.
 */
public class RetroPaymentSteps {
    private static final Logger logger = Logger.getLogger(RetroPaymentSteps.class.getName());

    @And("^I deselect 'Use posting date for vendor allocation\\?:' checkbox$")
    public void I_deselect_Use_posting_date_for_vendor_allocation_checkbox() throws Throwable {
        RetroPaymentView.deselectUsePostingDateForVendorAllocation();
    }

    @And("^I deselect 'Mark Retro Payments as One-Time Payments\\?:' checkbox$")
    public void I_deselect_Mark_Retro_Payments_as_One_Time_Payments_checkbox() throws Throwable {
        RetroPaymentView.deselectMarkRetroPaymentsAsOneTimePayments();
    }

    @And("^I select 'Use posting date for vendor allocation\\?:' checkbox$")
    public void I_select_Use_posting_date_for_vendor_allocation_checkbox() throws Throwable {
        RetroPaymentView.selectUsePostingDateForVendorAllocation();
    }

    @And("^I select 'Send Email\\?:' checkbox$")
    public void I_select_send_email_checkbox() throws Throwable {
        RetroPaymentView.selectSendEmailCheckbox();
    }
}