package com.lucernex.qa.steps.iwms.adminpages.MemberAdministration;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.admin.AdminGridView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.memberadministration.MemberContactsImportView;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;


/**
 * Created by RLE0097 on 3/31/2015.
 */
public class MemberContactsImportSteps {

    private static final Logger logger = Logger.getLogger(MemberContactsImportSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);


    @When("^I click \"([^\"]*)\" button of the member \"([^\"]*)\"$")
    public void I_click_edit_button_of_the_member(String strAction, String strMember) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AdminGridView.searchRecordInGrid(strMember);
        MemberContactsImportView.clickEditBtnOfMember(strAction, strMember);
    }

    @When("^I search member \"([^\"]*)\"$")
    public void I_search_member(String strMember) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AdminGridView.searchRecordInGrid(strMember);
    }

    @When("^I search for record \"([^\"]*)\"$")
    public void I_search_for_record(String strMember) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        AdminGridView.searchRecordInGrid(strMember);
    }

    @Then("^I verify newly created member \"([^\"]*)\"$")
    public void I_verify_newly_created_member(String member) throws Throwable {
        AdminGridView.searchRecordInGrid(member);
        MemberContactsImportView.verifyMember(member);
    }

    @And("^I select inactive status for the following members$")
    public void I_select_inactive_status_for_the_following_members(List<String> members) throws Throwable {
        for (String member : members) {
            MemberContactsImportView.selectInactiveStatus(member, "Inactive");
        }
    }
}