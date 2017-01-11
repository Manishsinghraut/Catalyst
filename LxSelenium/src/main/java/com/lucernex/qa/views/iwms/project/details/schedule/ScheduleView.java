package com.lucernex.qa.views.iwms.project.details.schedule;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.FileDownloader;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.entity.GenericEntityView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.contract.reports.ReportsView;
import com.lucernex.qa.views.iwms.portfolio.orgchart.OrgChartView;
import junit.framework.Assert;
import junit.framework.TestCase;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;
import static junit.framework.TestCase.fail;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

//import org.eclipse.jetty.util.log.Log;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

/**
 * Created by rle0239 on 8-07-2015.
 */
public class ScheduleView {

    private static final Logger logger = Logger.getLogger(ScheduleView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void rightClickOnTask(String taskName) {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".x-menu-body.x-menu-body.x-unselectable.x-menu-body-default.x-box-layout-ct.x-menu-body-default")));
                break;
            } catch (Exception e) {
                BaseView.takeScreenshot("RightClickOnTaskOrGroupError.png");
            }
        }
        if (i == 10) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".x-menu-body.x-menu-body.x-unselectable.x-menu-body-default.x-box-layout-ct.x-menu-body-default")));
            } catch (Exception e) {
                BaseView.takeScreenshot("RightClickOnTaskOrGroupError.png");
                fail("Failed to right click task" + e.getMessage());
            }
        }
    }

    public static void rightClickAndDoFirstLevelAction(String taskName, String action) throws Throwable {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".x-menu-body.x-menu-body.x-unselectable.x-menu-body-default.x-box-layout-ct.x-menu-body-default")));
                CommonMethods.clickButton(action);
                break;
            } catch (Exception e) {
                BaseView.takeScreenshot("RightClickOnTaskOrGroupError.png");
            }
        }
        if (i == 10) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".x-menu-body.x-menu-body.x-unselectable.x-menu-body-default.x-box-layout-ct.x-menu-body-default")));
            } catch (Exception e) {
                BaseView.takeScreenshot("RightClickOnTaskOrGroupError.png");
                fail("Failed to right click task" + e.getMessage());
            }
        }
    }

    public static void addNewTaskAbove(String taskName) {
        int i = 0;
       // SeleniumUtil.waitForElementIsClickable("xpath", "//span[./text()='" + taskName + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
        for (i = 0; i < 10; i++) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                SeleniumUtil.click("xpath", "//span[./text()='Add...']//following-sibling::div", 2);
                CommonMethods.clickButton("Task above");
                break;
            } catch (Exception e) {
            }
        }

        if (i == 10) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("span"), "Add..."));
                CommonMethods.clickButton("Add...");
                wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("span"), "Task above"));
                CommonMethods.clickButton("Task above");
            } catch (Exception e) {
                BaseView.takeScreenshot("Failed to Add new Task.png");
                fail("Failed to Add new Task" + e.getMessage());
            }
        }
    }

    public static void optionsToADD(String taskName, List<String> options) {
        for (int i = 0; i < 10; i++) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                SeleniumUtil.click("xpath", "//span[./text()='Add...']//following-sibling::div", 10);
                for (String option : options) {
                    WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
                    wait.until(ExpectedConditions.visibilityOf(BrowserDriver.getCurrentDriver().findElement(By.linkText(option))));
                }
                return;
            } catch (Exception e) {
            }
        }
        BaseView.takeScreenshot("options not displayed.png");
        fail("options not displayed");
    }


    public static void expandGanttChart() {
        try {

            SeleniumUtil.waitForElementIsClickable("cssselector", "span.icon-expandall", 10, SeleniumUtilities.OBJWAITTIMEOUT);
            BaseView.pushShortTimeout(2);
            int count = 0;
            do {
                count++;
                try {
                    BrowserDriver.getCurrentDriver().findElement(By.cssSelector("span.icon-expandall")).click();
                    break;
                } catch (StaleElementReferenceException se) {
                } catch (Exception e) {
                }
            } while (!(BrowserDriver.getCurrentDriver().
                    findElements(By.cssSelector("tr[class^='x-grid-tree-node-expanded']")).size() > 0) && count < 20);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to expand task gantt chart");
            BaseView.popDefaultTimeout();
            fail("Failed to expand task gantt chart");
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void clickSaveChangesToolBar() {
        try {
            BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".icon-save")).click();
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to click save changes tool bar.png");
            fail("Failed to click save changes tool bar");
        }
    }

    public static void verifyBLDates(String strTaskName, String strBLStartDate, String strBLEndDate) {
        try {
            SeleniumUtil.verifyTextValue("xpath", "//span[contains(.,'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[9]/div", strBLStartDate, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", "//span[contains(.,'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[10]/div", strBLEndDate, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to verify the Base Line Dates");
            fail("Failed to verify the Base Line Dates");
        }
    }

    public static void verifyLeadLagDays(String strFieldName, String strLeadLagDays) {
        try {
            SeleniumUtil.verifyTextValue("xpath", ".//div[contains(./text(),'" + strFieldName + "')]/parent::td/following-sibling::td/div", strLeadLagDays, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to verify the Base Line Dates");
            fail("Failed to verify the Base Line Dates");
        }
    }

    public static void applyChanges(String strButtonValue) {
        try {
            SeleniumUtil.click("cssselector", "input[value='" + strButtonValue + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to click on applyChanges button");
            fail("Failed to click on applyChanges button");
        }
    }

    public static void dragBarGraph() {
        try {
            SeleniumUtil.dragAndDropElementXYOffSet("cssselector", "div[id^='Lx-ui-GanttPanel'] div[id$='locked-splitter']", 200, 200);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to drag Bar Graph");
            fail("Failed to drag Bar Graph");
        }
    }

    public static void doubleClickPercentageDone(String strTask, String strPercentage) {
        try {
            SeleniumUtil.dblClickSendKey("xpath", "//span[contains(./text(),'" + strTask + "')]/parent::div/parent::td/following-sibling::td[3]/div", "name", "PercentComplete", strPercentage, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to double Click % Done");
            fail("Failed to double Click % Done");
        }
    }

    public static void doubleClickPercentageDoneCol(String strTask, String strPercentage) {
        try {
            SeleniumUtil.dblClickSendKey("xpath", "//span[contains(./text(),'" + strTask + "')]/parent::div/parent::td/following-sibling::td[4]/div", "name", "PercentComplete", strPercentage, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to double Click % Done");
            fail("Failed to double Click % Done");
        }
    }

    public static void doubleClickFAStartField(String strTask, String strFAStartDate) {
        try {
            SeleniumUtil.dblClickSendKey("xpath", "//span[contains(./text(),'" + strTask + "')]/parent::div/parent::td/following-sibling::td[5]/div", "cssselector", "input[id^='startdatefield']", strFAStartDate, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to double Click F/A Start Field");
            fail("Failed to double Click F/A Start Field");
        }
    }

    public static void doubleClickCommentField(String strTask, String strComment) {
        try {
            SeleniumUtil.dblClickSendKey("xpath", "//span[contains(./text(),'" + strTask + "')]/parent::div/parent::td/following-sibling::td[9]/div", "name", "Description", strComment, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to double Click F/A Start Field");
            fail("Failed to double Click F/A Start Field");
        }
    }

    public static void doubleClickFAEndField(String strTask, String strFAEndDate) {
        try {
            SeleniumUtil.dblClickSendKey("xpath", "//span[contains(./text(),'" + strTask + "')]/parent::div/parent::td/following-sibling::td[6]/div", "cssselector", "input[id^='enddatefield']", strFAEndDate, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to double Click F/A Start Field");
            fail("Failed to double Click F/A Start Field");
        }
    }

    public static void verifyTheStatusofTask(String strTask, String strStatus) {
        try {
            SeleniumUtil.verifyTextValue("xpath", ".//div[contains(./text(),'" + strStatus + "')]/parent::td/preceding-sibling::td[2]/div/span[contains(./text(),'" + strTask + "')]", strStatus, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to double Click % Done");
            fail("Failed to double Click % Done");
        }
    }

    public static void verifyTheFAStartnEndDate(String strTask, String strFADate) {
        try {
            SeleniumUtil.verifyTextValue("xpath", ".//div[contains(./text(),'" + strFADate + "')]/parent::td/preceding-sibling::td[4]/div/span[contains(./text(),'" + strTask + "')]", strFADate, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//div[contains(./text(),'" + strFADate + "')]/parent::td/preceding-sibling::td[5]/div/span[contains(./text(),'" + strTask + "')]", strFADate, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to double Click % Done");
            fail("Failed to double Click % Done");
        }
    }

    public static void verifyTheEndDate(String strTask, String strFADate) {
        try {
            SeleniumUtil.verifyTextValue("xpath", ".//div[contains(./text(),'" + strFADate + "')]/parent::td/preceding-sibling::td[5]/div/span[contains(./text(),'" + strTask + "')]", strFADate, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to double Click % Done");
            fail("Failed to double Click % Done");
        }
    }

    public static void verifyComment(String strTask, String strComment) {
        try {
            SeleniumUtil.verifyTextValue("xpath", ".//div[contains(./text(),'" + strComment + "')]/parent::td/preceding-sibling::td[9]/div/span[contains(./text(),'" + strTask + "')]", strComment, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to double Click % Done");
            fail("Failed to double Click % Done");
        }
    }

    public static void clickOnUploadNewDocLink() {
        try {
            SeleniumUtil.switchTodefaultContent();
            BaseView.popDefaultTimeout();
            //SeleniumUtil.click("xpath", ".//a[contains(./text(),'Upload new document to')]", SeleniumUtilities.OBJWAITTIMEOUT);
            BrowserDriver.getCurrentDriver().findElement(By.xpath("//a[contains(text(),'Upload new document to')]")).click();
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to click On Upload New Doc Link");
            fail("Failed to click On Upload New Doc Link");
        }
    }

    public static void clickOnOkButton() {
        try {
            SeleniumUtil.click("xpath", "//span[contains(./text(),'Ok')]", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to click On Upload New Doc Link");
            fail("Failed to click On Upload New Doc Link");
        }
    }

    public static void clickOnDownloadButton() {
        try {
            FileDownloader.fileDownloader("cssselector", "img[alt='Download']");
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to click On Download Button");
            fail("Failed to click On Download Button");
        }
    }

    public static void clickOnOkFileLink(String strFileName) {
        try {
            SeleniumUtil.click("xpath", "//a[contains(./text(),'" + strFileName + "')]", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to click On Ok File Link");
            fail("Failed to click On Ok File Link");
        }
    }

    public static void rightClickOnBlueBar(int intBlueBarRow, String strMenuOption) {
        try {
            int intEleCount = 0;
            List<WebElement> eles = BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".sch-event-wrap.sch-gantt-task.x-unselectable"));

            for (WebElement ele : eles) {
                intEleCount++;
                if (intEleCount == intBlueBarRow)
                    SeleniumUtil.rightClickSelectMenuOption(ele, strMenuOption);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Right Click On Blue Bar");
            fail("Failed to Right Click On Blue Bar");
        }
    }

    public static void verifyRowsInCollapsedMode(String gridId, List<String> values) {

        try {
            String strElement = AllContractPagesView.getGridElement(gridId);
            WebElement gridElement = null;
            gridElement = AllContractPagesView.findGrid(strElement);
            for (String val : values) {
                for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
                    for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                        AllContractPagesView.focusWebElement(td);
                        if (td.getText().equalsIgnoreCase(val)) {
                            logger.info("Error:" + val + "is present in the grid");
                            BaseView.takeScreenshot("Failed to verify Gant View Collapsed");
                            fail("Error:" + val + "is present in the grid" + "Failed to verify Gant View Collapsed");
                            break;
                        }
                    }
                }
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to verify Gant View Collapsed");
            fail("Failed to verify Gant View Collapsed");
        }
    }

    public static void verifySpreedSheetViewDates(String strTaskName, String strFAStartDate, String strFAEndDate, String strBLStartDate, String strBLEndDate) {
        try {
            SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[4]", strFAStartDate, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[5]", strFAEndDate, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[9]", strBLStartDate, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[10]", strBLEndDate, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the SpreedSheet view Dates");
            fail("Failed to Verify the SpreedSheet view Dates");
        }
    }

    public static void rightClickDeleteDependency(String strTaskName, String strMoveMenuOption, String strMenuOptionLink) throws Throwable {
        int count = 0;
        do {
            count++;
            try {
                CommonMethods.waitTillDivisionLoads();
                BaseView.pushShortTimeout(2);
                WebElement ele = BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + strTaskName + "']"));
                SeleniumUtil.rightClickSelectMenuOption(ele, strMoveMenuOption, strMenuOptionLink);
                break;
            } catch (Exception e) {
                BaseView.takeScreenshot("Failed to click the button " + strMoveMenuOption);
                if (count == 9) {
                    //fail("Failed to click the button "+strMoveMenuOption);
                }
            } finally {
                BaseView.popDefaultTimeout();
            }
        }
        while (!(BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[./text()='" + strMenuOptionLink + "']")).size() > 0) && count < 10);

    }

    public static void rightClickVerifyDeleteDependency(String strTaskName, String strMoveMenuOption, String strMenuOptionLink) throws Throwable {
        int count = 0;
        do {
            count++;
            try {
                CommonMethods.waitTillDivisionLoads();
                BaseView.pushShortTimeout(2);
                WebElement ele = BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + strTaskName + "']"));
                assertFalse(SeleniumUtil.rightClickVerifyMenuOption(ele, strMoveMenuOption, strMenuOptionLink));
                break;
            } catch (AssertionError e) {
                BaseView.takeScreenshot("Failed to Verify the SpreedSheet view Dates");
                if (count == 9) {
                    fail("Failed to Verify the SpreedSheet view Dates");
                }
            } finally {
                BaseView.popDefaultTimeout();
            }
        }
        while (BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[./text()='" + strMenuOptionLink + "']")).size() > 0 && count < 10);

    }

    public static void vrifyTaskNotDisplayed(String strTaskName) {
        try {
            Assert.assertFalse(SeleniumUtil.isElementExist("xpath", "//div[contains(./text(),'" + strTaskName + "')]"));
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the SpreedSheet view Dates");
            fail("Failed to Verify the SpreedSheet view Dates");
        }
    }

    public static void vrifyTaskDisplayed(String strTaskName) {
        try {
            Assert.assertTrue(SeleniumUtil.isElementExist("xpath", "//div[contains(./text(),'" + strTaskName + "')]"));
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the SpreedSheet view Dates");
            fail("Failed to Verify the SpreedSheet view Dates");
        }
    }

    public static void verifySpreedSheetViewStatusDates(String strTaskName, String strStatus, String
            strDone, String strFAStartDate, String strFAEndDate, String strFADuration, String strBLStartDate, String
                                                                strBLEndDate) {
        try {
            if (strFAStartDate.contains("[CURRENTDATE]"))
                strFAStartDate = SeleniumUtil.dateFormat("MM/dd/yyyy", SeleniumUtil.currentDate(0));

            logger.info(strFAStartDate);

            if (strFAEndDate.contains("[CURRENTDATE]"))
                strFAEndDate = SeleniumUtil.dateFormat("MM/dd/yyyy", SeleniumUtil.currentDate(0));

            logger.info(strFAEndDate);

            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[2]", strStatus, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strStatus);

            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[3]", strDone, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strDone);

            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[4]", strFAStartDate, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strFAStartDate);
            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[5]", strFAEndDate, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strFAEndDate);
            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[6]", strFADuration, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strFADuration);
            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[9]", strBLStartDate, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strBLStartDate);
            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[10]", strBLEndDate, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strBLEndDate);

        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the SpreedSheet view Dates");
            fail("Failed to Verify the SpreedSheet view Dates");
        }
    }

    public static void verifySpreedSheetViewStatusDates(int col, String strTaskName, String strStatus, String
            strDone, String strFAStartDate, String strFAEndDate, String strFADuration, String strBLStartDate, String
                                                                strBLEndDate) {
        try {
            if (strFAStartDate.contains("[CURRENTDATE]"))
                strFAStartDate = SeleniumUtil.dateFormat("MM/dd/yyyy", SeleniumUtil.currentDate(0));

            logger.info(strFAStartDate);

            if (strFAEndDate.contains("[CURRENTDATE]"))
                strFAEndDate = SeleniumUtil.dateFormat("MM/dd/yyyy", SeleniumUtil.currentDate(0));

            logger.info(strFAEndDate);

            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[3]", strStatus, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strStatus);

            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[4]", strDone, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strDone);

            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[5]", strFAStartDate, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strFAStartDate);
            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[6]", strFAEndDate, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strFAEndDate);
            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[7]", strFADuration, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strFADuration);
            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[10]", strBLStartDate, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strBLStartDate);
            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[11]", strBLEndDate, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strBLEndDate);

        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the SpreedSheet view Dates");
            fail("Failed to Verify the SpreedSheet view Dates");
        }
    }

    public static void selectScheduleTemplate(String strScheduleTemplate) {
        try {
            SeleniumUtil.select("id", "projectEntityID", strScheduleTemplate, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the select schedule Template" + strScheduleTemplate);
            fail("Failed to Verify the SpreedSheet view Dates");
        }
    }

    public static void selectTaskStatus(String strTaskStatus) {
        try {
            selectFromComboBox("CodeTaskStatusID", strTaskStatus);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the select task Status :" + strTaskStatus);
            fail("Failed to Verify the SpreedSheet view Dates");
        }
    }

    public static void selectFromComboBox(String name, String value) {
        try {
            for (int count = 0; count < 10; count++) {
//                SeleniumUtil.getWebElementObject("cssselector", "input[name^='" + name + "'][role = 'combobox']").clear();
//                if (!SeleniumUtil.getWebElementObject("cssselector", "input[name='" + name + "'][role = 'combobox']").getAttribute("value").equals("")) {
//
//                    for (String s : SeleniumUtil.getWebElementObject("cssselector", "input[name='" + name + "'][role = 'combobox']").getAttribute("value").split("|")) {
//                        SeleniumUtil.getWebElementObject("cssselector", "input[name='" + name + "'][role = 'combobox']").sendKeys(Keys.BACK_SPACE);
//                    }
//                }

                WebElement ele = SeleniumUtil.getWebElementObject("cssselector", "input[name='" + name + "'][role = 'combobox']");
                Actions action = new Actions(BrowserDriver.getCurrentDriver());
                try {
                    ele.clear();
                    action.moveToElement(ele).click().sendKeys(value).build().perform();
                    SeleniumUtil.getWebElementObject("xpath", "//div[contains(./text(),'" + value + "')]").click();
                } catch (Exception e) {
//                    AllContractPagesView.focusWebElement(ele);
//                    try{
//                        ele.click();
//                        Log.info("Clicking element after last try of finding element");
//                    }catch(Exception last){
//                        Log.info("Unable to click element after last try of finding element "+last.getMessage());
//                    }
                }

//                SeleniumUtil.getWebElementObject("cssselector", "input[name='" + name + "'][role = 'combobox']").click();
//                SeleniumUtil.getWebElementObject("cssselector", "input[name='" + name + "'][role = 'combobox']").sendKeys(value);
//                SeleniumUtil.getWebElementObject("cssselector", "input[name='" + name + "'][role = 'combobox']").sendKeys(Keys.RETURN);

                if (BrowserDriver.getCurrentDriver()
                        .findElement(By.cssSelector("input[name='" + name + "'][role='combobox']")).getAttribute("value").contains(value)) {
                    break;
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot(name + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void verifyTheReportGrid(String strEntityName, String strTask1FAStartDateCap, String
            strTask1FAStartDate, String strTaskFAEndDateCap, String strTaskFAEndDate, String strTask1FADurationCap, String
                                                   strTask1FADuration, String strTask2FAStartDateCap, String strTask2FAStartDate, String Task2FAEndDateCap, String
                                                   Task2FAEndDate, String Task2FADurationCap, String Task2FADuration) {
        try {
            if (!SeleniumUtil.verifyTextValue("linktext", strEntityName, strEntityName, SeleniumUtilities.OBJWAITTIMEOUT)) {
                BaseView.takeScreenshot(strEntityName);
                fail("Field does not exist :" + strEntityName);
            }

            if (!SeleniumUtil.verifyTextValue("linktext", strTask1FAStartDate, strTask1FAStartDate, SeleniumUtilities.OBJWAITTIMEOUT)) {
                BaseView.takeScreenshot(strTask1FAStartDate);
                fail("Field does not exist :" + strTask1FAStartDate);
            }

            if (!SeleniumUtil.verifyTextValue("linktext", strTaskFAEndDate, strTaskFAEndDate, SeleniumUtilities.OBJWAITTIMEOUT)) {
                BaseView.takeScreenshot(strTaskFAEndDate);
                fail("Field does not exist :" + strTaskFAEndDate);
            }

            if (!SeleniumUtil.verifyTextValue("xpath", ".//a[contains(./text(),'" + strEntityName + "')]/parent::td/following-sibling::td[3]", strTask1FADuration, SeleniumUtilities.OBJWAITTIMEOUT)) {
                BaseView.takeScreenshot(strTask1FADuration);
                fail("Field does not exist :" + strTask1FADuration);
            }

            if (!SeleniumUtil.verifyTextValue("linktext", strTask2FAStartDate, strTask2FAStartDate, SeleniumUtilities.OBJWAITTIMEOUT)) {
                BaseView.takeScreenshot(strTask2FAStartDate);
                fail("Field does not exist :" + strTask2FAStartDate);
            }

            if (!SeleniumUtil.verifyTextValue("linktext", Task2FAEndDate, Task2FAEndDate, SeleniumUtilities.OBJWAITTIMEOUT)) {
                BaseView.takeScreenshot(Task2FAEndDate);
                fail("Field does not exist :" + Task2FAEndDate);
            }

            if (!SeleniumUtil.verifyTextValue("xpath", ".//a[contains(./text(),'" + strEntityName + "')]/parent::td/following-sibling::td[6]", Task2FADuration, SeleniumUtilities.OBJWAITTIMEOUT)) {
                BaseView.takeScreenshot(Task2FADuration);
                fail("Field does not exist :" + Task2FADuration);
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("verifyTheReportGrid");
        }
    }

    public static void task1FAStartDate(String strtask1FAStartDate) {
        try {
            SeleniumUtil.dblClick("linktext", strtask1FAStartDate, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to double click on :" + strtask1FAStartDate);
            fail(strtask1FAStartDate);
        }
    }

    public static void openTaskInfoPopup(String taskName) {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                SeleniumUtil.click("xpath", "//span[./text()='Task information...']", 10);
                OrgChartView.waitTillModalWindow(5);
                break;
            } catch (Exception e) {
            }
        }

        if (i == 10) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                SeleniumUtil.click("xpath", "//span[./text()='Task information...']", 10);
            } catch (Exception e) {
                BaseView.takeScreenshot("Failed to open task pop up.png");
                TestCase.fail("Failed to open task pop up" + e.getMessage());
            }
        }
    }

    public static void openTaskInfoPopupOfSecondElement(String taskName) {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[./text()='" + taskName + "']")).get(1));
                SeleniumUtil.click("xpath", "//span[./text()='Task information...']", 10);
                OrgChartView.waitTillModalWindow(5);
                break;
            } catch (Exception e) {
            }
        }

        if (i == 10) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[./text()='" + taskName + "']")).get(1));
                SeleniumUtil.click("xpath", "//span[./text()='Task information...']", 10);
            } catch (Exception e) {
                BaseView.takeScreenshot("Failed to open task pop up.png");
                TestCase.fail("Failed to open task pop up" + e.getMessage());
            }
        }
    }

    public static void openTaskInfoPopup(String taskName, String strMenuOption) {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                SeleniumUtil.click("xpath", "//span[./text()='" + strMenuOption + "']", 10);
                OrgChartView.waitTillModalWindow(5);
                break;
            } catch (Exception e) {
            }
        }

        if (i == 10) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                SeleniumUtil.click("xpath", "//span[./text()='" + strMenuOption + "']", 10);
            } catch (Exception e) {
                BaseView.takeScreenshot("Failed to open task pop up.png");
                TestCase.fail("Failed to open task pop up" + e.getMessage());
            }
        }
    }

    public static void iSetTaskStatusOnEditPopupOfATask(List<Field> fields) throws Throwable {

        for (Field f : fields) {
            try {
                if (BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='" + f.getName() + "'][role='combobox']")).getAttribute("role").equalsIgnoreCase("combobox")) {
                    List<WebElement> elements = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("input[name^='" + f.getName() + "'][role='combobox']"));
                    for (WebElement ele : elements) {
                        if (ele.isDisplayed()) {
                            ele.clear();
                            ele.sendKeys(f.getValue());
                            break;
                        }
                    }

                    try {
                        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 6);
                        wait.until(ExpectedConditions.visibilityOf(BrowserDriver.getCurrentDriver()
                                .findElement(By.xpath("//ul/div[text()='" + f.getValue() + "'][contains(@class,'x-boundlist-item')]"))));
                        BrowserDriver.getCurrentDriver()
                                .findElement(By.xpath(("//ul/div[text()='" + f.getValue() + "'][contains(@class,'x-boundlist-item')]"))).click();
                    } catch (Exception e) {
                        try {
                            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
                            wait.until(ExpectedConditions.visibilityOf(BrowserDriver.getCurrentDriver()
                                    .findElement(By.xpath("//ul/div[contains(text(),'" + f.getValue() + "')][contains(@class,'x-boundlist-item')]"))));
                            BrowserDriver.getCurrentDriver()
                                    .findElement(By.xpath(("//ul/div[contains(text(),'" + f.getValue() + "')][contains(@class,'x-boundlist-item')]"))).click();
                        } catch (Exception e1) {
                        }
                    }
                }

            } catch (Exception e) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + e.getMessage());
                org.junit.Assert.fail("Failed to set the status of the task");
            }
        }
    }

    public static void iVerifyTheFollowingFieldsValueOnEditPopupOfATask(List<Field> fields) throws Throwable {

        for (Field f : fields) {
            try {

                if (f.getValue().equalsIgnoreCase("Today's Date")) {
                    f.setValue(GenericEntityView.convertToFormatPattern(ReportsView.getCurrentDate()));
                }
                if (f.getValue().equalsIgnoreCase("Tomorrow's Date")) {
                    f.setValue(GenericEntityView.convertToFormatPattern(SeleniumUtil.addDaystoCurrentDate(1)));
                }
                if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("type").equalsIgnoreCase("checkbox")) {
                    if (f.getValue().equalsIgnoreCase("true")) {
                        assertTrue((BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).isSelected()));
                        logger.info(f.getValue().trim() + " radio is checked");
                    } else {
                        assertFalse((BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).isSelected()));
                        logger.info(f.getValue().trim() + " radio is unchecked");
                    }

                } else if (BrowserDriver.getCurrentDriver().findElements(By.name(f.getName())).size() > 0) {
                    List<WebElement> elements = BrowserDriver.getCurrentDriver().findElements(By.name(f.getName()));
                    for (WebElement ele : elements) {
                        if (ele.isDisplayed() && ele.getAttribute("type").equalsIgnoreCase("text")) {
                            assertEquals(ele.getAttribute("value"), f.getValue());
                            logger.info(f.getValue().trim() + " present on editable field");
                            break;
                        }
                    }
                    //  assertEquals(BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("value"), f.getValue());
                    //logger.info(f.getValue().trim() + " present on editable field");

                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getTagName().equalsIgnoreCase("select")) {
                    Select select = new Select(BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())));
                    assertEquals(select.getFirstSelectedOption().getText().trim(), f.getValue().trim());
                    logger.info(f.getValue().trim() + " option is selected");

                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("type").equalsIgnoreCase("radio")) {
                    if (f.getValue().equalsIgnoreCase("true")) {
                        assertTrue((BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).isSelected()));
                        logger.info(f.getValue().trim() + " checkbox is checked");
                    } else {
                        assertFalse((BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).isSelected()));
                        logger.info(f.getValue().trim() + " checkbox is unchecked");
                    }

                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getTagName().equalsIgnoreCase("textarea")) {
                    assertEquals(BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("value"), f.getValue());
                    logger.info(f.getValue().trim() + " present on editable field");

                } else if (BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='" + f.getName() + "'][role='combobox']")).getAttribute("role").equalsIgnoreCase("combobox")) {
                    if (!BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='" + f.getName() + "'][role='combobox']")).getAttribute("value").trim().equalsIgnoreCase(f.getValue().trim())) {
