package com.lucernex.qa.steps.iwms.contract.details.summary;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.iwms.contract.details.summary.ExtendContractView;
import cucumber.api.java.en.Then;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

/**
 * Created by RLE0239 on 02-12-2015.
 */
public class ExtendContractSteps {

    private static final Logger logger = Logger.getLogger(ExtendContractSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);


    @Then("^I verify success message appear in top left corner of page$")
    public void I_verify_success_message_will_appear_in_top_left_corner_of_page(List<String> arg1) throws Throwable {
        ExtendContractView.validateContractExtendedSuccessMessage(arg1);
    }
}
