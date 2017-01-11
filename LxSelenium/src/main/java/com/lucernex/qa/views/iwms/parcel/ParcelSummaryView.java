package com.lucernex.qa.views.iwms.parcel;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.steps.iwms.GenericSteps;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import org.junit.Assert;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * Created by sowmya on 9/24/2015.
 */
public class ParcelSummaryView extends BaseView {

    private static final Logger logger = Logger.getLogger(ParcelSummaryView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void getEntityID() throws Throwable{
        try {
            CommonMethods.switchToVisibleFrame();
            CommonMethods.waitTillDivisionLoads();
            String entityID = SeleniumUtil.getElementText("xpath","//*[@id='ParcelID_label']/parent::td",1);
            GenericSteps.lxRecID = entityID.replaceAll("Parcel RecID\n", "");
            logger.info("Fetched entity ID " + GenericSteps.lxRecID);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch entity ID.png");
            Assert.fail("Unable to fetch entity ID ");
        }
    }
}
