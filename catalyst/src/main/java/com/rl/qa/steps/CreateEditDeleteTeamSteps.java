package com.rl.qa.steps;

import com.rl.qa.browsers.BrowserDriver;
import com.rl.qa.utils.SeleniumUtilities;
import com.rl.qa.views.CreateEditDeleteTeamViews;
import cucumber.api.java.en.And;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * Created by RLE0372 on 16-08-2016.
 */
public class CreateEditDeleteTeamSteps {
    private static final Logger logger = Logger.getLogger(com.rl.qa.steps.LoginSteps.class.getName());
    private static final com.rl.qa.utils.SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I verify created \"([^\"]*)\" in the teams table$")
    public void iVerifyCreatedInTheTeamsTable(String teamName) throws Throwable {
        CreateEditDeleteTeamViews.verifyTeamName(teamName);
    }

    @And("^I verify created \"([^\"]*)\" with \"([^\"]*)\" in the teams table$")
    public void iVerifyCreatedWithInTheTeamsTable(String teamName, String TeamDetails)throws Throwable {
        CreateEditDeleteTeamViews.verifyTeamDetails(teamName,TeamDetails);
    }

    @And("^I check the \"([^\"]*)\" check box$")
    public void iCheckTheCheckBox(String value) throws Throwable {
        CreateEditDeleteTeamViews.checkTheCheckBox(value);
    }
}
