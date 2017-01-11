package com.lucernex.qa.steps.iwms.setupwizards;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.setupwizards.SetupWizardAssignMembersView;
import cucumber.api.java.en.Then;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;


/**
 * Created by RLE0097 on 05/08/2015.
 */
public class SetupWizardAssignMembersSteps {
    private static final Logger logger = Logger.getLogger(SetupWizardAssignMembersSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @Then("^I click on Assign Members button$")
    public void I_click_on_Assign_Members_button_in_entity_setup_wizard() throws Throwable{
        try {
            SetupWizardAssignMembersView.clickAssignMembersButton();
            CommonMethods.waitTillDivisionLoads();
        } catch (Exception ex) {
            BaseView.takeScreenshot("I_click_on_Assign_Members_button_in_entity_setup_wizard.png");
            logger.info("Error :" + ex.getMessage());
        }
    }
}