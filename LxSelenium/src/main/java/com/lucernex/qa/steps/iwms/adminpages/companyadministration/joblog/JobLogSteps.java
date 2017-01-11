package com.lucernex.qa.steps.iwms.adminpages.companyadministration.joblog;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.companyadministration.joblog.JobLogView;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

/**
 * Created by rle0097 on 4/29/2015.
 */
public class JobLogSteps {
    private static final Logger logger = Logger.getLogger(JobLogSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I click on log file link")
    public void I_click_log_file_link() throws Throwable{
        CommonMethods.waitTillDivisionLoads();
        //JobLogView.clickJobLog(AllContractPagesView.batchNum);
        JobLogView.clickJobLogWithSearch(AllContractPagesView.batchNum);
    }

    @Then("^I verify the following text present in log file$")
    public void I_verify_the_following_text_present_in_log_file(List<String> text) throws Throwable {
       JobLogView.verifyLogTextPresent(text);
    }

    @Then("^I verify the following text not present in log file$")
    public void I_verify_the_following_text_not_present_in_log_file(List<String> text) throws Throwable {
        JobLogView.verifyLogTextNotPresent(text);
    }
}