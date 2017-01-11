package com.lucernex.qa.views.iwms.adminpages;

import com.lucernex.qa.views.HomeView;
import com.lucernex.qa.views.admin.AdminGridView;
import org.apache.commons.lang.WordUtils;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.ClickFields;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.contract.reports.ReportsView;
import junit.framework.Assert;
import junit.framework.TestCase;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import javax.validation.constraints.AssertTrue;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Logger;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertTrue;
import static junit.framework.Assert.fail;

import java.time.DayOfWeek;
import java.time.LocalDate;

import static java.time.temporal.TemporalAdjusters.previousOrSame;
import static java.time.temporal.TemporalAdjusters.nextOrSame;

/**
 * Created by rle0239 on 09/01/2015.
 */
public class AdminGenericView {
    private static final Logger logger = Logger.getLogger(AdminGenericView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void setValuesInSearchField(String strSearchText) {
        try {
            SeleniumUtil.clear("cssselector", "input[data-ref='inputEl']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("cssselector", "input[data-ref='inputEl']", strSearchText, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.enter("cssselector", "input[data-ref='inputEl']", SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception Ex) {
            BaseView.takeScreenshot(strSearchText + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void checkEntityCheckboxes(List<ClickFields> fields) {
        for (ClickFields f : fields) {
            try {
                SeleniumUtil.click(f.getLocator(), "_checkbox_IsValidFor" + f.getElement(), SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (InterruptedException Ex) {
                try {
                    SeleniumUtil.click(f.getLocator(), "_checkbox_IsValidFor" + f.getElement(), SeleniumUtilities.OBJWAITTIMEOUT);
                } catch (Exception e) {
                    BaseView.takeScreenshot(f.getElement() + ".png");
                    logger.info("Error :" + Ex.getMessage());
                    fail(Ex.getMessage());
                }

            } catch (Exception Ex) {
                try {
                    SeleniumUtil.click(f.getLocator(), "_checkbox_IsValidFor" + f.getElement(), SeleniumUtilities.OBJWAITTIMEOUT);
                } catch (Exception e) {
                    BaseView.takeScreenshot(f.getElement() + ".png");
                    logger.info("Error :" + Ex.getMessage());
                    fail(Ex.getMessage());
                }
            }
        }
    }

    public static void selectLayout(String layoutName) throws Throwable {
        SeleniumUtil.select("name", "DuplicatePageLayoutID", layoutName, SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void expandFolders(String accessTitle) throws Throwable {
        WebElement parent = null;
        int occurrence = 0;
        int maxAttempt = 0;
        try {
            do {
                List<WebElement> titles = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.show_div span[id^='title']"));
                for (WebElement title : titles) {
                    if (AllContractPagesView.getTextAndByPassException(title).trim().equals(accessTitle)) {
                        parent = BrowserDriver.getParent(BrowserDriver.getParent(title));
                        occurrence++;
                    }
                }
                if (occurrence > 1) {
                    logger.info("More than one access title is present");
                    BaseView.takeScreenshot("More than one access title is present.png");
                    fail("Moare than one access title is present" + accessTitle);
                } else if (occurrence == 0) {
                    logger.info("No access title is present");
                    BaseView.takeScreenshot("No title is present.png");
                    ReportsView.reachElementDownContainsText(accessTitle);
                } else {
                    try {
                        BaseView.pushVeryShortTimeout();
                        AllContractPagesView.focusWebElement(parent.findElement(By.tagName("a")));
                        parent.findElement(By.tagName("a")).click();
                        CommonMethods.waitTillDivisionLoads();
                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                maxAttempt++;
            } while (occurrence == 0 && maxAttempt < 50);

            if (occurrence == 0) {
                logger.info("No access title is present");
                BaseView.takeScreenshot("No title is present.png");
                fail("No access title is present" + accessTitle);
            }

        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToselectAccess" + ".png");
            logger.info("Error :" + Ex.getMessage());
            fail("Unable to select access type " + accessTitle + " for " + accessTitle);
        }
    }

    public static void selectSecurityAccess(String accessTitle, String accessType) throws Throwable {
        WebElement parent = null;
        int occurrence = 0;
        int maxAttempt = 0;
        try {
            do {
                List<WebElement> titles = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("tr.show_div span[id^='title']"));
                for (WebElement title : titles) {
                    if (AllContractPagesView.getTextAndByPassException(title).trim().equals(accessTitle)) {
                        parent = BrowserDriver.getParent(BrowserDriver.getParent(title));
                        occurrence++;
                    }
                }
                if (occurrence > 1) {
                    logger.info("More than one access title is present");
                    BaseView.takeScreenshot("More than one access title is present.png");
                } else if (occurrence == 0) {
                    logger.info("No access title is present");
                    BaseView.takeScreenshot("No title is present.png");
                    ReportsView.reachElementDownContainsText(accessTitle);
                } else {
                    try {
                        BaseView.pushVeryShortTimeout();
                        if (!parent.findElement(By.cssSelector("input[value='" + accessType + "']")).isSelected()) {
                            parent.findElement(By.cssSelector("input[value='" + accessType + "']")).click();
                        }
                    } catch (Exception e) {
                    } finally {
                        BaseView.popDefaultTimeout();
                    }
                }
                maxAttempt++;
            } while (occurrence == 0 && maxAttempt < 50);

            if (occurrence == 0) {
                logger.info("No access title is present");
                BaseView.takeScreenshot("No title is present.png");
                fail("No access title is present " + accessTitle);
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToSelectAccess" + ".png");
            logger.info("Error :" + Ex.getMessage());
            fail("Unable to select access type " + accessType + " for " + accessTitle);
        }
    }

    public static void selectUserClass(String value) {
        SeleniumUtilities.selectDropdownOption(By.name("UserClass"), value);
    }

    public static void enterValuesInMultiPeriodAddLength(String strFiscalCalendar, String strYear, String strYearValue, String strTotalPeriods, String strTotalPeriodsValues) {
        try {
            SeleniumUtil.clear("xpath", ".//td[contains(./text(),'" + strFiscalCalendar + "')]/following-sibling::td/input[@name='" + strYear + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("xpath", ".//td[contains(./text(),'" + strFiscalCalendar + "')]/following-sibling::td/input[@name='" + strYear + "']", strYearValue, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.clear("xpath", ".//td[contains(./text(),'" + strFiscalCalendar + "')]/following-sibling::td/input[@name='" + strTotalPeriods + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("xpath", ".//td[contains(./text(),'" + strFiscalCalendar + "')]/following-sibling::td/input[@name='" + strTotalPeriods + "']", strTotalPeriodsValues, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("enterValuesINMultiPeriodAddLength");
            Assert.fail("enterValuesINMultiPeriodAddLength");
        }
    }

    public static void enterValuesInMultiPeriodAddWeek(String strYear, String strYearValue, String strTotalPeriods, String strTotalPeriodsValues) {
        try {
            String strFiscalCalendar = "Multi-Period Add (by weeks):";
            SeleniumUtil.type("xpath", ".//td[contains(./text(),'" + strFiscalCalendar + "')]/following-sibling::td/input[@name='" + strYear + "']", strYearValue, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.select("xpath", ".//td[contains(./text(),'" + strFiscalCalendar + "')]/following-sibling::td/select[@name='" + strTotalPeriods + "']", strTotalPeriodsValues, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("enterValuesInMultiPeriodAddWeek");
            Assert.fail("enterValuesInMultiPeriodAddWeek");
        }
    }

    public static void enterValuesInYearFiscalYearStartAndWeeksEachPeriod(String strYear, String strFiscalYear, String strWKP1, String strWKP2, String strWKP3, String strWKP4, String strWKP5, String strWKP6, String strWKP7, String strWKP8, String strWKP9, String strWKP10, String strWKP11, String strWKP12) {
        try {
            SeleniumUtil.type("xpath", ".//input[@name='wkpStartDate']/ancestor::td[1]/preceding::td[2]/input", strYear, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "wkpStartDate", strFiscalYear, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "wkp1", strWKP1, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "wkp2", strWKP2, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "wkp3", strWKP3, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "wkp4", strWKP4, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "wkp5", strWKP5, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "wkp6", strWKP6, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "wkp7", strWKP7, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "wkp8", strWKP8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "wkp9", strWKP9, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "wkp10", strWKP10, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "wkp11", strWKP11, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "wkp12", strWKP12, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("enterValuesInYearFiscalYearStartAndWeeksEachPeriod");
            Assert.fail("enterValuesInYearFiscalYearStartAndWeeksEachPeriod");
        }
    }

    public static void clickOnCreatePeriodsForYear() {
        try {
            SeleniumUtil.click("xpath", ".//input[@name='wkp13']/preceding::td[1]/following-sibling::td[2]/input", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("clickOnCreatePeriodsForYear");
            Assert.fail("clickOnCreatePeriodsForYear");
        }
    }

    public static void verifyCalendarDateHeader() {
        try {
            LocalDate now = LocalDate.now();
            LocalDate first = now.with(previousOrSame(DayOfWeek.MONDAY));
            LocalDate last = now.with(nextOrSame(DayOfWeek.SUNDAY));

            String firstDay = WordUtils.capitalize((first.getMonth().toString().toLowerCase())) + " " + first.getDayOfMonth() + ", " + first.getYear();
            String lastDay = WordUtils.capitalize((last.getMonth().toString().toLowerCase())) + " " + last.getDayOfMonth() + ", " + last.getYear();

            String currentWeek = firstDay + " - " + lastDay;
//            String currentWeek = SeleniumUtil.dateFormat("MMMM d, yyyy", SeleniumUtil.addDaystoCurrentDate(0)) + " - " + SeleniumUtil.dateFormat("MMMM d, yyyy", SeleniumUtil.addDaystoCurrentDate(6));
            SeleniumUtil.textContains(currentWeek);
            assertTrue(currentWeek.contains(SeleniumUtil.getTextValue("xpath", ".//img[@src='/en/calendar/prev.gif']/ancestor::td/following-sibling::td[1]", SeleniumUtilities.OBJWAITTIMEOUT)));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyCalendarDateHeader");
            Assert.fail("verifyCalendarDateHeader");
        }
    }

    public static void verifyCalendarDateMonthHeader() {
        try {
            String currentMonth = SeleniumUtil.dateFormat("MMMM, yyyy", SeleniumUtil.addDaystoCurrentDate(0));
            SeleniumUtil.textContains(currentMonth);
            assertTrue(currentMonth.contains(SeleniumUtil.getTextValue("xpath", ".//img[@src='/en/calendar/prev.gif']/ancestor::td/following-sibling::td[1]", SeleniumUtilities.OBJWAITTIMEOUT)));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyCalendarDateMonthHeader");
            Assert.fail("verifyCalendarDateMonthHeader");
        }
    }

    public static void verifyTabSelectedByDefault(String tab) {
        try {
            SeleniumUtil.waitForElementContainText(SeleniumUtil.getWebElementWithoutStaleness("cssselector", ".x-tab-strip-active"), tab);
        } catch (Exception e) {
            BaseView.takeScreenshot("DefaultTabMissing.png");
            fail("DefaultTabMissing " + tab + " " + e.getMessage());
        }
    }

    public static void validateContractExtendedSuccessMessage(List<String> text) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        for (String msg : text) {
            try {
                SeleniumUtil.waitForElementContainText(SeleniumUtil.getWebElementWithoutStaleness("cssselector", "table.frmAdmin"), msg);
                logger.info("text present " + msg + " in page");
            } catch (Exception Ex) {
                BaseView.takeScreenshot("successMessage.png");
                logger.info("Error :" + Ex.getMessage());
                org.junit.Assert.fail("Error :" + Ex.getMessage());
            }
        }
    }


    public static void selectMultiValue(List<String> arrFields) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector", "div[id^='lovcombo'] [id$='-trigger-picker']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", "div[id^='lovcombo'] [id$='-trigger-picker']", SeleniumUtilities.OBJWAITTIMEOUT);
            for (String field : arrFields) {
                SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + field + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.click("xpath", ".//*[./text()='" + field + "']", SeleniumUtilities.OBJWAITTIMEOUT);
                assertTrue(SeleniumUtil.verifyTextValue("cssselector", "li[qtip='" + field + "']", field, SeleniumUtilities.OBJWAITTIMEOUT));
            }

        } catch (Exception Ex) {
            BaseView.takeScreenshot("selectMultiValue");
            logger.info("Error :" + Ex.getMessage());
            org.junit.Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void selectTemplateLineItems(String strTreeItem, String strItem) throws Throwable {
        try {
//            SeleniumUtil.waitForElementIsClickable("xpath", " .//span[./text()='"+strTreeItem+"']/preceding::img[1]/ancestor::table/following-sibling::table//span[./text()='"+strItem+"']/preceding::img[1] [contains(@class,'x-tree-icon x-tree-icon-leaf')]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.click("xpath", ".//span[./text()='"+strTreeItem+"']/preceding::img[1]/ancestor::table/following-sibling::table//span[./text()='"+strItem+"']/preceding::img[1] [contains(@class,'x-tree-icon x-tree-icon-leaf')]", SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("xpath", ".//span[./text()='" + strItem + "']/preceding::img[1]/ancestor::table/following-sibling::table//span[./text()='" + strTreeItem + "']/preceding::input[1]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            for (WebElement ele : eles) {
                if (ele.getAttribute("class").contains("x-tree-checkbox")) {
                    SeleniumUtil.click(ele, SeleniumUtilities.OBJWAITTIMEOUT);
                }
            }

        } catch (Exception Ex) {
            BaseView.takeScreenshot("selectTemplateLineItem");
            logger.info("Error :" + Ex.getMessage());
            org.junit.Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void selectTemplateLineItem(String strTreeItem, String strItem) throws Throwable {
        try {
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("xpath", ".//span[./text()='" + strItem + "']/preceding::img[1]/ancestor::table/following-sibling::table//span[./text()='" + strTreeItem + "']/preceding::input[1]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            if (eles.get(0).getAttribute("class").contains("x-tree-checkbox")) {
                SeleniumUtil.click(eles.get(0), SeleniumUtilities.OBJWAITTIMEOUT);
            }

        } catch (Exception Ex) {
            BaseView.takeScreenshot("selectTemplateLineItem");
            logger.info("Error :" + Ex.getMessage());
            org.junit.Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void export(List<String> items) throws Throwable {
        for (String strItem : items) {
            try {
                ;
                int count = 0;
                AdminGridView.searchRecordInGrid(strItem);
                CommonMethods.waitTillDivisionLoads();
                do {
                    count++;
                    try {
                        SeleniumUtil.click("xpath", ".//td//div[contains(text(),'" + strItem + "')]/parent::td/preceding-sibling::td//div[@class='x-grid-row-checker']", SeleniumUtilities.OBJWAITTIMEOUT);
                    } catch (StaleElementReferenceException se) {
                        logger.info("Stale element.. continue clicking once element is loaded");

                    } catch (Exception e) {
                        if (e.getMessage().contains("element is not clickable")) {
                            logger.info("element is not clickable.. continue clicking once element is loaded");
                        } else {
                            logger.info(e.getMessage());
                        }
                    }

                } while (!BrowserDriver.getCurrentDriver().findElement
                        (By.xpath(".//td//div[contains(text(),'" + strItem + "')]/parent::td/preceding-sibling::td//div[@class='x-grid-row-checker']/ancestor::table[1]"
                        )).getAttribute("class").contains("x-grid-item-selected") && count < 10);

            } catch (Exception Ex) {
                BaseView.takeScreenshot("selected Template");
                logger.info("Error :" + Ex.getMessage());
                fail("Error :" + Ex.getMessage());
            }
        }
    }

    public static void checkTheCheckbox() {
        try {
            SeleniumUtil.clickElement("id", "radio-1017-boxLabelEl", SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
            logger.info("Clicked Continue till end");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("I_check_the_Continue_till_end.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void selectSecurityAccessForForms(String accessType, String entity) throws Throwable {
        try {
            WebElement radio = BrowserDriver.getCurrentDriver().findElement(
                    By.xpath(".//tr[@class='show_div']//span[starts-with(@id,'title')]" +
                            "[starts-with(text(),'" + entity + "')]//ancestor::tr//following-sibling::" +
                            "tr[@class='show_div'][1]//span[starts-with(text(),'Details')]" +
                            "/ancestor::tr[1]//following-sibling::tr[@class='show_div']" +
                            "//span[contains(text(),'Forms')]//ancestor::tr[1]//input[@value='" + accessType + "']"));
            if (!radio.isSelected()) {
                radio.click();
            }

        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToSelectAccess" + ".png");
            logger.info("Error :" + Ex.getMessage());
            fail("Unable to select access type " + accessType + " for ");
        }
    }

    public static void navigateToAdminPageAndDismissTheAlert(String alertMsg) throws Throwable {
        try {
            HomeView.clickAdminButton();
            SeleniumUtil.handleParticularAlert(alertMsg);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToSelectAccess" + ".png");
            logger.info("Error :" + Ex.getMessage());
            fail("Unable to handle alert type " + alertMsg + " for ");
        }
    }

    public static void selectSecurityAccess(String accessType, List<String> entity) throws Throwable {
        try {
            if (entity.size() == 1) {
                WebElement radio = BrowserDriver.getCurrentDriver().findElement(
                        By.xpath(".//tr[@class='show_div']//span[starts-with(@id,'title')]" +
                                "[starts-with(text(),'" + entity.get(0) + "')]//ancestor::tr[1]//input[@value='" + accessType + "']"));
                if (!radio.isSelected()) {
                    radio.click();
                }
            } else if (entity.size() == 2) {
                WebElement radio = BrowserDriver.getCurrentDriver().findElement(
                        By.xpath(".//tr[@class='show_div']//span[starts-with(@id,'title')]" +
                                "[starts-with(text(),'" + entity.get(0) + "')]//ancestor::tr[1]//following-sibling::" +
                                "tr[@class='show_div']//span[starts-with(text(),'" + entity.get(1) + "')]" +
                                "/ancestor::tr[1]//input[@value='" + accessType + "']"));
                if (!radio.isSelected()) {
                    radio.click();
                }
            } else if (entity.size() == 3) {
                WebElement radio = BrowserDriver.getCurrentDriver().findElement(
                        By.xpath(".//tr[@class='show_div']//span[starts-with(@id,'title')]" +
                                "[starts-with(text(),'" + entity.get(0) + "')]//ancestor::tr[1]//following-sibling::" +
                                "tr[@class='show_div']//span[starts-with(text(),'" + entity.get(1) + "')]" +
                                "/ancestor::tr[1]//following-sibling::tr[@class='show_div']" +
                                "//span[contains(text(),'" + entity.get(2) + "')]//ancestor::tr[1]//input[@value='" + accessType + "']"));
                if (!radio.isSelected()) {
                    radio.click();
                }
            }

        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToSelectAccess" + ".png");
            logger.info("Error :" + Ex.getMessage());
            fail("Unable to select access type " + accessType + " for ");
        }
    }

    public static void clickOnEllipsis() {
        try {
            SeleniumUtil.click("xpath", "//div[input[@role='combobox']]/following-sibling::div[2]", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("clickOnEllipsisOnModalWindow");
            Assert.fail("clickOnCreatePeriodsForYear");
        }
    }
}
