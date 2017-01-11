package com.lucernex.qa.views.iwms.adminpages.companyadministration.managescheduletemplates;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.pages.components.ModalDialogPage;
import com.lucernex.qa.utils.AjaxEnabledPageFactory;
import com.lucernex.qa.utils.GridUtils;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import junit.framework.TestCase;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.logging.Logger;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;
import static junit.framework.Assert.assertTrue;
import static junit.framework.TestCase.fail;

/**
 * Created by rle0097 on 4/29/2015.
 */
public class ScheduleTemplateView {
    protected static final ModalDialogPage modalDialogPage = AjaxEnabledPageFactory.ajaxInitElements(BrowserDriver.getCurrentDriver(), ModalDialogPage.class);
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private static final Logger logger = Logger.getLogger(Logger.class.getName());

    public static void gridActions(String strItem, String action, String gridID) throws Throwable {
        logger.info("Attempting to click link " + action + "...");
        //time for the grid to load
        CommonMethods.waitTillDivisionLoads();
        WebElement grid = BrowserDriver.getCurrentDriver()
                .findElement(By.cssSelector(AllContractPagesView.getGridElement(gridID)));

        int maxTries = 10;
        int count = 0;
        for (count = 0; count < maxTries; count++) {
            logger.info("Try " + count + " for link: " + action + "....");

            for (WebElement group : grid.findElements(By.cssSelector("td"))) {
                if (group.getText().contains(strItem)) {
                    for (WebElement links : group.findElements(By.xpath("following-sibling::td"))) {
                        if (links.getText().contains(action)) {
                            try {
                                try {
                                    links.findElement(By.linkText(action)).sendKeys("");
                                } catch (Exception e) {
                                    //Ignore
                                }
                                links.findElement(By.linkText(action)).click();
                                return;
                            } catch (Exception e) {
                                //Ignore
                                //delay(1000);
                            }
                        }
                    }
                }
            }
        }
        BaseView.takeScreenshot("Did not find the grid link.png");
        Assert.fail("Did not find the grid link " + action + " after " + maxTries + " attempts");
    }

