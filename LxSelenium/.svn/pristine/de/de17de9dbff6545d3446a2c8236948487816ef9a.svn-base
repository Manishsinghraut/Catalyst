package com.lucernex.qa.views.setupwizards;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.setupwizards.SetupWizardAssignMembersPage;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * Created by ToanD on 4/2/2014.
 */
public class SetupWizardAssignMembersView {

    private static final Logger logger = Logger.getLogger(SetupWizardAssignMembersView.class.getName());
    private static final SetupWizardAssignMembersPage setupWizardAssignMembersPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SetupWizardAssignMembersPage.class);

    public static void clickAssignMembersButton() {
        logger.info("Clicking Assign Mambers button... ");
        setupWizardAssignMembersPage.assignMembersButton.click();
    }
}
