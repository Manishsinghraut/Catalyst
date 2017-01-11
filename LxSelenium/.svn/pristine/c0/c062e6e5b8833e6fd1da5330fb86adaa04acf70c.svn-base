package com.lucernex.qa.views.iwms.site.details.summary;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.steps.iwms.GenericSteps;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * Created by sowmya on 9/24/2015.
 */
public class SiteSurveyView extends BaseView {

    private static final Logger logger = Logger.getLogger(SiteSurveyView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void getEntityIDFromReport(String entityName) throws Throwable{
        try {
            CommonMethods.waitTillDivisionLoads();
            String entityID = SeleniumUtil.getElementText("xpath","//td//*[text()='"+entityName+"']//parent::td//following-sibling::td",1);
            GenericSteps.lxRecID = entityID.replaceAll("Parcel RecID\n", "");
            logger.info("Fetched entity ID " + GenericSteps.lxRecID);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch entity ID.png");
            Assert.fail("Unable to fetch entity ID ");
        }
    }


    public static void getEntityIDFromReportForParticularColumn(String columnName, String entityName) throws Throwable{
        try {
            CommonMethods.waitTillDivisionLoads();
            int size = BrowserDriver.getCurrentDriver().findElements(By.xpath("//tr//td[text()='"+columnName+"']/preceding-sibling::td")).size();
            String entityID = SeleniumUtil.getElementText("xpath","//td//*[text()='"+entityName+"']//parent::td//following-sibling::td["+size+"]",1);
           // String entityID = SeleniumUtil.getElementText("xpath","//td//*[text()='"+entityName+"']//parent::td//following-sibling::td["+(size-1)+"]",1);
            //GenericSteps.lxRecID = entityID.replaceAll("Parcel RecID\n", "");
            GenericSteps.lxRecID = entityID.replaceAll("\n", "");
            logger.info("Fetched entity ID " + GenericSteps.lxRecID);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch entity ID.png");
            Assert.fail("Unable to fetch entity ID ");
        }
    }

    public static void fetchCurrentDate() throws Throwable{
        try {
            GenericSteps.lxRecID = SeleniumUtil.addDaystoCurrentDate(0);
            logger.info("Fetched entity ID " + GenericSteps.lxRecID);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch entity ID.png");
            Assert.fail("Unable to fetch entity ID ");
        }
    }
}