    public static void verifyGridItem(String strPage, boolean present, String gridID) {
        WebElement grid = BrowserDriver.getCurrentDriver()
                .findElement(By.cssSelector(AllContractPagesView.getGridElement(gridID)));
        if (present) {
            try {
                if (grid.findElements(By.xpath("//*[text()='" + strPage + "']")).size() == 1) {
                    logger.info(strPage + " present");
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(strPage + "ScheduleTemp.png");
                fail(e.getMessage());
            }

        } else {
            try {
                if (grid.findElements(By.xpath("//*[text()='" + strPage + "']")).size() == 0) {
                    logger.info(strPage + " not present");
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(strPage + "ScheduleTemp.png");
                fail(e.getMessage());
            }
        }
    }

    public static void selectTemplate(String template) {
        try {
            SeleniumUtil.select("cssselector", "form[name='templSel']>select[name='projectEntityID']", template, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to select template.png");
        }
    }

    public static void enterLeadrLagDays(String strleadrLagDays) {
        try {
            SeleniumUtil.type("cssselector", "input[role='spinbutton']", strleadrLagDays, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("enterLeadrLagDays.png");
        }
    }

    public static void verifyPredecessorsGroupTask(String strTask, String strPredecessors) {
        try {
            String strExtractedValue = SeleniumUtil.getTextValue("xpath", "//td[@class='dataNormal']//a[./text()='" + strTask + "']/../following-sibling::td[2]", SeleniumUtilities.OBJWAITTIMEOUT);
            assertTrue(strExtractedValue.contains(strPredecessors));
            logger.info(strExtractedValue);
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyPredecessorsGroupTask.png");
        }
    }

    public static void verifyProjectSchedule(String strPrjKickOffDate) {
        try {
            SeleniumUtil.getFrameIndex("cssselector", "div[title='" + strPrjKickOffDate + " Project kickoff']");
            String strExtractedValue = SeleniumUtil.getTextValue("cssselector", "div[title='" + strPrjKickOffDate + " Project kickoff']", SeleniumUtilities.OBJWAITTIMEOUT);
            assertTrue(strExtractedValue.contains("Project kickoff"));
            logger.info(strExtractedValue);
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyProjectSchedule.png");
        }
    }

    public static void verifyGanttDarkerShadeOfGrey(int intBarCout) {
        try {
            SeleniumUtil.getFrameIndex("cssselector", ".sch-gantt-item.sch-gantt-task-bar.sch-event-resizable-");
            List<WebElement> ele = BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".sch-gantt-item.sch-gantt-task-bar.sch-event-resizable-"));
            assertTrue((intBarCout) == (ele.size()));
            logger.info(String.valueOf(ele.size()));
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyProjectSchedule.png");
        }
    }

    public static void verifyHolidayCalender(int intRowCount, String holidayName, String year, String month, String day) {
        try {
            GridUtils.verifyGrid("id", "HolidayDateGrid", intRowCount, holidayName, year, month, day);
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyHolidayCalender.png");
        }
    }

    public static void clickOnUpdateButton() {
        try {
            SeleniumUtil.click("id", "submitButton", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyHolidayCalender.png");
        }
    }

    public static void verifyCrashScheduleCalendar(String strCalendarName) {
        try {
            assertTrue(SeleniumUtil.getFirstSelectedOption("name", "HolidayScheduleID", SeleniumUtilities.OBJWAITTIMEOUT).contains(strCalendarName));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyHolidayCalender.png");
        }
    }

    public static void enterTaskName(String taskName) {
        try {
//            CommonMethods.selectFromComboBox(BrowserDriver
//                    .getCurrentDriver().findElement(By.xpath("//div[contains(@class,'x-css-shadow')]/following-sibling::div[contains(@class,'x-window')]//div[starts-with(@id,'headercontainer')][1]//following-sibling::div//input[@role='combobox']")), taskName);
            CommonMethods.selectFromComboBox(SeleniumUtil.getWebElementObject("xpath","//div[contains(@class,'x-css-shadow')]/following-sibling::div[contains(@class,'x-window')]//div[starts-with(@id,'headercontainer')][1]//following-sibling::div//input[@role='combobox']"), taskName);

        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to enter task name.png");
            fail("Unable to enter task name");
        }
    }

    /**
     * Clicks a button in the Grid.  Retries a number of times
     * to give time for the grid to load and populate the button
     */
    public static void clickGridButtonWhenReady(String buttonTitle) throws Throwable {
        logger.info("Attempting to click grid button " + buttonTitle + "...");
        //time for the grid to load
        CommonMethods.waitTillDivisionLoads();

        int maxTries = 10;
        int count = 0;
        for (count = 0; count < maxTries; count++) {
            logger.info("Try " + count + " for button: " + buttonTitle + "...");

            try {
                SeleniumUtil.waitForElementVisibilityOf("cssselector", "div.x-css-shadow+div.x-window", 5, 2);
                BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div.x-css-shadow+div.x-window"))
                        .findElement(By.xpath(".//span[./text()='" + buttonTitle + "']")).click();
                break;
            } catch (StaleElementReferenceException se) {
//                delay(1000);
                // Stale element exception re-fetch element
            } catch (Exception e) {
//                delay(1000);
                // dom changed, find button elements
            }
        }
        if (count == maxTries) {
            Assert.fail("Did not find the grid button " + buttonTitle + " after " + maxTries + " attempts");
        }
    }

    public static void verifyExtendedYellowAndBlueBar() {
        try {
            List<Integer> blueBarWidth = new ArrayList<>();
            List<Integer> yellowBarWidth = new ArrayList<>();
            List<WebElement> blueBars = BrowserDriver.getCurrentDriver()
                    .findElements(By.cssSelector(".sch-gantt-item.sch-gantt-task-bar.sch-event-resizable-"));
            List<WebElement> yellowBars = BrowserDriver.getCurrentDriver()
                    .findElements(By.cssSelector(".sch-gantt-item.sch-gantt-parenttask-bar.sch-event-resizable-"));

            for (WebElement blueBar : blueBars) {
                String[] values = blueBar.getAttribute("style").split("width:");
                String[] values2 = values[1].split("px");
                System.out.println(Integer.parseInt(values2[0].trim()));
                blueBarWidth.add(Integer.parseInt(values2[0].trim()));
            }
            for (WebElement yellowBar : yellowBars) {
                String[] values = yellowBar.getAttribute("style").split("width:");
                String[] values2 = values[1].split("px");
                System.out.println(Integer.parseInt(values2[0].trim()));
                yellowBarWidth.add(Integer.parseInt(values2[0].trim()));
            }

            Integer j = Collections.max(yellowBarWidth);
            Integer i = Collections.max(blueBarWidth);
            if (yellowBarWidth.indexOf(i) == 0 && blueBarWidth.indexOf(j) == 0) {
                logger.info("Yellow and blue bar extended");
            } else {
                BaseView.takeScreenshot("Yellow and blue bar not extended.png");
                fail("Yellow and blue bar are not extended");
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to enter task name.png");
            fail("Unable to see the extended blue and yellow bar");
        }
    }

    public static void enterComments(String value) {
        BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".x-btn-icon-el.x-btn-icon-el-default-toolbar-small.x-edit-sourceedit")).click();
        BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id^='htmleditor'] textarea")).clear();
        BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id^='htmleditor'] textarea")).sendKeys(value);
    }

