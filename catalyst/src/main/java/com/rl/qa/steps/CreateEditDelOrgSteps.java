package com.rl.qa.steps;

import com.rl.qa.browsers.BrowserDriver;
import com.rl.qa.utils.SeleniumUtilities;
import com.rl.qa.views.CreateEditDelOrgViews;
import cucumber.api.java.en.And;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * Created by RLE0372 on 18-07-2016.
 */
public class CreateEditDelOrgSteps {
    private static final Logger logger = Logger.getLogger(LoginSteps.class.getName());
    private static final com.rl.qa.utils.SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I click on the Settings Link$")
    public void iClickOnTheSettingsLink() throws Throwable {
        CreateEditDelOrgViews.clickOnSettings();
    }
    @And("^I click on Organizations link in main page$")
    public void iClickOnOrganizationsLinkInMainPage() throws Throwable {
        CreateEditDelOrgViews.clickOnOrganizations();
    }

    @And("^I click on \"([^\"]*)\" button$")
    public void iClickOnButton(String newButtonId) throws Throwable {
        CreateEditDelOrgViews.clickOnNewButton(newButtonId);
    }

    @And("^I click on save button$")
    public void iClickOnSaveButton() throws Throwable {
        CreateEditDelOrgViews.saveOrg();
    }

    @And("^I clear the existing \"([^\"]*)\" in the edit box$")
    public void iClearTheExistingInTheEditBox(String idOfEditbox) throws Throwable {
        CreateEditDelOrgViews.clearTheField(idOfEditbox);
    }


    @And("^I enter the \"([^\"]*)\" name to be changed$")
    public void iEnterTheNameToBeChanged(String New_Organization) throws Throwable {
        CreateEditDelOrgViews.enterNewOrgName(New_Organization);
    }


    @And("^I click on \"([^\"]*)\" delete button$")
    public void iClickOnDeleteButton(String New_Organization) throws Throwable {

        CreateEditDelOrgViews.delOrg(New_Organization);
    }

    @And("^I click on OK button$")
    public void iClickOnOKButton() throws Throwable {
        CreateEditDelOrgViews.clickOnOK();
    }


    @And("^I click on the Settings Link when control is on organization page$")
    public void iClickOnTheSettingsLinkWhenControlIsOnOrganizationPage() throws Throwable {
        CreateEditDelOrgViews.clickOnSettingsFromOrgPage();
    }

    @And("^I verify the created \"([^\"]*)\" in list$")
    public void iVerifyTheCreatedInList(String organizationName) throws Throwable {
        CreateEditDelOrgViews.verifyCreatedOrg(organizationName);
    }

    @And("^I see the catalyst \"([^\"]*)\"$")
    public void iSeeTheCatalyst(String idOfElement) throws Throwable {
        CreateEditDelOrgViews.seeWorkzone(idOfElement);
    }

    @And("^I verify the edited \"([^\"]*)\" in list$")
    public void iVerifyTheEditedInList(String editedOrg) throws Throwable {
        CreateEditDelOrgViews.verifyEditedOrg(editedOrg);
    }

    @And("^I verify login page is displayed$")
    public void iVerifyLoginPageIsDisplayed() throws Throwable {
        CreateEditDelOrgViews.verifyLoginPage();
    }

    @And("^I verify the \"([^\"]*)\" is deleted$")
    public void iVerifyTheIsDeleted(String orgName) throws Throwable {
        CreateEditDelOrgViews.verifyDeletedOrg(orgName);
    }

    @And("^I verify \"([^\"]*)\" with \"([^\"]*)\" in the organization list$")
    public void iVerifyWithInTheOrganizationList(String domainName, String orgName) throws Throwable {
        CreateEditDelOrgViews.verifyDomainName(domainName,orgName);
    }

    @And("^I verify \"([^\"]*)\" status with \"([^\"]*)\" in the organization list$")
    public void iVerifyStatusWithInTheOrganizationList(String status, String orgName) throws Throwable {
        CreateEditDelOrgViews.verifyStatusOfOrg(status,orgName);
    }
}
