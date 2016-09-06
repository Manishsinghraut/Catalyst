package com.rl.qa.steps;

import com.rl.qa.browsers.BrowserDriver;
import com.rl.qa.utils.BaseView;
import com.rl.qa.utils.SeleniumUtilities;
import com.rl.qa.views.CreateEditDelDockerViews;
import cucumber.api.java.en.And;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

import static junit.framework.TestCase.fail;

/**
 * Created by RLE0372 on 01-08-2016.
 */
public class CreateEditDelDockerSteps {
    private static final Logger logger = Logger.getLogger(LoginSteps.class.getName());
    private static final com.rl.qa.utils.SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);


    @And("^^I click on \"([^\"]*)\" link$")
    public void iClickOnLink(String linkText) throws Throwable {
        CreateEditDelDockerViews.clickOnDevopsSetup(linkText);
    }

    @And("^I enter \"([^\"]*)\" in user id edit box$")
    public void iEnterInUserIdEditBox(String userId) throws Throwable {
        CreateEditDelDockerViews.enterUserID(userId);
    }

    @And("^I Enter \"([^\"]*)\" in docker \"([^\"]*)\"$")
    public void iEnterInDocker(String dockerName, String dockerreponame) throws Throwable {
        CreateEditDelDockerViews.enterDockerHubRegistry(dockerName,dockerreponame);
    }

    @And("^I enter \"([^\"]*)\" in docker hub registry edit box$")
    public void iEnterInDockerHubRegistryEditBox(String DocerHubRegName) throws Throwable {
        CreateEditDelDockerViews.enterDockerHubRegistryName(DocerHubRegName);
    }

    @And("^I verify \"([^\"]*)\" page is displayed$")
    public void iVerifyPageIsDisplayed(String editDocker) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath","",8,SeleniumUtilities.OBJWAITTIMEOUT);
            if(SeleniumUtil.waitUntilElementContainsText("xpath","//*[contains(text(),'Edit Docker')]","Edit Docker",8,SeleniumUtilities.OBJWAITTIMEOUT)) {
                logger.info("Verified : " + editDocker);
            }
        } catch (Exception e) {
            try {
                SeleniumUtil.getWebElementObject("xpath", "//a[text()='Nodes']");
            } catch (Exception ex) {
                BaseView.takeScreenshot(editDocker + ".png");
                logger.info("Error :" + e.getMessage());
                fail(e.getMessage());
            }
        }

    }
    
    @And("^I verify \"([^\"]*)\" in the docker table$")
    public void iVerifyInTheDockerTable(String dockerName) throws Throwable {
        CreateEditDelDockerViews.verifyDocker(dockerName);
    }

    @And("^I verify select organization is disabled in edit docker page$")
    public void iVerifySelectOrganizationIsDisabledInEditDockerPage() throws Throwable {
        CreateEditDelDockerViews.verifySelOrgIsDisabled();
    }

    @And("^I verify \"([^\"]*)\" with \"([^\"]*)\" in the docker table$")
    public void iVerifyWithInTheDockerTable(String dockerName, String dockerDetails) throws Throwable {
        CreateEditDelDockerViews.verifyDockerInfo(dockerName,dockerDetails);
    }
}