    public static int verifyToolTipValues(String taskName, List<Field> values) {
        Actions mouseHover = new Actions(BrowserDriver.getCurrentDriver());
        mouseHover.moveToElement(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[text()='" + taskName + "']"))).build().perform();
        int valueCount = 0;
        List<WebElement> tooltips = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("table.taskTip"));
        for (WebElement tooltip : tooltips) {
            for (Field f : values) {
                int count = 0;
                boolean isDisplayed = false;
                do {
                    count++;
                    mouseHover.moveToElement(BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[text()='" + taskName + "']"))).build().perform();
                    try {
                        tooltip.findElement(By.xpath("//*[contains(text(),'" + f.getName() + "')]//following-sibling::*[contains(text(),'" + f.getValue() + "')]")).isDisplayed();
                        isDisplayed = true;
                        valueCount++;
                    }catch (Exception e){
                    }
                }
                while (!isDisplayed && count < 20);
            }
        }
        return valueCount;
    }

    public static WebElement getBlueBarOfTask(String taskName) throws Throwable {
        WebElement bluBar = null;
        boolean taskNamePresent = false;
        List<WebElement> tressViews = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id^='Lx-ui-GanttPanel'] table[id^='treeview'] span"));
        List<String> taskNames = new ArrayList<>();

        for (WebElement treeView : tressViews) {
            taskNames.add(AllContractPagesView.getTextAndByPassException(treeView));
        }

        if(taskNames.indexOf(taskName)!=-1) {
            int index = taskNames.indexOf(taskName);
            index = index+1;
            bluBar = BrowserDriver.getCurrentDriver().findElement(
                    By.cssSelector("div[id^='Lx-ui-GanttPanel'] table[id^='Lx-ui-GanttPanel']:nth-of-type(" + index + ")"))
                    .findElement(By.cssSelector(".sch-gantt-item.sch-gantt-task-bar.sch-event-resizable-"));
        }
        return bluBar;
    }

