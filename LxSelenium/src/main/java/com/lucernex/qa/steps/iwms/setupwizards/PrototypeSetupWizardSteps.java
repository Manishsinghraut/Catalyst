package com.lucernex.qa.steps.iwms.setupwizards;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.setupwizards.PrototypeSetupWizardView;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;


/**
 * Created by RLE0097 on 3/27/2015.
 */
public class PrototypeSetupWizardSteps {

    private static final Logger logger = Logger.getLogger(PrototypeSetupWizardSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @Then("^I verify label and value on summary page$")
    public void I_verify_label_and_value_on_summary_page(List<Field> fields) throws Throwable {
        PrototypeSetupWizardView.verifyValueAndLabelOnSummaryPage(fields);
    }


    @Then("^I verify description \"([^\"]*)\"$")
    public void I_verify_description(String strMember) throws Throwable {
        PrototypeSetupWizardView.verifyDescription(strMember);
    }
}