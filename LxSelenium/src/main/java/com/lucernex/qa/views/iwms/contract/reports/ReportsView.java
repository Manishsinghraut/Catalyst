package com.lucernex.qa.views.iwms.contract.reports;

import com.google.common.collect.Iterables;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.pages.iwms.contract.reports.ReportsPage;
import com.lucernex.qa.steps.iwms.GenericSteps;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.entity.GenericEntityView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.thoughtworks.selenium.Selenium;
import junit.framework.Assert;
import junit.framework.TestCase;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Logger;

import static com.lucernex.qa.views.iwms.CommonMethods.setFields;
import static junit.framework.Assert.assertTrue;
import static junit.framework.TestCase.fail;
import static org.junit.Assert.assertFalse;

/**
 * Created by rle0239 on 05-05-2015.
 */
public class ReportsView {
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    private static final ReportsPage reportsPage = PageFactory.initElements(
            BrowserDriver.getCurrentDriver(),
            ReportsPage.class
    );
    private static final Logger logger = Logger.getLogger(ReportsView.class.getName());

    public static void verifyReportsGrid(String gridID, List<Field> fields) throws Throwable {
        SeleniumUtil.waitForElementNotPresent("xpath", "//*[contains(text(),'Running')]");
        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("td.tblHeader"));

        Map<Integer, List<String>> cellValues = new HashMap<Integer, List<String>>();
        int rows = gridElement.findElements(By.cssSelector("tr.rowColor1")).size();

        int staleElementCount = 0;
        int rowCount = 0;

        for (WebElement tr : gridElement.findElements(By.cssSelector("tr.rowColor1"))) {
            String cell = "";
            List<String> columnValues = new ArrayList<String>();
            for (WebElement td : tr.findElements(By.cssSelector("td"))) {
                AllContractPagesView.focusWebElement(td);
                SeleniumUtilities.waitForNonStaleWebElement(td);
                do {
                    try {
                        cell = GenericEntityView.convertToFormatPattern(td.getText());
                        break;
                    } catch (StaleElementReferenceException se) {
                        staleElementCount++;
                    }
                } while (!(staleElementCount > 20));
                columnValues.add(cell);
            }
            cellValues.put(rowCount, columnValues);
            rowCount++;
        }

        int foundCount = 0;
        int finalCount = 0;

        if (rows > 0) {
            for (int i = 0; i < cellValues.size(); i++) {
                foundCount = 0;
                for (int j = 0; j < cellValues.get(i).size(); j++) {
                    for (Field f : fields) {
                        if (f.getValue().equals("Today's Date")) {
                            f.setValue(GenericEntityView.convertToFormatPattern(getCurrentDate()));
                        }
                        if (f.getValue().equals("Tomorrow's Date")) {
                            f.setValue(GenericEntityView.convertToFormatPattern(SeleniumUtil.addDaystoCurrentDate(1)));
                        }
                        if (cellValues.get(i).get(j).contains(f.getValue()) &&
                                headers.get(j).getText().contains(f.getName())) {
                            foundCount++;
                        }
                    }
                }

                if (foundCount == fields.size()) {
                    finalCount = foundCount;
                }
            }
        }