    public static int verifyToolTipValuesOnTimeLine(String taskName, List<Field> values) throws Throwable{
        Actions mouseHover = new Actions(BrowserDriver.getCurrentDriver());
        mouseHover.moveToElement(getBlueBarOfTask(taskName)).build().perform();
        try{
            mouseHover.moveToElement(getBlueBarOfTask(taskName).findElement(By.cssSelector(".sch-gantt-terminal.sch-gantt-terminal-start"))).build().perform();
        }catch(Exception e){
        }

        int valueCount = 0;
        List<WebElement> tooltips = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("table.taskTip"));
        for (WebElement tooltip : tooltips) {
            for (Field f : values) {
                int count = 0;
                boolean isDisplayed = false;
                do {
                    count++;
                    mouseHover.moveToElement(getBlueBarOfTask(taskName)).build().perform();
                    try{
                        mouseHover.moveToElement(getBlueBarOfTask(taskName).findElement(By.cssSelector(".sch-gantt-terminal.sch-gantt-terminal-start"))).build().perform();
                    }catch(Exception e){
                    }
                    try {
                        tooltip.findElement(By.xpath("//*[contains(text(),'" + f.getName() + "')]//following-sibling::*[contains(text(),'" + f.getValue() + "')]")).isDisplayed();
                        isDisplayed = true;
                        valueCount++;
                    }catch (Exception e){
                    }
                }
                while (!isDisplayed && count < 20);
            }
        }
        return valueCount;
    }

    public static void verifyScheduleGroupAssign(String strGroup,String strAssign) {
        try {
            SeleniumUtil.elementShouldVisible("xpath",".//*[./text()='"+strGroup+"']/parent::*/following-sibling::td[./text()='"+strAssign+"']",8,SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyScheduleGroupAssign");
            Assert.fail("verifyScheduleGroupAssign" + ex.getMessage());
        }
    }

    public static void verifyDaysAfterStart(String strDayAfterStart,String strName) {
        try {
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strName + "']/parent::td/following-sibling::td[2]", strDayAfterStart, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyDaysAfterStart");
            Assert.fail("verifyDaysAfterStart" + ex.getMessage());
        }
    }

    public static void verifySuccessorsTabGrid(String strTaskName,String strType,String strLeadLagDays) {
        try {
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/parent::td/following-sibling::td[1]", strType, SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/parent::td/following-sibling::td[2]", strLeadLagDays, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifySuccessorsTabGrid");
            Assert.fail("verifySuccessorsTabGrid :" + ex.getMessage());
        }
    }

    public static void verifyScheduleGrid(String strTaskName, String strStatus, String strFAStartDate, int intFAStartDate, String strFAEndDate, int intFAEndDate, String strDuration,String strBLStartDate,String strBLEndDate) {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[3]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[3]", strStatus, SeleniumUtilities.OBJWAITTIMEOUT));

            if(strFAStartDate.equalsIgnoreCase("[CURRENT DATE]")) {
                if (intFAStartDate > 0)
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(intFAStartDate + 1), SeleniumUtilities.OBJWAITTIMEOUT));
                else
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", SeleniumUtil.addDaystoCurrentDate(intFAStartDate), SeleniumUtilities.OBJWAITTIMEOUT));
            }else{
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", strFAStartDate, SeleniumUtilities.OBJWAITTIMEOUT));
            }
            if(strFAEndDate.equalsIgnoreCase("[CURRENT DATE]")) {
                if(intFAEndDate>0)
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(intFAEndDate + 1), SeleniumUtilities.OBJWAITTIMEOUT));
                else
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", SeleniumUtil.addDaystoCurrentDate(intFAEndDate), SeleniumUtilities.OBJWAITTIMEOUT));

            }else{
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", strFAEndDate, SeleniumUtilities.OBJWAITTIMEOUT));
            }

            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[7]", strDuration, SeleniumUtilities.OBJWAITTIMEOUT));

            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[10]", strBLStartDate, SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[11]", strBLEndDate, SeleniumUtilities.OBJWAITTIMEOUT));

        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyScheduleGrid");
            Assert.fail("verifyScheduleGrid :" + ex.getMessage());
        }
    }

    public static void verifyScheduleGrid(String strTaskName, String strStatus, String strFAStartDate, int intFAStartDate, String strFAEndDate, int intFAEndDate, String strDuration,String strSlack,String strBLStartDate,String strBLEndDate) {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[3]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[3]", strStatus, SeleniumUtilities.OBJWAITTIMEOUT));

            if(strFAStartDate.equalsIgnoreCase("[CURRENT DATE]")) {
                if (intFAStartDate > 0)
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(intFAStartDate + 1), SeleniumUtilities.OBJWAITTIMEOUT));
                else
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", SeleniumUtil.addDaystoCurrentDate(intFAStartDate), SeleniumUtilities.OBJWAITTIMEOUT));
            }else{
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", strFAStartDate, SeleniumUtilities.OBJWAITTIMEOUT));
            }
            if(strFAEndDate.equalsIgnoreCase("[CURRENT DATE]")) {
                if(intFAEndDate>0)
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(intFAEndDate + 1), SeleniumUtilities.OBJWAITTIMEOUT));
                else
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", SeleniumUtil.addDaystoCurrentDate(intFAEndDate), SeleniumUtilities.OBJWAITTIMEOUT));

            }else{
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", strFAEndDate, SeleniumUtilities.OBJWAITTIMEOUT));
            }

            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[7]", strDuration, SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[8]", strSlack, SeleniumUtilities.OBJWAITTIMEOUT));

            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[10]", strBLStartDate, SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[11]", strBLEndDate, SeleniumUtilities.OBJWAITTIMEOUT));

        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyScheduleGrid");
            Assert.fail("verifyScheduleGrid :" + ex.getMessage());
        }
    }

    public static void verifyScheduleGrid(String strTaskName, String strStatus,String strDone, String strFAStartDate, int intFAStartDate, String strFAEndDate, int intFAEndDate, String strBLStartDate,String strBLEndDate) {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[3]", 8, SeleniumUtilities.OBJWAITTIMEOUT);

            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[3]", strStatus, SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[4]", strDone, SeleniumUtilities.OBJWAITTIMEOUT));

            if(strFAStartDate.equalsIgnoreCase("[CURRENT DATE]")) {
                if (intFAStartDate > 0)
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(intFAStartDate + 1), SeleniumUtilities.OBJWAITTIMEOUT));
                else
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", SeleniumUtil.addDaystoCurrentDate(intFAStartDate), SeleniumUtilities.OBJWAITTIMEOUT));
            }else{
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", strFAStartDate, SeleniumUtilities.OBJWAITTIMEOUT));
            }
            if(strFAEndDate.equalsIgnoreCase("[CURRENT DATE]")) {
                if(intFAEndDate>0)
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(intFAEndDate + 1), SeleniumUtilities.OBJWAITTIMEOUT));
                else
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", SeleniumUtil.addDaystoCurrentDate(intFAEndDate), SeleniumUtilities.OBJWAITTIMEOUT));

            }else{
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", strFAEndDate, SeleniumUtilities.OBJWAITTIMEOUT));
            }


            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[10]", strBLStartDate, SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[11]", strBLEndDate, SeleniumUtilities.OBJWAITTIMEOUT));

        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyScheduleGrid");
            Assert.fail("verifyScheduleGrid :" + ex.getMessage());
        }
    }

    public static void verifyScheduleGrid(String strTaskName, String strStatus,String strDone, String strFAStartDate, int intFAStartDate, String strFAEndDate, int intFAEndDate, String strDuration, String strBLStartDate,String strBLEndDate) {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[3]", 8, SeleniumUtilities.OBJWAITTIMEOUT);

            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[3]", strStatus, SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[4]", strDone, SeleniumUtilities.OBJWAITTIMEOUT));

            if(strFAStartDate.equalsIgnoreCase("[CURRENT DATE]")) {
                if (intFAStartDate > 0)
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(intFAStartDate + 1), SeleniumUtilities.OBJWAITTIMEOUT));
                else
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", SeleniumUtil.addDaystoCurrentDate(intFAStartDate), SeleniumUtilities.OBJWAITTIMEOUT));
            }else{
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", strFAStartDate, SeleniumUtilities.OBJWAITTIMEOUT));
            }
            if(strFAEndDate.equalsIgnoreCase("[CURRENT DATE]")) {
                if(intFAEndDate>0)
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(intFAEndDate + 1), SeleniumUtilities.OBJWAITTIMEOUT));
                else
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", SeleniumUtil.addDaystoCurrentDate(intFAEndDate), SeleniumUtilities.OBJWAITTIMEOUT));

            }else{
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", strFAEndDate, SeleniumUtilities.OBJWAITTIMEOUT));
            }


            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[7]", strDuration, SeleniumUtilities.OBJWAITTIMEOUT));

            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[10]", strBLStartDate, SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[11]", strBLEndDate, SeleniumUtilities.OBJWAITTIMEOUT));

        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyScheduleGrid");
            Assert.fail("verifyScheduleGrid :" + ex.getMessage());
        }
    }

    public static void verifyPredecessorGrid(String strPredecessor, String strType, String strLeadLagDays) {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='"+strPredecessor+"']/parent::td/following-sibling::td[1]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strPredecessor+"']/parent::td/following-sibling::td[1]", strType, SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strPredecessor+"']/parent::td/following-sibling::td[2]", strLeadLagDays, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyPredecessorGrid");
            Assert.fail("verifyPredecessorGrid :" + ex.getMessage());
        }
    }


    public static void verifyScheduleGrid(String strTaskName, String strStatus,String strDone, String strFAStartDate, int intFAStartDate, String strFAEndDate, int intFAEndDate, String strDuration, String strSlack,String strBLStartDate, int intBLStartDays,String strBLEndDate, int intBLEndDays) {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[3]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[3]", strStatus, SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[4]", strDone, SeleniumUtilities.OBJWAITTIMEOUT));

            if(strFAStartDate.equalsIgnoreCase("[CURRENT DATE]")) {
                if (intFAStartDate > 0)
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(intFAStartDate + 1), SeleniumUtilities.OBJWAITTIMEOUT));
                else
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", SeleniumUtil.addDaystoCurrentDate(intFAStartDate), SeleniumUtilities.OBJWAITTIMEOUT));
            }else{
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[5]", strFAStartDate, SeleniumUtilities.OBJWAITTIMEOUT));
            }
            if(strFAEndDate.equalsIgnoreCase("[CURRENT DATE]")) {
                if(intFAEndDate>0)
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(intFAEndDate + 1), SeleniumUtilities.OBJWAITTIMEOUT));
                else
                    TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", SeleniumUtil.addDaystoCurrentDate(intFAEndDate), SeleniumUtilities.OBJWAITTIMEOUT));

            }else{
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[6]", strFAEndDate, SeleniumUtilities.OBJWAITTIMEOUT));
            }

            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[7]", strDuration, SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[8]", strSlack, SeleniumUtilities.OBJWAITTIMEOUT));

            if(strBLStartDate.equalsIgnoreCase("[CURRENT DATE]") || strBLEndDate.equalsIgnoreCase("[CURRENT DATE]")) {
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[10]", SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(intBLStartDays + 1), SeleniumUtilities.OBJWAITTIMEOUT));
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTaskName + "']/ancestor::td/following-sibling::td[11]", SeleniumUtil.addDaystoCurrentDateSkipWeekEndsCount(intBLEndDays + 1), SeleniumUtilities.OBJWAITTIMEOUT));
            }else{
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[10]", strBLStartDate, SeleniumUtilities.OBJWAITTIMEOUT));
                TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[11]", strBLEndDate, SeleniumUtilities.OBJWAITTIMEOUT));
            }



        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyScheduleGrid");
            Assert.fail("verifyScheduleGrid :" + ex.getMessage());
        }
    }


    public static void verifyScheduleGrid(String strTaskName, String strStatus) {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[3]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='"+strTaskName+"']/ancestor::td/following-sibling::td[3]", strStatus, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyScheduleGrid");
            Assert.fail("verifyScheduleGrid :" + ex.getMessage());
        }
    }

    public static void clickOnSaveIcon() {
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector", "span.icon-save", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector","span.icon-save",SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnSaveIcon");
            Assert.fail("clickOnSaveIcon :" + ex.getMessage());
        }
    }
}