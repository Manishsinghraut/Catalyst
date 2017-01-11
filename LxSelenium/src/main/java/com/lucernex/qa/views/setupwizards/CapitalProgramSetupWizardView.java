package com.lucernex.qa.views.setupwizards;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.setupwizards.SetupWizardAssignMembersPage;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.iwms.CommonMethods;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

/**
 * Created by ToanD on 4/2/2014.
 */
public class CapitalProgramSetupWizardView {

    private static final Logger logger = Logger.getLogger(CapitalProgramSetupWizardView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void selectFacility(String strFacility) throws Throwable{
        CommonMethods.waitTillDivisionLoads();
        SeleniumUtil.click("xpath","//td//div[contains(text(),'"+strFacility+"')]/parent::td/preceding-sibling::td//img", SeleniumUtilities.OBJWAITTIMEOUT);
    }
}
