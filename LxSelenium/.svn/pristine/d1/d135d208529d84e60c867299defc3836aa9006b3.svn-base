package com.lucernex.qa.steps.iwms.setupwizards;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.data.TypeFields;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.setupwizards.PortfolioSetupWizardView;
import com.lucernex.qa.views.setupwizards.SetupWizardCreateProjectView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;


/**
 * Created by RLE0097 on 3/26/2015.
 */
public class PortfolioSetupWizardSteps {
    private static final Logger logger = Logger.getLogger(PortfolioSetupWizardSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @Then("^I verify organization chart \"([^\"]*)\"$")
    public void I_verify_org_chart(String strChart) throws Throwable {
        PortfolioSetupWizardView.verifyOrgChart(strChart);
    }

    @Then("^I verify management members \"([^\"]*)\"$")
    public void I_verify_management_members(String strMember) throws Throwable {
        PortfolioSetupWizardView.verifyMembers(strMember);
    }

    @Then("^I verify management member link \"([^\"]*)\"$")
    public void I_verify_management_member_link(String strMember) throws Throwable {
        PortfolioSetupWizardView.verifyManagementMembersLink(strMember);
    }

    @Then("^I verify managers and members in \"([^\"]*)\" org chart$")
    public void I_verify_managers_and_members_in_org_chart(String strChart, List<TypeFields> fields) throws Throwable {
        PortfolioSetupWizardView.verifyManagersAndMembers(strChart, fields);
    }

    @Then("^I verify deleted region \"([^\"]*)\" not present in org chart$")
    public void I_verify_deleted_region_in_org_chart(String region) throws Throwable {
        PortfolioSetupWizardView.verifyDeleteRegion(region);
    }

    @Then("^I verify values on add parent region editable pop up$")
    public void I_verify_values_on_add_parent_region_editable_pop_up(List<Field> fields) throws Throwable{
        PortfolioSetupWizardView.verifyValuesOnAddParentPopup(fields);
    }

    @And("^I add following members$")
    public void I_add_following_members(List<String> members) throws Throwable {
        PortfolioSetupWizardView.addMembers(members,"availableMembers");
    }

    @And("^I add following project members$")
    public void I_add_following_project_members(List<String> members) throws Throwable {
        PortfolioSetupWizardView.addProMembers(members,"AssigneeMemberIDList_label", "availableAssigneeMemberIDList");
    }

    @And("^I add following Approver Member List$")
    public void I_add_following_Approver_Member_List(List<String> members) throws Throwable {
        PortfolioSetupWizardView.addProMembers(members, "ApproverMemberIDList_label","availableApproverMemberIDList");
    }

    @And("^I add following Notifiee members$")
    public void I_add_following_Notifiee_members(List<String> members) throws Throwable {
        PortfolioSetupWizardView.addProMembers(members, "NotifieeMemberIDList_label","availableNotifieeMemberIDList");
    }

    @And("^I close org chart window$")
    public void I_close_org_chart_window() throws Throwable {
        PortfolioSetupWizardView.clickOrgChartWindowButton();
    }

    @Then("^I verify success message after importing org chart")
    public void I_verify_success_message_after_creating_importing_orgchart(List<String> arg1) throws Throwable {
        PortfolioSetupWizardView.validateSuccessMessageDontThrowError(arg1);
    }
}
