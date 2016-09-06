package com.rl.qa.steps;

import com.rl.qa.browsers.BrowserDriver;
import com.rl.qa.utils.SeleniumUtilities;
import com.rl.qa.views.CreateEditDelJenkinsViews;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * Created by RLE0372 on 01-08-2016.
 */
public class CreateEditDelJenkinsSteps {
    private static final Logger logger = Logger.getLogger(LoginSteps.class.getName());
    private static final com.rl.qa.utils.SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);


    @And("^I enter \"([^\"]*)\" in \"([^\"]*)\" Edit box$")
    public void iEnterInEditBox(String nameOfJenkins, String idOfEditBox) throws Throwable {
        CreateEditDelJenkinsViews.enterJenkinsName(nameOfJenkins,idOfEditBox);

    }

    @And("^I verify \"([^\"]*)\" in the jenkins table$")
    public void iVerifyInTheJenkinsTable(String jenkinsPara) throws Throwable {
        CreateEditDelJenkinsViews.verifyJenkins(jenkinsPara);
    }


    @And("^I verify \"([^\"]*)\" with \"([^\"]*)\" in the jenkins table$")
    public void iVerifyWithInTheJenkinsTable(String jenkinsRefName, String jenkinsPara) throws Throwable {
        CreateEditDelJenkinsViews.verifyJenkinsDetails(jenkinsRefName,jenkinsPara);
    }
}
