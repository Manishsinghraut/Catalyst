package com.lucernex.qa.steps.iwms.adminpages.portfolioadministration;

import com.lucernex.qa.data.Field;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.portfolioadministration.PortfolioAdministrationGenericView;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.contract.details.summary.ExtendContractView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

import java.util.List;


/**
 * Created by RLE0239 on 401/22/2016.
 */
public class PortfolioAdministrationGenericSteps {

    @And("^I click \"([^\"]*)\" link in the non-frame grid \"([^\"]*)\" having the following header and cell values$")
    public void I_click_on_grid_row_action_button(String strAction, String gridID, List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        PortfolioAdministrationGenericView.clickGridLink(strAction, gridID, fields.get(0).getName(), fields.get(0).getValue(), fields);
    }

    @Then("^I verify success message appear after inactivating the facility$")
    public void I_verify_success_message_will_appear_in_top_left_corner_of_page(List<String> arg1) throws Throwable {
        PortfolioAdministrationGenericView.validateSuccessMessage(arg1);
    }

    @Then("^I verify \"([^\"]*)\" message in Inactive Schedule pop up$")
    public void I_verify_message_message(String arg1) throws Throwable {
        PortfolioAdministrationGenericView.inactiveSchedulePopupMsg(arg1);
    }

    @And("^I click on list inactive radio$")
    public void I_click_on_list_inactive_radio() throws Throwable {
        PortfolioAdministrationGenericView.selectInactiveFacilities();
    }
}