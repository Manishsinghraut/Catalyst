package com.rl.qa.steps;

import com.rl.qa.browsers.BrowserDriver;
import com.rl.qa.utils.BaseView;
import com.rl.qa.utils.SeleniumUtilities;
import com.rl.qa.views.CreateEditDelDesignerViews;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.openqa.selenium.support.PageFactory;

import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by rle0346 on 3/8/16.
 */
public class CreateEditDelDesignerSteps {
    private static final Logger logger = Logger.getLogger(LoginSteps.class.getName());
    private static final com.rl.qa.utils.SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I Click on \"([^\"]*)\" Link$")
    public void iClickOnLink(String StrDesignerlink) throws Throwable {
        CreateEditDelDesignerViews.clickOnUsersSetupLink(StrDesignerlink);
    }

    @And("^I Click on \"([^\"]*)\" Link in the link$")
    public void iClickOnLinkInTheLink(String strUserLink) throws Throwable {
        CreateEditDelDesignerViews.clickOnUsersLink(strUserLink);

    }

    @And("^I Click on New Button of Users page$")
    public void iClickOnNewButtonOfUsersPage() throws Throwable {
        try {
            CreateEditDelDesignerViews.clickOnNewButton();
        }
        catch (Exception e) {
            BaseView.takeScreenshot("I_click_on_New_Button");
            String msg = String.format("Unable to click on New : %s", e.getMessage());
            logger.log(Level.SEVERE, msg, e);
        }

    }

    @And("^I Enter the \"([^\"]*)\" User Login Name$")
    public void iEnterTheUserLoginName(String strDesignerName) throws Throwable {
        try{
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);

            String designerName=properties.getProperty("iwms.designerusername", "not_filtered");
            CreateEditDelDesignerViews.enterLoginName(designerName);
        }
        catch (Exception e) {
            BaseView.takeScreenshot("I_Enter_The_User_Login_Name");
            String msg = String.format("Unable to enter login name", e.getMessage());
            logger.log(Level.SEVERE, msg, e);
        }
    }

    @And("^I Enter the \"([^\"]*)\" of the User$")
    public void iEnterTheOfTheUser(String arg0) throws Throwable {
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);
            String strEmailAddress=properties.getProperty("iwms.emailaddress", "not_filtered");
            CreateEditDelDesignerViews.enterEmailAddress(strEmailAddress);
        }
        catch (Exception e) {
            BaseView.takeScreenshot("I_Enter_The_Email_address");
            String msg = String.format("Unable to enter  email", e.getMessage());
            logger.log(Level.SEVERE, msg, e);
        }

    }


    @And("^I Enter the \"([^\"]*)\" of the User field$")
    public void iEnterTheOfTheUserField(String strPassword) throws Throwable {
        try{
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);
            String userPassword=properties.getProperty("iwms.designeruserpassword", "not_filtered");
            CreateEditDelDesignerViews.enterPassword(userPassword);
        }
        catch (Exception e) {
            BaseView.takeScreenshot("I_Enter_The_Password");
            String msg = String.format("Unable to enter password", e.getMessage());
            logger.log(Level.SEVERE, msg, e);
        }
    }


    @And("^I Enter the \"([^\"]*)\" of User field$")
    public void iEnterTheOfUserField(String strConfPassword) throws Throwable {
        CreateEditDelDesignerViews.enterConfirmPassword(strConfPassword);
    }

    @And("^I Click on Org Dropdown and select \"([^\"]*)\"$")
    public void iClickOnOrgDropdownAndSelect(String strOrganization) throws Throwable {
        CreateEditDelDesignerViews.selectOrganization(strOrganization);
    }

    @And("^I Select the Role as \"([^\"]*)\"$")
    public void iSelectTheRoleAs(String strRole) throws Throwable {
        CreateEditDelDesignerViews.selectRole(strRole);

    }

    @And("^I Assign the Teams for the User with respect to \"([^\"]*)\"$")
    public void iAssignTheTeamsForTheUserWithRespectTo(String strOrganization) throws Throwable {
        try{
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);
            String organization=properties.getProperty("iwms.team", "not_filtered");
            CreateEditDelDesignerViews.selectTeam(organization);
        }
        catch (Exception e) {
            BaseView.takeScreenshot("I_Select_Team_for_User");
            String msg = String.format("Unable to select team for user", e.getMessage());
            logger.log(Level.SEVERE, msg, e);
        }
    }


    @And("^I Click on Save Button of User creation page$")
    public void iClickOnSaveButtonOfUserCreationPage() throws Throwable {
        try {
            CreateEditDelDesignerViews.clickSaveButton();
        }
        catch (Exception e) {
            BaseView.takeScreenshot("I_Click_On_Save_Button");
            String msg = String.format("Unable to click on save Button", e.getMessage());
            logger.log(Level.SEVERE, msg, e);
        }
    }


    @And("^I Click on Edit Button the \"([^\"]*)\" user created$")
    public void iClickOnEditButtonTheUserCreated(String strDesigner) throws Throwable {
        CreateEditDelDesignerViews.clickEditDesignerButton(strDesigner);
    }

    @Then("^I Verify the \"([^\"]*)\" User is created$")
    public void iVerifyTheUserIsCreated(String strDesigner) throws Throwable {
        CreateEditDelDesignerViews.verifyDesignerUserCreation(strDesigner);
    }

    @And("^I Verify the Login name is disabled$")
    public void iVerifyTheLoginNameIsDisabled() throws Throwable {
        CreateEditDelDesignerViews.VerifyLoginNameDisabled();

    }

    @And("^I Click on Update Password tick$")
    public void iClickOnUpdatePasswordTick() throws Throwable {
        CreateEditDelDesignerViews.clickOnUpdatePasswordCheckbox();
    }


    @And("^I Click on Delete button of the \"([^\"]*)\" user created$")
    public void iClickOnDeleteButtonOfTheUserCreated(String strDesigner) throws Throwable {
        CreateEditDelDesignerViews.clickOnDeleteButton(strDesigner);

    }

    @And("^I Click on \"([^\"]*)\" Button to remove the Designer user$")
    public void iClickOnButtonToRemoveTheDesignerUser(String strOK) throws Throwable {
        CreateEditDelDesignerViews.clickOnOkButton(strOK);
    }

    @And("^I Verify the \"([^\"]*)\" is updated$")
    public void iVerifyTheIsUpdated(String strEmailAddress) throws Throwable {
        CreateEditDelDesignerViews.verfiyEmailAddressUpdated(strEmailAddress);
    }

    @And("^I Assign the Teams for the SuperAdmin User with respect to \"([^\"]*)\"$")
    public void iAssignTheTeamsForTheSuperAdminUserWithRespectTo(String strDefaultTeam) throws Throwable {
        CreateEditDelDesignerViews.selectDefaultTeam(strDefaultTeam);

    }

    @Then("^I Verify the \"([^\"]*)\" User with this \"([^\"]*)\" is created$")
    public void iVerifyTheUserWithThisIsCreated(String strDesigner, String strEmailAddress) throws Throwable {
        CreateEditDelDesignerViews.VerifyEmailAddress(strDesigner, strEmailAddress);

    }

    @Then("^I Verify the \"([^\"]*)\" User with this \"([^\"]*)\" created$")
    public void iVerifyTheUserWithThisCreated(String strDesigner, String strDesignerRole) throws Throwable {
        CreateEditDelDesignerViews.VerifyDesignerRoleInTable(strDesigner, strDesignerRole);
    }


    @Then("^I Verify the \"([^\"]*)\" User with this \"([^\"]*)\" is available$")
    public void iVerifyTheUserWithThisIsAvailable(String strDesigner, String strOrganization) throws Throwable {
        CreateEditDelDesignerViews.VerifyOrganizationInTable(strDesigner, strOrganization);
    }

    @Then("^I select the \"([^\"]*)\" and verify \"([^\"]*)\" Button is enabled$")
    public void iSelectTheAndVerifyButtonIsEnabled(String strOrganization, String strEdit) throws Throwable {
        CreateEditDelDesignerViews.verifyButtonIsEnabled(strOrganization, strEdit);
    }

    @Then("^I Verify the \"([^\"]*)\" user is deleted$")
    public void iVerifyTheUserIsDeleted(String strDesigner) throws Throwable {
        CreateEditDelDesignerViews.verifyDeletedUser(strDesigner);
    }
}
