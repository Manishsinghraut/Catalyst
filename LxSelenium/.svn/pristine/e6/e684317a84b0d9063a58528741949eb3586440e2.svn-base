package com.lucernex.qa.views.iwms.location.summary;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.pages.iwms.contract.paymentInfo.recoveries.RecoveriesPage;
import com.lucernex.qa.pages.iwms.location.summary.LocationsPage;
import com.lucernex.qa.steps.iwms.GenericSteps;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import junit.framework.TestCase;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

/**
 * Created by sowmya on 9/24/2015.
 */
public class SummaryView extends BaseView {

    private static final Logger logger = Logger.getLogger(SummaryView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private static final LocationsPage locationsPage = PageFactory.initElements(
            BrowserDriver.getCurrentDriver(),
            LocationsPage.class
    );

    public static void getEntityID() throws Throwable{
        try {
            CommonMethods.switchToVisibleFrame();
            CommonMethods.waitTillDivisionLoads();
            String entityID = SeleniumUtil.getElementText("xpath","//*[@id='EntityId_label']/parent::td",1);
            GenericSteps.lxRecID = entityID.replaceAll("Entity LxID\n", "");
            logger.info("Fetched entity ID " + GenericSteps.lxRecID);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch entity ID.png");
            Assert.fail("Unable to fetch entity ID ");
        }
    }
}