//                        delay(500);
                    }
                    assertEquals(BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='" + f.getName() + "'][role='combobox']")).getAttribute("value").trim(), f.getValue().trim());
                    logger.info(f.getValue().trim() + " present on editable field");
                }
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    public static void doubleClickOnTaskName(String strButton) throws Throwable {
        for (int i = 0; i < 10; i++) {
            try {
                CommonMethods.waitTillDivisionLoads();
                CommonMethods.doubleClickOnElement(strButton);
                OrgChartView.waitTillModalWindow(5);
                logger.info("Clicked " + strButton);
                return;
            } catch (Exception Ex) {
                BaseView.takeScreenshot("Clicked " + strButton + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
        BaseView.takeScreenshot("Failed to double click and open modal window.png");
        fail("Failed to double click and open modal window");
    }

    public static void verifyTaskNotPresent(List<String> text) throws Throwable {
        try {
            CommonMethods.switchToVisibleFrameQuick();
            for (String eachText : text) {
                for (int i = 0; i < 10; i++) {
                    try {
                        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
                        wait.until(ExpectedConditions.not(ExpectedConditions.textToBePresentInElement(BrowserDriver.getCurrentDriver().findElement(By.tagName("*")), eachText)));
                        break;
                    } catch (Exception e) {
                        if (i == 9) {
                            fail("Text value: " + eachText + " is present");
                        }
                    }
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("VerifyLogTextError.png");
            org.junit.Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void addNewSubTask(String taskName) {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                SeleniumUtil.click("xpath", "//span[./text()='Add...']//following-sibling::div", 10);
                CommonMethods.clickButton("Sub-task");
                break;
            } catch (Exception e) {
            }
        }

        if (i == 10) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("span"), "Add..."));
                CommonMethods.clickButton("Add...");
                wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("span"), "Sub-task"));
                CommonMethods.clickButton("Sub-task");
            } catch (Exception e) {
                BaseView.takeScreenshot("Failed to Add new sub Task.png");
                fail("Failed to Add new sub Task" + e.getMessage());
            }
        }
    }

    public static void addNewPredecessor(String taskName) {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                SeleniumUtil.click("xpath", "//span[./text()='Add...']//following-sibling::div", 10);
                CommonMethods.clickButton("Predecessor");
                break;
            } catch (Exception e) {
            }
        }

        if (i == 10) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("span"), "Add..."));
                CommonMethods.clickButton("Add...");
                wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("span"), "Predecessor"));
                CommonMethods.clickButton("Predecessor");
            } catch (Exception e) {
                BaseView.takeScreenshot("Failed to Add new sub Task.png");
                fail("Failed to Add new sub Task" + e.getMessage());
            }
        }
    }

    public static void addNewSuccessor(String taskName) {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                SeleniumUtil.click("xpath", "//span[./text()='Add...']//following-sibling::div", 10);
                CommonMethods.clickButton("Successor");
                break;
            } catch (Exception e) {
            }
        }

        if (i == 10) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[./text()='" + taskName + "']")));
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("span"), "Add..."));
                CommonMethods.clickButton("Add...");
                wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("span"), "Successor"));
                CommonMethods.clickButton("Successor");
            } catch (Exception e) {
                BaseView.takeScreenshot("Failed to Add new sub Task.png");
                fail("Failed to Add new sub Task" + e.getMessage());
            }
        }
    }

    public static void verifyTaskConvertedToGroup(String taskName) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        List<WebElement> groups = BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".x-tree-icon-parent+span"));

        for (WebElement group : groups) {
            if (group.getText().equals(taskName)) {
                logger.info("The give task: " + taskName + " name is converted to group");
                return;
            }
        }
        BaseView.takeScreenshot("The give task name is not converted to group");
        fail("The give task name is not converted to group");
    }

    public static void enterAssigneeName(String name) {
        try {
            CommonMethods.selectFromComboBox(BrowserDriver
                    .getCurrentDriver().findElement(By.xpath("//div[contains(@class,'x-css-shadow')]/following-sibling::div[contains(@class,'x-window')]//div[starts-with(@id,'headercontainer')][1]//following-sibling::div//input[@role='combobox']")), name);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to enter task name.png");
            fail("Unable to enter task name");
        }
    }

    public static void verifyTaskTip(String strTaskName) throws Throwable {
        try {
            SeleniumUtil.mouseOver("xpath", "//span[contains(./text(),'" + strTaskName + "')]", SeleniumUtilities.OBJWAITTIMEOUT);

            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            Boolean boolStatus = wait.until(ExpectedConditions.invisibilityOfElementWithText(By.cssSelector("table[class='taskTip']"), strTaskName)).booleanValue();
            System.out.print(boolStatus);

        } catch (Exception e) {
            BaseView.takeScreenshot("verifyTaskTip.png");
            org.junit.Assert.fail("Failed to click " + e.getMessage());
        }
    }


    public static void verifyFACurrentDate(String strLoctor, String strValue) {
        try {
            assertEquals(BrowserDriver.getCurrentDriver().findElement(By.name(strLoctor)).getAttribute("value"), SeleniumUtil.currentDate(0));
            logger.info(strValue.trim() + " present on editable field");

        } catch (Exception e) {
            BaseView.takeScreenshot("verifyFACurrentDate.png");
            org.junit.Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void verifyFADates(String strTaskName, String strFAStartDate, String strFAEndDate) {
        try {
            SeleniumUtil.verifyTextValue("xpath", "//span[contains(.,'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[4]/div", strFAStartDate, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", "//span[contains(.,'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[5]/div", strFAEndDate, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to verify the Base Line Dates");
            fail("Failed to verify the Base Line Dates");
        }
    }

    public static void clickTabInPopupOfEditTask(String button) {

        try {
            BrowserDriver.getCurrentDriver().findElement(By.xpath(".//div[starts-with(@id,'taskeditor')]//span[./text()='" + button + "']")).click();
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to click on " + button + " tab in popup window of Edit Task");
            fail("Failed to click on \" + button + \" tab in popup window of Edit Task");
        }
    }

    public static void verifyListOfAssignee(String strTaskName, List<String> assigneeNames) {

        try {
            String assignColdata = SeleniumUtil.getElementText("xpath", "//span[contains(.,'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[2]/div", SeleniumUtilities.OBJWAITTIMEOUT);
            assignColdata = assignColdata.trim();
            System.out.println(assignColdata);
            String[] coldata = assignColdata.trim().split(",");
            int count = 0;
            for (String b : assigneeNames) {
                for (int z = 0; z < coldata.length; z++) {

                    if (coldata[z].trim().equalsIgnoreCase(b)) {
                        count++;
                        break;
                    }

                }
            }
            if (count == assigneeNames.size()) {
                logger.info("All members are present in the Assignees colum for the " + strTaskName + " task");
            } else {
                BaseView.takeScreenshot("All Assignees are not present for the " + strTaskName + "task");
                fail("All Assignees are not present for the " + strTaskName + " task");
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("All Assignees are not present for the " + strTaskName + "task");
            fail("All Assignees are not present for the " + strTaskName + "task");
        }
    }

    public static void finduserAndremove(List<String> fields) {
        try {

            for (int i = 0; i < fields.size(); i++) {
                String val = fields.get(i);

                BaseView.pushShortTimeout();
                List<WebElement> elements = BrowserDriver.getCurrentDriver().findElements(By.xpath(".//table[contains(@id, 'gridview')]/tbody/tr/td[1]/div"));

                for (WebElement ele : elements) {
                    System.out.println(ele.getText());
                    if (ele.getText().equalsIgnoreCase(val)) {
                        try {
                            ele.click();
                            CommonMethods.clickOnButton("Remove");
                            break;
                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                            ele.click();
                            CommonMethods.clickOnButton("Remove");
                            break;
                        }
                    }
                }
            }
            BaseView.popDefaultTimeout();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            BaseView.takeScreenshot("Failed to enter deatils");
            fail("failed to enter details");
        }
    }

    public static void clickOnbuttonofFormstab(String button) {
        try {
            CommonMethods.switchToVisibleFrame();
            BrowserDriver.getCurrentDriver().findElement(By.xpath("//button[contains(text(),'" + button + "')]")).click();
        } catch (Exception e) {
            BaseView.takeScreenshot("To click on " + button + "in the forms tab");
            fail("To click on " + button + "in the forms tab");
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }

    public static void selectForm(String strSelectFormvalue) {
        try {
            SeleniumUtil.select("cssselector", "#selectFormTypeForm>div>select", strSelectFormvalue, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to select Form :" + strSelectFormvalue);
            fail("Failed to select Form type from select dropdown");
        }
    }

   /* public static void enterDetailsOfTaskInSuccessorTab(List<String> fields) {
        try {
            int j = 0;
            for (int i = 0; i < fields.size(); i++) {
                String val = fields.get(i);
                j = i + 3;

                BaseView.pushShortTimeout();
                WebElement ele = BrowserDriver.getCurrentDriver().findElement(By.xpath(".//table[contains(@id, 'gridview')]/tbody/tr/td[" + j + "]/div"));
                System.out.println(ele.getText());

                try {
                    //ele.click();
                    for (int k = 0; k < 10; k++) {
                        try {
                            //SeleniumUtil.doubleClickElement(ele);
                            SeleniumUtil.sendEnterKeyToElement(ele);
                            BrowserDriver.waitForElement(BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id^='dependencygrid'] input")), 5);
                            break;
                        } catch (Exception e) {
                        }
                    }

                } catch (Exception e) {
                    System.out.println(e.getMessage());
                    // ele.click();
                }

                List<WebElement> eles = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("input[name^='combo-']"));
                if (eles.size() > 0) {
                    BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='combo-']")).sendKeys(Keys.ARROW_DOWN);
                    for (int a = 0; a < 3; a++) {
                        if (BrowserDriver.getCurrentDriver()
                                .findElement(By.xpath(("//li[text()='" + val + "'][contains(@class,'x-boundlist-item')]"))).isDisplayed()) {
                            BrowserDriver.getCurrentDriver()
                                    .findElement(By.xpath(("//li[text()='" + val + "'][contains(@class,'x-boundlist-item')]"))).click();
                            break;
                        } else {
                            ele.sendKeys(Keys.ARROW_DOWN);
                        }
                    }

                } else {
                    List<WebElement> elems = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("input[name^='durationfield-']"));
                    if (elems.size() > 0) {
                        WebElement element = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='durationfield-']"));
                        element.clear();
                        element.sendKeys(val);

                    }
                }
            }

            BaseView.popDefaultTimeout();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            BaseView.takeScreenshot("Failed to enter deatils");
            fail("failed to enter details");
        }
    }*/

    public static void enterTaskType(String taskType) {
        int count = 0;
        int count1 = 0;

        try {
            BaseView.pushShortTimeout();
            do {
                try {
                    count1++;
                    try {
                        BrowserDriver.getCurrentDriver().findElement(By.xpath(".//table[contains(@id, 'gridview')]/tbody/tr/td[1]/div")).click();
                    } catch (Exception e) {
                    }
                    BrowserDriver.getCurrentDriver().findElement(By.xpath(".//table[contains(@id, 'gridview')]/tbody/tr/td[3]/div")).click();
                    WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                    wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input[name^='combo-']")));
                    break;
                } catch (Exception e) {
                }
            }
            while (!(BrowserDriver.getCurrentDriver().findElements(By.cssSelector("input[name^='combo-']")).size() > 0) && count1 < 10);
        } finally {
            BaseView.popDefaultTimeout();
        }

        do {
            count++;
            List<WebElement> eles = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("input[name^='combo-']"));
            if (eles.size() > 0) {
                BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='combo-']")).sendKeys(Keys.ARROW_DOWN);
                for (int a = 0; a < 3; a++) {
                    if (BrowserDriver.getCurrentDriver()
                            .findElement(By.xpath(("//li[text()='" + taskType + "'][contains(@class,'x-boundlist-item')]"))).isDisplayed()) {
                        BrowserDriver.getCurrentDriver()
                                .findElement(By.xpath(("//li[text()='" + taskType + "'][contains(@class,'x-boundlist-item')]"))).click();
                        break;
                    }
                }

            }
        }
        while (!BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='combo-']")).getAttribute("value").contains(taskType) && count < 10);
    }


    public static void enterTaskLeadLagDays(String days) {
        int count = 0;
        int count1 = 0;

        try {
            BaseView.pushShortTimeout(1);
            count1++;
            do {
                try {
                    try {
                        BrowserDriver.getCurrentDriver().findElement(By.xpath(".//table[contains(@id, 'gridview')]/tbody/tr/td[1]/div")).click();
                    } catch (Exception e) {
                    }
                    BrowserDriver.getCurrentDriver().findElement(By.xpath(".//table[contains(@id, 'gridview')]/tbody/tr/td[4]/div")).click();
                    WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                    wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input[name^='durationfield-']")));
                    break;
                } catch (Exception e) {
                }
            }
            while (!(BrowserDriver.getCurrentDriver().findElements(By.cssSelector("input[name^='durationfield-']")).size() > 0) && count1 < 10);
        } finally {
            BaseView.popDefaultTimeout();
        }

        do {
            count++;
            List<WebElement> eles = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("input[name^='durationfield-']"));
            if (eles.size() > 0) {
                WebElement element = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='durationfield-']"));
                element.clear();
                element.sendKeys(days);
            }
        }
        while (!BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='durationfield-']")).getAttribute("value").contains(days) && count < 10);
    }

    public static void enterDetailsOfTaskInSuccessorTab(List<String> fields) {
        try {
            int j = 0;
            for (int i = 0; i < fields.size(); i++) {
                String val = fields.get(i);
                j = i + 3;

                BaseView.pushShortTimeout();
                WebElement ele = BrowserDriver.getCurrentDriver().findElement(By.xpath(".//table[contains(@id, 'gridview')]/tbody/tr/td[" + j + "]/div"));

                for (int k = 0; k < 10; k++) {
                    try {
                        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                        Actions action = new Actions(BrowserDriver.getCurrentDriver());
                        action.moveToElement(ele).click().sendKeys(Keys.ENTER).build().perform();
                        ele.click();
                        wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.xpath(".//table[contains(@id, 'gridview')]/tbody/tr/td[" + j + "]/div[contains(@style,'visibility: hidden;')]")));
                        break;
                    } catch (Exception e) {
                        if (k == 9) {
                            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                            wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.xpath(".//table[contains(@id, 'gridview')]/tbody/tr/td[" + j + "]/div[contains(@style,'visibility: hidden;')]")));
                        }
                    }
                }

                List<WebElement> eles = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("input[name^='combo-']"));
                if (eles.size() > 0) {
                    BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='combo-']")).sendKeys(Keys.ARROW_DOWN);
                    for (int a = 0; a < 3; a++) {
                        if (BrowserDriver.getCurrentDriver()
                                .findElement(By.xpath(("//li[text()='" + val + "'][contains(@class,'x-boundlist-item')]"))).isDisplayed()) {
                            BrowserDriver.getCurrentDriver()
                                    .findElement(By.xpath(("//li[text()='" + val + "'][contains(@class,'x-boundlist-item')]"))).click();
                            break;
                        } else {
                            ele.sendKeys(Keys.ARROW_DOWN);
                        }
                    }

                } else {
                    List<WebElement> elems = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("input[name^='durationfield-']"));
                    if (elems.size() > 0) {
                        WebElement element = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name^='durationfield-']"));
                        element.clear();
                        element.sendKeys(val);

                    }
                }
            }

            BaseView.popDefaultTimeout();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            BaseView.takeScreenshot("Failed to enter deatils");
            fail("failed to enter details");
        }
    }

    public static void setFADates(String strFADate, int intDays) {
        try {
            if (strFADate.equalsIgnoreCase("Start date")) {
                strFADate = "ActualStartDate";
            } else {
                strFADate = "ActualEndDate";
            }
            SeleniumUtil.clear("name", strFADate, SeleniumUtilities.OBJWAITTIMEOUT);
            //SeleniumUtil.type("name", strFADate, SeleniumUtil.currentDate(intDays), SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", strFADate, SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(intDays), SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Populate date :" + intDays);
            fail("Failed to Populate date :" + intDays);
        }
    }

    public static void verifySpreedSheetViewStatusDates(String strTaskName, String strStatus, String
            strDone, String strFAStartDate, int startDays, String strFAEndDate, int endDays) {
        try {
            if (strFAStartDate.contains("[CURRENTDATE]"))
                strFAStartDate = SeleniumUtil.dateFormat("MM/dd/yyyy", SeleniumUtil.currentDate(startDays));

            logger.info(strFAStartDate);

            if (strFAEndDate.contains("[CURRENTDATE]"))
                strFAEndDate = SeleniumUtil.dateFormat("MM/dd/yyyy", SeleniumUtil.currentDate(endDays));

            logger.info(strFAEndDate);

            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[2]", strStatus, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strStatus);

            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[3]", strDone, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strDone);

            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[4]", strFAStartDate, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strFAStartDate);
            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[5]", strFAEndDate, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strFAEndDate);

        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the SpreedSheet view Dates");
            fail("Failed to Verify the SpreedSheet view Dates");
        }
    }


    public static void clickOnTab(String strTab) {
        try {
            List<WebElement> eles = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("span[class='x-tab-inner x-tab-inner-default']"));
            for (WebElement ele : eles) {
                if (ele.getText().contains(strTab)) {
                    SeleniumUtil.click(ele, SeleniumUtilities.OBJWAITTIMEOUT);
                    break;
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to click on :" + strTab);
            fail("Failed to click on :" + strTab);
        }

    }

    public static void clickOnTaskFromMyActivitiesWindowFromDashboard(String link) {
        try {
            for (int i = 0; i < 10; i++) {
                try {
                    SeleniumUtil.click("linktext", link, SeleniumUtilities.OBJWAITTIMEOUT);
                    if (SeleniumUtil.verifyTextValue("xpath", "//div[contains(./text(),'Editing Task for')]", "Editing Task for", SeleniumUtilities.OBJWAITTIMEOUT))
                        break;
                } catch (Exception ex) {
                }
            }
            logger.info("Clicked " + link);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("clickOnTaskFromMyActivitiesWindowFromDashboard.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void clickvaluefortheEntity(String value, String columno, String entityname) {
        try {
            SeleniumUtil.dblClick("xpath", "//a[contains(text(),'" + entityname + "')]/../../td[" + columno + "]/a", SeleniumUtilities.OBJWAITTIMEOUT);
//            delay(5000);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to click on " + value + " under colum number" + columno);
            fail("Failed to click on " + value + " under colum number" + columno);
        }
    }

    public static void verifyThereIsNoTasks(String tabname) {
        try {
            List<WebElement> eles = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div.x-css-shadow+div.x-window .x-grid-item-container *"));
            if (eles.size() == 0)
                logger.info("No tasks found under " + tabname);
            else {
                logger.info("ERROR: Tasks found under " + tabname);
                fail("ERROR: Tasks found under " + tabname);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("Tasks found under " + tabname);
            fail("Tasks found under " + tabname);
        }
    }

    public static void closeMyActivitiesWindow() {
        try {
            BaseView.pushVeryShortTimeout();
            SeleniumUtil.click("cssselector", "div[data-qtip='Close this panel']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to close My Activities Window");
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void selectMatchLeaseFiscalYearEnds() {
        try {
            SeleniumUtil.click("cssselector", "input[name='json_SL_MatchYearEnds'][value='false']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("selectMatchLeaseFiscalYearEnds");
        }
    }

    public static void verifySlackDaysOnSpreedSheetView(String strTaskName, String strSlackDays) {
        try {
            SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[7]", strSlackDays, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the slack days on SpreedSheet view");
            fail("Failed to Verify the slack days on SpreedSheet view");
        }
    }

    public static void clickOnHighlightCriticalPath() {
        try {

            SeleniumUtil.click("cssselector", "a[data-qtip='Highlight critical path']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Highlight critical path");
            fail("Failed to Highlight critical path");
        }
    }

    public static void verifyBlinkingBar() {
        try {
            /*SeleniumUtil.waitForElementVisibilityOf("cssselector", ".x-grid-view.x-grid-with-row-lines.sch-timelineview.sch-ganttview.x-fit-item.x-grid-view-default.x-unselectable.sch-gantt-terminal-allow-source-end.sch-gantt-terminal-allow-source-start.sch-gantt-critical-chain", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            assertTrue("verify the last part of the schedule bars will start blinking in red while the rest of the schedule bars become blurred",
             SeleniumUtil.waitForElementVisibilityOf("cssselector", ".x-grid-view.x-grid-with-row-lines.sch-timelineview.sch-ganttview.x-fit-item.x-grid-view-default.x-unselectable.sch-gantt-terminal-allow-source-end.sch-gantt-terminal-allow-source-start.sch-gantt-critical-chain", 3, SeleniumUtilities.OBJWAITTIMEOUT));*/
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.sch-gantt-critical-chain")));
            SeleniumUtil.click("cssselector", "a[data-qtip='Highlight critical path'][class$='pressed']", SeleniumUtilities.WAIT_TIME);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Highlight critical path");
            fail("Failed to Highlight critical path");
        }
    }

    public static void clickOnTimeSpan(String strTimeSpan) {
        try {
            SeleniumUtil.click("cssselector", "a[data-qtip='" + strTimeSpan + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to click on" + strTimeSpan + " Time Span arrow");
            fail("Failed to click on" + strTimeSpan + " Time Span arrow");
        }
    }

    public static void verifyScheduleBarDateRange(String str1stScheduleBarDate, String str2ndScheduleBarDate) {
        try {
            SeleniumUtil.verifyTextValue("cssselector", "table[class='sch-header-row sch-header-row-middle '] td:nth-child(1)", str1stScheduleBarDate, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("cssselector", "table[class='sch-header-row sch-header-row-middle '] td:nth-child(2)", str2ndScheduleBarDate, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the slack days on SpreedSheet view");
            fail("Failed to Verify the slack days on SpreedSheet view");
        }
    }

    public static void verifyOrangeColoredBars() {
        try {

            int positionsMoved1 = BrowserDriver.getCurrentDriver().findElements(By.xpath("//td[contains(@class,'sch-column-header')][contains(@class,'sch-dayheadercell')]/*[text()='05 Jan']/parent::td[1]/preceding-sibling::td")).size();
            int positionsMoved2 = BrowserDriver.getCurrentDriver().findElements(By.xpath("//td[contains(@class,'sch-column-header')][contains(@class,'sch-dayheadercell')]/*[text()='06 Jan']/parent::td[1]/preceding-sibling::td")).size();

            String style = BrowserDriver.getCurrentDriver()
                    .findElement(
                            By.xpath("//td[contains(@class,'sch-column-header')][contains(@class,'sch-dayheadercell')]/*[text()='06 Jan']/parent::td[1]"))
                    .getAttribute("style").replace("position: static; text-align: center; width: ", "").replace("px;", "").trim();
            int width = Integer.parseInt(style);

            org.junit.Assert.assertTrue(SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[class*='sch-event-wrap'][class*='sch-gantt-parenttask-baseline'][class*='sch-gantt-baseline-item'][class*='x-unselectable'][style='left:" + width * positionsMoved1 + "px']", 5, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[class*='sch-event-wrap'][class*='sch-gantt-task-baseline'][class*='sch-gantt-baseline-item'][class*='x-unselectable'][style='left:" + width * positionsMoved1 + "px']", SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[class*='sch-event-wrap'][class*='sch-gantt-task-baseline'][class*='sch-gantt-baseline-item'][class*='x-unselectable'][style='left:" + width * positionsMoved2 + "px']", SeleniumUtilities.OBJWAITTIMEOUT));

            assertTrue(SeleniumUtil
                    .waitForElementVisibilityOf("xpath", "//div[contains(@class,'sch-gantt-item')][contains(@class,'sch-gantt-task-bar')][not(contains(@class,'sch-event-resizable-'))]", 5, SeleniumUtilities.OBJWAITTIMEOUT));
            assertTrue(SeleniumUtil
                    .waitForElementVisibilityOf("xpath", "//div[contains(@class,'sch-gantt-item')][contains(@class,'sch-gantt-parenttask-bar')][not(contains(@class,'sch-event-resizable-'))]", SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to verify Orange Colored Bars");
            fail("Failed to verify Orange Colored Bars");
        }
    }

    public static void verifyOrangeColoredBarsdisappears() {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.waitForElementNotPresent("cssselector", "div[id$='-base']"));
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to verify Orange Colored Bars Disappear");
            fail("Failed to verify Orange Colored Bars Disappear");
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("Failed to verify Orange Colored Bars Disappear");
            fail("Failed to verify Orange Colored Bars Disappear");
        }
    }

    public static void searchTask(String strSearchTaskName) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "input[data-ref='inputEl']", 3, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.clear("cssselector","input[data-ref='inputEl']",SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("cssselector", "input[data-ref='inputEl']", strSearchTaskName, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.hitEnterKey("cssselector", "input[data-ref='inputEl']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Search for task name");
            fail("Failed to Search for task name");
        }
    }

//    public static void sortGanttChartGrid(String strSearchTaskName,String strSortingOption) {
//        try {
//            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//span[contains(.,'"+strSearchTaskName+"')]/parent::span/following-sibling::div", 3, SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.moveToElement("xpath", ".//span[contains(.,'"+strSearchTaskName+"')]/parent::span/following-sibling::div",SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.click("xpath", ".//span[contains(.,'" + strSearchTaskName + "')]/parent::span/following-sibling::div", SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.click("xpath", "..//span[contains(.,'"+strSortingOption+"')]/parent::a",SeleniumUtilities.OBJWAITTIMEOUT);
//        } catch (Exception e) {
//            BaseView.takeScreenshot("Failed to Sort :" +strSearchTaskName);
//            fail("Failed to Sort :" +strSearchTaskName);
//        }
//    }

    public static void verifySortedFields(String strSortedField, int intTableCount) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "table[id^='treeview'][data-recordindex='" + intTableCount + "']", 3, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("cssselector", "table[id^='treeview'][data-recordindex='" + intTableCount + "']", strSortedField, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the slack days on SpreedSheet view");
            fail("Failed to Verify the slack days on SpreedSheet view");
        }
    }

    public static void clickOnZoomButton(String strZoomButton) {
        try {
            SeleniumUtil.click("cssselector", "a[data-qtip='" + strZoomButton + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to click on" + strZoomButton + " button");
            fail("Failed to click on" + strZoomButton + " button");
        }
    }

//    public static void verifyWeeksForTheSpecificMonth(int inWeeksAndMonth) {
//        try {
//            SeleniumUtil.waitForElementVisibilityOf("cssselector", ".sch-simple-timeheader", 3, SeleniumUtilities.OBJWAITTIMEOUT);
//            org.junit.Assert.assertTrue(BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".sch-simple-timeheader")).size() == inWeeksAndMonth);
//        } catch (Exception e) {
//            BaseView.takeScreenshot("Failed to Verify the Weeks For The Specific Month");
//            fail("Failed to Verify the Weeks For The Specific Month");
//        }
//    }

//    public static void verifyTimeLine(String strTimeline) {
//        try {
//            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("cssselector", "table[class^='sch-header-row sch-header-row-middle'] tr td",strTimeline , SeleniumUtilities.OBJWAITTIMEOUT));
//        } catch (Exception e) {
//            BaseView.takeScreenshot("Failed to Verify the"+strTimeline);
//            fail("Failed to Verify the"+strTimeline);
//        }
//    }

    public static void verifyTopHeaderDates(String strTopHeaderDates) {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("cssselector", "table[class^='sch-header-row sch-header-row-middle'] tr", strTopHeaderDates, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the Top header Dates :" + strTopHeaderDates);
            fail("Failed to Verify the Top header Dates :" + strTopHeaderDates);
        }
    }

    public static void verifyBottomHeaderDates(String strBottomHeaderDates) {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("cssselector", "table[class^='sch-header-row sch-header-row-bottom'] tr", strBottomHeaderDates, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the Bottom header Dates :" + strBottomHeaderDates);
            fail("Failed to Verify the Bottom header Dates :" + strBottomHeaderDates);
        }
    }

    public static void verifyGanttChartFullScreen() {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.waitForElementVisibilityOf("xpath", ".//a[contains(.,'Exit Full Screen')]", 4, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the full screen of gantt chart view");
            fail("Failed to Verify the full screen of gantt chart view");
        }
    }

    public static void verifyDefualtGanttChartView() {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.waitForElementVisibilityOf("xpath", ".//span[contains(.,'Schedule')]", 4, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the full screen of gantt chart view");
            fail("Failed to Verify the full screen of gantt chart view");
        }
    }

    public static void dragVerticalSplitBarToRight() {
        try {
            Actions moveToRight = new Actions(BrowserDriver.getCurrentDriver());
            //Get initial vertical bar position
            String pos1[] = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".x-splitter-vertical")).getAttribute("style").split("left: ");
            String pos2[] = pos1[1].split("px;");
            int initialPosition = Integer.parseInt(pos2[0]);
            logger.info("initial vertical bar position :" + initialPosition);

            moveToRight.dragAndDropBy(BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".x-splitter-vertical")), 198, 10000).build().perform();

            //Get vertical bar position after drag and drop
            String pos3[] = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".x-splitter-vertical")).getAttribute("style").split("left: ");
            String pos4[] = pos3[1].split("px;");
            int draggedPosition = Integer.parseInt(pos4[0]);
            logger.info("dragged vertical bar position :" + draggedPosition);

            assertTrue("Split bar is not present at dragged location\n" + BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".x-splitter-vertical")).getAttribute("style"), initialPosition < draggedPosition);
        } catch (NoSuchElementException ne) {
            BaseView.takeScreenshot("Unable to find element.png");
            fail("Unable to find element " + ne.getMessage());
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to drag and drop element to right element.png");
            fail("Unable to drag and drop element to right element " + e.getMessage());
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void verifyDownwardArrowInHeaders(String gridID, String header) throws Throwable {
        String strElement = AllContractPagesView.getGridElement(gridID);
        WebElement gridElement = SeleniumUtil.getElement("cssselector", strElement, 5, SeleniumUtilities.OBJWAITTIMEOUT);
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                Actions action = new Actions(BrowserDriver.getCurrentDriver());
                action.moveToElement(gridElement.findElement(By.xpath("//span[text()='" + header + "']"))).build().perform();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[text()='" + header + "']/parent::span/parent::span//following-sibling::div")));
                AllContractPagesView.waitTillDivisionLoads();
                break;
            } catch (Exception e) {
                if (i == 10) {
                    BaseView.takeScreenshot("Failed view down arrow.png");
                    logger.info("Error :" + e.getMessage());
                    fail(e.getMessage());
                }
            }
        }
    }


    public static void verifyColumns(String gridID, String header, String
            sortMethod, List<String> menuItems) throws Throwable {
        int i = 0;
        String strElement = AllContractPagesView.getGridElement(gridID);
        WebElement gridElement = SeleniumUtil.getElement("cssselector", strElement, 5, SeleniumUtilities.OBJWAITTIMEOUT);
        for (i = 0; i < 10; i++) {
            try {
                BaseView.pushVeryShortTimeout();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                Actions action = new Actions(BrowserDriver.getCurrentDriver());
                gridElement.findElement(By.xpath("//span[text()='" + header + "']")).click();
                gridElement.findElement(By.xpath("//span[text()='" + header + "']")).click();
                action.moveToElement(gridElement.findElement(By.xpath("//span[text()='" + header + "']"))).build().perform();
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[text()='" + header + "']/parent::span/parent::span//following-sibling::div")));

                gridElement.findElement(By.xpath("//span[text()='" + header + "']/parent::span/parent::span//following-sibling::div")).click();
                gridElement.findElement(By.xpath("//span[text()='" + sortMethod + "']")).click();
                for (String menu : menuItems) {
                    wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[starts-with(@id,'menucheckitem')][text()='" + menu + "']/following-sibling::div[starts-with(@id,'menucheckitem')]")));
                }
                break;
            } catch (Exception e) {
                if (i == 10) {
                    BaseView.takeScreenshot("UnableToSort.png");
                    logger.info("Error :" + e.getMessage());
                    BaseView.popDefaultTimeout();
                    fail(e.getMessage());
                }
            } finally {
                BaseView.popDefaultTimeout();
            }
        }
    }


    public static void selectColumns(String gridID, String header, String
            sortMethod, List<String> menuItems) throws Throwable {
        int i = 0;
        String strElement = AllContractPagesView.getGridElement(gridID);
        WebElement gridElement = SeleniumUtil.getElement("cssselector", strElement, 5, SeleniumUtilities.OBJWAITTIMEOUT);
        for (i = 0; i < 10; i++) {
            try {
                BaseView.pushVeryShortTimeout();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                Actions action = new Actions(BrowserDriver.getCurrentDriver());
                gridElement.findElement(By.xpath("//span[text()='" + header + "']")).click();
                gridElement.findElement(By.xpath("//span[text()='" + header + "']")).click();
                action.moveToElement(gridElement.findElement(By.xpath("//span[text()='" + header + "']"))).build().perform();
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[text()='" + header + "']/parent::span/parent::span//following-sibling::div")));

                gridElement.findElement(By.xpath("//span[text()='" + header + "']/parent::span/parent::span//following-sibling::div")).click();
                gridElement.findElement(By.xpath("//span[text()='" + sortMethod + "']")).click();
                for (String menu : menuItems) {
                    wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[starts-with(@id,'menucheckitem')][text()='" + menu + "']/following-sibling::div[starts-with(@id,'menucheckitem')]")));
                    BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[starts-with(@id,'menucheckitem')][text()='" + menu + "']/following-sibling::div[starts-with(@id,'menucheckitem')]")).click();
                }

                break;
            } catch (Exception e) {
                if (i == 10) {
                    BaseView.takeScreenshot("UnableToSort.png");
                    logger.info("Error :" + e.getMessage());
                    BaseView.popDefaultTimeout();
                    fail(e.getMessage());
                }
            } finally {
                BaseView.popDefaultTimeout();
            }
        }
    }

    public static void deselectColumns(String gridID, String header, String
            sortMethod, List<String> menuItems) throws Throwable {
        int i = 0;
        String strElement = AllContractPagesView.getGridElement(gridID);
        WebElement gridElement = SeleniumUtil.getElement("cssselector", strElement, 5, SeleniumUtilities.OBJWAITTIMEOUT);
        for (i = 0; i < 10; i++) {
            try {
                BaseView.pushVeryShortTimeout();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                Actions action = new Actions(BrowserDriver.getCurrentDriver());
                gridElement.findElement(By.xpath("//span[text()='" + header + "']")).click();
                gridElement.findElement(By.xpath("//span[text()='" + header + "']")).click();
                action.moveToElement(gridElement.findElement(By.xpath("//span[text()='" + header + "']"))).build().perform();
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[text()='" + header + "']/parent::span/parent::span//following-sibling::div")));

                gridElement.findElement(By.xpath("//span[text()='" + header + "']/parent::span/parent::span//following-sibling::div")).click();
                gridElement.findElement(By.xpath("//span[text()='" + sortMethod + "']")).click();
                for (String menu : menuItems) {
                    wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[starts-with(@id,'menucheckitem')][text()='" + menu + "']/following-sibling::div[starts-with(@id,'menucheckitem')]")));
                    BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[starts-with(@id,'menucheckitem')][text()='" + menu + "']/following-sibling::div[starts-with(@id,'menucheckitem')]")).click();
                }
                break;
            } catch (Exception e) {
                if (i == 10) {
                    BaseView.takeScreenshot("UnableToSort.png");
                    logger.info("Error :" + e.getMessage());
                    BaseView.popDefaultTimeout();
                    fail(e.getMessage());
                }
            } finally {
                BaseView.popDefaultTimeout();
            }
        }
    }

    public static void verifyHeaderInVisibleAfterDeselectingColumn(String gridID, List<String> headers) throws
            Throwable {
        for (String header : headers) {
            try {
                CommonMethods.switchToVisibleFrame();
                String strElement = AllContractPagesView.getGridElement(gridID);
                WebElement gridElement = SeleniumUtil.getElement("cssselector", strElement, 5, SeleniumUtilities.OBJWAITTIMEOUT);
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 6);
                wait.until(ExpectedConditions.not(ExpectedConditions.visibilityOf(gridElement.findElement(By.xpath("//span[text()='" + header + "']")))));
            } catch (Exception e) {
                BaseView.takeScreenshot("VerifyLogTextError.png");
                fail("Failed to click " + e.getMessage());
            }
        }
    }

    public static void verifyHeaderVisibleAfterSelectingColumn(String gridID, List<String> headers) throws
            Throwable {
        for (String header : headers) {
            try {
                CommonMethods.switchToVisibleFrame();
                String strElement = AllContractPagesView.getGridElement(gridID);
                WebElement gridElement = SeleniumUtil.getElement("cssselector", strElement, 5, SeleniumUtilities.OBJWAITTIMEOUT);
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 6);
                wait.until(ExpectedConditions.visibilityOf(gridElement.findElement(By.xpath("//span[text()='" + header + "']"))));
            } catch (Exception e) {
                BaseView.takeScreenshot("VerifyLogTextError.png");
                fail("Failed to click " + e.getMessage());
            }
        }
    }

    public static void openDocumentUploadWindow() {
        try {
            try {
                SeleniumUtil.click("xpath", "//div[starts-with(@id,'customListGrid_')]//parent::div[1]/following-sibling::div[contains(@class,'x-form-trigger')]", SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception e) {
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Unable to open document upload" + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void selectFoldersInDocumentUploadWindow(String folderName) {
        try {
            SeleniumUtil.clickElement("xpath", "//span[contains(text(),'" + folderName + "')]", 10);
        } catch (Exception e) {
            BaseView.takeScreenshot("FixFolder.png");
            org.junit.Assert.fail("Selected folder " + e.getMessage());
        }
    }

    public static void verifyBlueBarPresentOrNot(int intBlueBarRow, String option) {
        try {
            int intEleCount = 0;
            List<WebElement> blueBarRows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("table[id^='Lx-ui-GanttPanel']"));

            for (WebElement ele : blueBarRows) {
                intEleCount++;
                if (intEleCount == intBlueBarRow)
                    if (option.equalsIgnoreCase("Present")) {
                        assertEquals("Expected blue bar ot present at position " + intBlueBarRow, ele.findElements(By.cssSelector(".sch-event-wrap.sch-gantt-task.x-unselectable")).size(), 1);
                    } else if (option.equalsIgnoreCase("Not Present")) {
                        BaseView.pushShortTimeout();
                        assertEquals("Expected blue bar ot present at position :" + intBlueBarRow, ele.findElements(By.cssSelector(".sch-event-wrap.sch-gantt-task.x-unselectable")).size(), 0);
                        BaseView.popDefaultTimeout();
                    }
            }
        } catch (Exception e) {
            BaseView.popDefaultTimeout();
            BaseView.takeScreenshot("Expected blue bar is not present.png");
            fail("Expected blue bar is not present");
        }
    }

    public static void verifyBlankGridTab() {
        try {
            SeleniumUtil.verifyTextValue("cssselector", "div[id^='dependencygrid'][id$='body']", "", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyBlankGridTab");
            org.junit.Assert.fail("verify Blank Grid Tab " + e.getMessage());
        }
    }

    public static void dragandDropBubble() {
        try {
            dragAndDropElement("xpath", ".//table[2]/tbody/tr/td/div/div[1]/div[2]/div[6]", "xpath", ".//table[3]/tbody/tr/td/div/div[1]/div[2]/div[5]", ".//table[2]/tbody/tr/td/div/div[1]/div[2]", ".//table[3]/tbody/tr/td/div/div[1]/div[2]");
        } catch (Exception e) {
            BaseView.takeScreenshot("dragandDropBubble");
            org.junit.Assert.fail("Drag and Drop Bubble" + e.getMessage());
        }
    }

    public static void dragAndDropElement(String fromElementLocator, String fromElement, String
            targetElementLocator, String targetElement, String strFirstBarDesc, String strSecondBarDesc) throws Exception {
        try {
            WebElement fristBlueBarEle = SeleniumUtil.getWebElementObject("xpath", strFirstBarDesc);
            Actions fristBlueBarBuilder = new Actions(BrowserDriver.getCurrentDriver());
            fristBlueBarBuilder.moveToElement(fristBlueBarEle).build().perform();
            WebElement fromEle = SeleniumUtil.getWebElementObject(fromElementLocator, fromElement);

            WebElement SecondBlueBarEle = SeleniumUtil.getWebElementObject("xpath", strSecondBarDesc);
            Actions secondBlueBarBuilder = new Actions(BrowserDriver.getCurrentDriver());
            secondBlueBarBuilder.moveToElement(SecondBlueBarEle).build().perform();

            WebElement targetEle = SeleniumUtil.getWebElementObject(targetElementLocator, targetElement);
            Actions builder = new Actions(BrowserDriver.getCurrentDriver());
            Action dragAndDrop = builder.moveToElement(fristBlueBarEle)
                    .clickAndHold(fromEle)
                    .moveToElement(SecondBlueBarEle)
                    .moveToElement(targetEle)
                    .release(targetEle)
                    .build();

            dragAndDrop.perform();
            SeleniumUtil.Log.info("Drag and drop of " + fromElement + " field is successful");
        } catch (Exception ex) {
            SeleniumUtil.Log.error("Error Message :" + ex.getMessage());
        }
    }

    public static void verifyBlueBarPostion() {
        try {
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[style='left:290px']", 5, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyBlueBarPostion");
            SeleniumUtil.failed("verify Blue Bar Postion :" + e.getMessage());

        }
    }

    public static void dragandDropBluebar() {
        try {
            WebElement ele = SeleniumUtil.getClickableWebElementObject("xpath", ".//table[6]/tbody/tr/td/div/div[1]/div[2]");
            Actions builder1 = new Actions(BrowserDriver.getCurrentDriver());
            builder1.moveToElement(ele).build().perform();
            Actions builder = new Actions(BrowserDriver.getCurrentDriver());
            builder.clickAndHold(ele).dragAndDropBy(ele, 692, 230).release(ele).build().perform();
//            Action dragAndDrop = builder.moveToElement(ele)
//                    .clickAndHold(ele)
//                    .dragAndDropBy(ele,329,231)
//                    .release(ele)
//                    .build();
//
//            dragAndDrop.perform();
//            builder.clickAndHold(ele).dragAndDropBy(ele,692,230).release(ele). build().perform();

//            SeleniumUtil.dragAndDropElement("xpath", ".//table[6]/tbody/tr/td/div/div[1]/div[2]", "xpath", ".//table[6]/tbody/tr/td/div/div[@style='left:290px']");
        } catch (Exception e) {
            BaseView.takeScreenshot("dragandDropBluebar");
            SeleniumUtil.failed("Drag and Drop Bluebar" + e.getMessage());
        }
    }

    public static void dragandDropStartBluebartoBegin() {
        try {
            SeleniumUtil.dragAndDropElement("xpath", ".//table[6]/tbody/tr/td/div/div[1]/div[2]", "xpath", ".//table[6]/tbody/tr/td/div/div[@style='left:81px']");
        } catch (Exception e) {
            BaseView.takeScreenshot("dragandDropStartBluebartoBegin");
            SeleniumUtil.failed("drag and Drop Start Bluebar to Begin" + e.getMessage());
        }
    }

    public static void dragEndOfLastBluebartoExtend() {
        try {
            SeleniumUtil.dragAndDropElement("xpath", ".//table[6]/tbody/tr/td/div/div/div/div[@class='sch-resizable-handle sch-gantt-task-handle sch-resizable-handle-end']", "xpath", "div[style='width:954px;']");
        } catch (Exception e) {
            BaseView.takeScreenshot("dragandDropStartBluebartoBegin");
            SeleniumUtil.failed("drag and Drop Start Bluebar to Begin" + e.getMessage());
        }
    }

    public static void verifyTaskType(String strTaskName, String strType) {
        try {
            SeleniumUtil.verifyTextValue("xpath", ".//div[contains(./text(),'" + strTaskName + "')]/parent::td/following-sibling::td[1]", strType, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to verify Task Type");
            fail("Failed to verify Task Type");
        }
    }

    public static void openTaskInfoPopup(int intRowNo, String strRowName, String strTaskName, String
            strMenuOption) {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath(".//table[" + (intRowNo + 1) + "]/tbody/tr/td/div/div[1]/div[2]")));
                SeleniumUtil.click("xpath", "//span[./text()='" + strMenuOption + "']", 10);
                OrgChartView.waitTillModalWindow(5);
                break;
            } catch (Exception e) {
            }
        }

        if (i == 10) {
            try {
                CommonMethods.rightClick(BrowserDriver.getCurrentDriver().findElement(By.xpath(".//table[" + (intRowNo + 1) + "]/tbody/tr/td/div/div[1]/div[2]")));
                SeleniumUtil.click("xpath", "//span[./text()='" + strMenuOption + "']", 10);
            } catch (Exception e) {
                BaseView.takeScreenshot("Failed to open task pop up.png");
                TestCase.fail("Failed to open task pop up" + e.getMessage());
            }
        }
    }

    public static void blueBarPotion(int intRowNo, String strBarPostion) {
        try {
            org.junit.Assert.assertTrue(strBarPostion.contains(SeleniumUtil.getAttributeValue("xpath", ".//table[" + (intRowNo + 1) + "]/tbody/tr/td/div/div[1]/div[2]/parent::div", "style", SeleniumUtilities.OBJWAITTIMEOUT)));
//           org.junit.Assert.assertTrue(strBarPostion.contains(SeleniumUtil.getAttributeValue("xpath", ".//table[" + (intRowNo + 1) + "]/tbody/tr/td/div/div[1]/div[2]", "style", SeleniumUtilities.OBJWAITTIMEOUT)));
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to verify the blueBarPotion");
            TestCase.fail("Failed to verify the blueBarPotion" + e.getMessage());
        }
    }

    public static void verifySpreedSheetViewAssignees(int col, String strTaskName, String strAssignees) {
        try {

            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[2]", strAssignees, SeleniumUtilities.OBJWAITTIMEOUT))
                fail("Does not exist:" + strAssignees);

        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the SpreedSheet view Dates");
            fail("Failed to Verify the SpreedSheet view Dates");
        }
    }

    public static void verifyInSpreedSheetViewTaskName(String strTaskName) {
        try {
            SeleniumUtil.waitForNonStaleWebElement("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td", 5, SeleniumUtilities.OBJWAITTIMEOUT);
//            if (!SeleniumUtil.verifyTextValue("xpath", ".//span[contains(text(),'" + strTaskName + "')]/parent::div/parent::td/following-sibling::td[2]", strAssignees, SeleniumUtilities.OBJWAITTIMEOUT))
//                fail("Does not exist:" + strAssignees);

        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the SpreedSheet view Dates");
            fail("Failed to Verify the SpreedSheet view Dates");
        }
    }
    /*
    **
    * Specify date bar under which task is starting
    **/

    public static int getPositionOfTask(String specifyDateBar) {
        int width = 0;
        String style = null;
        int positionsMoved = 0;
        try {
            positionsMoved = BrowserDriver.getCurrentDriver().findElements(By.xpath("//td[contains(@class,'sch-column-header')][contains(@class,'sch-dayheadercell')]/*[text()='" + specifyDateBar + "']/parent::td[1]/preceding-sibling::td")).size();
            style = BrowserDriver.getCurrentDriver()
                    .findElement(
                            By.xpath("//td[contains(@class,'sch-column-header')][contains(@class,'sch-dayheadercell')]/*[text()='" + specifyDateBar + "']/parent::td[1]"))
                    .getAttribute("style").replace("position: static; text-align: center; width: ", "").replace("px;", "").trim();
            width = Integer.parseInt(style);


        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to Verify the SpreedSheet view Dates");
            fail("Failed to Verify the SpreedSheet view Dates");
        }
        return width * positionsMoved;
    }


    public static void deselectColumnHeaders(String gridID, String header, String
            sortMethod, List<String> menuItems) throws Throwable {
        int i = 0;
        String strElement = AllContractPagesView.getGridElement(gridID);

        WebElement gridElement = SeleniumUtil.getElement("cssselector", strElement, 5, SeleniumUtilities.OBJWAITTIMEOUT);
        for (i = 0; i < 10; i++) {
            try {
                BaseView.pushVeryShortTimeout();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                Actions action = new Actions(BrowserDriver.getCurrentDriver());
                gridElement.findElement(By.xpath("//b[text()='" + header + "']")).click();
                gridElement.findElement(By.xpath("//b[text()='" + header + "']")).click();
                action.moveToElement(gridElement.findElement(By.xpath("//b[text()='" + header + "']"))).build().perform();
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//b[text()='" + header + "']/ancestor::span[@class='x-column-header-text-container']/following-sibling::div")));

                gridElement.findElement(By.xpath("//b[text()='" + header + "']/ancestor::span[@class='x-column-header-text-container']/following-sibling::div")).click();
                gridElement.findElement(By.xpath("//span[text()='" + sortMethod + "']")).click();
                for (String menu : menuItems) {
                    wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[starts-with(@id,'menucheckitem')]//b[text()='" + menu + "']//ancestor::span[starts-with(@id,'menucheckitem')]/following-sibling::div[starts-with(@id,'menucheckitem')]")));
                    BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[starts-with(@id,'menucheckitem')]//b[text()='" + menu + "']//ancestor::span[starts-with(@id,'menucheckitem')]/following-sibling::div[starts-with(@id,'menucheckitem')]")).click();
                }
                break;
            } catch (Exception e) {
                if (i == 10) {
                    BaseView.takeScreenshot("UnableToSort.png");
                    logger.info("Error :" + e.getMessage());
                    BaseView.popDefaultTimeout();
                    fail(e.getMessage());
                }
            } finally {
                BaseView.popDefaultTimeout();
            }
        }
    }

    public static void verifyHeaderIsInVisibleAfterDeselectingColumn(String gridID, List<String> headers) throws
            Throwable {
        for (String header : headers) {
            try {
                CommonMethods.switchToVisibleFrame();
                String strElement = AllContractPagesView.getGridElement(gridID);
                WebElement gridElement = SeleniumUtil.getElement("cssselector", strElement, 5, SeleniumUtilities.OBJWAITTIMEOUT);
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 6);
                wait.until(ExpectedConditions.not(ExpectedConditions.visibilityOf(gridElement.findElement(By.xpath("//b[text()='" + header + "']")))));
            } catch (Exception e) {
                BaseView.takeScreenshot("VerifyLogTextError.png");
                fail("Failed to click " + e.getMessage());
            }
        }
    }


    public static void verifyAssigneesInEditTaskPopup(String entity, List<String> assignees) throws Throwable {
        for (String assignee : assignees) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 6);
                wait.until
                        (ExpectedConditions.visibilityOf(BrowserDriver.getCurrentDriver()
                                .findElement(By.xpath("//div[text()='Editing Task for " + entity + "']" +
                                        "//ancestor::div[contains(@class,'x-window-header-top')]" +
                                        "//following-sibling::div//*[text()='" + assignee + "']"))));
            } catch (Exception e) {
                BaseView.takeScreenshot("VerifyAssigneeError.png");
                fail("Failed to verify Assignee " + e.getMessage());
            }
        }
    }

    public static void verifyAssigneesInEditTaskPopupNotPresent(String entity, List<String> assignees) throws Throwable {
        for (String assignee : assignees) {
            try {
                BaseView.pushShortTimeout(2);
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 6);
                wait.until(ExpectedConditions.numberOfElementsToBe(By.xpath("//div[text()='Editing Task for " + entity + "']" +
                                        "//ancestor::div[contains(@class,'x-window-header-top')]" +
                                        "//following-sibling::div//*[text()='" + assignee + "']"),0));
            } catch (Exception e) {
                BaseView.takeScreenshot("VerifyAssigneeError.png");
                fail("Failed to verify Assignee " + e.getMessage());
            }
        }
    }
}