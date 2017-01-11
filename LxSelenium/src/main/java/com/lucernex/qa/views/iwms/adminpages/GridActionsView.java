package com.lucernex.qa.views.iwms.adminpages;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import junit.framework.TestCase;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.fail;

/**
 * Created by rle0097 on 4/29/2015.
 */
public class GridActionsView {
    private static final Logger logger = Logger.getLogger(GridActionsView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void gridActions(String strTitle, String action, String gridID) throws Throwable {
        try {
            waitForGridToLoad(gridID);
            SeleniumUtil.clickElement("xpath", "//div[@id='" + gridID + "']//table//td//div[text()='" + strTitle + "']/parent::td/following-sibling::td//a[text()='" + action + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("Clicked link " + action);
        } catch (InterruptedException e) {
            BaseView.takeScreenshot(strTitle + action + ".png");
            TestCase.fail(e.getMessage());
        } catch (Exception e) {
            BaseView.takeScreenshot(strTitle + action + ".png");
            TestCase.fail(e.getMessage());
        }
    }

    public static void gridActionsForSubRows(String strTitle, String action, String gridID) throws Throwable {
        try {
            waitForGridToLoad(gridID);
            //SeleniumUtil.clickElement("xpath", "//div[@id='"+gridID+"']//table//td[text()='" + strTitle + "']/following-sibling::td//a[text()='"+action+"']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", "//div[@id='" + gridID + "']//table//td[text()='" + strTitle + "']/following-sibling::td//a[text()='" + action + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("Clicked link " + action);
        } catch (InterruptedException e) {
            BaseView.takeScreenshot(strTitle + action + ".png");
            TestCase.fail(e.getMessage());
        } catch (Exception e) {
            BaseView.takeScreenshot(strTitle + action + ".png");
            TestCase.fail(e.getMessage());
        }
    }

    public static void gridActionsForManageDataFields(String action, String strTitle, String gridID) throws Throwable {
        try {
            waitForGridToLoad(gridID);
            AllContractPagesView.focusWebElement(SeleniumUtil.getWebElementObject("xpath", "//div[@id='" + gridID + "']//table//td//*[text()='" + strTitle + "']/parent::td/following-sibling::td//a[text()='" + action + "']"));
            /*CommonMethods.moveToWebElementAndFocus(BrowserDriver.getCurrentDriver().findElement(By.xpath("//div[@id='"+gridID+"']//table//td/*//*[text()='"+strTitle+"']/parent::td/following-sibling::td//a[text()='"+action+"']")));
            SeleniumUtil.click("xpath", "", SeleniumUtilities.OBJWAITTIMEOUT);*/
            SeleniumUtil.click("xpath", "//div[@id='" + gridID + "']//table//td/*//*[text()='" + strTitle + "']/parent::td/following-sibling::td//a[text()='" + action + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("Clicked link " + action);
        } catch (InterruptedException e) {
            BaseView.takeScreenshot(strTitle + action + ".png");
            TestCase.fail(e.getMessage());
        } catch (Exception e) {
            BaseView.takeScreenshot(strTitle + action + ".png");
            TestCase.fail(e.getMessage());
        }
    }

    public static void clickRow(String strTitle, String gridID) throws Throwable {
        try {
            waitForGridToLoad(gridID);
            SeleniumUtil.clickElement("xpath", "//div[@id='" + gridID + "']//table//td//div[text()='" + strTitle + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("Clicked row " + strTitle);
        } catch (InterruptedException e) {
            BaseView.takeScreenshot(strTitle + ".png");
            TestCase.fail(e.getMessage());
        } catch (Exception e) {
            BaseView.takeScreenshot(strTitle + ".png");
            TestCase.fail(e.getMessage());
        }
    }

    public static void waitTillDivisionLoads() throws Throwable {
        //Loading starts sometimes after some delay
        //delay(2000);
        try {
            BaseView.pushShortTimeout();
            BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id*='loadmask'][id*='msgText']"));
            //if loading elements present fetch all the loading elements
            for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id*='loadmask'][id*='msgText']"))) {
                //wait till grid load
                for (int i = 0; i < 5; i++) {
                    if (ele.isDisplayed()) {
                        //delay(2000);
                    } else {
                        break;
                    }
                }
            }
        } catch (NoSuchElementException ne) {
            logger.info("No loading element present in this page");
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void waitForGridToLoad(String gridID) throws Throwable {
        waitTillDivisionLoads();
    }

    public static void verifyPageLayoutNotPresent(String gridID, String uniqueValue, String header) throws Throwable {
        waitForGridToLoad(gridID);
        int fixCol = 0;
//        SeleniumUtil.waitForNonStaleWebElement("cssselector", "div[id='" + gridID + "']",8, SeleniumUtilities.OBJWAITTIMEOUT);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']"));
        //Fix the row in grid
//        SeleniumUtil.waitForNonStaleWebElement("cssselector", "table.rowColor1",8, SeleniumUtilities.OBJWAITTIMEOUT);
        for (WebElement table : gridElement.findElements(By.cssSelector("table.rowColor1"))) {
            for (WebElement tr : table.findElements(By.cssSelector("tr"))) {
                fixCol = 0;
                for (WebElement td : tr.findElements(By.cssSelector("td"))) {
                    fixCol++;
//                    SeleniumUtil.waitForNonStaleWebElement("cssselector", "td.tblSubHeader:nth-of-type(" + fixCol + ")",8, SeleniumUtilities.OBJWAITTIMEOUT);
                    if (tr.findElement(By.cssSelector("td.tblSubHeader:nth-of-type(" + fixCol + ")")).getText().contains(header)) {
                        if (td.getText().contains(uniqueValue)) {
                            fail("Expected row present in the grid");
                        }
                    }
                }
            }
        }
        logger.info("Expected row not present in the grid");
    }

    public static void verifyGridRowNotPresent(String gridID, String uniqueValue, String header) throws Throwable {
        waitForGridToLoad(gridID);
        int fixCol = 0;
        SeleniumUtil.waitForNonStaleWebElement("cssselector","div[id='" + gridID + "']",8,SeleniumUtilities.OBJWAITTIMEOUT);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']"));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
        //Fix the row in grid
        for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
            fixCol = 0;
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                fixCol++;
                if (headers.get(fixCol - 1).getText().contains(header)) {
                    if (td.getText().contains(uniqueValue)) {
                        fail("Expected row present in the grid");
                    }
                }
            }
        }
        logger.info("Expected row not present in the grid");
    }
}
