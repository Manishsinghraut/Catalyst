package com.lucernex.qa.views.iwms.contract;

import com.google.common.collect.Lists;
import com.google.common.math.IntMath;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.*;
import com.lucernex.qa.pages.iwms.contract.AllContractPagesPage;
import com.lucernex.qa.steps.iwms.GenericSteps;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.components.ActionsView;
import com.lucernex.qa.views.entity.GenericEntityView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.reports.ReportsView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import static junit.framework.Assert.assertNotNull;
import static junit.framework.TestCase.fail;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

/**
 * Created by rle0239 on 05-05-2015.
 */
public class AllContractPagesView {

    private static final AllContractPagesPage allContractPages = PageFactory.initElements(BrowserDriver.getCurrentDriver(), AllContractPagesPage.class);
    private static final Logger logger = Logger.getLogger(AllContractPagesView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    public static WebElement allContractPagesFrame;
    public static String batchNum;

    public static void switchToFrame() throws Throwable {
        logger.info("Switching to default frame....");
        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
        boolean isFrameVisible = false;
        logger.info("Started finding visible frame....");
        for (WebElement frame : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("iframe[id^=ext-element-]"))) {
            //System.out.println(frame.getAttribute("src"));
            if (frame.isDisplayed()) {
                allContractPagesFrame = frame;
                isFrameVisible = true;
                logger.info("Visible frame found, exiting loop");
                break;
            }
        }
        if (!isFrameVisible) {
            fail("No frames are visible hence not switching to frame");
        }
        //Waits till the "Loading.." text disappears
        BrowserDriver.getCurrentDriver().switchTo().frame(allContractPagesFrame);
        logger.info("Switched to Third level Tab continuing....");
        waitTillDivisionLoads();
    }

    public static void iAmAtTermsTab(String title) throws Throwable {
        try {
            switchToFrame();
            CommonMethods.waitTillDivisionLoads();
            assertEquals("Expected page title: " + title + " but getting " + allContractPages.title.getText(), allContractPages.title.getText(), title);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Expected page title.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void verifyPageTitle(String title) throws Throwable {
        try {
            CommonMethods.waitTillDivisionLoads();
            assertTrue("Expected page title: " + title + " but getting " + allContractPages.panelHeader.getText(), allContractPages.panelHeader.getText().contains(title));
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Expected page title.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        }
    }


    public static void clickButtonInMessageBox(String buttonText, Boolean boolFrame) throws Throwable {
        boolean found = false;
        try {
            if (!boolFrame)
                CommonMethods.switchToVisibleFrame();

            for (WebElement btn : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id^='messagebox'] span[data-ref='btnInnerEl']"))) {
                if (btn.getText().trim().equalsIgnoreCase(buttonText.trim())) {
                    btn.click();
                    //delay(2000);
                    found = true;
                    break;
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("clickButtonInMessageBox.png");
            logger.info("Error :" + Ex.getMessage());
            //Assert.fail("Error :" + Ex.getMessage());
        } finally {
            if (!found) {
                BaseView.takeScreenshot("clickButtonInMessageBox.png");
                //Assert.fail("Error info: unable to click " + buttonText + " button in message box");
            }
            logger.info("Clicked button " + buttonText);
        }
    }

    public static void clickButtonInMessageBox(String buttonText,String msgBoxTitle) throws Throwable {
        boolean found = false;
        try {
            assertNotNull("Message Box is not present " + msgBoxTitle, getMessageBox(msgBoxTitle));
            for (WebElement btn : getMessageBox(msgBoxTitle).findElements(By.cssSelector("span[data-ref='btnInnerEl']"))) {
                if (AllContractPagesView.getTextAndByPassException(btn).trim().equalsIgnoreCase(buttonText.trim())) {
                    btn.click();
                    found = true;
                    break;
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("clickButtonInMessageBox.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        } finally {
            if (!found) {
                BaseView.takeScreenshot("clickButtonInMessageBox.png");
                Assert.fail("Error info: unable to click " + buttonText + " button in message box");
            }
            logger.info("Clicked button " + buttonText);
        }
    }

    public static WebElement getMessageBox(String msgBoxTitle) throws Throwable {
        try {
            for (WebElement msgBox : BrowserDriver.getCurrentDriver()
                    .findElements(By.cssSelector("div[id^='messagebox']"))) {
                if (msgBox.findElement(By.cssSelector(" .x-window-body .x-window-text")).isDisplayed()) {
                    if (AllContractPagesView.getTextAndByPassException(
                            msgBox.findElement(By.cssSelector(" .x-window-body .x-window-text"))).contains(msgBoxTitle)) {
                        return msgBox;
                    }
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("clickButtonInMessageBox.png");
            logger.info("Unable to fetch message box" + Ex.getMessage());
        }
        return null;
    }

    public static void successMessage(String buttonText) throws Throwable {
        try {
            switchToFrame();
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            wait.until(ExpectedConditions.textToBePresentInElement(allContractPages.successMsg, buttonText));
            //assertEquals("Expected Success Message is not displayed", buttonText, termsPage.successMsg.getText());
            logger.info("Expected Success Message is displayed " + buttonText);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("successMessage.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void generateRentMessage(String generateRentMessage) throws Throwable {
        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 60);
            wait.until(ExpectedConditions.textToBePresentInElement(allContractPages.generateRentMsg, generateRentMessage));
            logger.info("Expected Success Message is displayed " + generateRentMessage);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("successMessage.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void errorMessage(String errorText) throws Throwable {
        try {
            switchToFrame();
            waitTillDivisionLoads();
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), SeleniumUtilities.OBJWAITTIMEOUT);
            wait.until(ExpectedConditions.textToBePresentInElement(allContractPages.errorMsg, errorText));
            //assertEquals("Expected Success Message is not displayed", buttonText, termsPage.successMsg.getText());
            logger.info("Expected Error Message is displayed " + errorText);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("successMessage.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void closeErrorMessage() throws Throwable {
        try {
            switchToFrame();
            waitTillDivisionLoads();
            allContractPages.msgCloser.click();
            logger.info("Closed error message successfully");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("successMessage.png");
            logger.info("Error in closing error message:" + Ex.getMessage());
            Assert.fail("Error in closing error message :" + Ex.getMessage());
        }
    }

    public static void verifyGridRow(String gridID, String uniqueValue, List<Field> fields) throws Throwable {
        switchToFrame();
        boolean found = false;
        WebElement fixRow = null;
        WebElement gridElement = null;
        int maxTries = 0;

        String strElement = getGridElement(gridID);//"div[id='" + gridID + "']";

     /*   try {
            SeleniumUtil.moveToElement("cssSelector", "div[id='" + gridID + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']")).sendKeys("");
        } catch (Exception e) {

        }*/
        moveToElementAndFocus(strElement);
        gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        //Fix the row in grid
        for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                //if (td.getText().contains(uniqueValue)) {
                if (td.getText().equalsIgnoreCase(uniqueValue.trim())) {
                    fixRow = BrowserDriver.getParent(td);
                    found = true;
                    break;
                }
            }
            if (found) {
                break;
            }
        }
        //Traverse cells value now
        int headerCount = 0;
        String strValue = "";
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
        List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
        for (Field f : fields) {
            assertEquals(headers.size(),
                    fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
            logger.info("Row cells are same as header cells");

            if (f.getValue().contains("[CURRENT DATE]")) {
                strValue = f.getValue().replace("[CURRENT DATE]", SeleniumUtil.addDaystoCurrentDate(0));
            } else if (f.getValue().contains("[CURRENT END DATE]")) {
                strValue = f.getValue().replace("[CURRENT END DATE]", SeleniumUtil.addDaystoCurrentDate(-1));
            } else
                strValue = f.getValue();

            assertTrue("Expected cell value " + strValue + "is not present under Column header " + f.getName(), cells.get(headerCount).getText().replace(",", "").contains(strValue.replace(",", "")));
            assertTrue("Expected cell value " + strValue + "is not present under Column header" + f.getName(), headers.get(headerCount).getText().contains(f.getName()));
            logger.info("Cell value " + strValue + "is present under Column header" + f.getName());
            headerCount++;
        }

    }

    public static WebElement findGrid(String strElement) {
        for (int i = 0; i < 10; i++) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(strElement)));
                return BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
            } catch (Exception e) {
                logger.info("Unable to find element attempt " + i + "....");
            }
        }
        BaseView.takeScreenshot("Unable to find element after maximum attempts also.png");
        fail("Unable to find element after maximum attempts also");
        return BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
    }

    public static void verifyGridRow(String gridID, List<Field> fields) throws Throwable {
        //switchToFrame();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        boolean found = false;
        WebElement fixRow = null;
        WebElement gridElement = null;

        String strElement = getGridElement(gridID);
        //gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        gridElement = findGrid(strElement);
        //Fix the row in grid
        for (Field f : fields) {
            for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    AllContractPagesView.focusWebElement(td);
                    if (td.getText().equalsIgnoreCase(f.getValue().trim())) {
                        fixRow = BrowserDriver.getParent(td);
                        found = true;
                        break;
                    }
                }
                if (found) break;
            }
            if (found) break;
        }

        //Traverse cells value now
        int headerCount = 0;
        int matchRecord = 0;
        int rowCount = 0;
        String strValue = "";
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
        List<WebElement> cols = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
        for (Field f : fields) {

            assertEquals(headers.size(),
                    fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
            logger.info("Row cells are same as header cells");

            if (f.getValue().contains("[CURRENT DATE]")) {
                strValue = f.getValue().replace("[CURRENT DATE]", SeleniumUtil.addDaystoCurrentDate(0));
            } else if (f.getValue().contains("[CURRENT END DATE]")) {
                strValue = f.getValue().replace("[CURRENT END DATE]", SeleniumUtil.addDaystoCurrentDate(-1));
            } else
                strValue = f.getValue();

            headerCount = 0;
            for (WebElement cell : cols) {
               /*  try{
                    SeleniumUtil.moveToElement(headers.get(headerCount), 1);
                    cell.sendKeys();
                }catch(Exception e){
                }*/

//                delay(1000);
                /*if((cell.getText().replace(",", "").contains(strValue.replace(",", ""))) && (headers.get(headerCount).getText().contains(f.getName()))){
                    matchRecord++;
                    break;
                }*/
                if ((AllContractPagesView.getFocusedWebElement(cell).getText().replace(",", "").contains(strValue.replace(",", ""))) && (AllContractPagesView.getFocusedWebElement(headers.get(headerCount)).getText().contains(f.getName()))) {
                    matchRecord++;
                    break;
                }
                headerCount++;
            }

            logger.info("Cell value " + strValue + "is present under Column header" + f.getName());
            rowCount++;
        }
        if (matchRecord != rowCount) fail("Grid values are not matching !!!" + fixRow.getText());
    }

    public static void clickGridRow(String gridID, String uniqueValue) throws Throwable {
        switchToFrame();
        boolean found = false;
        WebElement fixRow = null;
        String strElement = "div[id='" + gridID + "']";
       /* try {
            SeleniumUtil.moveToElement("cssSelector", "div[id='" + gridID + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']")).sendKeys("");
        } catch (Exception e) {

        }*/
        moveToElementAndFocus(strElement);
        WebElement gridElement;
        try {
            gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        } catch (Exception Ex) {
            BrowserDriver.getCurrentDriver().switchTo().defaultContent();
            gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        }
        //Fix the row in grid
        for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                if (td.getText().contains(uniqueValue)) {
                    td.click();
                    found = true;
                    break;
                }
            }
            if (found) {
                break;
            }
        }
    }

    public static void selectGridRowcheckbox(String gridID, String uniqueValue) throws Throwable {
        switchToFrame();
        boolean found = false;
        WebElement fixRow = null;
        String strElement = "div[id='" + gridID + "']";
        moveToElementAndFocus(strElement);
        WebElement gridElement;
        try {
            gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        } catch (Exception Ex) {
            BrowserDriver.getCurrentDriver().switchTo().defaultContent();
            gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        }
        //Fix the row in grid
        for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                if (td.getText().contains(uniqueValue)) {
                    WebElement checkbox = tr.findElement(By.cssSelector("div[class='x-grid-row-checker']"));//click();
                    checkbox.click();
                    found = true;
                    break;
                }
            }
            if (found) {
                break;
            }
        }
    }

    public static void clickUniqueGridRow(String gridID, String cellValue, String header) throws Throwable {
        switchToFrame();
        boolean found = false;
        WebElement fixRow = null;
        WebElement fixCol = null;
        int colIndex = 0;
        String strElement = "div[id='" + gridID + "']";
       /* try {
            SeleniumUtil.moveToElement("cssSelector", "div[id='" + gridID + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']")).sendKeys("");
        } catch (Exception e) {

        }*/
        moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        //Fix the row in grid
        for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
            colIndex = 0;
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                colIndex++;
                if (td.getText().trim().contains(cellValue.trim())) {
                    fixRow = BrowserDriver.getParent(td);
                    fixCol = td;

                    try {
                        //Traverse cells value now
                        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                        List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
                        assertEquals(headers.size(),
                                fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
                        assertTrue("Expected cell value " + cellValue + "is not present under Column header " + header, cells.get(colIndex - 1).getText().contains(cellValue));
                        assertTrue("Expected cell value " + cellValue + "is not present under Column header" + header, headers.get(colIndex - 1).getText().contains(header));
                        logger.info("Cell value " + cellValue + "is present under Column header" + header);
                        //Focus row
                        try {
                            fixCol.sendKeys("");
                        } catch (Exception e) {

                        }
                        fixCol.click();
                        found = true;
                        break;
                    } catch (AssertionError e) {

                    }
                }
            }
            if (found) {
                break;
            }
        }

