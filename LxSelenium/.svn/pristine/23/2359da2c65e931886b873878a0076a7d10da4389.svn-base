package com.lucernex.qa.entity.contract.paymentinfo.recoveries;

import com.lucernex.qa.views.entity.contract.paymentinfo.recoveries.RecoveriesPageView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

/**
 * Created by sergeym on 7/22/2014.
 */
public class RecoveriesSteps {
    @And("^I click on the PrepaidAmountTotal button$")
    public void I_click_on_the_PrepaidAmountTotal_button() throws Throwable {
        RecoveriesPageView.clickPrepaidAmountTotalButton();
    }

    @And("^I check All Checkbox$")
    public void I_check_All_Checkbox() throws Throwable {
        RecoveriesPageView.checkAllCheckbox();
    }

    @Then("^I see Prepaid Amount Total updated$")
    public void I_see_Prepaid_Amount_Total_updated() throws Throwable {
        RecoveriesPageView.checkTotalUpdatedCorrectly();
    }

    @Then("^I see I am on the Recoveries page$")
    public void I_see_I_am_on_the_recoveries_page() throws Throwable {
        RecoveriesPageView.checkRecoveryGroupLabel();
    }
}
