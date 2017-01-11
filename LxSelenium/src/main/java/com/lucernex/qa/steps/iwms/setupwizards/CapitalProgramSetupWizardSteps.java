package com.lucernex.qa.steps.iwms.setupwizards;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.details.summary.ExtendContractView;
import com.lucernex.qa.views.setupwizards.CapitalProgramSetupWizardView;
import com.lucernex.qa.views.setupwizards.SetupWizardCreateProjectView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;


/**
 * Created by RLE0097 on 3/27/2015.
 */
public class CapitalProgramSetupWizardSteps {

    private static final Logger logger = Logger.getLogger(CapitalProgramSetupWizardSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I select facility \"([^\"]*)\"$")
    public void I_select_facility(String strFacility) throws Throwable {
        CapitalProgramSetupWizardView.selectFacility(strFacility);
    }

    @And("^I wait till the project gets created$")
    public void I_wait_till_the_project_gets_created() throws Exception {
        SetupWizardCreateProjectView.waitTillProjectCreation();
    }

    @Then("^I verify success message after creating or importing projects$")
    public void I_verify_success_message_after_creating_importing_projects(List<String> arg1) throws Throwable {
        SetupWizardCreateProjectView.validateSuccessMessageDontThrowError(arg1);
    }

    @And("^I select Create Organization Chart by duplicating Organization Chart from Select \"([^\"]*)\" from drop down$")
    public void I_select_Create_Organization_Chart_by_duplicating_Organization_Chart_from_Select_from_drop_down(String strDropDownValue) throws Throwable {
       SetupWizardCreateProjectView.createOrganizationChartByDuplicatingOrganizationChartfrom(strDropDownValue);
    }

    @And("^I Add column type \"([^\"]*)\" and click on upload spreadsheet drop down$")
    public void I_Add_column_type_and_click_on_upload_spreadsheet_drop_down(String strColumnType) throws Throwable {
        SetupWizardCreateProjectView.columnTypeAndclickOnuploadSpreadsheetDropdown(strColumnType);
    }

    @And("^I click on upload budget button$")
    public void I_click_on_upload_budget_button() throws Throwable {
        SetupWizardCreateProjectView.clickOnUploadButton();
    }

    @And("^I click on close button from Duplicating OrgChart$")
    public void I_click_on_close_button_from_Duplicating_OrgChart() throws Throwable {
        SetupWizardCreateProjectView.clickOnDuplicatingOrgChartButton();
    }
}