        if (!found) {
            fail("Final Expected " + cellValue + " is not present under column header " + header);
        }
    }

    public static void verifyGridRowNotPresent(String gridID, String uniqueValue) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        switchToFrame();
        CommonMethods.waitTillDivisionLoads();
        WebElement fixRow = null;
        String strElement = "div[id='" + gridID + "']";
      /*  try {
            SeleniumUtil.moveToElement("cssSelector", "div[id='" + gridID + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']")).sendKeys("");
        } catch (Exception e) {

        }*/
        moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        //Fix the row in grid
        SeleniumUtil.waitUntilElementNotContainsText(gridElement,uniqueValue,20,SeleniumUtilities.OBJWAITTIMEOUT);
        for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                if (td.getText().contains(uniqueValue)) {
                    fail("Expected row present in the grid");
                }
            }
        }
        logger.info("Expected row not present in the grid");
    }

    public static void verifyGridWithoutSwitchToFrameRowNotPresent(String gridID, String uniqueValue) throws Throwable {
        WebElement fixRow = null;
        String strElement = "div[id='" + gridID + "']";
      /*  try {
            SeleniumUtil.moveToElement("cssSelector", "div[id='" + gridID + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']")).sendKeys("");
        } catch (Exception e) {

        }*/
        moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        //Fix the row in grid
        for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                if (td.getText().contains(uniqueValue)) {
                    fail("Expected row present in the grid");
                }
            }
        }
        logger.info("Expected row not present in the grid");
    }

    public static void waitTillDivisionLoads() throws Throwable {
        CommonMethods.waitTillDivisionLoads();
    }

   /* public static void waitTillDivisionLoads() throws Throwable {

        //Loading starts sometime after some delay
        delay(1000);
        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
        for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id*='loadmask'][id*='msgText']"))) {
            try {
                wait.until(ExpectedConditions.invisibilityOfElementWithText(By.cssSelector("div[id*='loadmask'][id*='msgText']"), "Loading..."));
                //ele.isDisplayed();
            } catch (Exception e) {
                delay(5000);
            }
        }
        //Checks for no single "Loading..." element in a page at last
        try{
            wait.until(ExpectedConditions.invisibilityOfElementWithText(By.cssSelector("div[id*='loadmask'][id*='msgText']"), "Loading..."));
        }catch(Exception e) {
        }
        delay(2000);
    }*/

    public static void checkExpenseSetup(String expenseSetup) throws Throwable {
        try {
            //delay(10000);
            SeleniumUtil.click("xpath", "//td//div[contains(text(),'" + expenseSetup + "')]/parent::td/preceding-sibling::td[1]//div/div", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("checkExpenseSetup.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void checkContracts(String expenseSetup) throws Throwable {
        try {
            //delay(10000);
            SeleniumUtil.click("xpath", "//td//div/a[contains(text(),'" + expenseSetup + "')]/parent::div/parent::td/preceding-sibling::td[1]//div/div", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("checkExpenseSetup.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        }
    }


    public static void enterRentableAreaInContractDetailsPage(String rentableArea) throws Throwable {
        try {
            switchToFrame();
            BrowserDriver.getCurrentDriver().findElement(By.name("Contract_RentableArea")).sendKeys(rentableArea);
            BrowserDriver.getCurrentDriver().findElement(By.id("RentableArea_label")).click();

        } catch (Exception Ex) {
            BaseView.takeScreenshot("enterRentableAreaInContractDetailsPage.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void clearRentableAreaInContractDetailsPage() throws Throwable {
        try {
            switchToFrame();
            BrowserDriver.getCurrentDriver().findElement(By.name("Contract_RentableArea")).clear();
        } catch (Exception Ex) {
            BaseView.takeScreenshot("ClearRentableAreaInContractDetailsPage.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void hitEnterKey(String value) throws Throwable {
        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), SeleniumUtilities.OBJWAITTIMEOUT);
            wait.until(ExpectedConditions.textToBePresentInElementValue(allContractPages.searchTextField, value));
            SeleniumUtil.enter("name", "searchText", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("hitEnterKeyError.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void hitEnterKey() throws Throwable {
        try {
            SeleniumUtil.enter("name", "searchText", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("hitEnterKeyError.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void enterSearchText(String searchText) throws Throwable {
        try {
            allContractPages.searchTextField.sendKeys(searchText);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("enterSearchTextError.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void getTableHeader(String tblHeader) throws Throwable {
        boolean found = false;
        try {
            switchToFrame();

            for (WebElement tblHeaders : BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".tblHeader"))) {
                if (tblHeaders.getText().trim().equalsIgnoreCase(tblHeader.trim())) {
                    found = true;
                    break;
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot(tblHeader + "GetTableHeaderError.png");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        } finally {
            if (!found) {
                BaseView.takeScreenshot(tblHeader + "GetTableHeaderError.png");
                Assert.fail("Error info: unable to find " + tblHeader + " in the page");
            }
            logger.info("Table header " + tblHeader + " found");
        }
    }

    public static void clickOnGridButton(String btnName) throws Exception {
        try {
            SeleniumUtil.click("xpath", "//*[contains(text(),'" + btnName + "')]", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot(btnName + ".png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void clickGridActionBtn(String strAction, String gridID, String header, String cellValue) throws Throwable {
        switchToFrame();
        boolean found = false;
        WebElement fixRow = null;
        WebElement gridElement = null;
        int colIndex = 0;
        gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']"));
        //Fix the row in grid
        for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
            colIndex = 0;
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                colIndex++;
                if (td.getText().contains(cellValue)) {
                    fixRow = BrowserDriver.getParent(td);
                    try {
                        //Traverse cells value now
                        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                        List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
                        assertEquals(headers.size(),
                                fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
                        assertTrue("Expected cell value " + cellValue + "is not present under Column header " + header, cells.get(colIndex - 1).getText().contains(cellValue));
                        assertTrue("Expected cell value " + cellValue + "is not present under Column header" + header, headers.get(colIndex - 1).getText().contains(header));
                        logger.info("Cell value " + cellValue + "is present under Column header" + header);
                        found = true;
                        break;
                    } catch (Exception e) {

                    }
                }
            }
            if (found) {
                break;
            }
        }
        if (!found) {
            fail("Expected " + cellValue + " is not present under column header" + header);
        }
        //Traverse cells value now
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
        List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
        assertEquals(headers.size(),
                fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
        logger.info("Row cells are same as header cells");

        assertTrue("Expected cell value " + cellValue + "is not present under Column header " + header, cells.get(colIndex).getText().contains(cellValue));
        assertTrue("Expected cell value " + cellValue + "is not present under Column header" + header, headers.get(colIndex).getText().contains(header));
        logger.info("Cell value " + cellValue + "is present under Column header" + header);
        try {
            cells.get(cells.size() - 1).findElement(By.xpath("//a[contains(text(),'" + strAction + "')]")).sendKeys("");
        } catch (Exception e) {

        }
        cells.get(cells.size() - 1).findElement(By.xpath("//a[contains(text(),'" + strAction + "')]")).click();

        /*try{
            WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']"));
            try{
                gridElement.findElement(By.xpath("//td//div[contains(text(),'"+rowValue+"')]//parent::td//following-sibling::td//div/a[contains(text(),'"+strAction+"')]")).sendKeys("");
            }catch(Exception e){
            }
            gridElement.findElement(By.xpath("//td//div[contains(text(),'"+rowValue+"')]//parent::td//following-sibling::td//div/a[contains(text(),'"+strAction+"')]")).click();
        } catch (Exception e) {
            TestCase.fail(e.getMessage());
        }*/
    }

    public static void verifyUniqueGridRow(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        switchToFrame();
        boolean found = false;
        WebElement fixRow = null;
        WebElement fixCol = null;
        String strElement = "";
        int colIndex = 0;

        if (gridID.contains("^"))
            strElement = "div[id^='" + gridID.replace("^", "") + "']";
        else
            strElement = "div[id='" + gridID + "']";

        //Focusing the grid
       /* try {
            SeleniumUtil.moveToElement("cssSelector", strElement, SeleniumUtilities.OBJWAITTIMEOUT);
            BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement)).sendKeys("");
        } catch (Exception e) {

        }*/
        SeleniumUtil.waitForElementVisibilityOf("cssselector",strElement,10,SeleniumUtilities.OBJWAITTIMEOUT);
        moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        //Fix the row in grid
        for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
            colIndex = 0;
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                colIndex++;
                if (td.getText().trim().equalsIgnoreCase(uniqueValue.trim())) {
                    fixRow = BrowserDriver.getParent(td);
                    fixCol = td;

                    try {
                        //Traverse cells value now
                        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                        List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
                        assertEquals(headers.size(),
                                fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
                        assertTrue("Expected cell value " + uniqueValue + "is not present under Column header " + header, cells.get(colIndex - 1).getText().contains(uniqueValue));
                        assertTrue("Expected cell value " + uniqueValue + "is not present under Column header" + header, headers.get(colIndex - 1).getText().contains(header));
                        logger.info("Cell value " + uniqueValue + "is present under Column header" + header);
                        found = true;
                        break;
                    } catch (Exception e) {

                    }
                }
            }
            if (found) {
                break;
            }
        }


        if (!found) {
            for (int i = 0; i < 6; i++) {
                try {
                    SeleniumUtil.click("cssselector", "span[class=\"x-btn-icon-el x-btn-icon-el-default-toolbar-small x-tbar-page-next \"]", SeleniumUtilities.OBJWAITTIMEOUT);
                }catch(Exception ex){
                    SeleniumUtil.Log.info(ex.getMessage());
                }
//                delay(3000);
                moveToElementAndFocus(strElement);
                gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
                //Fix the row in grid
                for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
                    colIndex = 0;
                    for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                        colIndex++;
                        if (td.getText().trim().equalsIgnoreCase(uniqueValue.trim())) {
                            fixRow = BrowserDriver.getParent(td);
                            fixCol = td;

                            try {
                                //Traverse cells value now
                                List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                                List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
                                assertEquals(headers.size(),
                                        fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
                                assertTrue("Expected cell value " + uniqueValue + "is not present under Column header " + header, cells.get(colIndex - 1).getText().contains(uniqueValue));
                                assertTrue("Expected cell value " + uniqueValue + "is not present under Column header" + header, headers.get(colIndex - 1).getText().contains(header));
                                logger.info("Cell value " + uniqueValue + "is present under Column header" + header);
                                found = true;
                                break;
                            } catch (Exception e) {

                            }
                            if (found) break;
                        }
                        if (found) break;
                    }
                    if (found) break;
                }
                if (found) break;
            }
        }


        if (!found) {
            fail("Final Expected " + uniqueValue + " is not present under column header" + header);
        }
        //Traverse cells value now
        int headerCount = 0;
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
        List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
        for (Field f : fields) {
            assertEquals(headers.size(),
                    fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
            logger.info("Row cells are same as header cells");

            assertTrue("Expected cell value " + cells.get(headerCount).getText() + "is not present under Column header " + f.getName(), cells.get(headerCount).getText().contains(f.getValue()));
            assertTrue("Expected cell value " + headers.get(headerCount).getText() + "is not present under Column header" + f.getName(), headers.get(headerCount).getText().contains(f.getName()));
            logger.info("Cell value " + f.getValue() + "is present under Column header" + f.getName());
            headerCount++;
        }
    }

    public static void sortColumn(String gridID, String header, String sortMethod) throws Throwable {
        switchToFrame();
        String strElement = getGridElement(gridID);
        WebElement gridElement = SeleniumUtil.getElement("cssselector",strElement,5,SeleniumUtilities.OBJWAITTIMEOUT); //BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
//        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id^='" + gridID + "']"));
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                Actions action = new Actions(BrowserDriver.getCurrentDriver());
                action.moveToElement(gridElement.findElement(By.xpath("//span[text()='" + header + "']"))).build().perform();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[text()='" + header + "']/parent::span/parent::span//following-sibling::div")));
                gridElement.findElement(By.xpath("//span[text()='" + header + "']/parent::span/parent::span//following-sibling::div")).click();
                gridElement.findElement(By.xpath("//span[text()='" + sortMethod + "']")).click();
                waitTillDivisionLoads();
                break;
            } catch (Exception e) {
                if (i == 10) {
                    BaseView.takeScreenshot("UnableToSort.png");
                    logger.info("Error :" + e.getMessage());
                    fail(e.getMessage());
                }
            }
        }
    }

    public static void sortColumnGeneric(String gridID, String header, String sortMethod) throws Throwable {
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']"));
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                Actions action = new Actions(BrowserDriver.getCurrentDriver());
                action.moveToElement(gridElement.findElement(By.xpath("//span[text()='" + header + "']"))).build().perform();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[text()='" + header + "']/parent::span/parent::span//following-sibling::div")));
                gridElement.findElement(By.xpath("//span[text()='" + header + "']/parent::span/parent::span//following-sibling::div")).click();
                gridElement.findElement(By.xpath("//span[text()='" + sortMethod + "']")).click();
                waitTillDivisionLoads();
                break;
            } catch (Exception e) {
                if (i == 10) {
                    BaseView.takeScreenshot("UnableToSort.png");
                    logger.info("Error :" + e.getMessage());
                    fail(e.getMessage());
                }
            }
        }
    }

    public static void verifySort(String gridID, String one, String two) throws Throwable {
        switchToFrame();
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']"));
        try {
            gridElement.findElement(By.xpath("//div[contains(text(),'" + one + "')]//ancestor::tr//div[contains(text(),'" + two + "')]"));
        } catch (Exception e) {
            BaseView.takeScreenshot("SortFailure.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void expenseRecoveryReportedControllableExpensesGross() {
        try {
            SeleniumUtil.click("id", "vis_ExpenseRecovery_ReportedControllableExpensesGross", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("expenseRecoveryReportedControllableExpensesGross.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void moveToElementAndFocus(String locator) {
        try {
            try {
                SeleniumUtil.waitForElementVisibilityOf("cssSelector", locator,5,2);
                SeleniumUtil.moveToElement("cssSelector", locator, SeleniumUtilities.OBJWAITTIMEOUT);
//                BrowserDriver.getCurrentDriver().findElement(By.cssSelector(locator)).sendKeys("");
            } catch (Exception e) {

            }
        } catch (Exception e) {
            BaseView.takeScreenshot("UnableToMoveToElement.png");
            logger.info("Error :" + e.getMessage());
        }
    }

    public static void recordBatchNumber() {
        try {
            batchNum = allContractPages.batchNumbr.getAttribute("value");
            logger.info(batchNum);
        } catch (Exception e) {
            BaseView.takeScreenshot("recordBatchNumberError.png");
            logger.info("Error :" + e.getMessage());
        }
    }

    public static void verifyBatchID() {
        try {
            assertEquals("Expected batch number is not present in the transaction page " + batchNum, batchNum, allContractPages.batchID.getText());
        } catch (Exception e) {
            BaseView.takeScreenshot("BatchIDverificationError.png");
            logger.info("Error :" + e.getMessage());
        }
    }

    public static void contractDropdown(String strDropdonwValue) throws Throwable {
        try {
            BaseView.pushShortTimeout();
            CommonMethods.waitTillDivisionLoads();
            SeleniumUtil.select("id", "lx-hpicker", strDropdonwValue, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("contractExpenseForecastFromPageDropdown.png");
            logger.info("Error :" + e.getMessage());
        } finally {

            BaseView.popDefaultTimeout();
        }
    }

    public static void selectPageLayout(String strDropdonwValue) throws Throwable {
        try {
            SeleniumUtil.switchTodefaultContent();
            BaseView.pushShortTimeout();
            CommonMethods.waitTillDivisionLoads();
            Select select = new Select(BrowserDriver.getCurrentDriver().findElement(By.id("lx-hpicker")));
            select.selectByVisibleText(strDropdonwValue);
        } catch (Exception e) {
            BaseView.takeScreenshot("contractExpenseForecastFromPageDropdown.png");
            logger.info("Error :" + e.getMessage());
        } finally {

            BaseView.popDefaultTimeout();
        }
    }

    public static void selectMonthAndYear(String strMonth, String strYear) throws Throwable {
        try {
            try {
                SeleniumUtil.getFrameIndex("name", "CurrentSelectorDate_month");
                SeleniumUtil.select("name", "CurrentSelectorDate_month", strMonth, SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.select("name", "CurrentSelectorDate_year", strYear, SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.click("name", "Refresh", SeleniumUtilities.OBJWAITTIMEOUT);
                //SeleniumUtil.switchTodefaultContent();
                CommonMethods.waitTillDivisionLoads();
            } catch (Exception e) {
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("contractExpenseForecastFromPageDropdown.png");
            logger.info("Error :" + e.getMessage());
        }
    }

    public static void selectMonthAndYearInSchedulePage(String strMonth, String strYear) {
        try {
            SeleniumUtil.select("name", "CurrentSelectorDate_month", strMonth, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.select("name", "CurrentSelectorDate_year", strYear, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("contractExpenseForecastFromPageDropdown.png");
            logger.info("Error :" + e.getMessage());
        }
    }

    public static int getParticularGridRowCount(String gridID, String uniqueValue, String header) throws Throwable {
        switchToFrame();
        String strElement = "";

        strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        return gridParticularRowCount(gridElement, uniqueValue, header);
    }

    public static int gridParticularRowCount(WebElement gridElement, String uniqueValue, String header) throws Throwable {
        int rowCount = 0;
        int colIndex = 0;
        WebElement fixRow = null;

        for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
            colIndex = 0;
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                if (td.getText().trim().equalsIgnoreCase(uniqueValue.trim())) {
                    fixRow = BrowserDriver.getParent(td);
                    try {
                        //Traverse cells value now
                        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                        List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
                        assertEquals(headers.size(),
                                fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
                        assertTrue("Expected cell value " + uniqueValue + " is not present under Column header " + header, cells.get(colIndex).getText().contains(uniqueValue));
                        assertTrue("Expected cell value " + uniqueValue + " is not present under Column header " + header, headers.get(colIndex).getText().contains(header));
                        logger.info("Cell value " + uniqueValue + " is present under Column header " + header);
                        rowCount++;
                    } catch (Exception e) {
                    }
                }
                colIndex = colIndex + 1;
            }
        }
        System.out.println(rowCount);
        return rowCount;
    }

    public static List<WebElement> getGridAllRowsCount(String gridID) throws Throwable {
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        return gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"));
    }

    public static List<WebElement> getGridAllRowsCountNew(String gridID) throws Throwable {
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        String element = "";
        try {
            BaseView.pushShortTimeout();
            if (gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size() > 0) {
                element = "tr[class*='!important'][class*='x-grid-row']";
            } else if (gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']:not([class*='!important'])")).size() > 0) {
                element = "tr[class*='x-grid-row']:not([class*='!important'])";
            }
        } finally {
            BaseView.popDefaultTimeout();
        }
        return gridElement.findElements(By.cssSelector(element));
    }

    public static void verifyGridValues(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
        switchToFrame();
        WebElement fixRow = null;
        String strElement = "";

        strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        //Fix the row in grid
        fixRow = getNewRow(gridElement, uniqueValue, header);//getRow(gridElement,uniqueValue,header);

        for (Field f : fields) {
            findGridValue(gridElement, fixRow, f.getName(), f.getValue());
        }
    }

    public static void verifyGridWithoutFrameValues(String gridID, String uniqueValue, String header, List<Field> fields) throws Throwable {
//        switchToFrame();
        WebElement fixRow = null;
        String strElement = "";

        strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        //Fix the row in grid
        fixRow = getNewRow(gridElement, uniqueValue, header);//getRow(gridElement,uniqueValue,header);

        for (Field f : fields) {
            findGridValue(gridElement, fixRow, f.getName(), f.getValue());
        }
    }

    public static String getGridElement(String gridID) {
        String strElement;
        if (gridID.contains("!")){
            if (gridID.contains("^"))
                strElement = "table[id^='" + gridID.replace("^", "").replace("~","") + "']";
            else if (gridID.contains("*"))
                strElement = "table[id*='" + gridID.replace("^", "").replace("~", "") + "']";
            else if (gridID.contains("$"))
                strElement = "table[id$='" + gridID.replace("$", "").replace("~", "") + "']";
            else
                strElement = "table[id='" + gridID + "']";
        }
        else {
            if (gridID.contains("^"))
                strElement = "div[id^='" + gridID.replace("^", "") + "']";
            else if (gridID.contains("*"))
                strElement = "div[id*='" + gridID.replace("^", "") + "']";
            else if (gridID.contains("$"))
                strElement = "div[id$='" + gridID.replace("$", "") + "']";
            else
                strElement = "div[id='" + gridID + "']";
        }


        return strElement;
    }


    public static String getGridLocator(String gridID) {
        String strElement;
        if (gridID.contains("^"))
            strElement = "*[class^='" + gridID.replace("^", "") + "']";
        else if (gridID.contains("*"))
            strElement = "*[class*='" + gridID.replace("^", "") + "']";
        else if (gridID.contains("$"))
            strElement = "*[class='" + gridID.replace("$", "") + "']";
        else
            strElement = "*[class='" + gridID + "']";

        return strElement;
    }

    public static WebElement getRow(WebElement gridElement, String uniqueValue, String header) {
        boolean found = false;
        WebElement fixRow = null;
        int colIndex = 0;

        for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
            colIndex = 0;
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                colIndex++;
                if (td.getText().trim().equalsIgnoreCase(uniqueValue.trim())) {
                    fixRow = BrowserDriver.getParent(td);
                    try {
                        //Traverse cells value now
                        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                        List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
                        assertEquals(headers.size(),
                                fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
                        assertTrue("Expected cell value " + uniqueValue + " is not present under Column header " + header, cells.get(colIndex - 1).getText().contains(uniqueValue));
                        assertTrue("Expected cell value " + uniqueValue + " is not present under Column header " + header, headers.get(colIndex - 1).getText().contains(header));
                        logger.info("Cell value " + uniqueValue + " is present under Column header " + header);
                        found = true;
                        break;
                    } catch (Exception e) {

                    }
                }
            }
            if (found) {
                break;
            }
        }
        if (!found) {
            fail("Final Expected " + uniqueValue + " is not present under column header " + header);
        }
        return fixRow;
    }

    public static WebElement getNewRow(WebElement gridElement, String uniqueValue, String header) {
        boolean found = false;
        WebElement fixRow = null;
        int colIndex = 0;
        List<WebElement> listHeaders = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
        for (WebElement tr : gridElement.findElements(By.cssSelector("tr"))) {
            for (int i = 0; i < listHeaders.size(); i++) {
                if (listHeaders.get(i).getText().trim().equalsIgnoreCase(header.trim())) {
                    colIndex = 0;
                    for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                        colIndex++;
                        if ((td.getText().trim().equalsIgnoreCase(uniqueValue.trim())) && (i == (colIndex - 1))) {
                            fixRow = BrowserDriver.getParent(td);
                            try {
                                //Traverse cells value now
                                List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                                List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
                                assertEquals(headers.size(),
                                        fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
                                assertTrue("Expected cell value " + uniqueValue + " is not present under Column header " + header, cells.get(colIndex - 1).getText().contains(uniqueValue));
                                assertTrue("Expected cell value " + uniqueValue + " is not present under Column header " + header, headers.get(colIndex - 1).getText().contains(header));
                                logger.info("Cell value " + uniqueValue + " is present under Column header " + header);
                                found = true;
                                return fixRow;
                            } catch (Exception e) {
                            }
                        }
                    }
                }
            }
            if (found) {
                break;
            }
        }
        if (!found) {
            fail("Final Expected " + uniqueValue + " is not present under column header " + header);
        }
        return fixRow;
    }

    public static void findGridValue(WebElement gridElement, WebElement fixRow, String header, String cellValue) {
        //Traverse cells value now
        int colIndex = 0;
        boolean found = false;
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
        List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
        for (WebElement f : headers) {
            if (f.getText().contains(header)) {
                assertTrue("Expected cell value " + cellValue + " is present under Column header " + header, cells.get(colIndex).getText().contains(cellValue));
                logger.info("Expected cell value " + cellValue + " is present under Column header " + header);
                found = true;
                break;
            }
            colIndex = colIndex + 1;
        }
        if (!found) {
            fail("Final Expected " + cellValue + " is not present under column header " + header);
        }
    }

    public static void verifyGridRowNotPresentUnderHeader(String gridID, String uniqueValue, String header) throws Throwable {
        switchToFrame();
        String strElement = "";
        int colIndex = 0;

        strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
        //Fix the row in grid
        for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
            colIndex = 0;
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                if (td.getText().contains(uniqueValue) && headers.get(colIndex).getText().contains(header)) {
                    fail("Expected row present in the grid");
                }
                colIndex = colIndex + 1;
            }
        }
        logger.info("Expected row not present in the grid");
    }

    public static void typeValueHitTab(String locator, String element, String strValue) {
        try {
            SeleniumUtil.typeHitTab(locator, element, strValue, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("typeValueHitTab.png");
            logger.info("Error :" + e.getMessage());
        }
    }

    public static void addAssignee() {
        try {
            SeleniumUtil.click("name", "addAssignee", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("addAssignee.png");
            logger.info("Error :" + e.getMessage());
        }
    }

    public static void deleteRowsInGrid(String gridID, String uniqueValue, String header) throws Throwable {
        try {
            int rows = getParticularGridRowCount(gridID, uniqueValue, header);
            System.out.println(rows);
            for (int i = rows; i > 0; i--) {
                clickUniqueGridRow(gridID, uniqueValue, header);
                SeleniumUtil.switchTodefaultContent();
                ActionsView.clickActionPanelButtonWhenReady("Delete Item");
                AllContractPagesView.clickButtonInMessageBox("Yes", false);
                AllContractPagesView.waitTillDivisionLoads();
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("Delete rows from grid error.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void deleteAllRowsRowsInGrid(String gridID) throws Throwable {
        try {
            for (WebElement row : getGridAllRowsCount(gridID)) {
                CommonMethods.switchToVisibleFrame();
                try {
                    row.sendKeys("");
                    row.click();
                } catch (Exception e) {
                    row.click();
                }
                SeleniumUtil.switchTodefaultContent();
                ActionsView.clickActionPanelButtonWhenReady("Delete Item");
                AllContractPagesView.clickButtonInMessageBox("Yes", false);
                AllContractPagesView.waitTillDivisionLoads();
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("Delete rows from grid error.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void verifySuccessMsg() {
        try {
            SeleniumUtil.verifyTextValue("cssselector", "div[class='x-component x-window-text x-box-item x-component-default']", "An existing Expense Schedule record End Date has been changed from 12/31/2020 to 03/31/2015", SeleniumUtil.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("cssselector", "div[class='x-component x-window-text x-box-item x-component-default']", "A new Expense Schedule record was created with Start Date 02/01/2015, End Date 03/31/2015 and Payment Amount $50.00", SeleniumUtil.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("cssselector", "div[class='x-component x-window-text x-box-item x-component-default']", "A new Expense Schedule record was created with Start Date 04/01/2015, End Date 12/31/2015 and Payment Amount $100.00", SeleniumUtil.OBJWAITTIMEOUT);
        } catch (Exception ex) {
        }
    }

    public static void focusWebElement(WebElement ele) {
        WebDriver driver = BrowserDriver.getCurrentDriver();
        try {
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView();", ele);
        } catch (Exception e) {
            try {
                ele.sendKeys("");
            } catch (Exception e2) {
            }
        } finally {
            try {
                ele.sendKeys("");
            } catch (Exception e2) {
            }
            try {
                SeleniumUtil.moveToElement(ele, 1);
            } catch (Exception e1) {
            }
        }
    }

    public static WebElement getFocusedWebElement(WebElement ele) {
        WebDriver driver = BrowserDriver.getCurrentDriver();
        try {
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView();", ele);
        } catch (Exception e) {
            try {
                SeleniumUtil.moveToElement(ele, 1);
            } catch (Exception e1) {
            }
        } finally {
            try {
                ele.sendKeys("");
            } catch (Exception e2) {
            }
        }
        return ele;
    }

    public static void clickPage(String page) {
        try {
            BaseView.pushShortTimeout();
            if (BrowserDriver.getCurrentDriver().findElement(By.cssSelector("a[data-qtip='" + page + "'] span[data-ref='btnIconEl']")).isEnabled()) {
                BrowserDriver.getCurrentDriver().findElement(By.cssSelector("a[data-qtip='" + page + "'] span[data-ref='btnIconEl']")).click();
            }
        } catch (Exception e) {
            BaseView.popDefaultTimeout();
            BaseView.takeScreenshot("UnableToClickNextPage.png");
        }finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void clickUniqueGrid(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        WebElement gridElement = SeleniumUtil.getElement("cssselector",strElement,5,SeleniumUtilities.OBJWAITTIMEOUT); //BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        SeleniumUtil.moveToElement(gridElement,SeleniumUtilities.OBJWAITTIMEOUT);

        try {
            BaseView.pushShortTimeout();
            if (gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size() > 0) {
                clickImportantGridRow(gridElement, cellValue, header, fields);
            } else {
                clickMainGrid(gridElement, cellValue, header, fields);
            }
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void verifyRowValuesInGrid(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        WebElement gridElement = SeleniumUtil.getElement("cssselector",strElement,5,SeleniumUtilities.OBJWAITTIMEOUT); //BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement))
        try {
            BaseView.pushShortTimeout();
            if (gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size() > 0) {
                clickImportantGridRow(gridElement, cellValue, header, fields);
            } else {
                verifyGridRowValues(gridElement, cellValue, header, fields);
            }
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void extractValueFromGrid(String gridID, String cellValue, String header,String strExtractFieldValue) throws Throwable {
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        WebElement gridElement = SeleniumUtil.getElement("cssselector",strElement,5,SeleniumUtilities.OBJWAITTIMEOUT);

        try {
            BaseView.pushShortTimeout();
            extractFieldValue(gridElement, cellValue, header, strExtractFieldValue);
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void clickUniqueGridManyPage(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        clickGridLineItemsManyPage(gridID, cellValue, header, fields);
    }

    public static void verifySummaryTotal(int intRow, String strValue) {
        try {
            boolean flag = false;
            for (int i = 0; i < 5; i++) {
                if (SeleniumUtil.verifyTextValue("xpath", "//table[@class=\"rowColor1\"]/tbody/tr[" + (intRow + i) + "]", strValue, SeleniumUtil.OBJWAITTIMEOUT)) {
                    flag = true;
                }
                if (flag) break;
            }
            if (!flag) fail(strValue);
        } catch (Exception ex) {
        }
    }

    public static void salesGrid(String gridID, List<Sales> fields) throws Throwable {
        int colIndex = 0;
        int rowIndex = 0;

        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        String salesHeaders[] = {"Sales Group", "Sales Type", "Sales Category", "Sales Period",
                "Sales Year", "Gross Sales Amount", "Net Sales Amount", "Currency"};

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        for (Sales s : fields) {
            List<WebElement> tr = gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"));
            colIndex = 0;
            List<WebElement> columns = tr.get(rowIndex).findElements(By.cssSelector("td.x-grid-cell"));
            focusWebElement(columns.get(colIndex));

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getGroup() + " not present",
                    AllContractPagesView.getTextAndByPassException(headers.get(colIndex)).trim().contains(salesHeaders[colIndex]) &&
                            AllContractPagesView.getTextAndByPassException(columns.get(colIndex)).trim().contains(fields.get(rowIndex).getGroup()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getSalesType() + " not present",
                    AllContractPagesView.getTextAndByPassException(headers.get(colIndex)).trim().contains(salesHeaders[colIndex]) &&
                            AllContractPagesView.getTextAndByPassException(columns.get(colIndex)).trim().contains(fields.get(rowIndex).getSalesType()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getSalesCategory() + " not present",
                    AllContractPagesView.getTextAndByPassException(headers.get(colIndex)).trim().contains(salesHeaders[colIndex]) &&
                            AllContractPagesView.getTextAndByPassException(columns.get(colIndex)).trim().contains(fields.get(rowIndex).getSalesCategory()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getSalesPeriod() + " not present",
                    AllContractPagesView.getTextAndByPassException(headers.get(colIndex)).trim().contains(salesHeaders[colIndex]) &&
                            AllContractPagesView.getTextAndByPassException(columns.get(colIndex)).trim().contains(fields.get(rowIndex).getSalesPeriod()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getSalesYear() + " not present",
                    AllContractPagesView.getTextAndByPassException(headers.get(colIndex)).trim().contains(salesHeaders[colIndex]) &&
                            AllContractPagesView.getTextAndByPassException(columns.get(colIndex)).trim().contains(fields.get(rowIndex).getSalesYear()));
            colIndex = colIndex + 1;


            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getGrossSalesAmount() + " not present",
                    AllContractPagesView.getTextAndByPassException(headers.get(colIndex)).trim().contains(salesHeaders[colIndex]) &&
                            AllContractPagesView.getTextAndByPassException(columns.get(colIndex)).trim().contains(fields.get(rowIndex).getGrossSalesAmount()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getNetSalesAmount() + " not present",
                    AllContractPagesView.getTextAndByPassException(headers.get(colIndex)).trim().contains(salesHeaders[colIndex]) &&
                            AllContractPagesView.getTextAndByPassException(columns.get(colIndex)).trim().contains(fields.get(rowIndex).getNetSalesAmount()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getCurrency() + " not present",
                    AllContractPagesView.getTextAndByPassException(headers.get(colIndex)).trim().contains(salesHeaders[colIndex]) &&
                            AllContractPagesView.getTextAndByPassException(columns.get(colIndex)).trim().contains(fields.get(rowIndex).getCurrency()));
            colIndex = colIndex + 1;

            rowIndex++;
        }
    }


    public static void receiptGrid(String gridID, List<Receipts> fields) throws Throwable {
        int colIndex = 0;
        int rowIndex = 0;

        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        String receiptHeaders[] = {"Effective Date", "Period Year", "Period Month", "Receipt Number",
                "Receipt Type", "Amount Received", "Currency Type", "Amount Not Allocated"};

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        focusWebElement(gridElement);

        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        for (Receipts s : fields) {
            List<WebElement> tr = gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"));
            colIndex = 0;
            List<WebElement> columns = tr.get(rowIndex).findElements(By.cssSelector("td.x-grid-cell"));
            focusWebElement(columns.get(colIndex));
            focusWebElement(headers.get(colIndex));

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getEffectiveDate() + " not present",
                    headers.get(colIndex).getText().trim().contains(receiptHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getEffectiveDate()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getPeriodYear() + " not present",
                    headers.get(colIndex).getText().trim().contains(receiptHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getPeriodYear()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getPeriodMonth() + " not present",
                    headers.get(colIndex).getText().trim().contains(receiptHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getPeriodMonth()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getReceiptNumber() + " not present",
                    headers.get(colIndex).getText().trim().contains(receiptHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getReceiptNumber()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getReceiptType() + " not present",
                    headers.get(colIndex).getText().trim().contains(receiptHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getReceiptType()));
            colIndex = colIndex + 1;


            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getAmountReceived() + " not present",
                    headers.get(colIndex).getText().trim().contains(receiptHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getAmountReceived()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getCurrencyType() + " not present",
                    headers.get(colIndex).getText().trim().contains(receiptHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getCurrencyType()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getAmountNotAllocated() + " not present",
                    headers.get(colIndex).getText().trim().contains(receiptHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getAmountNotAllocated()));
            colIndex = colIndex + 1;

            rowIndex++;
        }
    }

    public static void partitionList(String gridID, List<SingleBPSchedule> fields) throws Throwable {
        String strElement = getGridElement(gridID);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        List<List<SingleBPSchedule>> partitions = new ArrayList<List<SingleBPSchedule>>();
        if (getPageCount(gridElement) > 1 && getTotalItemsCount(gridElement) > 12 && fields.size() > 12 && getItemsDisplayCount(gridElement) == 12) {
            int partitionSize = IntMath.divide(fields.size(), 2, RoundingMode.UP);
            partitions = Lists.partition(fields, partitionSize);
            singleBPScheduleGridUpdated(gridID, partitions);
        } else {
            singleBPScheduleGrid(gridID, fields);
        }
    }

    public static void singleBPScheduleGridUpdated(String gridID, List<List<SingleBPSchedule>> listFields) throws Throwable {
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        String salesHeaders[] = {"Sales Group", "Month/Year", "Gross Sales", "Excluded Sales",
                "Lease YTD Sales", "Breakpoint", "Sales Past Breakpoint", "Rate", "Total %Rent", "Amount Previously Paid", "%Rent Owed"};

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        for (List<SingleBPSchedule> fields : listFields) {
            int colIndex = 0;
            int rowIndex = 0;
            for (SingleBPSchedule s : fields) {
                List<WebElement> tr = gridElement.findElements(By.cssSelector("tr[class*='x-grid-row'][class*='!important']"));
                colIndex = 0;
                List<WebElement> columns = tr.get(rowIndex).findElements(By.cssSelector("td.x-grid-cell"));
                focusWebElement(columns.get(colIndex));

                assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getGroup() + " not present",
                        headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                                columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getGroup()));
                colIndex = colIndex + 1;

                assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getMonthYear() + " not present",
                        headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                                columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getMonthYear()));
                colIndex = colIndex + 1;

                assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getGrossSales() + " not present",
                        headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                                columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getGrossSales()));
                colIndex = colIndex + 1;

                assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getExcludedSales() + " not present",
                        headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                                columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getExcludedSales()));
                colIndex = colIndex + 1;

                assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getLeaseYTDSales() + " not present",
                        headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                                columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getLeaseYTDSales()));
                colIndex = colIndex + 1;


                assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getBreakpoint() + " not present",
                        headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                                columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getBreakpoint()));
                colIndex = colIndex + 1;

                assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getSalesPastBreakpoint() + " not present",
                        headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                                columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getSalesPastBreakpoint()));
                colIndex = colIndex + 1;

                assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getRate() + " not present",
                        headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                                columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getRate()));
                colIndex = colIndex + 1;

                assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getTotalPercentRent() + " not present",
                        headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                                columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getTotalPercentRent()));
                colIndex = colIndex + 1;

                assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getAmountPaid() + " not present",
                        headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                                columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getAmountPaid()));
                colIndex = colIndex + 1;

                assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getPercentOwed() + " not present",
                        headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                                columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getPercentOwed()));
                colIndex = colIndex + 1;


                rowIndex++;
            }
            clickPage("Next Page");
            waitTillDivisionLoads();
            waitTillDivisionLoads();
        }
    }


    public static void singleBPScheduleGrid(String gridID, List<SingleBPSchedule> fields) {
        int colIndex = 0;
        int rowIndex = 0;
        int intpageRow = 0;

        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        String salesHeaders[] = {"Sales Group", "Month/Year", "Gross Sales", "Excluded Sales",
                "Lease YTD Sales", "Breakpoint", "Sales Past Breakpoint", "Rate", "Total %Rent", "Amount Previously Paid", "%Rent Owed"};

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        for (SingleBPSchedule s : fields) {
            List<WebElement> tr = gridElement.findElements(By.cssSelector("tr[class*='x-grid-row'][class*='!important']"));
            colIndex = 0;
            List<WebElement> columns = tr.get(intpageRow).findElements(By.cssSelector("td.x-grid-cell"));
            focusWebElement(columns.get(colIndex));

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getGroup() + " not present",
                    headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getGroup()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getMonthYear() + " not present",
                    headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getMonthYear()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getGrossSales() + " not present",
                    headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getGrossSales()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getExcludedSales() + " not present",
                    headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getExcludedSales()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getLeaseYTDSales() + " not present",
                    headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getLeaseYTDSales()));
            colIndex = colIndex + 1;


            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getBreakpoint() + " not present",
                    headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getBreakpoint()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getSalesPastBreakpoint() + " not present",
                    headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getSalesPastBreakpoint()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getRate() + " not present",
                    headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getRate()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getTotalPercentRent() + " not present",
                    headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getTotalPercentRent()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getAmountPaid() + " not present",
                    headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getAmountPaid()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getPercentOwed() + " not present",
                    headers.get(colIndex).getText().trim().contains(salesHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getPercentOwed()));
            colIndex = colIndex + 1;

            rowIndex++;
            intpageRow++;
            if (intpageRow == 12) {
                try {
                    SeleniumUtil.click("cssselector", "a[data-qtip='Next Page']", SeleniumUtilities.OBJWAITTIMEOUT);
                    AllContractPagesView.waitTillDivisionLoads();
                    intpageRow = 0;
                } catch (Exception ex) {
                } catch (Throwable throwable) {
                }
            }
        }

    }

    public static void clickTypeField(String name) throws Throwable{
        try {
            CommonMethods.waitTillDivisionLoads();
            BrowserDriver.getCurrentDriver()
                    .findElement(By.cssSelector("div[id^='" + name + "'][class*='x-form-options-trigger']")).click();
        } catch (Exception e) {
            BaseView.takeScreenshot("UnableToclickTypeField.png");
        }
    }

    public static void slPeriodGrid(String gridID, List<SLPeriodGrid> fields) throws Throwable {
        int colIndex = 0;
        int rowIndex = 0;

        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        String slGridHeaders[] = {"Year", "Period", "Period Length", "Cash Rent",
                "Rent Expense", "Deferred Rent", "Cumulative Balance","Begin Date", "End Date","Status"};

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        for (SLPeriodGrid s : fields) {
            List<WebElement> tr = gridElement.findElements(By.cssSelector("tr[class*='x-grid-row'][class*='!important']"));
            colIndex = 0;
            List<WebElement> columns = tr.get(rowIndex).findElements(By.cssSelector("td.x-grid-cell"));
            focusWebElement(columns.get(colIndex));

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getYear() + " not present",
                    headers.get(colIndex).getText().trim().contains(slGridHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getYear()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getPeriod() + " not present",
                    headers.get(colIndex).getText().trim().contains(slGridHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getPeriod()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getPeriodLength() + " not present",
                    headers.get(colIndex).getText().trim().contains(slGridHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getPeriodLength()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getCashRent() + " not present",
                    headers.get(colIndex).getText().trim().contains(slGridHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getCashRent()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getRentExpense() + " not present",
                    headers.get(colIndex).getText().trim().contains(slGridHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getRentExpense()));
            colIndex = colIndex + 1;


            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getDeferredRent() + " not present",
                    headers.get(colIndex).getText().trim().contains(slGridHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getDeferredRent()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getCumulativeBalance() + " not present",
                    headers.get(colIndex).getText().trim().contains(slGridHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getCumulativeBalance()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getStatus() + " not present",
                    headers.get(colIndex).getText().trim().contains(slGridHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getBeginDate()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getBeginDate() + " not present",
                    headers.get(colIndex).getText().trim().contains(slGridHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getEndDate()));
            colIndex = colIndex + 1;

            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getEndDate() + " not present",
                    headers.get(colIndex).getText().trim().contains(slGridHeaders[colIndex]) &&
                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getStatus()));
            colIndex = colIndex + 1;

//            assertTrue(rowIndex + " " + colIndex + " " + fields.get(rowIndex).getBlank() + " not present",
//                    headers.get(colIndex).getText().trim().contains(slGridHeaders[colIndex]) &&
//                            columns.get(colIndex).getText().trim().contains(fields.get(rowIndex).getBlank()));
//            colIndex = colIndex + 1;


            rowIndex++;
        }
    }

    public static void verifyRemainingBalance(String strRemainingBalance) {
        try {
            SeleniumUtil.getFrameIndex("id", "ScheduledOffset_AmountNotAllocated_span");
            assertTrue("I verify Remaining Balance should be", strRemainingBalance.equalsIgnoreCase(SeleniumUtil.getTextValue("id", "ScheduledOffset_AmountNotAllocated_span", SeleniumUtilities.OBJWAITTIMEOUT)));
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            BaseView.takeScreenshot("Add Percentage Rent Breakpoint.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void clickAddPercentRentBP() {
        try {
            SeleniumUtil.getFrameIndex("xpath", ".//span[./text()='Add Percentage Rent Breakpoint']");
            SeleniumUtil.click("xpath", ".//span[./text()='Add Percentage Rent Breakpoint']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Add Percentage Rent Breakpoint.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void verifyGridLoading(String arg1, List<String> columns) {
//        delay(5000);
        try {
            CommonMethods.waitTillDivisionLoads();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        SeleniumUtil.getFrameIndex("cssSelector", "div[id='BOGridVirtualSalesPeriod']");

        List<WebElement> columnHdrs = SeleniumUtil.getWebDriver().findElements(By.cssSelector("div.x-column-header-inner"));

        assertNotNull("Did not see grid column headers!", columnHdrs);
        junit.framework.Assert.assertTrue("List of grid column headers is empty!", columnHdrs.size() > 0);

        for (int i = 0; i < columnHdrs.size(); i++) {
            if (!columns.get(i + 1).equalsIgnoreCase(columnHdrs.get(i).getText().trim())) {
                BaseView.takeScreenshot(columns.get(i + 1) + ".png");
                fail(columns.get(i + 1));
            }
        }
    }

    public static void verifyTaxValuePopulatedFromLocation(List<Field> fields) throws Throwable {
        try {
            AllContractPagesView.switchToFrame();
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector", "table[class=\'frmColor\']");
            for (Field f : fields) {
                try {
                    SeleniumUtil.verifyDataInTableRow(tableEle, f.getName(), f.getValue());
                } catch (Exception ex) {
                    BaseView.takeScreenshot(f.getValue() + ".png");
                    logger.info("Error :" + ex.getMessage());
                }
            }
            SeleniumUtil.switchTodefaultContent();

        } catch (Exception ex) {
            BaseView.takeScreenshot("I_verify_values_on_non_editable_summary_page.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void setFieldValuesOnStraightLineSchedulePopup(List<Field> fields) {
        for (Field f : fields) {
            try {
                BrowserDriver.getCurrentDriver().findElements(By.name(f.getName())).get(1).sendKeys(f.getValue());
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    public static void selectContractRadio() {
        try {
            SeleniumUtil.click("cssselector", "input[onclick='setShowType(\"contacts\")']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("selectContractRadio.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void clickOnReported(String strLoctor, String strElement) {
        try {
            SeleniumUtil.click(strLoctor, strElement, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnReported.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void verifySubTotal(String strLoctor, String strElement, String strSubTotal) {
        try {
            SeleniumUtil.verifyTextValue(strLoctor, strElement, strSubTotal, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnReported.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void prepaidAmount(String strLoctor, String strElement) {
        try {
            SeleniumUtil.click(strLoctor, strElement, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnReported.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void sortSetPrepaidAmount(String strSortType) {
        try {
            Actions builder = new Actions(BrowserDriver.getCurrentDriver());
//            builder.moveToElement(BrowserDriver.getCurrentDriver().findElement(By.xpath(".//*[@class='x-column-header-text-container' and .//*[contains(text(),'Effective Date')]]")));
//            builder.click(BrowserDriver.getCurrentDriver().findElement(By.xpath(".//*[@class='x-column-header-text-container' and .//*[contains(text(),'Effective Date')]]")));
            //builder.click(BrowserDriver.getCurrentDriver().findElement(By.xpath(".//*[@class='x-column-header-text-container' and .//*[contains(text(),'Effective Date')]]")));
//            builder.click(BrowserDriver.getCurrentDriver().findElement(By.xpath(".//*[@class='x-column-header-text-container' and .//*[contains(text(),'Effective Date')]]/following-sibling::div[@data-ref='triggerEl']")));
//            builder.moveToElement(BrowserDriver.getCurrentDriver().findElement(By.xpath(".//*[@class='x-column-header-text-container' and .//*[contains(text(),'Effective Date')]]/following-sibling::div[@data-ref='triggerEl']")));
//            builder.click(BrowserDriver.getCurrentDriver().findElement(By.xpath(".//*[@class='x-column-header-text-container' and .//*[contains(text(),'Effective Date')]]/following-sibling::div[@data-ref='triggerEl']")));
//            builder.click(BrowserDriver.getCurrentDriver().findElement(By.xpath(".//span[./text()='" + strSortType + "']")));
//            builder.build().perform();
//            delay(3000);
            SeleniumUtil.waitForElementVisibilityOf("xpath",".//*[@class='x-column-header-text-container' and .//*[contains(text(),'Effective Date')]]/following-sibling::div[@data-ref='triggerEl']",5,2);
            builder.moveToElement(BrowserDriver.getCurrentDriver().findElement(By.xpath(".//*[@class='x-column-header-text-container' and .//*[contains(text(),'Effective Date')]]/following-sibling::div[@data-ref='triggerEl']"))).click(BrowserDriver.getCurrentDriver().findElement(By.xpath(".//*[@class='x-column-header-text-container' and .//*[contains(text(),'Effective Date')]]/following-sibling::div[@data-ref='triggerEl']"))).click().build().perform();

        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnReported.png");
            logger.info("Error :" + ex.getMessage());
            fail("Error : " + ex.getMessage());
        }
    }

    public static void verifyGridValue(String gridID, String cellValue, String header, String cellValue1, String header1, List<Field> fields) throws Throwable {

        int foundCount = 0;
        int row = 0;
        int colIndex = 0;
        boolean rowExist = false;
        boolean secoundLoopExit=false;
        WebElement clickableRow = null;
        int count = 0;
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        int pageCount = getPageCount(gridElement);

        for (int j = pageCount; j > 0; j--) {
            //Fetch rows
            List<WebElement> fixRow = new ArrayList<WebElement>();

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                colIndex = 0;
                secoundLoopExit=false;
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    colIndex++;
                    focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    /*if ((td.getText().trim().contains(cellValue.trim()) || cellValue.trim().contains(td.getText().trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        try {
                            fixRow.add(BrowserDriver.getParent(td));
                            td.click();
                        } catch (Exception se) {
                        }
                        rowExist = true;
                    }*/

                    if ((getTextAndByPassException(td).trim().contains(cellValue.trim()) || cellValue.trim().contains(getTextAndByPassException(td).trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        try {
                            secoundLoopExit=true;
                            colIndex = 0;
                            for (WebElement td2 : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                                colIndex++;
                                if ((getTextAndByPassException(td2).trim().contains(cellValue1.trim()) || cellValue1.trim().contains(getTextAndByPassException(td2).trim())) && headers.get(colIndex - 1).getText().trim().equals(header1.trim())) {
                                    fixRow.add(BrowserDriver.getParent(td));
                                    td.click();
                                    rowExist = true;
                                }
                            }

                        } catch (Exception se) {
                        }
                    }
                    if (secoundLoopExit) break;
                }
                if (rowExist) break;
            }

            if (!rowExist) {
                for (int i = 0; i < 6; i++) {
                    try {
                        SeleniumUtil.click("cssselector", "span[class=\"x-btn-icon-el x-btn-icon-el-default-toolbar-small x-tbar-page-next \"]", SeleniumUtilities.OBJWAITTIMEOUT);
                    } catch (Exception e) {
                    }

                    gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
                    headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                    //Fetch rows
                    fixRow = new ArrayList<WebElement>();
                    for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                        colIndex = 0;

                        for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                            //SeleniumUtilities.waitForNonStaleWebElement(td);
                            colIndex++;
                            /*if ((td.getText().trim().contains(cellValue.trim()) || cellValue.trim().contains(td.getText().trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                                fixRow.add(BrowserDriver.getParent(td));
                                rowExist = true;
                            }*/

                            if ((getTextAndByPassException(td).trim().contains(cellValue.trim()) || cellValue.trim().contains(getTextAndByPassException(td).trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                                fixRow.add(BrowserDriver.getParent(td));
                                rowExist = true;
                            }
                        }
                    }
                    if (rowExist) break;
                }
            }

            for (WebElement ele : fixRow) {
                List<WebElement> cells = ele.findElements(By.cssSelector("td.x-grid-cell"));
                row = 0;
                foundCount = 0;
                for (WebElement cell : cells) {
                    row = row + 1;
                    focusWebElement(cells.get(cells.size() - 1));
                    focusWebElement(cell);

                    if (headers.get(row - 1).getText().trim().length() == 0) {
                        row = row + 1;
                    }

                    if (headers.get(row - 1).getText().trim().length() > 0) {
                        for (Field f : fields) {
                           /* if ((cell.getText().contains(GenericEntityView.convertToFormatPattern(f.getValue())) || f.getValue().contains(GenericEntityView.convertToFormatPattern(cell.getText()))) && headers.get(row - 1).getText().trim().equals(f.getName())) {
                                System.out.print(cell.getText() + ":" + f.getValue() + "  -  " + headers.get(row - 1).getText().trim() + " PPPP " + (f.getName()));
                                foundCount++;
                                break;
                            }*/
                            if ((getTextAndByPassException(cell).trim().contains(GenericEntityView.convertToFormatPattern(f.getValue().trim()).trim()) || f.getValue().contains(GenericEntityView.convertToFormatPattern(getTextAndByPassException(cell)).trim())) && headers.get(row - 1).getText().trim().equals(f.getName().trim())) {
                                System.out.print(getTextAndByPassException(cell) + ":" + f.getValue() + "  -  " + headers.get(row - 1).getText().trim() + " PPPP " + (f.getName()));
                                foundCount++;
                                break;
                            }
                        }
                    }
                }

                if (foundCount == fields.size()) {
                    try {
                        count = foundCount;
                        clickableRow = ele;
                        logger.info("Final Expected " + cellValue + " is present under column header " + header);
                        focusWebElement(clickableRow);
                        clickableRow.click();
                    } catch (Exception e) {
                        try {
                            clickableRow.click();
                        } catch (Exception se) {
                        }
                    }
                }
            }
            clickPage("Next Page");
            waitTillDivisionLoads();
            waitTillDivisionLoads();
        }

        if (!(count == fields.size())) {
            logger.info("Final Expected " + cellValue + " is not present under column header " + header);
            BaseView.takeScreenshot("Final Expected " + cellValue + " is not present under column header " + header + ".png");
            fail("Final Expected " + cellValue + " is not present under column header " + header);
        }
    }

    public static void clickMainGrid(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {

        int foundCount = 0;
        int row = 0;
        int colIndex = 0;
        boolean rowExist = false;
        WebElement clickableRow = null;
        int count = 0;
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        focusWebElement(gridElement);
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        int pageCount = getPageCount(gridElement);

        for (int j = pageCount; j > 0; j--) {
            //Fetch rows
            List<WebElement> fixRow = new ArrayList<WebElement>();

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                colIndex = 0;
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    colIndex++;
                    focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    /*if ((td.getText().trim().contains(cellValue.trim()) || cellValue.trim().contains(td.getText().trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        try {
                            fixRow.add(BrowserDriver.getParent(td));
                            td.click();
                        } catch (Exception se) {
                        }
                        rowExist = true;
                    }*/
                    if ((getTextAndByPassException(td).trim().equalsIgnoreCase(cellValue.trim()) || cellValue.trim().equalsIgnoreCase(getTextAndByPassException(td).trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        try {
                            fixRow.add(BrowserDriver.getParent(td));
                            td.click();
                        } catch (Exception se) {
                        }
                        rowExist = true;
                    }
                    //if(rowExist) break;
                }
                //if(rowExist) break;
            }

            for (WebElement ele : fixRow) {
                List<WebElement> cells = ele.findElements(By.cssSelector("td.x-grid-cell"));
                row = 0;
                foundCount = 0;
                for (WebElement cell : cells) {
                    row = row + 1;
                    focusWebElement(cells.get(cells.size() - 1));
                    focusWebElement(cell);
                    focusWebElement(headers.get(row - 1));

                    if (headers.get(row - 1).getText().trim().length() == 0) {
                        row = row + 1;
                    }

                    if (headers.get(row - 1).getText().trim().length() > 0) {
                        for (Field f : fields) {
                            if (f.getValue().contains("[CURRENT DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(0));
                            } else if (f.getValue().contains("[CURRENT END DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(-1));
                            }
                           /* if ((cell.getText().contains(GenericEntityView.convertToFormatPattern(f.getValue())) || f.getValue().contains(GenericEntityView.convertToFormatPattern(cell.getText()))) && headers.get(row - 1).getText().trim().equals(f.getName())) {
                                System.out.print(cell.getText() + ":" + f.getValue() + "  -  " + headers.get(row - 1).getText().trim() + " PPPP " + (f.getName()));
                                foundCount++;
                                break;
                            }*/
                            if ((getTextAndByPassException(cell).trim().contains(GenericEntityView.convertToFormatPattern(f.getValue().trim()).trim()) || f.getValue().contains(GenericEntityView.convertToFormatPattern(getTextAndByPassException(cell)).trim())) && headers.get(row - 1).getText().trim().equals(f.getName().trim())) {
                                logger.info("Value :" + getTextAndByPassException(cell) + ":" + f.getValue() + "  -  Header :" + headers.get(row - 1).getText().trim() + " - " + (f.getName()));
                                foundCount++;
                                break;
                            }
                        }
                    }
                }

                if (foundCount == fields.size()) {
                    try {
                        count = foundCount;
                        clickableRow = ele;
                        logger.info("Final Expected " + cellValue + " is present under column header " + header);
                        focusWebElement(clickableRow);
                        clickableRow.click();
                    } catch (Exception e) {
                        try {
                            clickableRow.click();
                        } catch (Exception se) {
                        }
                    }
                }
            }
            clickPage("Next Page");
            waitTillDivisionLoads();
            waitTillDivisionLoads();
        }

        if (!(count == fields.size())) {
            logger.info("Final Expected " + cellValue + " is not present under column header " + header);
            BaseView.takeScreenshot("Final Expected " + cellValue + " is not present under column header " + header + ".png");
            fail("Final Expected " + cellValue + " is not present under column header " + header);
        }
    }

    public static void clickMainGrid(WebElement gridElement, String cellValue, String header, List<Field> fields) throws Throwable {

        int foundCount = 0;
        int row = 0;
        int colIndex = 0;
        boolean rowExist = false;
        WebElement clickableRow = null;
        int count = 0;
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
//        String strElement = getGridElement(gridID);
//        moveToElementAndFocus(strElement);
//
//        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        focusWebElement(gridElement);
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        int pageCount = getPageCount(gridElement);

        for (int j = pageCount; j > 0; j--) {
            //Fetch rows
            List<WebElement> fixRow = new ArrayList<WebElement>();

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                colIndex = 0;
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    colIndex++;
                    focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    /*if ((td.getText().trim().contains(cellValue.trim()) || cellValue.trim().contains(td.getText().trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        try {
                            fixRow.add(BrowserDriver.getParent(td));
                            td.click();
                        } catch (Exception se) {
                        }
                        rowExist = true;
                    }*/
                    if ((getTextAndByPassException(td).trim().equalsIgnoreCase(cellValue.trim()) || cellValue.trim().equalsIgnoreCase(getTextAndByPassException(td).trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        try {
                            fixRow.add(BrowserDriver.getParent(td));
                            td.click();
                        } catch (Exception se) {
                        }
                        rowExist = true;
                    }
                    //if(rowExist) break;
                }
                //if(rowExist) break;
            }

            for (WebElement ele : fixRow) {
                List<WebElement> cells = ele.findElements(By.cssSelector("td.x-grid-cell"));
                row = 0;
                foundCount = 0;
                for (WebElement cell : cells) {
                    row = row + 1;
                    focusWebElement(cells.get(cells.size() - 1));
                    focusWebElement(cell);
                    focusWebElement(headers.get(row - 1));

                    if (headers.get(row - 1).getText().trim().length() == 0) {
                        row = row + 1;
                    }

                    if (headers.get(row - 1).getText().trim().length() > 0) {
                        for (Field f : fields) {
                            if (f.getValue().contains("[CURRENT DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(0));
                            } else if (f.getValue().contains("[CURRENT END DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(-1));
                            }
                           /* if ((cell.getText().contains(GenericEntityView.convertToFormatPattern(f.getValue())) || f.getValue().contains(GenericEntityView.convertToFormatPattern(cell.getText()))) && headers.get(row - 1).getText().trim().equals(f.getName())) {
                                System.out.print(cell.getText() + ":" + f.getValue() + "  -  " + headers.get(row - 1).getText().trim() + " PPPP " + (f.getName()));
                                foundCount++;
                                break;
                            }*/
                            if ((getTextAndByPassException(cell).trim().contains(GenericEntityView.convertToFormatPattern(f.getValue().trim()).trim()) || f.getValue().contains(GenericEntityView.convertToFormatPattern(getTextAndByPassException(cell)).trim())) && headers.get(row - 1).getText().trim().equals(f.getName().trim())) {
                                logger.info("Value :" + getTextAndByPassException(cell) + ":" + f.getValue() + "  -  Header :" + headers.get(row - 1).getText().trim() + " - " + (f.getName()));
                                foundCount++;
                                break;
                            }
                        }
                    }
                }

                if (foundCount == fields.size()) {
                    try {
                        count = foundCount;
                        clickableRow = ele;
                        logger.info("Final Expected " + cellValue + " is present under column header " + header);
                        focusWebElement(clickableRow);
                        clickableRow.click();
                    } catch (Exception e) {
                        try {
                            clickableRow.click();
                        } catch (Exception se) {
                        }
                    }
                }
            }
            if (!(count == fields.size())) {
                clickPage(gridElement,"Next Page");
            }
            waitTillDivisionLoads();
            waitTillDivisionLoads();
        }

        if (!(count == fields.size())) {
            logger.info("Final Expected " + cellValue + " is not present under column header " + header);
            BaseView.takeScreenshot("Final Expected " + cellValue + " is not present under column header " + header + ".png");
            fail("Final Expected " + cellValue + " is not present under column header " + header);
        }
    }

    public static void verifyGridRowValues(WebElement gridElement, String cellValue, String header, List<Field> fields) throws Throwable {

        int foundCount = 0;
        int row = 0;
        int colIndex = 0;
        boolean rowExist = false;
        WebElement clickableRow = null;
        int count = 0;
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        focusWebElement(gridElement);
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        int pageCount = getPageCount(gridElement);

        for (int j = pageCount; j > 0; j--) {
            //Fetch rows
            List<WebElement> fixRow = new ArrayList<WebElement>();

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                colIndex = 0;
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    colIndex++;
                    focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    if ((getTextAndByPassException(td).trim().equalsIgnoreCase(cellValue.trim()) || cellValue.trim().equalsIgnoreCase(getTextAndByPassException(td).trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        try {
                            fixRow.add(BrowserDriver.getParent(td));
//                            td.click();
                        } catch (Exception se) {
                        }
                        rowExist = true;
                    }
                }
            }

            for (WebElement ele : fixRow) {
                List<WebElement> cells = ele.findElements(By.cssSelector("td.x-grid-cell"));
                row = 0;
                foundCount = 0;
                for (WebElement cell : cells) {
                    row = row + 1;
                    focusWebElement(cells.get(cells.size() - 1));
                    focusWebElement(cell);
                    focusWebElement(headers.get(row - 1));

                    if (headers.get(row - 1).getText().trim().length() == 0) {
                        row = row + 1;
                    }

                    if (headers.get(row - 1).getText().trim().length() > 0) {
                        for (Field f : fields) {
                            if (f.getValue().contains("[CURRENT DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(0));
                            } else if (f.getValue().contains("[CURRENT END DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(-1));
                            }
                            if ((getTextAndByPassException(cell).trim().contains(GenericEntityView.convertToFormatPattern(f.getValue().trim()).trim()) || f.getValue().contains(GenericEntityView.convertToFormatPattern(getTextAndByPassException(cell)).trim())) && headers.get(row - 1).getText().trim().equals(f.getName().trim())) {
                                logger.info("Value :" + getTextAndByPassException(cell) + ":" + f.getValue() + "  -  Header :" + headers.get(row - 1).getText().trim() + " - " + (f.getName()));
                                foundCount++;
                                break;
                            }
                        }
                    }
                }

                if (foundCount == fields.size()) {
                    try {
                        count = foundCount;
                        clickableRow = ele;
                        logger.info("Final Expected " + cellValue + " is present under column header " + header);
                        focusWebElement(clickableRow);
                        clickableRow.click();
                    } catch (Exception e) {
                        try {
                            clickableRow.click();
                        } catch (Exception se) {
                        }
                    }
                }
            }
            if (!(count == fields.size())) {
                clickPage("Next Page");
            }
            waitTillDivisionLoads();
            waitTillDivisionLoads();
        }

        if (!(count == fields.size())) {
            logger.info("Final Expected " + cellValue + " is not present under column header " + header);
            BaseView.takeScreenshot("Final Expected " + cellValue + " is not present under column header " + header + ".png");
            fail("Final Expected " + cellValue + " is not present under column header " + header);
        }
    }

    public static void extractFieldValue(WebElement gridElement, String cellValue, String header,String strExtractFieldValue) throws Throwable {

        int foundCount = 0;
        int row = 0;
        int colIndex = 0;
        boolean rowExist = false;
        WebElement clickableRow = null;
        int count = 0;
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);

        focusWebElement(gridElement);
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        int pageCount = getPageCount(gridElement);

        for (int j = pageCount; j > 0; j--) {
            //Fetch rows
            List<WebElement> fixRow = new ArrayList<WebElement>();

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                colIndex = 0;
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    colIndex++;
                    focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    if ((getTextAndByPassException(td).trim().equalsIgnoreCase(cellValue.trim()) || cellValue.trim().equalsIgnoreCase(getTextAndByPassException(td).trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        try {
                            fixRow.add(BrowserDriver.getParent(td));
                            td.click();
                        } catch (Exception se) {
                        }
                        rowExist = true;
                    }
                }
            }

            for (WebElement ele : fixRow) {
                List<WebElement> cells = ele.findElements(By.cssSelector("td.x-grid-cell"));
                row = 0;
                foundCount = 0;
                for (WebElement cell : cells) {
                    row = row + 1;
                    focusWebElement(cells.get(cells.size() - 1));
                    focusWebElement(cell);
                    focusWebElement(headers.get(row - 1));

                    if (headers.get(row - 1).getText().trim().length() == 0) {
                        row = row + 1;
                    }

                    if (headers.get(row - 1).getText().trim().length() > 0) {

//                        for (Field f : fields) {
//                            if (f.getValue().contains("[CURRENT DATE]")) {
//                                f.setValue(SeleniumUtil.addDaystoCurrentDate(0));
//                            } else if (f.getValue().contains("[CURRENT END DATE]")) {
//                                f.setValue(SeleniumUtil.addDaystoCurrentDate(-1));
//                            }
                        if(strExtractFieldValue.equalsIgnoreCase(headers.get(row - 1).getText().trim())){
                            GenericSteps.lxRecID=getTextAndByPassException(cell).trim();
                        }
//                            if ((getTextAndByPassException(cell).trim().contains(GenericEntityView.convertToFormatPattern(f.getValue().trim()).trim()) || f.getValue().contains(GenericEntityView.convertToFormatPattern(getTextAndByPassException(cell)).trim())) && headers.get(row - 1).getText().trim().equals(f.getName().trim())) {
//                                logger.info("Value :" + getTextAndByPassException(cell) + ":" + f.getValue() + "  -  Header :" + headers.get(row - 1).getText().trim() + " - " + (f.getName()));
//                                foundCount++;
//                                break;
//                            }
//                        }

                    }
                }
            }
        }
    }

    public static void clickOnPencil() throws Throwable {
        try {
            SeleniumUtil.click("cssselector", "img[src='/en/img/pencil.png']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("Click on Pencil image.png");
            fail("pencel image does not exist !!!");
        }
    }

    public static void clickOnGreenRightMark() throws Throwable {
        try {
            SeleniumUtil.click("cssselector", "span[style*='/img/approve.png']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("Click on Green check image.png");
            fail("Green check image does not exist !!!");
        }
    }


    public static void clickLineItem(String gridID, String cellValue, String header, String cellValue1, String header1) throws Throwable {

        int foundCount = 0;
        int row = 0;
        int colIndex = 0;
        boolean rowExist = false;
        WebElement clickableRow = null;
        int count = 0;
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        int pageCount = getPageCount(gridElement);

        for (int j = pageCount; j > 0; j--) {
            //Fetch rows
            List<WebElement> fixRow = new ArrayList<WebElement>();

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                colIndex = 0;
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    colIndex++;
                    focusWebElement(td);
                    if ((getTextAndByPassException(td).trim().contains(cellValue.trim()) || cellValue.trim().contains(getTextAndByPassException(td).trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        if (cellValue1.equalsIgnoreCase("") && header1.equalsIgnoreCase("")) {
                            tr.findElement(By.cssSelector("img[alt='Approve']")).click();
                            rowExist = true;
                        } else {
                            try {
                                colIndex = 0;
                                for (WebElement td2 : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                                    colIndex++;
                                    if ((getTextAndByPassException(td2).trim().contains(cellValue1.trim()) || cellValue1.trim().contains(getTextAndByPassException(td2).trim())) && headers.get(colIndex - 1).getText().trim().equals(header1.trim())) {
                                        fixRow.add(BrowserDriver.getParent(td));
                                        tr.findElement(By.cssSelector("img[alt='Approve']")).click();
                                        rowExist = true;
                                    }
                                }

                            } catch (Exception se) {
                            }
                        }
                    }
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    if (rowExist) break;
                }
                if (rowExist) break;
            }

            if (!rowExist) {
                for (int i = 0; i < 6; i++) {
                    try {
                        SeleniumUtil.click("cssselector", "span[class=\"x-btn-icon-el x-btn-icon-el-default-toolbar-small x-tbar-page-next \"]", SeleniumUtilities.OBJWAITTIMEOUT);
                    } catch (Exception e) {
                    }

                    gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
                    headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                    //Fetch rows
                    fixRow = new ArrayList<WebElement>();
                    for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                        colIndex = 0;

                        for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                            //SeleniumUtilities.waitForNonStaleWebElement(td);
                            colIndex++;
                            /*if ((td.getText().trim().contains(cellValue.trim()) || cellValue.trim().contains(td.getText().trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                                fixRow.add(BrowserDriver.getParent(td));
                                rowExist = true;
                            }*/

                            if ((getTextAndByPassException(td).trim().contains(cellValue.trim()) || cellValue.trim().contains(getTextAndByPassException(td).trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                                fixRow.add(BrowserDriver.getParent(td));
                                rowExist = true;
                            }
                        }
                    }
                    if (rowExist) break;
                }
            }
        }
    }

    public static void viewMainGrid(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {

        int foundCount = 0;
        int row = 0;
        int colIndex = 0;
        boolean rowExist = false;
        WebElement clickableRow = null;
        int count = 0;
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        //Fetch rows
        List<WebElement> fixRow = new ArrayList<WebElement>();

        for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
            colIndex = 0;
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                colIndex++;
                focusWebElement(td);
                SeleniumUtilities.waitForNonStaleWebElement(td);
                if ((td.getText().trim().contains(cellValue.trim()) || cellValue.trim().contains(td.getText().trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                    try {
                        fixRow.add(BrowserDriver.getParent(td));
                    } catch (Exception se) {
                    }
                    rowExist = true;
                }
            }
        }

        if (!rowExist) {
            for (int i = 0; i < 6; i++) {
                try {
                    SeleniumUtil.click("cssselector", "span[class=\"x-btn-icon-el x-btn-icon-el-default-toolbar-small x-tbar-page-next \"]", SeleniumUtilities.OBJWAITTIMEOUT);
                } catch (Exception e) {
                }

                gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
                headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                //Fetch rows
                fixRow = new ArrayList<WebElement>();
                for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                    colIndex = 0;

                    for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                        //SeleniumUtilities.waitForNonStaleWebElement(td);
                        colIndex++;
                        if ((td.getText().trim().contains(cellValue.trim()) || cellValue.trim().contains(td.getText().trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                            fixRow.add(BrowserDriver.getParent(td));
                            rowExist = true;
                        }
                    }
                }
                if (rowExist) break;
            }
        }

        int rowNumber = 0;
        for (WebElement ele : fixRow) {
            rowNumber++;
            List<WebElement> cells = ele.findElements(By.cssSelector("td.x-grid-cell"));
            row = 0;
            foundCount = 0;
            for (WebElement cell : cells) {
                row = row + 1;
                focusWebElement(cells.get(cells.size() - 1));
                focusWebElement(cell);
                //boolean boolFieldExist = false;
                logger.info("Row number " + rowNumber + "....\n");
                for (Field f : fields) {
                    if (f.getValue().equals("Today's Date")) {
                        logger.info(ReportsView.getCurrentDate());
                        f.setValue(GenericEntityView.convertToFormatPattern(ReportsView.getCurrentDate()));
                    }
                    if ((cell.getText().contains(GenericEntityView.convertToFormatPattern(f.getValue())) || f.getValue().contains(GenericEntityView.convertToFormatPattern(cell.getText()))) && headers.get(row - 1).getText().trim().equals(f.getName())) {
                        System.out.print(cell.getText() + ":" + f.getValue() + "  -  " + headers.get(row - 1).getText().trim() + " PPPP " + (f.getName()));
                        foundCount++;
                        logger.info("Expected column value : " + f.getValue() + "Application value : " + getTextAndByPassException(cell) + "\n");
                        break;
                    }
                    //if (boolFieldExist) break;
                }
            }

            if (foundCount == fields.size()) {
                try {
                    count = foundCount;
                    clickableRow = ele;
                    logger.info("Final Expected " + cellValue + " is present under column header " + header);
                    focusWebElement(clickableRow);
                } catch (Exception e) {
                    try {
                        clickableRow.click();
                    } catch (Exception se) {
                    }
                }
            }
        }

        if (!(count == fields.size())) {
            logger.info("Final Expected " + cellValue + " is not present under column header " + header);
            BaseView.takeScreenshot("Final Expected " + cellValue + " is not present under column header " + header + ".png");
            fail("Final Expected " + cellValue + " is not present under column header " + header);
        }
    }

    public static void clickImportantGridRow(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {
        int finalCount = 0;
        int getRow = 0;
        GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        //SeleniumUtil.getWebElementObject("cssselector", strElement);
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        int pageCount = getPageCount(gridElement);

        for (int page = pageCount; page > 0; page--) {

            Map<Integer, List<String>> cellValues = new HashMap<Integer, List<String>>();
            int tables = gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size();

            int staleElementCount = 0;
            int rowCount = 0;

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']"))) {
                String cell = "";
                List<String> columnValues = new ArrayList<String>();
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    do {
                        try {
                            cell = td.getText();
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

            if (tables > 0) {
                for (int i = 0; i < cellValues.size(); i++) {
                    foundCount = 0;
                    for (int j = 0; j < cellValues.get(i).size(); j++) {
                        for (Field f : fields) {
                            if (f.getValue().contains("[CURRENT DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(0));
                            } else if (f.getValue().contains("[CURRENT END DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(-1));
                            }
                            if (cellValues.get(i).get(j).contains(f.getValue()) &&
                                    headers.get(j).getText().equals(f.getName())) {
                                foundCount++;
                            }
                        }
                    }

                    if (foundCount == fields.size()) {
                        finalCount = foundCount;
                        getRow = i;
                    }
                }
            }
            clickPage("Next Page");
            waitTillDivisionLoads();
            waitTillDivisionLoads();
        }

        if (!(finalCount == fields.size())) {
            logger.info("Final Expected value is not present under column header");
            BaseView.takeScreenshot("Final Expected " + cellValue + " is not present under column header " + header + ".png");
            fail("Final Expected value is not present under column header");
        } else {
            try {
                gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).get(getRow).click();
                gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).
                        get(getRow).findElement(By.tagName("div")).click();
            } catch (Exception e) {
            }
        }
    }

    public static void clickImportantGridRow(WebElement gridElement, String cellValue, String header, List<Field> fields) throws Throwable {
        int finalCount = 0;
        int getRow = 0;
        GenericEntityView.convertToFormatPattern(cellValue);
      /*  String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
*/
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        int pageCount = getPageCount(gridElement);

        for (int page = pageCount; page > 0; page--) {

            Map<Integer, List<String>> cellValues = new HashMap<Integer, List<String>>();
            int tables = gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size();

            int staleElementCount = 0;
            int rowCount = 0;

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']"))) {
                String cell = "";
                List<String> columnValues = new ArrayList<String>();
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    do {
                        try {
                            cell = td.getText();
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

            if (tables > 0) {
                for (int i = 0; i < cellValues.size(); i++) {
                    foundCount = 0;
                    for (int j = 0; j < cellValues.get(i).size(); j++) {
                        for (Field f : fields) {
                            if (f.getValue().contains("[CURRENT DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(0));
                            } else if (f.getValue().contains("[CURRENT END DATE]")) {
                                f.setValue(SeleniumUtil.addDaystoCurrentDate(-1));
                            }
                            if (cellValues.get(i).get(j).contains(f.getValue()) &&
                                    headers.get(j).getText().equals(f.getName())) {
                                foundCount++;
                            }
                        }
                    }

                    if (foundCount == fields.size()) {
                        finalCount = foundCount;
                        getRow = i;
                    }
                }
            }

            clickPage (gridElement,"Next Page");
            waitTillDivisionLoads();
            waitTillDivisionLoads();
        }

        if (!(finalCount == fields.size())) {
            logger.info("Final Expected value is not present under column header");
            BaseView.takeScreenshot("Final Expected " + cellValue + " is not present under column header " + header + ".png");
            fail("Final Expected value is not present under column header");
        } else {
            try {
                gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).
                        get(getRow).findElement(By.tagName("div")).click();

            } catch (Exception e) {
                try {
                    gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).get(getRow).click();
                } catch (Exception e1) {
                }
            }
        }
    }

    public static void viewImportantGridRow(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {

        GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        Map<Integer, List<String>> cellValues = new HashMap<Integer, List<String>>();
        int tables = gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size();

        int staleElementCount = 0;
        int rowCount = 0;

        for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']"))) {
            String cell = "";
            List<String> columnValues = new ArrayList<String>();
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                focusWebElement(td);
                SeleniumUtilities.waitForNonStaleWebElement(td);
                do {
                    try {
                        cell = td.getText();
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
        int getRow = 0;

        if (tables > 0) {
            for (int i = 0; i < cellValues.size(); i++) {
                foundCount = 0;
                logger.info("Row number " + i + "....\n");
                for (int j = 0; j < cellValues.get(i).size(); j++) {
                    for (Field f : fields) {
                        if (f.getValue().equals("Today's Date")) {
                            f.setValue(GenericEntityView.convertToFormatPattern(ReportsView.getCurrentDate()));
                        }
                        if (cellValues.get(i).get(j).contains(f.getValue()) &&
                                headers.get(j).getText().contains(f.getName())) {
                            foundCount++;
                        }
                        logger.info("Expected column value :" + f.getValue() + "Application value :" + cellValues.get(i).get(j) + "\n");
                    }
                }

                if (foundCount == fields.size()) {
                    finalCount = foundCount;
                    getRow = i;
                }
            }
        }

        if (!(finalCount == fields.size())) {
            logger.info("Final Expected value is not present under column header");
            BaseView.takeScreenshot("Final Expected " + cellValue + " is not present under column header " + header + ".png");
            fail("Final Expected value is not present under column header");
        }
    }

    public static void clickOffsetAmount(String amount) {
        try {
            BrowserDriver.getCurrentDriver().findElement(By.xpath("//*[@id='OffsetPaymentLink']/i[text()='" + amount + "']")).click();
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnReported.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void verifyUserMsg(String arg1) throws Throwable {
        try {
            CommonMethods.switchToVisibleFrameQuick();
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 60);
            wait.until(ExpectedConditions.textToBePresentInElement(By.id("userMsg"), arg1));
            logger.info("Verified : " + arg1);
        } catch (Exception e) {
            BaseView.takeScreenshot(arg1 + ".png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void viewUniqueGrid(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        if (gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size() > 0) {
            viewImportantGridRow(gridID, cellValue, header, fields);
        } else {
            viewMainGrid(gridID, cellValue, header, fields);
        }
    }

    public static void clickGridLineItemsManyPage(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {

        int foundCount = 0;
        int row = 0;
        int colIndex = 0;
        WebElement clickableRow = null;
        int count = 0;
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        int pageCount = getPageCount(gridElement);

        for (int i = pageCount; i > 0; i--) {
            //Fetch rows
            List<WebElement> fixRow = new ArrayList<WebElement>();

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                colIndex = 0;
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    colIndex++;
                    focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    if ((td.getText().trim().contains(cellValue.trim()) || cellValue.trim().contains(td.getText().trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        try {
                            fixRow.add(BrowserDriver.getParent(td));
                            td.click();
                        } catch (Exception se) {
                        }
                    }
                }
            }

            for (WebElement ele : fixRow) {
                List<WebElement> cells = ele.findElements(By.cssSelector("td.x-grid-cell"));
                row = 0;
                foundCount = 0;
                for (WebElement cell : cells) {
                    row = row + 1;
                    focusWebElement(cells.get(cells.size() - 1));
                    focusWebElement(cell);
                    for (Field f : fields) {
                        if ((cell.getText().contains(GenericEntityView.convertToFormatPattern(f.getValue())) || f.getValue().contains(GenericEntityView.convertToFormatPattern(cell.getText()))) && headers.get(row - 1).getText().trim().equals(f.getName())) {
                            System.out.print(cell.getText() + ":" + f.getValue() + "  -  " + headers.get(row - 1).getText().trim() + " PPPP " + (f.getName()));
                            foundCount++;
                            break;
                        }
                    }
                }

                if (foundCount == fields.size()) {
                    try {
                        count = foundCount;
                        clickableRow = ele;
                        logger.info("Final Expected " + cellValue + " is present under column header " + header);
                        focusWebElement(clickableRow);
                        clickableRow.click();
                    } catch (Exception e) {
                        try {
                            clickableRow.click();
                        } catch (Exception se) {
                        }
                    }
                }
            }
            clickPage("Next Page");
            waitTillDivisionLoads();
            waitTillDivisionLoads();
        }

        if (!(count == fields.size())) {
            logger.info("Final Expected " + cellValue + " is not present under column header " + header);
            fail("Final Expected " + cellValue + " is not present under column header " + header);
        }
    }

    public static int getPageCount(WebElement grid) throws Throwable {
        BaseView.pushShortTimeout(2);
        try {
            clickPage(grid, "First Page");
            waitTillDivisionLoads();
            waitTillDivisionLoads();
        } catch (Exception e) {
        }
        if (grid.findElements(By.cssSelector("div[class*='x-tbar-page-number']+div[id^='tbtext']")).size() > 0) {
            try {
                BaseView.popDefaultTimeout();
                return Integer.parseInt(
                        grid.findElement(By.cssSelector("div[class*='x-tbar-page-number']+div[id^='tbtext']")).getText()
                                .replace("of ", ""));
            } catch (Exception e) {
                BaseView.popDefaultTimeout();
                return 1;
            }

        } else
            BaseView.popDefaultTimeout();
        return 1;
    }

    public static int getTotalItemsCount(WebElement grid) throws Throwable {
        try {
            String array[] = grid.findElements(By.cssSelector(".x-toolbar-text.x-box-item.x-toolbar-item.x-toolbar-text-default")).get(2)
                    .getText().split("of ");
            return Integer.parseInt(array[1]);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch display item count.png");
        }
        return 0;
    }

    public static int getItemsDisplayCount(WebElement grid) throws Throwable {
        try {
            String array[] = grid.findElements(By.cssSelector(".x-toolbar-text.x-box-item.x-toolbar-item.x-toolbar-text-default")).get(2)
                    .getText().split("of ");
            String array2[] = array[1].split("-");
            return Integer.parseInt(array2[1].trim());
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch display item count.png");
        }
        return 0;
    }


    public static String getTextAndByPassException(WebElement td) throws Throwable {
        int staleElementCount = 0;
        String cell = "";
        do {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), SeleniumUtilities.WAIT_TIME);
                try {
                    wait.until(ExpectedConditions.not(ExpectedConditions.stalenessOf(td)));
                } catch (Exception e) {
                }

                cell = td.getText();
                SeleniumUtil.Log.info(cell);
                break;
            } catch (TimeoutException te) {
                staleElementCount++;
            } catch (StaleElementReferenceException se) {
                staleElementCount++;
            } catch (Exception e) {
                staleElementCount++;
            }
        } while (!(staleElementCount > 10));
        return cell;
    }

    public static void enterTextAndHitEnterKey(String strSearchTxt) throws Throwable {
        try {
            SeleniumUtil.type("cssselector", "input[name^='ext-comp-'][name$='-inputEl']", strSearchTxt, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.hitEnterKey("cssselector", "input[name^='ext-comp-'][name$='-inputEl']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnReported.png");
            logger.info("Error :" + ex.getMessage());
        }

    }

    public static WebElement getUniqueGridRow(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        if (gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size() > 0) {
            return getImportantGridRow(gridID, cellValue, header, fields);
        } else {
            return getMainGridRow(gridID, cellValue, header, fields);
        }
    }

    public static WebElement getImportantGridRow(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {
        int finalCount = 0;
        int getRow = 0;
        GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        int pageCount = getPageCount(gridElement);

        for (int page = pageCount; page > 0; page--) {

            Map<Integer, List<String>> cellValues = new HashMap<Integer, List<String>>();
            int tables = gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size();

            int staleElementCount = 0;
            int rowCount = 0;

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']"))) {
                String cell = "";
                List<String> columnValues = new ArrayList<String>();
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    do {
                        try {
                            cell = td.getText();
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
            for (int i = 0; i < cellValues.size(); i++) {
                foundCount = 0;
                for (int j = 0; j < cellValues.get(i).size(); j++) {
                    for (Field f : fields) {
                        if (cellValues.get(i).get(j).contains(f.getValue()) &&
                                headers.get(j).getText().equals(f.getName())) {
                            foundCount++;
                        }
                    }
                }

                if (tables > 0) {

                    if (foundCount == fields.size()) {
                        finalCount = foundCount;
                        getRow = i;
                    }
                }
            }
            clickPage("Next Page");
            waitTillDivisionLoads();
            waitTillDivisionLoads();
        }

        if (!(finalCount == fields.size())) {
            logger.info("Final Expected value is not present under column header");
            BaseView.takeScreenshot("Final Expected " + cellValue + " is not present under column header " + header + ".png");
            fail("Final Expected value is not present under column header");
        } else {
            try {
                gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).get(getRow).click();
            } catch (Exception e) {
            }
        }
        return gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).get(getRow);
    }


    public static WebElement getMainGridRow(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {

        int foundCount = 0;
        int row = 0;
        int colIndex = 0;
        boolean rowExist = false;
        WebElement clickableRow = null;
        int count = 0;
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        int pageCount = getPageCount(gridElement);

        for (int j = pageCount; j > 0; j--) {
            //Fetch rows
            List<WebElement> fixRow = new ArrayList<WebElement>();

            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                colIndex = 0;
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    colIndex++;
                    focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    if ((getTextAndByPassException(td).trim().contains(cellValue.trim()) || cellValue.trim().contains(getTextAndByPassException(td).trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        try {
                            fixRow.add(BrowserDriver.getParent(td));
                            td.click();
                        } catch (Exception se) {
                        }
                        rowExist = true;
                    }
                }
            }

            if (!rowExist) {
                for (int i = 0; i < 6; i++) {
                    try {
                        SeleniumUtil.click("cssselector", "span[class=\"x-btn-icon-el x-btn-icon-el-default-toolbar-small x-tbar-page-next \"]", SeleniumUtilities.OBJWAITTIMEOUT);
                    } catch (Exception e) {
                    }

                    gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
                    headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                    //Fetch rows
                    fixRow = new ArrayList<WebElement>();
                    for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
                        colIndex = 0;

                        for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                            colIndex++;

                            if ((getTextAndByPassException(td).trim().contains(cellValue.trim()) || cellValue.trim().contains(getTextAndByPassException(td).trim())) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                                fixRow.add(BrowserDriver.getParent(td));
                                rowExist = true;
                            }
                        }
                    }
                    if (rowExist) break;
                }
            }

            for (WebElement ele : fixRow) {
                List<WebElement> cells = ele.findElements(By.cssSelector("td.x-grid-cell"));
                row = 0;
                foundCount = 0;
                for (WebElement cell : cells) {
                    row = row + 1;
                    focusWebElement(cells.get(cells.size() - 1));
                    focusWebElement(cell);
                    for (Field f : fields) {
                        if ((getTextAndByPassException(cell).contains(GenericEntityView.convertToFormatPattern(f.getValue())) || f.getValue().contains(GenericEntityView.convertToFormatPattern(getTextAndByPassException(cell)))) && headers.get(row - 1).getText().trim().equals(f.getName())) {
                            System.out.print(getTextAndByPassException(cell) + ":" + f.getValue() + "  -  " + headers.get(row - 1).getText().trim() + " PPPP " + (f.getName()));
                            foundCount++;
                            break;
                        }
                    }
                }

                if (foundCount == fields.size()) {
                    try {
                        count = foundCount;
                        clickableRow = ele;
                        logger.info("Final Expected " + cellValue + " is present under column header " + header);
                        focusWebElement(clickableRow);
                        clickableRow.click();
                    } catch (Exception e) {
                        try {
                            clickableRow.click();
                        } catch (Exception se) {
                        }
                    }
                }
            }
            clickPage("Next Page");
            waitTillDivisionLoads();
            waitTillDivisionLoads();
        }

        if (!(count == fields.size())) {
            logger.info("Final Expected " + cellValue + " is not present under column header " + header);
            BaseView.takeScreenshot("Final Expected " + cellValue + " is not present under column header " + header + ".png");
            fail("Final Expected " + cellValue + " is not present under column header " + header);
        }
        return clickableRow;
    }

    public static void selectRadioButton(String strLoctor) throws Throwable {
        try {
            SeleniumUtil.click("cssselector", strLoctor, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
        } catch (Exception ex) {
            BaseView.takeScreenshot("ExpandError.png");
            Assert.fail("Unable to select transaction radio button !!!! " + ex.getMessage());
        }
    }

    public static void disablePaymentApproval() throws Throwable {
        try {
//            SeleniumUtil.click("id", "numberOfApproversDisabled-btnWrap", SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
            SeleniumUtil.click("id", "Firm_NumberOfPTApprovalLevelsDisabled-btnInnerEl", SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
        } catch (Exception ex) {
            BaseView.takeScreenshot("ExpandError.png");
            Assert.fail("Unable to disable Payment Approval!!!! " + ex.getMessage());
        }
    }

    public static void verifyErrorMsg(String strMsg) throws Throwable {
        try {
            SeleniumUtil.verifyTextValue("cssselector", "div[class='x-component x-window-text x-box-item x-component-default']", strMsg, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
        } catch (Exception ex) {
            BaseView.takeScreenshot("ExpandError.png");
            Assert.fail("Unable to disable Payment Approval!!!! " + ex.getMessage());
        }
    }

    public static void changeStatus(String gridID, String cellValue, String header, List<Field> fields, String action) throws Throwable {
        AllContractPagesView.getUniqueGridRow(gridID, cellValue, header, fields).findElement(By.cssSelector("img[src='/en/img/" + action + ".png']")).click();
        CommonMethods.waitTillDivisionLoads();
    }

    public static void changeStatusForAllRows(String gridID, String status) throws Throwable {

        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                gridElement.findElement(By.cssSelector("img[src='../img/down.gif']")).click();
                CommonMethods.clickButton(status);
                break;
            } catch (Exception e) {
                if (i == 10) {
                    BaseView.takeScreenshot("UnableToSort.png");
                    logger.info("Error :" + e.getMessage());
                    fail(e.getMessage());
                }
            }
        }
    }

    public static void selectFiscalDetailsRadio() {
        try {
            SeleniumUtil.click("cssselector", "input[name='SLPeriodComposite'][value='true']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("selectFiscalDetailsRadio");
            Assert.fail("Unable to select Fiscal Details Radio!!!! " + ex.getMessage());
        }
    }

    public static void amountDue() {
        try {
            SeleniumUtil.click("cssselector", "div#divExpenseRecoveryPrepaidAmount>img", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnReported.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void clickOnStepNextEditLink(String strStepEditLink) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//font[contains(.,'"+strStepEditLink+"')]/following-sibling::a",10,SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//font[contains(.,'"+strStepEditLink+"')]/following-sibling::a", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnStepNextEditLink");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void selectAvailableField(String strSelectField,String strField) {
        try {
            strField="Contract_"+strField+"ID_";
            SeleniumUtil.select("cssselector","select[name^='"+strField+"']", strSelectField, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
                BaseView.takeScreenshot("selectAvailableField");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void clickOnMoveButton(String strMoveButton) {
        try {
            SeleniumUtil.click("cssselector", "input[value='"+strMoveButton+"']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("selectAvailableField");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void clickOnFinishButton() {
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector", "input[value='FINISH']", 6, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", "input[value='FINISH']", SeleniumUtilities.OBJWAITTIMEOUT);
            if(SeleniumUtil.waitForElementVisibilityOf("cssselector", "input[value='FINISH']", 2,SeleniumUtilities.OBJWAITTIMEOUT)) {
                SeleniumUtil.click("cssselector", "input[value='FINISH']", SeleniumUtilities.OBJWAITTIMEOUT);
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnFinishButton");
            junit.framework.Assert.fail(ex.getMessage());
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void clickOnSaveAndRunReport() {
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector", "input[value='Save and Run Report']", 6, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", "input[value='Save and Run Report']", SeleniumUtilities.OBJWAITTIMEOUT);
            if(SeleniumUtil.waitForElementVisibilityOf("cssselector", "input[value='Save and Run Report']", 2,SeleniumUtilities.OBJWAITTIMEOUT)) {
                SeleniumUtil.click("cssselector", "input[value='Save and Run Report']", SeleniumUtilities.OBJWAITTIMEOUT);
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnSaveAndRunReport");
            junit.framework.Assert.fail(ex.getMessage());
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void verifyRelatedContractAllReport(int col,String strLocation,String strContractName,String strFacility) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//table[@class='linedTable']/tbody/tr[2]/td[1]/a[" + col + "]", 6,2);
            junit.framework.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//table[@class='linedTable']/tbody/tr[2]/td[1]/a[" + col + "]", strLocation, SeleniumUtilities.OBJWAITTIMEOUT));
            junit.framework.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//table[@class='linedTable']/tbody/tr[2]/td[2]/a[" + col + "]", strContractName, SeleniumUtilities.OBJWAITTIMEOUT));
            junit.framework.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath",".//table[@class='linedTable']/tbody/tr[2]/td[3]/a["+col+"]",strFacility,SeleniumUtilities.OBJWAITTIMEOUT));

        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyRelatedContractAllReport");
            junit.framework.Assert.fail(ex.getMessage());
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void verifyScheduleValuesBottomPage(List<Field> fields) throws Throwable {
        List<String> labels = new ArrayList<>();
        for (Field f:fields){
            WebElement ele = BrowserDriver.getCurrentDriver().findElement(By.xpath("//*[text()='"+f.getName()+"']"));
            labels.add(AllContractPagesView.getTextAndByPassException(BrowserDriver.getParent(ele)).trim());
        }

        for(int i =0;i<labels.size();i++){
            BaseView.takeScreenshot("Unexpected values at the bottom of the page.png");
            assertTrue("Unexpected values "+labels.get(i)+" at the bottom of the page \n expected "+fields.get(i).getValue(), labels.get(i).contains(fields.get(i).getValue()));
        }
    }

    public static void selectTransactions(List<String> transactions) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        for (String transaction : transactions) {
            try {
                SeleniumUtil.click("xpath", "//td//div[contains(text(),'" + transaction + "')]/parent::td/preceding-sibling::td//div/div",
                        SeleniumUtilities.OBJWAITTIMEOUT);

            } catch (Exception e) {
                logger.info("Unable to select the transaction "+transaction);
                BaseView.takeScreenshot("Unable to select the transaction "+transaction+" .png");
                fail("Unable to select the transaction "+transaction+" "+e.getMessage());
            }
        }
    }


    public static void closePortfolioItems() {
        try {
            for (WebElement closeTagField : SeleniumUtil.getWebElementObjects("cssselector", "div.x-tagfield-item-close ", 5, SeleniumUtilities.OBJWAITTIMEOUT)) {
                SeleniumUtil.click(closeTagField, SeleniumUtilities.OBJWAITTIMEOUT);
            }
        }
        catch(Exception ex){
            BaseView.takeScreenshot("Unable to close portfolioItems");
            fail("Unable to close portfolioItems "+ex.getMessage());
        }
    }

    public static int getPageCount() throws Throwable {
        try {
            clickPage("First Page");
            waitTillDivisionLoads();
            waitTillDivisionLoads();
        } catch (Exception e) {
        }
        if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[class*='x-tbar-page-number']+div[id^='tbtext']")).size() > 0) {
            try {
                return Integer.parseInt(
                        BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[class*='x-tbar-page-number']+div[id^='tbtext']")).getText()
                                .replace("of ", ""));
            } catch (Exception e) {
                return 1;
            }

        } else
            return 1;
    }

    public static void findUniqueGrid(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {
        cellValue = GenericEntityView.convertToFormatPattern(cellValue);
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        WebElement gridElement = SeleniumUtil.getElement("cssselector",strElement,5,SeleniumUtilities.OBJWAITTIMEOUT); //BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        try {
            BaseView.pushShortTimeout();
            if (gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size() > 0) {
                clickImportantGridRow(gridElement, cellValue, header, fields);
            } else {
                clickMainGrid(gridElement, cellValue, header, fields);
            }
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void verifyRadioButton(String strDescrition,String boolFlag) {
        try {
            if (boolFlag.equalsIgnoreCase("true")) {
                junit.framework.Assert.assertTrue(SeleniumUtil.getWebElementObject("cssselector", strDescrition).isSelected());
                logger.info(boolFlag.trim() + " radio button selected");
            } else {
                assertFalse(SeleniumUtil.getWebElementObject("cssselector", strDescrition).isSelected());
                logger.info(boolFlag.trim() + " radio button selected");
            }
        }
        catch(Exception ex){
            BaseView.takeScreenshot("verifyRadioButton");
            fail("verifyRadioButton "+ex.getMessage());
        }
    }

    public static void getTermEntityIDFromReport(String entityName) throws Throwable{
        try {
            CommonMethods.waitTillDivisionLoads();
            String entityID = SeleniumUtil.getElementText("xpath","//td//*[text()='"+entityName+"']//parent::td//following-sibling::td[2]",1);
            String s[]= entityID.split("\n");
            GenericSteps.lxRecID = s[1].trim();
            logger.info("Fetched entity ID " + GenericSteps.lxRecID);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch entity ID.png");
            Assert.fail("Unable to fetch entity ID ");
        }
    }

    public static void getVariableOffsetIDFromReport(String entityName) throws Throwable{
        try {
            CommonMethods.waitTillDivisionLoads();
            String entityID = SeleniumUtil.getElementText("xpath","//td//*[text()='"+entityName+"']//parent::td//following-sibling::td[3]",1);
            String s[]= entityID.split("\n");
            GenericSteps.lxRecID = s[0].trim();
            logger.info("Fetched entity ID " + GenericSteps.lxRecID);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch entity ID.png");
            Assert.fail("Unable to fetch entity ID ");
        }
    }

    @And("^I verify the following recovery fields value on editable page$")
    public void I_verify_the_following_recovery_fields_on_editable_page(List<Field> fields) {
        for (Field f : fields) {
            try {
                assertTrue("Expected " + f.getValue() + "but found" + BrowserDriver.getCurrentDriver().findElement(By.id(f.getName())).getText(),
                        BrowserDriver.getCurrentDriver().findElement(By.id(f.getName())).getText()
                                .trim()
                                .contains(f.getValue().trim()));

            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    public static void getEntityIDFromReportForParticularColumn(String columnName, String entityName, int rowNum) throws Throwable{
        try {
            CommonMethods.waitTillDivisionLoads();
            int size = BrowserDriver.getCurrentDriver().findElements(By.xpath("//tr//td[text()='"+columnName+"']/preceding-sibling::td")).size();
            String entityID = SeleniumUtil.getElementText("xpath","//td//*[text()='"+entityName+"']//parent::td//following-sibling::td["+size+"]",1);
            //String entityID = SeleniumUtil.getElementText("xpath","//td//*[text()='"+entityName+"']//parent::td//following-sibling::td["+(size-1)+"]",1);
            String ids[] = entityID.split("\n");
            GenericSteps.lxRecID = ids[rowNum-1];
            logger.info("Fetched entity ID " + GenericSteps.lxRecID);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch entity ID.png");
            Assert.fail("Unable to fetch entity ID ");
        }
    }

    public static int getRowsCountMultiplePage(String gridID) throws Throwable {
        String strElement = getGridElement(gridID);
        moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        int count = 0;
        String element = "";
        int pageCount = getPageCount(gridElement);

        for (int page = pageCount; page > 0; page--) {
            try {
                BaseView.pushShortTimeout();
                if (gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size() > 0) {
                    element = "tr[class*='!important'][class*='x-grid-row']";
                    count = count + gridElement.findElements(By.cssSelector(element)).size();
                } else if (gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']:not([class*='!important'])")).size() > 0) {
                    element = "tr[class*='x-grid-row']:not([class*='!important'])";
                    count = count + gridElement.findElements(By.cssSelector(element)).size();
                }
            } finally {
                BaseView.popDefaultTimeout();
            }
            clickPage(gridElement,"Next Page");
        }
        clickPage(gridElement,"First Page");
        return count;
    }

    public static void clickColumnAction(String gridID, String header, String rowAction) throws Throwable {
        try{
            SeleniumUtil.click("cssselector","div[id^='ext-comp'] [id$='-trigger-clear']",SeleniumUtilities.OBJWAITTIMEOUT);
        }catch(Exception ex){}

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']"));
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                Actions action = new Actions(BrowserDriver.getCurrentDriver());
                action.moveToElement(gridElement.findElement(By.xpath("//span[text()='" + header + "']"))).build().perform();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[text()='" + header + "']")));
                gridElement.findElement(By.xpath("//span[text()='" + header + "']")).click();
                gridElement.findElement(By.xpath("//span[text()='" + rowAction + "']")).click();
                waitTillDivisionLoads();
                break;
            } catch (Exception e) {
                if (i == 10) {
                    BaseView.takeScreenshot("UnableToSort.png");
                    logger.info("Error :" + e.getMessage());
                    fail(e.getMessage());
                }
            }
        }
    }

    public static void clickPage(WebElement gridElement, String page) throws Throwable{
        try {
            BaseView.pushShortTimeout(2);
            if (gridElement.findElement(By.cssSelector("a[data-qtip='" + page + "'] span[data-ref='btnIconEl']")).isEnabled()) {
                gridElement.findElement(By.cssSelector("a[data-qtip='" + page + "'] span[data-ref='btnIconEl']")).click();
                CommonMethods.waitTillDivisionLoads();
                CommonMethods.waitTillDivisionLoads();
            }
        } catch (Exception e) {
            BaseView.popDefaultTimeout();
            BaseView.takeScreenshot("UnableToClickNextPage.png");
        }finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void clickOnListInactive() throws Throwable{
        try {
         SeleniumUtil.click("cssselector","input[name='showActive'][value='false']",SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.popDefaultTimeout();
            BaseView.takeScreenshot("clickOnListInactive");
        }
    }

    public static void assignMemberToFormTask(String strLink,String strFormTask) throws Throwable{
        try {
            SeleniumUtil.click("xpath",".//*[./text()='"+strFormTask+"']/following-sibling::td/*[./text()='"+strLink+"']",SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.popDefaultTimeout();
            BaseView.takeScreenshot("assignMemberToFormTask");
        }
    }

    public static void clickColumnActionProjectManagement(String gridID, String header, String rowAction) throws Throwable {
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id='" + gridID + "']"));
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                Actions action = new Actions(BrowserDriver.getCurrentDriver());
                action.moveToElement(gridElement.findElement(By.xpath("//span[text()='" + header + "']"))).build().perform();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[text()='" + header + "']")));
                gridElement.findElement(By.xpath("//span[text()='" + header + "']")).click();
                gridElement.findElement(By.xpath("//span[text()='" + rowAction + "']")).click();
                waitTillDivisionLoads();
                break;
            } catch (Exception e) {
                if (i == 10) {
                    BaseView.takeScreenshot("UnableToSort.png");
                    logger.info("Error :" + e.getMessage());
                    fail(e.getMessage());
                }
            }
        }
    }


    public static void  artificialBreakpoint() throws Throwable {
        try{
            SeleniumUtil.click(allContractPages.artificialBreakpoint,SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("artificialBreakpoint");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static String getSubGridElement(String gridID) {
        String strElement;
        if (gridID.contains("^"))
            strElement = "div[id^='" + gridID.replace("^", "") + "']";
        else if (gridID.contains("*"))
            strElement = "div[id*='" + gridID.replace("^", "") + "']";
        else if (gridID.contains("$"))
            strElement = "div[id$='" + gridID.replace("$", "") + "']";
        else if (gridID.contains("."))
            strElement = gridID;
        else
            strElement = "div[id='" + gridID + "']";

        return strElement;
    }
}