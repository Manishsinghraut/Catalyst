package com.lucernex.qa.views.iwms.adminpages.companyadministration.joblog;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.admin.AdminGridView;
import com.lucernex.qa.views.iwms.CommonMethods;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static junit.framework.TestCase.fail;

/**
 * Created by rle0097 on 06/11/2015.
 */
public class JobLogView {

    private static final Logger logger = Logger.getLogger(Logger.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    JobLogView() throws Throwable {
        CommonMethods.switchToVisibleFrame();
    }

    public static void clickJobLog(String batchID) {
        try {
            SeleniumUtil.click("paritallinktext", batchID, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("ClickJobLogError.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void clickJobLogWithSearch(String batchID) throws Throwable{
        try {
            AdminGridView. searchRecordInGrid(batchID);
//            BrowserDriver.getCurrentDriver().findElement(By.partialLinkText(batchID)).click();
            SeleniumUtil.waitForElementIsClickable("paritallinktext", batchID, 6, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.dblClick("paritallinktext", batchID, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("ClickJobLogError.png");
            logger.info("UnabletoClick log file "+batchID);
            Assert.fail("Failed to click link"+batchID+"\n" + e.getMessage());
        }
    }

    public static void verifyLogTextPresent(List<String> text) throws Throwable {
        try {
            JobLogView obj = new JobLogView();

            for (String f : text) {
                int size = BrowserDriver.getCurrentDriver().findElements(By.tagName("td")).size();
                int count = 0;
                int moreThanOne = 0;
                for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.tagName("td"))) {
                    count++;
                    if (count < size) {
                        if (ele.getText().contains(f)) {
                            logger.info("Text value: " + f + " is present");
                            moreThanOne++;
                            break;
                        }
                    } else {
                        fail("Text value: " + f + " is not present");
                    }
                }
                if(moreThanOne!=1){
                    fail("More than one " + f + " is present");
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("VerifyLogTextError.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void verifyLogTextNotPresent(List<String> text) throws Throwable {
        try {
            JobLogView obj = new JobLogView();
            for (String f : text) {
                for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.tagName("td"))) {
                    if (ele.getText().contains(f)) {
                        fail("Text value: " + f + " is present");
                    }
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("VerifyLogTextError.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void verifyTextNotPresent(List<String> text) throws Throwable {
        try {
            for (String f : text) {
                for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.tagName("td"))) {
                    if (ele.getText().contains(f)) {
                        fail("Text value: " + f + " is present");
                    }
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("VerifyLogTextError.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }
}