        if (!(finalCount == fields.size())) {
            logger.info("Final Expected value is not present under column header");
            fail("Final Expected value is not present under column header");
        }
    }

    public static void activeTab(String tabName) {
        BrowserDriver.waitForElement(reportsPage.activeThirdLevelTab);
        if (!BrowserDriver.getTextFromElement(reportsPage.activeThirdLevelTab).contains(tabName)) {
            BaseView.takeScreenshot("UserIsNotDirectedToCorrectTab.png");
            fail("User is not directed to correct tab " + tabName);
        }
    }

    public static String getCurrentDate() {
        DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
//        dateFormat.setTimeZone(TimeZone.getTimeZone("US/Pacific"));
        Date date = new Date();
        System.out.println(dateFormat.format(date));
        return dateFormat.format(date);
    }

    public static String getCurrentDateAndTime() {
        DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss a");
        dateFormat.setTimeZone(TimeZone.getTimeZone("US/Pacific"));
        Date date = new Date();
        System.out.println(dateFormat.format(date));
        System.out.println(dateFormat.format(date));
        return dateFormat.format(date);
    }

    public static void verifyPaymentVarianceReportsGrid(String gridID, List<Field> fields) throws Throwable {

        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("table.linedTable tr:nth-of-type(2) td.tblHeader"));

        Map<Integer, List<String>> cellValues = new HashMap<Integer, List<String>>();
        int rows = gridElement.findElements(By.cssSelector("tr.rowColor1")).size();

        int staleElementCount = 0;
        int rowCount = 0;

        for (WebElement tr : gridElement.findElements(By.cssSelector("tr.rowColor1"))) {
            String cell = "";
            List<String> columnValues = new ArrayList<String>();
            for (WebElement td : tr.findElements(By.cssSelector("td"))) {
                AllContractPagesView.focusWebElement(td);
                SeleniumUtilities.waitForNonStaleWebElement(td);
                do {
                    try {
                        cell = GenericEntityView.convertToFormatPattern(td.getText());
                        break;
                    } catch (StaleElementReferenceException se) {
                        staleElementCount++;
                    }
                } while (!(staleElementCount > 20));
                columnValues.add(cell);
            }
            cellValues.put(rowCount, columnValues);
            rowCount++;
        }

        int foundCount = 0;
        int finalCount = 0;

        if (rows > 0) {
            for (int i = 0; i < cellValues.size(); i++) {
                foundCount = 0;
                for (int j = 0; j < cellValues.get(i).size(); j++) {
                    for (Field f : fields) {
                        if (f.getValue().equals("Today's Date")) {
                            f.setValue(GenericEntityView.convertToFormatPattern(getCurrentDate()));
                        }
                        if (cellValues.get(i).get(j).contains(f.getValue()) &&
                                headers.get(j).getText().contains(f.getName())) {
                            foundCount++;
                        }
                    }
                }

                if (foundCount == fields.size()) {
                    finalCount = foundCount;
                }
            }
        }

        if (!(finalCount == fields.size())) {
            logger.info("Final Expected value is not present under column header");
            fail("Final Expected value is not present under column header");
        }
    }

    public static void isLinkClickable(String linkText) {
        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            wait.until(ExpectedConditions.elementToBeClickable(BrowserDriver.getCurrentDriver().findElement(By.linkText(linkText))));
        } catch (Exception e) {
            BaseView.takeScreenshot("Link is not clickable.png");
            fail("Error info: link is not clickable " + e.toString());
        }
    }

    public static void closeReportsWindow() {
        try {
            BrowserDriver.getCurrentDriver().switchTo().window(BaseView.mainWindowHandle);
            Set<String> windowHandles = BrowserDriver.getCurrentDriver().getWindowHandles();
            if (CollectionUtils.isNotEmpty(windowHandles)) {
                String mainWindow = Iterables.get(windowHandles, 0, null);
                String secondWindowHandle = Iterables.get(windowHandles, 1, null);

                if (StringUtils.isNotEmpty(secondWindowHandle)) {
                    BrowserDriver.getCurrentDriver().switchTo().window(secondWindowHandle);
                    BrowserDriver.getCurrentDriver().close();
                    BrowserDriver.getCurrentDriver().switchTo().window(mainWindow);
                } else {
                    BrowserDriver.getCurrentDriver().switchTo().window(mainWindow);
                    logger.warning("There is no second browser window found");
                }
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("UnableToCloseWindow.png");
            fail("Error info: Unable to close window" + e.toString());
        }
    }

    public static void expandEntityReport(String entity) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", "//td/a[text()='" + entity + "']//ancestor::tr[1]/td/img[contains(@src,'plus.gif')]", 10, SeleniumUtilities.OBJWAITTIMEOUT);
            if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//td/a[text()='" + entity + "']//ancestor::tr[1]/td/img[contains(@src,'plus.gif')]")).size() > 0) {
                BrowserDriver.getCurrentDriver().findElement(By.xpath("//td/a[text()='" + entity + "']//ancestor::tr[1]/td/img[contains(@src,'plus.gif')]")).click();
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("ExpandTreeError.png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyReportsCLGrid(String gridID, String customListName, List<Field> fields) throws Throwable {

        String strElement = AllContractPagesView.getGridElement(gridID);
        CommonMethods.moveToElementAndFocus(strElement);
        SeleniumUtil.waitForElementVisibilityOf("cssselector", strElement, 5, 2);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        //WebElement customList = gridElement.findElement(By.xpath(""));
        List<WebElement> headers = gridElement.findElements(By.xpath("//a[text()='" + customListName + "']//ancestor::tr[1]//following-sibling::tr[1]//tr[@class='cstListHeader']//td"));

        Map<Integer, List<String>> cellValues = new HashMap<Integer, List<String>>();
        int rows = gridElement.findElements(By.xpath("//a[text()='" + customListName + "']//ancestor::tr[1]//following-sibling::tr[1]//tr[@class='cstListHeader']//following-sibling::tr")).size();

        int staleElementCount = 0;
        int rowCount = 0;
        int rowIndex = 0;

        for (WebElement tr : gridElement.findElements(By.cssSelector("tr.cstListHeader~tr"))) {
            String cell = "";
            if (!(tr.getText().trim().equals(""))) {
                List<String> columnValues = new ArrayList<String>();
                for (WebElement td : tr.findElements(By.cssSelector("td"))) {
                    AllContractPagesView.focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    do {
                        try {
                            cell = GenericEntityView.convertToFormatPattern(td.getText());
                            break;
                        } catch (StaleElementReferenceException se) {
                            staleElementCount++;
                        }
                    } while (!(staleElementCount > 20));
                    columnValues.add(cell);
                }
                cellValues.put(rowIndex, columnValues);
                rowIndex++;
            }
            rowCount++;
        }

        int foundCount = 0;
        int finalCount = 0;

        if (rowIndex > 0) {
            for (int i = 0; i < cellValues.size(); i++) {
                foundCount = 0;
                for (int j = 0; j < cellValues.get(i).size(); j++) {
                    for (Field f : fields) {
                        if (f.getValue().equals("Today's Date")) {
                            f.setValue(GenericEntityView.convertToFormatPattern(getCurrentDate()));
                        }
                        if (cellValues.get(i).get(j).contains(f.getValue()) &&
                                headers.get(j).getText().contains(f.getName())) {
                            foundCount++;
                        }
                    }
                }

                if (foundCount == fields.size()) {
                    finalCount = foundCount;
                }
            }
        }

        if (!(finalCount == fields.size())) {
            logger.info("Final Expected value is not present under column header");
            fail("Final Expected value is not present under column header");
        }
    }

    public static void waitTillPageTitleContainsText(String pageTitle) {
        String errorMessage = "";
        for (int i = 0; i < 10; i++) {
            try {
                WebDriverWait waitModalWindow = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
                waitModalWindow.until(ExpectedConditions.textToBePresentInElement(By.cssSelector(".stepTitle"), pageTitle));
                logger.info("Page title present: " + pageTitle);
                return;
            } catch (Exception e) {
                errorMessage = e.getMessage();
            }
        }
        logger.info("Page title not present: " + pageTitle);
        BaseView.takeScreenshot("Page title not present: " + pageTitle + ".png");
        fail(errorMessage);
    }

    public static void doubleClickWebElement(WebElement strElement) {
        try {
            AllContractPagesView.focusWebElement(strElement);
            Actions dbclick = new Actions(BrowserDriver.getCurrentDriver());
            dbclick.doubleClick(strElement).build().perform();
        } catch (Exception ex) {
            BaseView.takeScreenshot("dblClickButton.png");
        }
    }

  /*  public static void dragAndDropReportFields(List<String> field) throws Throwable {
        for (String f : field) {
            ReportsView.doubleClickWebElement(BrowserDriver.findElementWithTimeout(By.xpath("//span[text()='" + f + "']"), 10));
        }
    }*/

    public static void dragAndDropReportFields(List<String> field) throws Throwable {
        for (String f : field) {
            try {
                BaseView.pushVeryShortTimeout();
                if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + f + "']")).size() > 0) {
                    ReportsView.doubleClickWebElement(BrowserDriver.findElementWithTimeout(By.xpath("//span[text()='" + f + "']"), 10));
                } else if (reachElementDown(f)) {
                    ReportsView.doubleClickWebElement(BrowserDriver.findElementWithTimeout(By.xpath("//span[text()='" + f + "']"), 10));
                } else if (reachElementUp(f)) {
                    ReportsView.doubleClickWebElement(BrowserDriver.findElementWithTimeout(By.xpath("//span[text()='" + f + "']"), 10));
                }
            } catch (Exception e) {

            } finally {
                BaseView.popDefaultTimeout();
            }
        }
    }

    public static boolean reachElementDown(String element) {
        boolean exist = false;
        try {
            BaseView.pushVeryShortTimeout();
            Actions action = new Actions(BrowserDriver.getCurrentDriver());
            for (int i = 0; i < 200; i++) {
                try {
                    action.sendKeys(Keys.ARROW_DOWN).build().perform();
                    if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + element + "']")).size() > 0) {
                        exist = true;
                        break;
                    }
                } catch (Exception e) {
                }
            }
        } catch (Exception e) {
        } finally {
            BaseView.popDefaultTimeout();
        }
        return exist;
    }

    public static boolean reachElementUp(String element) {
        boolean exist = false;
        try {
            BaseView.pushVeryShortTimeout();
            Actions action = new Actions(BrowserDriver.getCurrentDriver());
            for (int i = 0; i < 100; i++) {
                try {
                    action.sendKeys(Keys.ARROW_UP).build().perform();
                    if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + element + "']")).size() > 0) {
                        exist = true;
                        break;
                    }
                } catch (Exception e) {
                }
            }
        } catch (Exception e) {
        } finally {
            BaseView.popDefaultTimeout();
        }
        return exist;
    }

    public static void buildReportLayout(List<String> clFields) throws Throwable {
        int i = 0;
        for (String s : clFields) {
            try {
                SeleniumUtil.select("cssSelector", "select[name^='selectBoxHeader']", s, SeleniumUtilities.OBJWAITTIMEOUT);
                List<WebElement> headers = BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".tblHeader"));

                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
                String fieldName[] = s.split("\\(");
                wait.until(ExpectedConditions
                        .textToBePresentInElement(headers.get(i), fieldName[0].trim()));
            } catch (Exception e) {
                BaseView.takeScreenshot("FailedToSelect.png");
                org.junit.Assert.fail("Failed to select " + e.getMessage());
            }
            i++;
        }
    }

    public void checkRadioByLabelNameWithinBrTAG(String name, String value) throws Throwable {
        List<WebElement> radios = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("*[name*='" + name + "']"));
        WebElement labelElement = BrowserDriver.getParent(BrowserDriver.getCurrentDriver().findElement(By.cssSelector("*[name*='" + name + "']")));
        String labels = labelElement.getText();
        String splitLabels[] = labels.split("\n");
            /*for (String s;WebElement radio;) {
                s.contains(value);

            }*/
    }

    public static boolean reachElementDownContainsText(String element) {
        boolean exist = false;
        try {
            BaseView.pushVeryShortTimeout();
            Actions action = new Actions(BrowserDriver.getCurrentDriver());
            for (int i = 0; i < 200; i++) {
                try {
                    action.sendKeys(Keys.ARROW_DOWN).build().perform();
                    if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[contains(text(),'" + element + "')]")).size() > 0) {
                        exist = true;
                        break;
                    }
                } catch (Exception e) {
                }
            }
        } catch (Exception e) {
        } finally {
            BaseView.popDefaultTimeout();
        }
        return exist;
    }


    public static void doubleClickOnFields(List<String> field) throws Throwable {
        for (String f : field) {
            try {
                BaseView.pushVeryShortTimeout();
                if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + f + "']")).size() > 0) {
                    ReportsView.doubleClickWebElement(BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + f + "']")).get(BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + f + "']")).size() - 1));
                } else if (reachElementDown(f)) {
                    ReportsView.doubleClickWebElement(BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + f + "']")).get(BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + f + "']")).size() - 1));
                } else if (reachElementUp(f)) {
                    ReportsView.doubleClickWebElement(BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + f + "']")).get(BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + f + "']")).size() - 1));
                }
            } catch (Exception e) {

            } finally {
                BaseView.popDefaultTimeout();
            }
        }
    }

    public static void verifyFieldValuesOnReport(String strEntity, String strFristValues, String strSecondValues, String strSum, String strProduct, String strDivision) throws Throwable {
        try {
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[./text()='" + strEntity + "']/parent::td/following-sibling::td[1]", strFristValues.trim(), SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[./text()='" + strEntity + "']/parent::td/following-sibling::td[2]", strSecondValues.trim(), SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[./text()='" + strEntity + "']/parent::td/following-sibling::td[3]", strSum.trim(), SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[./text()='" + strEntity + "']/parent::td/following-sibling::td[4]", strProduct.trim(), SeleniumUtilities.OBJWAITTIMEOUT));
            TestCase.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[./text()='" + strEntity + "']/parent::td/following-sibling::td[5]", strDivision.trim(), SeleniumUtilities.OBJWAITTIMEOUT));

        } catch (Exception e) {
            BaseView.takeScreenshot("verifyFieldValuesOnReport");
            fail(e.getMessage());
        }
    }


    public static void clickOnEditButton(String strStep) throws Throwable {
        try {
            SeleniumUtil.click("xpath", ".//*[contains(./text(),'" + strStep + "')]/following-sibling::a", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("clickOnEditButton");
            fail(e.getMessage());
        }
    }

    public static void selectCriteriaConditions(String strValue) throws Throwable {
        try {
            SeleniumUtil.select("cssselector", "select[name^='crtOpt1ProgramID_']", strValue, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("selectCriteriaConditions");
            fail(e.getMessage());
        }
    }

    public static void clickOnSaveAndRunReportButton(String strSaveButton) throws Throwable {
        try {
            SeleniumUtil.click("cssselector", "input[value='" + strSaveButton + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("clickOnSaveAndRunReportButton");
            fail(e.getMessage());
        }
    }


    public static void waitForTextReportHeader(String reportName) throws Throwable {
        try {
            SeleniumUtil.waitForElementContainText(SeleniumUtil.getClickableWebElementObject("cssselector", ".ReportHeader"), reportName);
        } catch (Exception e) {
            BaseView.takeScreenshot("clickOnSaveAndRunReportButton");
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            fail(e.getMessage());
        }
    }

    public static void portfolio(String portfolioOption) throws Throwable {
        try {
            SeleniumUtil.select("cssselector", "select[name^='crtOpt1ProgramID']", portfolioOption, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
        } catch (Exception e) {
            BaseView.takeScreenshot("portfolio");
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            fail(e.getMessage());
        }
    }

    public static void availablefields(String strAvailablefield) throws Throwable {
        try {
            SeleniumUtil.select("cssselector", "select[name^='ProjectEntity_ProgramID']", strAvailablefield, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
        } catch (Exception e) {
            BaseView.takeScreenshot("availablefields");
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            fail(e.getMessage());
        }
    }

    public static void editStep(String step) throws Throwable {
        try {
            SeleniumUtil.click(SeleniumUtil.getClickableWebElementObject("xpath", "//td/font[contains(text(),'" + step + "')]/following-sibling::a[contains(text(),'edit')]"), 1);
        } catch (Exception e) {
            BaseView.takeScreenshot("unable to click edit link for the step " + step);
            BaseView.switchToSecondWindowToClose();
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            fail(e.getMessage());
        }
    }

    public static void verifyImageAttachedToEntity(String entityName, boolean exist) throws Throwable {
        try {
            if (exist) {
                assertTrue(SeleniumUtil.isElementExist("xpath", "//td/a[text()='" + entityName + "']/parent::td//following-sibling::td//img"));
            } else {
                assertFalse(SeleniumUtil.isElementExist("xpath", "//td/a[text()='" + entityName + "']/parent::td//following-sibling::td//img"));
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("Image is not attached " + entityName);
            BaseView.switchToSecondWindowToClose();
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            fail(e.getMessage());
        }
    }

    public static void extractRecID(String strName, String strMaintenanceCategory) throws Throwable {
        try {
            Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[1]", strMaintenanceCategory, SeleniumUtilities.OBJWAITTIMEOUT));
            String[] arrLxRecID = SeleniumUtil.getTextValue("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[2]", SeleniumUtilities.OBJWAITTIMEOUT).split("\n");
            GenericSteps.lxRecID = arrLxRecID[1];

        } catch (Exception e) {
            BaseView.takeScreenshot("extractAssetRecID");
            BaseView.switchToSecondWindowToClose();
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            TestCase.fail(e.getMessage());
        }
    }

    public static void extractTenantRecIDnSpaceRecID(String strName, String strSpaceName) throws Throwable {
        try {
            String[] arrLxRecID = SeleniumUtil.getTextValue("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[1]", SeleniumUtilities.OBJWAITTIMEOUT).split("\n");
            GenericSteps.lxRecID = arrLxRecID[0];//SeleniumUtil.getTextValue("xpath",".//a[@title='"+strName+"']/parent::td/following-sibling::td[1]",SeleniumUtilities.OBJWAITTIMEOUT);
            Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[2]", strSpaceName, SeleniumUtilities.OBJWAITTIMEOUT));
            String[] arrTenantRecID = SeleniumUtil.getTextValue("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[3]", SeleniumUtilities.OBJWAITTIMEOUT).split("\n");
            GenericSteps.TenantRecID = arrTenantRecID[0]; //SeleniumUtil.getTextValue("xpath",".//a[@title='"+strName+"']/parent::td/following-sibling::td[3]",SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("extractTenantRecIDnSpaceRecID");
            BaseView.switchToSecondWindowToClose();
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            TestCase.fail(e.getMessage());
        }
    }


    public static void extractSalesExclusionRecIDnSpaceRecID(String strName, String strSalesGroup, String strSalesType) throws Throwable {
        try {
            String[] arrLxRecID = SeleniumUtil.getTextValue("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[3]", SeleniumUtilities.OBJWAITTIMEOUT).split("\n");
            GenericSteps.lxRecID = arrLxRecID[0];
            Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[1]", strSalesGroup, SeleniumUtilities.OBJWAITTIMEOUT));
            Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[2]", strSalesType, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("extractSalesExclusionRecIDnSpaceRecID");
            BaseView.switchToSecondWindowToClose();
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            TestCase.fail(e.getMessage());
        }
    }

    public static void extractSalesRecIDs(String strSaleGroup) throws Throwable {
        try {
            if (strSaleGroup.equalsIgnoreCase("Internal Sales")) {
                GenericSteps.lxSalesRecID1 = SeleniumUtil.getTextValue("id", "Sales_SalesID_span", SeleniumUtilities.OBJWAITTIMEOUT);
            } else {
                GenericSteps.lxSalesRecID2 = SeleniumUtil.getTextValue("id", "Sales_SalesID_span", SeleniumUtilities.OBJWAITTIMEOUT);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("extractSalesRecIDs");
            BaseView.switchToSecondWindowToClose();
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            TestCase.fail(e.getMessage());
        }
    }

    public static void extractRecID(String strDescription) throws Throwable {
        try {
            GenericSteps.lxRecID = SeleniumUtil.getTextValue("id", strDescription, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("extractAmendmentRecID");
            BaseView.switchToSecondWindowToClose();
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            TestCase.fail(e.getMessage());
        }
    }

    public static void extractResponsibilitiesRecID(String strName, String strMaintenanceCategory) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[1]", 20, SeleniumUtilities.OBJWAITTIMEOUT);
            Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[1]", strMaintenanceCategory, SeleniumUtilities.OBJWAITTIMEOUT));
            String[] arrLxRecID = SeleniumUtil.getTextValue("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[2]", SeleniumUtilities.OBJWAITTIMEOUT).split("\n");
            GenericSteps.lxRecID = arrLxRecID[1];

        } catch (Exception e) {
            BaseView.takeScreenshot("extractResponsibilitiesRecID");
            BaseView.switchToSecondWindowToClose();
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            TestCase.fail(e.getMessage());
        }
    }

    public static void extractPercentageRentBreakpointRecID(String strName) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[1]", 20, SeleniumUtilities.OBJWAITTIMEOUT);
            String[] arrLxRecID = SeleniumUtil.getTextValue("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[1]", SeleniumUtilities.OBJWAITTIMEOUT).split("\n");
            GenericSteps.lxRecID = arrLxRecID[0];

        } catch (Exception e) {
            BaseView.takeScreenshot("extractPercentageRentBreakpointRecID");
            BaseView.switchToSecondWindowToClose();
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            TestCase.fail(e.getMessage());
        }
    }

    public static void extractsCovenantRecID(String strName, String strCovenantCategory) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[1]", 20, SeleniumUtilities.OBJWAITTIMEOUT);
            Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[1]", strCovenantCategory, SeleniumUtilities.OBJWAITTIMEOUT));
            String[] arrLxRecID = SeleniumUtil.getTextValue("xpath", ".//a[@title='" + strName + "']/parent::td/following-sibling::td[2]", SeleniumUtilities.OBJWAITTIMEOUT).split("\n");
            GenericSteps.lxRecID = arrLxRecID[1];

        } catch (Exception e) {
            BaseView.takeScreenshot("extractsCovenantRecID");
            BaseView.switchToSecondWindowToClose();
            SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
            TestCase.fail(e.getMessage());
        }
    }

    public static void waitForEditableReportFields(String editable, List<String> editableFields) throws Throwable {
        if (editable.equals("editable")) {
            boolean flag = false;
            for (String editableField : editableFields) {
                try {
                    if (editable.contains("[Today's Date]")) {
                        editable = SeleniumUtil.addDaystoCurrentDate(0);
                    }
                    for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("td span[class='editableText']"))) {
                        if (AllContractPagesView
                                .getTextAndByPassException(ele).contains(editableField)) {
                            logger.info(editableField + " is editable");
                            flag = true;
                        }
                    }

                } catch (Exception e) {
                    BaseView.takeScreenshot("extractsCovenantRecID");
                    BaseView.switchToSecondWindowToClose();
                    SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
                    TestCase.fail(e.getMessage());
                }
                if (!flag) {
                    BaseView.takeScreenshot("extractsCovenantRecID");
                    BaseView.switchToSecondWindowToClose();
                    SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
                    fail(editableField + " is non editable");
                }
            }
        } else if (editable.equals("non-editable")) {
            boolean flag = false;
            for (String editableField : editableFields) {
                try {
                    if (editable.contains("[Today's Date]")) {
                        editable = SeleniumUtil.addDaystoCurrentDate(0);
                    }
                    for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("td span[class='editableText']"))) {
                        if (!AllContractPagesView
                                .getTextAndByPassException(ele).contains(editableField)) {
                            logger.info(editableField + " is non editable");
                            flag = true;
                        }
                    }

                } catch (Exception e) {
                    BaseView.takeScreenshot("extractsCovenantRecID");
                    BaseView.switchToSecondWindowToClose();
                    SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
                    TestCase.fail(e.getMessage());
                }
                if (!flag) {
                    BaseView.takeScreenshot("extractsCovenantRecID");
                    BaseView.switchToSecondWindowToClose();
                    SeleniumUtil.getWebDriver().switchTo().window(BaseView.mainWindowHandle);
                    fail(editableField + " is editable");
                }
            }
        }
    }

	public static void editReportField(String strFieldValue, String strFieldName, String strEntityName) throws Throwable {
        try {

            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//*[./text()='"+strEntityName+"']/parent::td/following-sibling::td/*[./text()='"+strFieldValue+"']", 20, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.moveToElement("xpath", ".//*[./text()='" + strEntityName + "']/parent::td/following-sibling::td/*[./text()='" + strFieldValue + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//*[./text()='"+strEntityName+"']/parent::td/following-sibling::td/*[./text()='"+strFieldValue+"']", SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception e) {
            BaseView.takeScreenshot("editReportField");
            TestCase.fail(e.getMessage());
        }
    }


    public static void editReportPrecedingField(String strFieldValue, String strFieldName, String strEntityName) throws Throwable {
        try {

            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//*[./text()='"+strEntityName+"']/parent::td/preceding-sibling::td/*[./text()='"+strFieldValue+"']", 20, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.moveToElement("xpath", ".//*[./text()='" + strEntityName + "']/parent::td/preceding-sibling::td/*[./text()='" + strFieldValue + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//*[./text()='"+strEntityName+"']/parent::td/preceding-sibling::td/*[./text()='"+strFieldValue+"']", SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception e) {
            BaseView.takeScreenshot("editReportPrecedingField");
            TestCase.fail(e.getMessage());
        }
    }

    public static void editReportCustomListFields(String strEntityName) throws Throwable {
        try {

            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//*[./text()='"+strEntityName+"']/following-sibling::td", 20, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.moveToElement("xpath", ".//*[./text()='"+strEntityName+"']/following-sibling::td", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//*[./text()='"+strEntityName+"']/following-sibling::td", SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception e) {
            BaseView.takeScreenshot("editReportCustomListFields");
            TestCase.fail(e.getMessage());
        }
    }

    public static void clickOnGreenMark() throws Throwable {
        try {
            SeleniumUtil.moveToElement ("xpath", ".//span[@style='background-image:url(/RolloutManager/img/approve.png);']/ancestor::a", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//span[@style='background-image:url(/RolloutManager/img/approve.png);']/ancestor::a", 10, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.moveToElement("xpath", ".//span[@style='background-image:url(/RolloutManager/img/approve.png);']/ancestor::a", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//span[@style='background-image:url(/RolloutManager/img/approve.png);']/ancestor::a", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("clickOnGreenMark");
            TestCase.fail(e.getMessage());
        }
    }

    public static void clickOnRedMark() throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//span[@style='background-image:url(/RolloutManager/img/deny.png);']/ancestor::a", 10, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//span[@style='background-image:url(/RolloutManager/img/deny.png);']/ancestor::a", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("clickOnRedMark");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyTotal(String strTotal) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("id", "math_Total_0", 10, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("id", "math_Total_0", strTotal, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyTotal");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyFieldValuesOnReport(String strFileCreatedDate, String strVersion, String strName) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//*[./text()='"+strName+"']/parent::td/following-sibling::td[4]", 10, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strName + "']/parent::td/following-sibling::td[4]", 10, SeleniumUtilities.OBJWAITTIMEOUT);
            if(strFileCreatedDate.contains("[Today's Date]")) {
                strFileCreatedDate = SeleniumUtil.addDaystoCurrentDate(0);
            }
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strName + "']/parent::td/following-sibling::td[4]", strFileCreatedDate, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strName + "']/parent::td/following-sibling::td[5]", strVersion, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyFieldValuesOnReport");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyFieldValuesOnReport(String strFileCreatedDate,String strName) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//*[./text()='"+strName+"']/parent::td/following-sibling::td[3]", 10, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='"+strName+"']/parent::td/following-sibling::td[3]", 10, SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strName + "']/parent::td/following-sibling::td[3]", strFileCreatedDate, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyFieldValuesOnReport");
            TestCase.fail(e.getMessage());
        }
    }
}