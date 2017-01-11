package com.lucernex.qa.steps.iwms.contract.paymentinfo.transactions;

import com.lucernex.qa.views.iwms.contract.paymentinfo.recurring_expenses.RetroPaymentView;
import com.lucernex.qa.views.iwms.contract.paymentinfo.transactions.TransactionsView;
import com.lucernex.qa.views.iwms.location.summary.SummaryView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;

import java.util.logging.Logger;

/**
 * Created by RLE0239 on 02/26/2015.
 */
public class TransactionsSteps {
    private static final Logger logger = Logger.getLogger(TransactionsSteps.class.getName());

    @And("^I fetch transaction ID$")
    public void I_transaction_ID() throws Throwable {
        TransactionsView.fetchTransactionID();
    }

    @And("^I fetch Insurance ID$")
    public void I_Insurance_ID() throws Throwable {
        TransactionsView.fetchInsuranceID();
    }

    @And("^I fetch entity ID from Contract summary page$")
    public void I_fetch_entity_ID_from_contract_summary_page() throws Throwable {
        TransactionsView.getEntityID();
    }
}