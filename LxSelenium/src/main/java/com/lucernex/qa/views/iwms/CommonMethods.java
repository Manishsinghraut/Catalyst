package com.lucernex.qa.views.iwms;

import com.lucernex.qa.FileUtilities;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.*;
import com.lucernex.qa.steps.iwms.GenericSteps;
import com.lucernex.qa.utils.CucumberContext;
import com.lucernex.qa.utils.FileUpload;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.utils.Spreadsheet;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.HomeView;
import com.lucernex.qa.views.LoginView;
import com.lucernex.qa.views.components.LxModalWindow;
import com.lucernex.qa.views.components.PortfolioNavigationView;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.contract.reports.ReportsView;
import com.lucernex.qa.views.iwms.portfolio.orgchart.OrgChartView;
import com.lucernex.swagger.util.Credentials;
import junit.framework.Assert;
import junit.framework.TestCase;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Logger;

import static com.google.common.base.Strings.isNullOrEmpty;
import static com.lucernex.qa.utils.GridUtils.validatedTheColumnsOfTheGrid;
import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

//import org.eclipse.jetty.util.log.Log;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

/**
 * Created by rle0097 on 4/29/2015.
 */
public class CommonMethods {
    private static int defaultWaitTime = 30;
    private static final Logger logger = Logger.getLogger(CommonMethods.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private String dataFolder = null;

    public static void clickOnButton(String strElement) throws Exception {
        SeleniumUtil.textContains(strElement.trim());
        SeleniumUtil.waitForElementIsClickable("xpath", ".//span[./text()='" + strElement + "']", 4, SeleniumUtilities.OBJWAITTIMEOUT);
        List<WebElement> eles = SeleniumUtil.getWebDriver().findElements(By.xpath(".//span[./text()='" + strElement + "']"));
        for (WebElement ele : eles) {
            if (ele.isDisplayed() && (ele.isEnabled())) {
                ele.sendKeys("");
                SeleniumUtil.waitForObjectToLoad(ele);
                SeleniumUtil.getClickableWebElementObject(ele);
                SeleniumUtil.click(ele, SeleniumUtilities.OBJWAITTIMEOUT);
//                Actions builder = new Actions(SeleniumUtil.getWebDriver());
//                builder.moveToElement(ele);
//                builder.click(ele);
//                builder.build().perform();
                break;
            }
        }
//        SeleniumUtil.click("xpath", ".//span[./text()='" + strElement + "']", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void clickOnUpdateButton(String strElement) throws Exception {
        SeleniumUtil.waitForElementIsClickable("xpath", ".//a[@target='_blank']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
        List<WebElement> eles = SeleniumUtil.getWebDriver().findElements(By.xpath(".//a[@target='_blank']"));
        for (WebElement ele : eles) {
            SeleniumUtil.waitForElementIsClickable(ele, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            if (ele.isDisplayed() && (ele.isEnabled()) && ele.getText().contains(strElement)) {
                ele.sendKeys("");
                ele.sendKeys(Keys.ENTER);
                break;
            }
        }
    }

    public static void clickOnYesButton(String strElement) throws Exception {
        SeleniumUtil.waitForElementIsClickable("cssselector", "a[class='x-btn x-unselectable x-box-item x-toolbar-item x-btn-default-small x-focus x-btn-focus x-btn-default-small-focus']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
        List<WebElement> eles = SeleniumUtil.getWebDriver().findElements(By.cssSelector("a[class='x-btn x-unselectable x-box-item x-toolbar-item x-btn-default-small x-focus x-btn-focus x-btn-default-small-focus']"));
        for (WebElement ele : eles) {
            SeleniumUtil.waitForElementIsClickable(ele, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            if (ele.isDisplayed() && (ele.isEnabled()) && ele.getText().contains(strElement)) {
                ele.sendKeys("");
                ele.sendKeys(Keys.ENTER);
                break;
            }
        }
    }

    public static void clickOnFinishButton(String strElement) throws Exception {
        SeleniumUtil.waitForElementIsClickable("xpath", ".//span[contains(.,'" + strElement + "')]/ancestor::a", 8, SeleniumUtilities.OBJWAITTIMEOUT);
        List<WebElement> eles = SeleniumUtil.getWebDriver().findElements(By.xpath(".//span[contains(.,'Finish')]/ancestor::a"));
        for (WebElement ele : eles) {
            SeleniumUtil.waitForElementIsClickable(ele, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            if (ele.isDisplayed() && (ele.isEnabled()) && ele.getText().contains(strElement)) {
                ele.sendKeys("");
                ele.sendKeys(Keys.ENTER);
                break;
            }
        }
    }

    public static void clickLastButton(String strElement) throws Exception {
        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 60);
        wait.until(ExpectedConditions.visibilityOf(BrowserDriver.getCurrentDriver().findElements(By.xpath(".//span[./text()='" + strElement + "']"))
                .get(BrowserDriver.getCurrentDriver().findElements(By.xpath(".//span[./text()='" + strElement + "']"))
                        .size() - 1)));
        wait.until(ExpectedConditions.elementToBeClickable(BrowserDriver.getCurrentDriver().findElements(By.xpath(".//span[./text()='" + strElement + "']"))
                .get(BrowserDriver.getCurrentDriver().findElements(By.xpath(".//span[./text()='" + strElement + "']"))
                        .size() - 1)));

        BrowserDriver.getCurrentDriver().findElements(By.xpath(".//span[./text()='" + strElement + "']"))
                .get(BrowserDriver.getCurrentDriver().findElements(By.xpath(".//span[./text()='" + strElement + "']"))
                        .size() - 1).click();
    }

    public static void rightClick(WebElement element) throws Exception {
        Actions rightClick = new Actions(BrowserDriver.getCurrentDriver());
        rightClick.moveToElement(element);
        rightClick.contextClick(element).build().perform();
    }

    public static void clickButton(String strElement) throws Exception {
        SeleniumUtil.click("xpath", ".//span[./text()='" + strElement + "']", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    /*public static void clickButtonContainsText(String strElement) throws Exception {
        SeleniumUtil.click("xpath", ".//span[contains(text(),'" + strElement + "')]", SeleniumUtilities.OBJWAITTIMEOUT);
    }*/
    public static void clickButtonContainsText(String strElement) throws Throwable {
        logger.info("Attempting to click button " + strElement + "...");
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        int maxTries = 10;
        int count = 0;
        for (count = 0; count < maxTries; count++) {
            logger.info("Try " + count + " for button: " + strElement + "...");

            try {
                BrowserDriver.findElementWithTimeout(By.xpath(".//span[contains(text(),'" + strElement + "')]"), 30).click();
                break;
            } catch (StaleElementReferenceException se) {
                System.out.print(se.getMessage());
            } catch (Exception e) {
                System.out.print(e.getMessage());
            }
        }
        if (count == maxTries) {
            fail("Did not find the grid button " + strElement + " after " + maxTries + " attempts");
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
//        SeleniumUtil.waitForElementIsClickable("xpath",".//span[./text()='" + buttonTitle + "']",10,2);
//        SeleniumUtil.click(SeleniumUtil.getElement("xpath",".//span[./text()='" + buttonTitle + "']",10,2),SeleniumUtilities.OBJWAITTIMEOUT);

        int maxTries = 10;
        int count = 0;
        for (count = 0; count < maxTries; count++) {
            logger.info("Try " + count + " for button: " + buttonTitle + "...");

            try {
                BrowserDriver.findElementWithTimeout(By.xpath(".//span[./text()='" + buttonTitle + "']"), 30).click();
                try {
                    BrowserDriver.findElementWithTimeout(By.xpath(".//span[./text()='" + buttonTitle + "']"), 30).click();
                } catch (Exception e) {
                }
                break;
            } catch (StaleElementReferenceException se) {
                // Stale element exception re-fetch element
            } catch (Exception e) {
                // dom changed, find button elements
            }
        }
        if (count == maxTries) {
            fail("Did not find the grid button " + buttonTitle + " after " + maxTries + " attempts");
        }
    }

    public static void clickOnThreeDotButton(String strThreeDots, String strElement) throws Exception {
        SeleniumUtil.waitForElementIsClickable("cssselector", "*[id^='" + strElement + "'][id*='trigger-options']", 5, SeleniumUtilities.OBJWAITTIMEOUT);
        SeleniumUtil.click("cssselector", "*[id^='" + strElement + "'][id*='trigger-options']", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void SelectRadioButton(String strElement) throws Exception {
        SeleniumUtil.click("xpath", ".//span[./text()='" + strElement + "']", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void dblClickButton(String strElement) {
        try {
            SeleniumUtil.doubleClickElement(SeleniumUtil.getElement("xpath", ".//span[./text()='" + strElement + "']", 3, 2));
            if (!SeleniumUtil.verifyTextValue("xpath", "//div[contains(./text(),'Editing Task for')]", "Editing Task for", SeleniumUtilities.OBJWAITTIMEOUT))
                SeleniumUtil.doubleClickElement(SeleniumUtil.getElement("xpath", ".//span[./text()='" + strElement + "']", 3, 2));
        } catch (Exception ex) {
            try {
                SeleniumUtil.doubleClickElement(SeleniumUtil.getElement("xpath", ".//span[./text()='" + strElement + "']", 3, 2));
            } catch (Exception e) {
                BaseView.takeScreenshot("dblClickButton.png");
                fail("Unable to expand folder " + e.getMessage());
            }
        }
    }

    public static void expandFolders(String folderName) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", "//span[text()='" + folderName + "']/preceding-sibling::img[2]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            WebElement folder = BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[text()='" + folderName + "']/preceding-sibling::img[2]"));
            AllContractPagesView.focusWebElement(folder);
            SeleniumUtil.clickElement("xpath", "//span[text()='" + folderName + "']/preceding-sibling::img[2]", 10);
        } catch (Exception e) {
            try {
//                delay(5000);
                SeleniumUtil.getElement("xpath", "//span[text()='" + folderName + "']/preceding-sibling::img[2]", 5, 2);
                SeleniumUtil.clickElement("xpath", "//span[text()='" + folderName + "']/preceding-sibling::img[2]", 10);
            } catch (Exception ex) {
                BaseView.takeScreenshot("ExpandError.png");
                fail("Unable to expand folder " + e.getMessage());
            }
        }
    }


    public static void expandFoldersWhichDontHaveName(String folderName) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", "//span[not(text()='" + folderName + "')]/preceding-sibling::img[2]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            WebElement folder = BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[not(text()='" + folderName + "')]/preceding-sibling::img[2]"));
            AllContractPagesView.focusWebElement(folder);
            SeleniumUtil.clickElement("xpath", "//span[not(text()='" + folderName + "')]/preceding-sibling::img[2]", 10);
        } catch (Exception e) {
            try {
//                delay(5000);
                SeleniumUtil.getElement("xpath", "//span[not(text()='" + folderName + "')]/preceding-sibling::img[2]", 5, 2);
                SeleniumUtil.clickElement("xpath", "//span[not(text()='" + folderName + "')]/preceding-sibling::img[2]", 10);
            } catch (Exception ex) {
                BaseView.takeScreenshot("ExpandError.png");
                fail("Unable to expand folder " + e.getMessage());
            }
        }
    }

    public static void collapseFolders(String folderName) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        try {
            BaseView.pushVeryShortTimeout();
            if (BrowserDriver.getCurrentDriver()
                    .findElements(By.xpath("//span[text()='" + folderName + "']/preceding-sibling::img[2]")).size() > 0) {
                WebElement folder = BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[text()='" + folderName + "']/preceding-sibling::img[2]"));
                AllContractPagesView.focusWebElement(folder);
                SeleniumUtil.clickElement("xpath", "//span[text()='" + folderName + "']/preceding-sibling::img[2]", 10);
            } else if (ReportsView.reachElementUp(folderName)) {
                WebElement folder = BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[text()='" + folderName + "']/preceding-sibling::img[2]"));
                AllContractPagesView.focusWebElement(folder);
                SeleniumUtil.clickElement("xpath", "//span[text()='" + folderName + "']/preceding-sibling::img[2]", 10);
            } else if (ReportsView.reachElementDown(folderName)) {
                WebElement folder = BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[text()='" + folderName + "']/preceding-sibling::img[2]"));
                AllContractPagesView.focusWebElement(folder);
                SeleniumUtil.clickElement("xpath", "//span[text()='" + folderName + "']/preceding-sibling::img[2]", 10);
            }
        } catch (Exception e) {

        } finally {
            BaseView.popDefaultTimeout();
        }
        /*try {
            WebElement folder = BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[text()='" + folderName + "']/preceding-sibling::img[2]"));
            AllContractPagesView.focusWebElement(folder);
            SeleniumUtil.clickElement("xpath", "//span[text()='" + folderName + "']/preceding-sibling::img[2]", 10);
        } catch (Exception e) {
            try {
                delay(5000);
                SeleniumUtil.clickElement("xpath", "//span[text()='" + folderName + "']/preceding-sibling::img[2]", 10);
            } catch (Exception ex) {
                BaseView.takeScreenshot("ExpandError.png");
                fail("Unable to expand folder " + e.getMessage());
            }
        }*/
    }

    public static void selectFolders(String folderName) {
        try {
            AllContractPagesView.focusWebElement(BrowserDriver.getCurrentDriver().findElement(By.xpath(".//span[contains(text(),'" + folderName + "')]")));
            SeleniumUtil.waitForElementIsClickable("xpath", ".//span[contains(text(),'" + folderName + "')]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            try {
                SeleniumUtil.click("xpath", ".//span[contains(text(),'" + folderName + "')]", SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception e) {
                BaseView.pushShortTimeout();
                if (e.getMessage().contains("Element is not clickable")) {
                    SeleniumUtil.click("xpath", ".//span[contains(text(),'" + folderName + "')]//ancestor::div[1]//parent::td", SeleniumUtilities.OBJWAITTIMEOUT);
                }
            }
            SeleniumUtil.handleUnexpectedAlerts();
            BaseView.popDefaultTimeout();
        } catch (Exception e) {
            BaseView.takeScreenshot("FixFolder.png");
            BaseView.popDefaultTimeout();
            fail("Selected folder " + e.getMessage());
        }
    }

    public static void dragAndDrop(String strFromElement) throws Exception {
        SeleniumUtil.dragAndDropElement("xpath", ".//span[./text()='" + strFromElement + "']", "cssselector", "newcell[id^=extdd-]");
    }

    public static void selectCheckboxByName(String name, String value) {
        try {
            if (value.contains("true")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.name(name)).isSelected()) {
                    BrowserDriver.getCurrentDriver().findElement(By.name(name)).click();
                }
            } else if (value.contains("false")) {
                if (BrowserDriver.getCurrentDriver().findElement(By.name(name)).isSelected()) {
                    BrowserDriver.getCurrentDriver().findElement(By.name(name)).click();
                }
            } else {
                SeleniumUtil.click("cssSelector", "input[name=" + name + "][value=" + value + "]", SeleniumUtilities.OBJWAITTIMEOUT);
                //BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name="+name+"][value="+value+ "]")).click();
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToSelectRadioByName.png");
            logger.info("Error :" + Ex.getMessage());
            fail("Error :" + Ex.getMessage());
        }
    }

    public static void selectCheckboxByLabelName(String name) {
        try {
            WebElement checkbox = null;
            java.util.List<WebElement> checkboxes = BrowserDriver.getCurrentDriver().findElements(By.tagName("label"));

            for (WebElement label : checkboxes) {
                if (label.getText().contains(name.trim())) {

                    try {
                        BrowserDriver.getCurrentDriver().findElement(By.xpath("//label[text()='" + name + "']/preceding-sibling::input[@role='checkbox']")).click();
                        return;
                    } catch (Exception Ex) {
                    }
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToSelectCheckBoxByLabel.png");
            logger.info("Error :" + Ex.getMessage());
            fail("Error :" + Ex.getMessage());
        }
//        fail("Error : Unable to select checkbox by label");
    }


    public static void verifyCheckBoxByLabel(String name, String value) {
        java.util.List<WebElement> checkboxes = BrowserDriver.getCurrentDriver().findElements(By.tagName("label"));

        for (WebElement label : checkboxes) {
            if (label.getText().contains(name.trim())) {
                if (value.contains("true")) {
                    if (!BrowserDriver.getCurrentDriver().
                            findElement(By.xpath("//label[text()='" + name + "']/preceding-sibling::input[@role='checkbox']"))
                            .isSelected()) {
                        //fail("Checkbox is not selected");
                        BaseView.takeScreenshot("Checkbox is not selected.png");
                    }
                } else if (value.contains("false")) {
                    if (BrowserDriver.getCurrentDriver().
                            findElement(By.xpath("//label[text()='" + name + "']/preceding-sibling::input[@role='checkbox']"))
                            .isSelected()) {
                        // fail("Checkbox is selected");
                        BaseView.takeScreenshot("Checkbox is selected.png");
                    }
                }
            }
        }
    }


    public static void selectRadioByLabelName(String name) {
        try {
            AllContractPagesView.focusWebElement(BrowserDriver.getCurrentDriver().findElement(By.xpath(".//*[text()='" + name + "']/preceding-sibling::input")));
            BrowserDriver.getCurrentDriver().findElement(By.xpath(".//*[text()='" + name + "']/preceding-sibling::input")).click();
            BaseView.popDefaultTimeout();
            return;
        } catch (Exception Ex) {
            BaseView.popDefaultTimeout();
            BaseView.takeScreenshot("UnableToSelectRadioByLabel.png");
            logger.info("Error :" + Ex.getMessage());
            fail("Error :" + Ex.getMessage());
        }
        fail("Error : Unable to select Radio by label");
    }

    public static void selectRadioByLabel(String name) {
        try {

            BrowserDriver.getCurrentDriver().findElement(By.xpath("//*[text()='" + name + "']/preceding-sibling::*[1]/input[@type='radio']")).click();
            return;

        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToSelectRadioByLabel.png");
            logger.info("Error :" + Ex.getMessage());
            fail("Error :" + Ex.getMessage());
        }
        fail("Error : Unable to select Radio by label");
    }

    public static void selectCheckboxByID(String ID) {
        try {
            BrowserDriver.getCurrentDriver().findElement(By.id(ID)).click();
        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToSelectCheckBoxByLabel.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void selectRadioboxByName(String name, String value) {
        try {
            if (value.contains("true")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.name(name)).isSelected()) {
                    SeleniumUtil.click("name", name, SeleniumUtilities.OBJWAITTIMEOUT);
                }
            } else if (value.contains("false")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.name(name)).isSelected()) {
                    SeleniumUtil.click("xpath", ".//input[contains(@value,'false') and contains(@name,'" + name + "')]", SeleniumUtilities.OBJWAITTIMEOUT);
                }
            } else {
                SeleniumUtil.click("cssSelector", "input[name=" + name + "][value=" + value + "]", SeleniumUtilities.OBJWAITTIMEOUT);
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToSelectRadioByName.png");
            logger.info("Error :" + Ex.getMessage());
            fail("Error :" + Ex.getMessage());
        }
    }

    public static void selectRadioByValueAndName(String name, String value) {
        try {
            if (value.contains("true")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name=" + name + "][value=" + value + "]")).isSelected()) {
                    SeleniumUtil.click("cssSelector", "input[name=" + name + "][value=" + value + "]", SeleniumUtilities.OBJWAITTIMEOUT);
                }
            } else if (value.contains("false")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[name=" + name + "][value=" + value + "]")).isSelected()) {
                    SeleniumUtil.click("cssSelector", "input[name=" + name + "][value=" + value + "]", SeleniumUtilities.OBJWAITTIMEOUT);
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToSelectRadioByName.png");
            logger.info("Error :" + Ex.getMessage());
            fail("Error :" + Ex.getMessage());
        }
    }

    public static void inputValueByName(String name, String value) {
        try {
            WebElement ele = BrowserDriver.getCurrentDriver().findElement(By.name(name));
            try {
                ele.clear();
                BaseView.pushShortTimeout(2);
            } catch (Exception e) {
                BaseView.pushShortTimeout(2);
            }
            Actions builder = new Actions(BrowserDriver.getCurrentDriver());
            builder.moveToElement(ele);
            builder.doubleClick(ele).sendKeys(Keys.chord(Keys.CONTROL, "a"), value).sendKeys(Keys.TAB).perform();
            /*BrowserDriver.getCurrentDriver().findElement(By.name(name)).clear();
            BrowserDriver.getCurrentDriver().findElement(By.name(name)).sendKeys(value);
            BrowserDriver.getCurrentDriver().findElement(By.name(name)).sendKeys(value.replace("0",value));*/
        } catch (Exception Ex) {
            BaseView.popDefaultTimeout();
            BaseView.takeScreenshot("UnableToInputValueByName.png");
            logger.info("Error :" + Ex.getMessage());
            fail("Error :" + Ex.getMessage());
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void selectFromListByName(String name, String value) {
        try {
            Select select = new Select(BrowserDriver.getCurrentDriver().findElement(By.name(name)));
            if (!select.getFirstSelectedOption().getText().contains(value)) {
                BaseView.selectFromList(By.name(name), value);
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToSelectFromListByName.png");
            logger.info("Error :" + Ex.getMessage());
            fail("Error :" + Ex.getMessage());
        }
    }

    public static void getOptionsFromMultipleSelectionBox(String name, String value) {
        try {
            Select select = new Select(BrowserDriver.getCurrentDriver().findElement(By.name(name)));
            for (WebElement ele : select.getOptions()) {
                if (ele.getText().contains(value.trim())) {
                    return;
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("FailedTogetOptionsFromSelectionBox.png");
            logger.info("Error :" + Ex.getMessage());
            fail("Error :" + Ex.getMessage());
        }
        fail("Failed to find selected option in the list");
    }

    public static void waitTillListInvisible(String value) {
        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
        int count = 0;
        do {
            try {
                count++;
                BaseView.pushShortTimeout();
                wait.until(ExpectedConditions.visibilityOf(BrowserDriver.getCurrentDriver()
                        .findElement(By.xpath("//ul/div[text()='" + value + "'][contains(@class,'x-boundlist-item')]"))));
                BrowserDriver.getCurrentDriver()
                        .findElement(By.xpath(("//ul/div[text()='" + value + "'][contains(@class,'x-boundlist-item')]"))).click();
                wait.until(ExpectedConditions.not(ExpectedConditions.visibilityOf(BrowserDriver.getCurrentDriver()
                        .findElement(By.xpath("//ul/div[text()='" + value + "'][contains(@class,'x-boundlist-item')]")))));
            } catch (Exception e) {
                try {
                    wait.until(ExpectedConditions.visibilityOf(BrowserDriver.getCurrentDriver()
                            .findElement(By.xpath("//ul/div[contains(text(),'" + value + "')][contains(@class,'x-boundlist-item')]")))).click();
                    wait.until(ExpectedConditions.not(ExpectedConditions.visibilityOf(BrowserDriver.getCurrentDriver()
                            .findElement(By.xpath("//ul/div[contains(text(),'" + value + "')][contains(@class,'x-boundlist-item')]")))));
                } catch (Exception ee) {
                }
            }
        } while (BrowserDriver.getCurrentDriver()
                .findElement(By.xpath("//ul/div[contains(@class,'x-boundlist-item')]")).isDisplayed() && count < 10);
        BaseView.popDefaultTimeout();

    }

    public static void selectFromComboBox(String name, String value) {
        try {
            for (int count = 0; count < 10; count++) {
                SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']").clear();
                try {
                    WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                    wait.until(ExpectedConditions.textToBePresentInElementValue(SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']"), ""));
                } catch (Exception e) {
                }
                if (!SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']").getAttribute("value").equals("")) {

                    for (String s : SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']").getAttribute("value").split("|")) {
                        SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']").sendKeys(Keys.BACK_SPACE);
                    }
                }

                for (int i = 0; i < 10; i++) {
                    SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']").sendKeys(value);
                    try {
                        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                        wait.until(ExpectedConditions.textToBePresentInElementValue(SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']"), value));
                    } catch (Exception e) {
                    }
                    if (BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + name + "'][role = 'combobox']"))
                            .getAttribute("value").trim().equals(value)) {
                        break;
                    }
                    for (String s : SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']").getAttribute("value").split("|")) {
                        SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']").sendKeys(Keys.BACK_SPACE);
                    }
                    SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']").clear();
                }
               /* WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 6);
                try {
                    BaseView.pushShortTimeout();
                    wait.until(ExpectedConditions.visibilityOf(BrowserDriver.getCurrentDriver()
                            .findElement(By.xpath("//ul/div[text()='" + value + "'][contains(@class,'x-boundlist-item')]"))));
                    BrowserDriver.getCurrentDriver()
                            .findElement(By.xpath(("//ul/div[text()='" + value + "'][contains(@class,'x-boundlist-item')]"))).click();
                } catch (Exception e) {
                    try {
                        wait.until(ExpectedConditions.visibilityOf(BrowserDriver.getCurrentDriver()
                                .findElement(By.xpath("//ul/div[contains(text(),'" + value + "')][contains(@class,'x-boundlist-item')]")))).click();
                    } catch (Exception ee) {
                    }
                }finally {
                    BaseView.popDefaultTimeout();
                }*/
                waitTillListInvisible(value);

                if (BrowserDriver.getCurrentDriver()
                        .findElement(By.cssSelector("input[id^='" + name + "'][role='combobox']")).getAttribute("value").contains(value)) {
                    break;
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot(name + ".png");
            logger.info("Error :" + Ex.getMessage());
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void selectFromSpinButton(String name, String value) {
        try {
            for (int count = 0; count < 10; count++) {
                SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'spinbutton']").clear();
                SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'spinbutton']").sendKeys(value);
                //delay(3000);
                if (BrowserDriver.getCurrentDriver()
                        .findElement(By.cssSelector("input[id^='" + name + "'][role='spinbutton']")).getAttribute("value").contains(value)) {
                    break;
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot(name + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void selectFromNonEditableComboBox(String name, String value) {
        try {
            for (int count = 0; count < 10; count++) {

                SeleniumUtil.getClickableWebElementObject("cssselector", "div[id^='" + name + "'] div div div~div").click();
                SeleniumUtil.getClickableWebElementObject("xpath", "//li[contains(text(),'" + value + "')]").click();
                //delay(3000);
                if (BrowserDriver.getCurrentDriver()
                        .findElement(By.cssSelector("input[id^='" + name + "'][role='combobox']")).getAttribute("value").contains(value)) {
                    break;
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot(name + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }


    public static void selectItemFromList(String name, String value) {
        try {
            for (WebElement closeTagField : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div.x-tagfield-item-close "))) {
                SeleniumUtil.click(closeTagField, SeleniumUtilities.OBJWAITTIMEOUT);
//                closeTagField.click();
//                delay(2000);
            }
            //SeleniumUtil.type("cssselector",name="portfolioIDList",value,SeleniumUtilities.OBJWAITTIMEOUT);
            //SeleniumUtil.escape("cssselector",name="portfolioIDList",SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("cssselector", "input[id^='" + name + "']", value, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.escape("cssselector", "input[id^='" + name + "']", SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.getElement("cssselector", "input[id^='" + name + "']", 5, 2).sendKeys(value);
//            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + name + "']")).sendKeys(value);
//            delay(2000);
//            SeleniumUtil.getClickableWebElementObject("cssselector", "div[id^='" + name + "'] div div div~div").click();
//            SeleniumUtil.getElement("cssselector", "div[id^='" + name + "'] div div div~div", 5, 2).click();
        } catch (Exception Ex) {
            BaseView.takeScreenshot(name + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void selectItemFromTheList(String name, String value) {
        try {
            for (WebElement closeTagField : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div.x-tagfield-item-close "))) {
                SeleniumUtil.click(closeTagField, SeleniumUtilities.OBJWAITTIMEOUT);
            }

            SeleniumUtil.click("cssselector", "div[id^='lovcombo-'][id$='-trigger-picker']", SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.type("name", "PageLayout_PortfolioIDList", value, SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.enter("name", "PageLayout_PortfolioIDList", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("cssselector", "input[name$='_PortfolioIDList']", value, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.enter("cssselector", "input[name$='_PortfolioIDList']", SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception Ex) {
            BaseView.takeScreenshot(name + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }


    public static void checkSpecifiedLogin(String fullUserName, String userName) throws Throwable {
        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
            wait.until(ExpectedConditions.textToBePresentInElementLocated(By.cssSelector("td>b"), "User:"));

            if (!BrowserDriver.getCurrentDriver()
                    .findElement(By.xpath("//td/b[text()='User:']/following-sibling::a")).getText().contains(fullUserName)) {
                URL url = CucumberContext.getURL();
                BrowserDriver.loadPage(url);
                HomeView.logout();
                login(userName);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("LoginError.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void login(String loginName) throws Throwable {
        boolean flag = false;
        String strFirmName = "", strUserName, strPassword;
        int sheetRowNum = 0;
        String localPath = new File("Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/Member_SS.xlsx").getAbsolutePath();
        Spreadsheet excel = new Spreadsheet(new File(localPath));
        excel.getSheetName();

        for (int i = 6; i < 20; i++) {
            String strExlAccessType = excel.getCellValue("Member.LoginName", i, Spreadsheet.Type.TEXT).toString();
            if (!isNullOrEmpty(strExlAccessType) && (strExlAccessType.equalsIgnoreCase(loginName))) {
                sheetRowNum = i;
                flag = true;
            }
            if (flag) break;
        }
        if (flag) {
            strUserName = excel.getCellValue("Member.LoginName", sheetRowNum, Spreadsheet.Type.TEXT).toString();
            strPassword = excel.getCellValue("Member.Password", sheetRowNum, Spreadsheet.Type.TEXT).toString();

            URL url = CucumberContext.getURL();

            assertNotNull(url);

            String appURL = url.toString();

            assertNotNull(appURL);

            // Load browser and point it at configured IWMS web-ui.
            BrowserDriver.loadPage(appURL);

            Boolean loggedIn = (Boolean) CucumberContext.getCucumberContext().get("loggedIn");
            if (loggedIn != null && loggedIn && HomeView.waitForAuthenticatedPage()) {
                logger.info("Already logged in, reusing authenticated session(1).");
                return;
            }


            Credentials credentials = CucumberContext.getCredentials();

            assertNotNull(credentials);
            if (isNullOrEmpty(strFirmName)) {
                credentials = new Credentials(
                        strUserName, credentials.getFirmname(), strPassword
                );
            } else
                credentials = new Credentials(
                        strUserName, strFirmName, strPassword
                );

            CucumberContext.getCucumberContext().put("credentials", credentials);


            assertNotNull(credentials);

            // Look for 1st IWMS authentication page.
            LoginView.verifyFirstPageDisplayed();

            // Enter username and firmname in 1st IWMS authentication page.
            LoginView.firstPageSubmit(
                    credentials.getUsername(),
                    credentials.getFirmname()
            );

            // Wait for 2nd IWMS authentication page.
            LoginView.verifySecondPageDisplayed();

            // Enter password into 2nd IWMS authentication page.
            LoginView.secondPageSubmit(credentials.getPassword());

            // Make sure we got logged in.
            for (int i = 0; i < 2; i++) {
                try {
                    HomeView.verifyFooterDisplayed();
                } catch (NoSuchElementException e) {
                    URL baseURL = getCurrentBaseURL();

                    if (baseURL != null) {
                        // Redirect to IWMS dashboard.
                        BrowserDriver.loadPage(baseURL.toString() + "/RolloutManager/dashboard/DashboardDispatch.jsp");
                    }
                }
            }

            CucumberContext.getCucumberContext().put("loggedIn", true);

            URL baseURL = getCurrentBaseURL();

            if (baseURL != null) {
                // IWMS can redirect on login to a different URL so capture the redirect URL.
                CucumberContext.getCucumberContext().put(CucumberContext.IWMS_URL, baseURL);
            }

            logger.info("Logged in successfully.");
        } else
            logger.info("Login to IWMS using " + loginName + " access credentials does not exist in excel spreadsheet");
    }

    private static URL getCurrentBaseURL() {
        try {
            URL currentURL = new URL(BrowserDriver.getCurrentDriver().getCurrentUrl());

            return new URL(currentURL.getProtocol(), currentURL.getHost(), currentURL.getPort(), "");
        } catch (MalformedURLException e) {
            logger.info(String.format("Invalid current URL [%s]", BrowserDriver.getCurrentDriver().getCurrentUrl()));
            return null;
        }
    }

    public static void setFields(String strName, String strValue) {
        try {
            if (strValue.contains("[CURRENT DATE]")) {
                strValue = strValue.replace("[CURRENT DATE]", SeleniumUtil.addDaystoCurrentDate(0));
            }
            if (BrowserDriver.getCurrentDriver().findElement(By.name(strName)).getAttribute("type").equalsIgnoreCase("hidden")) {
                CommonMethods.selectFromComboBox(strName, strValue);

            } else if (BrowserDriver.getCurrentDriver().findElement(By.name(strName)).getAttribute("type").equalsIgnoreCase("checkbox")) {
                CommonMethods.selectCheckboxByName(strName, strValue);

            } else if ((BrowserDriver.getCurrentDriver().findElement(By.name(strName)).getAttribute("type").equalsIgnoreCase("text")) || (BrowserDriver.getCurrentDriver().findElement(By.name(strName)).getAttribute("type").equalsIgnoreCase("password"))) {
                CommonMethods.inputValueByName(strName, strValue);

            } else if (BrowserDriver.getCurrentDriver().findElement(By.name(strName)).getTagName().equalsIgnoreCase("select")) {
                SeleniumUtil.select("name", strName, strValue, SeleniumUtilities.OBJWAITTIMEOUT);

            } else if (BrowserDriver.getCurrentDriver().findElement(By.name(strName)).getAttribute("type").equalsIgnoreCase("radio")) {
                CommonMethods.selectRadioboxByName(strName, strValue);

            } else if (BrowserDriver.getCurrentDriver().findElement(By.name(strName)).getTagName().equalsIgnoreCase("textarea")) {
                CommonMethods.inputValueByName(strName, strValue);
            }

        } catch (Exception Ex) {
            BaseView.takeScreenshot(strName + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void switchToVisibleFrame() throws Throwable {
        WebElement iframe = null;
        //delay(2000);
        logger.info("Switching to default frame....");
        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
        boolean isFrameVisible = false;
        logger.info("Started finding visible frame....");
        BaseView.pushShortTimeout();
        for (WebElement frame : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("iframe[id^=ext-element-]"))) {
            //System.out.println(frame.getAttribute("src"));
            if (frame.isDisplayed()) {
                iframe = frame;
                isFrameVisible = true;
                logger.info("Visible frame found, exiting loop" + "FrameName=" + frame.getAttribute("id"));
                break;
            }
        }
        if (!isFrameVisible) {
            BaseView.popDefaultTimeout();
            fail("No frames are visible hence not switching to frame");
        }
        //Waits till the "Loading.." text disappears
        BrowserDriver.getCurrentDriver().switchTo().frame(iframe);
        logger.info("Switched to visible continuing....");
        BaseView.popDefaultTimeout();
    }

    public static void switchToVisibleFrameQuick() throws Throwable {
        WebElement iframe = null;
        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
        boolean isFrameVisible = false;
        for (WebElement frame : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("iframe[id^=ext-element-]"))) {
            if (frame.isDisplayed()) {
                iframe = frame;
                isFrameVisible = true;
                logger.info("Visible frame found, exiting loop");
                break;
            }
        }
        if (!isFrameVisible) {
            fail("No frames are visible hence not switching to frame");
        }
        BrowserDriver.getCurrentDriver().switchTo().frame(iframe);
    }

    public static boolean isDisplayed(WebElement element) {
        for (int i = 0; i < 10; i++) {
            try {
                element.isDisplayed();
                return true;
            } catch (StaleElementReferenceException ee) {
                try {
                    WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                    wait.until(ExpectedConditions.not(ExpectedConditions.stalenessOf(element)));
                } catch (Exception se) {
                }
                if (i == 10) {
                    try {
                        element.isDisplayed();
                        return true;
                    } catch (StaleElementReferenceException se) {
                        return false;
                    }
                }
                //If its a element not found exception or some other exception, the below code waits
            } catch (Exception ee) {
                try {
                    WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                    wait.until(ExpectedConditions.not(ExpectedConditions.stalenessOf(element)));
                } catch (Exception se) {
                }
                if (i == 10) {
                    try {
                        element.isDisplayed();
                        return true;
                    } catch (StaleElementReferenceException se) {
                        return false;
                    }
                }
            }
        }
        try {
            element.isDisplayed();
            return true;
        } catch (StaleElementReferenceException se) {
            return false;
        }
    }

    public static boolean isDisplayed(WebElement element, int intSeconds) {
        for (int i = 0; i < 10; i++) {
            try {
                element.isDisplayed();
                return true;
            } catch (StaleElementReferenceException ee) {
                try {
                    WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), intSeconds);
                    wait.until(ExpectedConditions.not(ExpectedConditions.stalenessOf(element)));
                } catch (Exception se) {
                }
                if (i == 10) {
                    try {
                        element.isDisplayed();
                        return true;
                    } catch (StaleElementReferenceException se) {
                        return false;
                    }
                }
            } catch (Exception ee) {
                try {
                    WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), intSeconds);
                    wait.until(ExpectedConditions.not(ExpectedConditions.stalenessOf(element)));
                } catch (Exception se) {
                }
                if (i == 10) {
                    try {
                        element.isDisplayed();
                        return true;
                    } catch (StaleElementReferenceException se) {
                        return false;
                    }
                }
            }
        }
        try {
            element.isDisplayed();
            return true;
        } catch (StaleElementReferenceException se) {
            return false;
        }
    }

  /*  public static void waitTillDivisionLoads() throws Throwable {
        BaseView.pushShortTimeout(2);
        if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id*='loadmask'][id*='msgText']")).size() > 0) {
            for (int j = 0; j < 10; j++) {
                //Loading starts sometimes after some delay
                try {
                    BaseView.pushShortTimeout(2);
                    BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id*='loadmask'][id*='msgText']"));
                    //if loading elements present fetch all the loading elements
                    for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id*='loadmask'][id*='msgText']"))) {
                        //wait till grid load
                        for (int i = 0; i < 15; i++) {
                            if (isDisplayed(ele)) {
                                try {
                                    WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                                    boolean boolElement= wait.until(ExpectedConditions.not(ExpectedConditions.visibilityOf(ele)));
//                                    break;
                                    if(boolElement) return;
                                } catch (Exception e) {
                                }
                            } else {
                                return;
                            }
                        }
                    }
                } catch (NoSuchElementException ne) {
                    logger.info("No loading element present in this page");
                } finally {
                    BaseView.popDefaultTimeout();
                }
            }
        }else{
            BaseView.popDefaultTimeout();
        }
    }*/

    public static void waitForPageLoad() {
        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            wait.until(new ExpectedCondition<Boolean>() {
                public Boolean apply(WebDriver wdriver) {
                    return ((JavascriptExecutor) BrowserDriver.getCurrentDriver()).executeScript(
                            "return document.readyState"
                    ).equals("complete");
                }
            });
        } catch (Exception e) {
        }
    }

    public static void waitTillDivisionLoads() throws Throwable {
        waitForPageLoad();
        BaseView.pushShortTimeout(2);
        SeleniumUtil.getWebDriver();

        List<WebElement> loadingElements = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id*='loadmask'][id*='msgText']"));
        if (BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id*='loadmask'][id*='msgText']")).size() > 0) {
            for (int j = 0; j < 10; j++) {
                //Loading starts sometimes after some delay
                try {
                    BaseView.pushShortTimeout(1);
                    BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id*='loadmask'][id*='msgText']"));
                    //if loading elements present fetch all the loading elements
                    for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id*='loadmask'][id*='msgText']"))) {
                        //wait till grid load
                        for (int i = 15; i <= 0; i--) {
                            if (isDisplayed(ele)) {
                                try {
                                    WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                                    boolean boolElement = wait.until(ExpectedConditions.not(ExpectedConditions.visibilityOf(loadingElements.get(loadingElements.size() - 1))));
//                                    break;
                                    if (boolElement) return;
                                } catch (Exception e) {
                                }
                            } else {
                                return;
                            }
                        }
                    }
                } catch (NoSuchElementException ne) {
                    logger.info("No loading element present in this page");
                } finally {
                    BaseView.popDefaultTimeout();
                }
            }
        } else {
            BaseView.popDefaultTimeout();
        }
    }

    /*public static void waitTillDivisionLoads() throws Throwable {
        //Loading starts sometime after some delay
        delay(2000);
        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
        for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div[id*='loadmask'][id*='msgText']"))) {
            try {
                wait.until(ExpectedConditions.invisibilityOfElementWithText(By.cssSelector("div[id*='loadmask'][id*='msgText']"), "Loading..."));
                //ele.isDisplayed();
            } catch (Exception e) {
                //delay(20000);
            }
        }
        //Checks for no single "Loading..." element in a page at last
        //delay(4000);
        try {
            wait.until(ExpectedConditions.invisibilityOfElementWithText(By.cssSelector("div[id*='loadmask'][id*='msgText']"), "Loading..."));
        } catch (Exception e) {
            delay(10000);
        }
    }*/

   /* public static void startRecording() throws Exception
    {

        GraphicsConfiguration gc = GraphicsEnvironment
                .getLocalGraphicsEnvironment()
                .getDefaultScreenDevice()
                .getDefaultConfiguration();

        screenRecorder = new ScreenRecorder(gc,
                new Format(MediaTypeKey, MediaType.FILE, MimeTypeKey, MIME_AVI),
                new Format(MediaTypeKey, MediaType.VIDEO, EncodingKey, ENCODING_AVI_TECHSMITH_SCREEN_CAPTURE,
                        CompressorNameKey, ENCODING_AVI_TECHSMITH_SCREEN_CAPTURE,
                        DepthKey, 24, FrameRateKey, Rational.valueOf(15),
                        QualityKey, 1.0f,
                        KeyFrameIntervalKey, 15 * 60),
                new Format(MediaTypeKey, MediaType.VIDEO, EncodingKey, "black",
                        FrameRateKey, Rational.valueOf(30)),
                null);
        screenRecorder.start();
    }

    public static void stopRecording() throws Exception
    {
        screenRecorder.stop();
    }
*/

    public static void clickUniqueGridRow(String gridID, String cellValue, String header) throws Throwable {
        boolean found = false;
        WebElement fixRow = null;
        WebElement fixCol = null;
        int colIndex = 0;
        String strElement = "div[id='" + gridID + "']";
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
                        java.util.List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
                        java.util.List<WebElement> cells = fixRow.findElements(By.cssSelector("td.x-grid-cell"));
                        assertEquals(headers.size(),
                                fixRow.findElements(By.cssSelector("td.x-grid-cell")).size());
                        org.junit.Assert.assertTrue("Expected cell value " + cellValue + "is not present under Column header " + header, cells.get(colIndex - 1).getText().contains(cellValue));
                        org.junit.Assert.assertTrue("Expected cell value " + cellValue + "is not present under Column header" + header, headers.get(colIndex - 1).getText().contains(header));
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

    public static void moveToElementAndFocus(String locator) {
        try {
            try {
                SeleniumUtil.moveToElement("cssSelector", locator, SeleniumUtilities.OBJWAITTIMEOUT);
                BrowserDriver.getCurrentDriver().findElement(By.cssSelector(locator)).sendKeys("");
            } catch (Exception e) {

            }
        } catch (Exception e) {
            BaseView.takeScreenshot("UnableToMoveToElement.png");
            logger.info("Error :" + e.getMessage());
        }
    }

    public static void moveToWebElementAndFocus(WebElement element) {
        try {
            try {
                element.sendKeys("");
            } catch (Exception e) {
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("UnableToMoveToElement.png");
            logger.info("Error :" + e.getMessage());
        }
    }

    public static void verifyGridValuesGeneric(String gridID, String uniqueValue, String header, java.util.List<Field> fields) throws Throwable {
        WebElement fixRow = null;
        String strElement = "";

        strElement = AllContractPagesView.getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        //Fix the row in grid
        fixRow = AllContractPagesView.getNewRow(gridElement, uniqueValue, header);//getRow(gridElement,uniqueValue,header);

        for (Field f : fields) {
            AllContractPagesView.findGridValue(gridElement, fixRow, f.getName(), f.getValue());
        }
    }

    public static void expandFolders(String loctor, String folderName) throws Throwable {
        try {
            SeleniumUtil.clickElement(loctor, folderName, 10);
        } catch (Exception e) {
            try {
                SeleniumUtil.getElement(loctor, folderName, 5, 2);
                SeleniumUtil.clickElement(loctor, folderName, 10);
            } catch (Exception ex) {
                BaseView.takeScreenshot("ExpandError.png");
                fail("Unable to expand folder " + e.getMessage());
            }
        }
    }

    public static void refreshGrid(String gridID) throws Throwable {
        try {
            BaseView.pushShortTimeout();
            String strElement = AllContractPagesView.getGridElement(gridID);
            moveToElementAndFocus(strElement);
            WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
            gridElement.findElement(By.cssSelector("*[data-qtip=\"Refresh\"]")).click();
        } catch (Exception e) {
            logger.info("No need of catching failures");
        }
        CommonMethods.waitTillDivisionLoads();
    }

    public static void clickGridActionBtn(String strAction, String gridID, String header, String cellValue, List<Field> fields) throws Throwable {
        refreshGrid(gridID);
        int foundCount = 0;
        int row = 0;
        int colIndex = 0;
        WebElement clickableRow = null;
        int count = 0;

        String strElement = AllContractPagesView.getGridElement(gridID);
        moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        //Fetch rows
        List<WebElement> fixRow = new ArrayList<WebElement>();

        //for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"))) {
        BaseView.pushShortTimeout();
        if (gridElement.findElements(By.cssSelector("tr[class*='x-grid-row'][class*='!important']")).size() > 0) {
            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row'][class*='!important']"))) {
                colIndex = 0;
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    colIndex++;
                    AllContractPagesView.focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    if (AllContractPagesView.getTextAndByPassException(td).trim().equals(cellValue.trim()) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        fixRow.add(BrowserDriver.getParent(td));
                    }
                }
            }
        } else if (gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']:not([class*='!important'])")).size() > 0) {
            for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']:not([class*='!important'])"))) {
                colIndex = 0;
                for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                    colIndex++;
                    AllContractPagesView.focusWebElement(td);
                    SeleniumUtilities.waitForNonStaleWebElement(td);
                    if (AllContractPagesView.getTextAndByPassException(td).trim().equals(cellValue.trim()) && headers.get(colIndex - 1).getText().trim().equals(header.trim())) {
                        fixRow.add(BrowserDriver.getParent(td));
                    }
                }
            }
        }
        BaseView.popDefaultTimeout();
        for (WebElement ele : fixRow) {
            List<WebElement> cells = ele.findElements(By.cssSelector("td.x-grid-cell"));
            row = 0;
            foundCount = 0;
            for (WebElement cell : cells) {
                row = row + 1;
                AllContractPagesView.focusWebElement(cells.get(cells.size() - 1));
                AllContractPagesView.focusWebElement(cell);
                for (Field f : fields) {
                    if (AllContractPagesView.getTextAndByPassException(cell).contains(f.getValue()) && headers.get(row - 1).getText().trim().equals(f.getName())) {
                        foundCount++;
                    }
                }
            }

            if (foundCount == fields.size()) {
                try {
                    count = foundCount;
                    clickableRow = ele;
                    logger.info("Final Expected " + cellValue + " is present under column header " + header);
                    AllContractPagesView.focusWebElement(clickableRow.findElement(By.partialLinkText(strAction)));
                    //clickableRow.findElement(By.partialLinkText(strAction)).click();
                } catch (Exception e) {
                   /* clickableRow.click();
                    try {
                        clickableRow.click();
                    } catch (Exception ex) {
                        clickableRow.click();
                    }*/
                }
            }
        }

        if (!(count == fields.size())) {
            logger.info("Final Expected " + cellValue + " is not present under column header " + header);
            fail("Final Expected " + cellValue + " is not present under column header " + header);
        } else {
            if (clickableRow != null) {
                try {
                    //clickableRow.click();
                    // SeleniumUtil.waitForElementIsClickable("paritallinktext",strAction,8,SeleniumUtilities.OBJWAITTIMEOUT);
                    clickableRow.findElement(By.partialLinkText(strAction)).click();
                    //SeleniumUtil.click(clickableRow.findElement(By.partialLinkText(strAction)),SeleniumUtilities.OBJWAITTIMEOUT);
                } catch (StaleElementReferenceException e) {
                    try {
                        //SeleniumUtil.waitForElementIsClickable("paritallinktext",strAction,8,SeleniumUtilities.OBJWAITTIMEOUT);
                        clickableRow.findElement(By.partialLinkText(strAction)).click();
                        //SeleniumUtil.click(clickableRow.findElement(By.partialLinkText(strAction)),SeleniumUtilities.OBJWAITTIMEOUT);
                    } catch (Exception ee) {
                    }
                } catch (Exception ee) {
                    try {
                        //SeleniumUtil.waitForElementIsClickable("paritallinktext",strAction,8,SeleniumUtilities.OBJWAITTIMEOUT);
                        clickableRow.findElement(By.partialLinkText(strAction)).click();
                        //SeleniumUtil.click(clickableRow.findElement(By.partialLinkText(strAction)),SeleniumUtilities.OBJWAITTIMEOUT);
                    } catch (Exception eee) {
                    }
                }
            }
        }
    }

    public static void clickOnBtn(String button) {
        try {
            SeleniumUtil.click("xpath", ".//span[./text()='" + button + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot(button + ".png");
            logger.info("Error :" + e.getMessage());
        }
    }

    public static void setValuesInTextFields(List<TypeFields> fields) {
        for (TypeFields f : fields) {
            try {
                SeleniumUtil.clear(f.getLocator(), f.getElement(), SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.type(f.getLocator(), f.getElement(), f.getValue(), SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    public static void clickPageBtn(List<ClickFields> fields) {
        for (ClickFields f : fields) {
            try {
//                delay(5000);
                SeleniumUtil.click(SeleniumUtil.getElement(f.getLocator(), f.getElement(), 5, 2), SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (InterruptedException Ex) {
                try {
//                    delay(5000);
                    SeleniumUtil.click(SeleniumUtil.getElement(f.getLocator(), f.getElement(), 5, 2), SeleniumUtilities.OBJWAITTIMEOUT);
                } catch (Exception e) {
                    BaseView.takeScreenshot(f.getElement() + ".png");
                    logger.info("Error :" + Ex.getMessage());
                    TestCase.fail(Ex.getMessage());
                }

            } catch (Exception Ex) {
                try {
//                    delay(5000);
                    SeleniumUtil.click(SeleniumUtil.getElement(f.getLocator(), f.getElement(), 5, 2), SeleniumUtilities.OBJWAITTIMEOUT);
                } catch (Exception e) {
                    BaseView.takeScreenshot(f.getElement() + ".png");
                    logger.info("Error :" + Ex.getMessage());
                    TestCase.fail(Ex.getMessage());
                }
            }

        }
    }

    public static void clickOnAddList(String strLoc, String strElement) {
//        for (ClickFields f : fields) {
        try {
//            delay(5000);
            SeleniumUtil.click(SeleniumUtil.getElement(strLoc, strElement, 5, 2), SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (InterruptedException Ex) {
            try {
//                delay(5000);
                SeleniumUtil.click(SeleniumUtil.getElement(strLoc, strElement, 5, 2), SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception e) {
                BaseView.takeScreenshot(strElement + ".png");
                logger.info("Error :" + Ex.getMessage());
                TestCase.fail(Ex.getMessage());
            }

        } catch (Exception Ex) {
            try {
//                delay(5000);
                SeleniumUtil.click(SeleniumUtil.getElement(strLoc, strElement, 5, 2), SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception e) {
                BaseView.takeScreenshot(strElement + ".png");
                logger.info("Error :" + Ex.getMessage());
                TestCase.fail(Ex.getMessage());
            }
        }

//        }
    }

    public static void clickOnElement(List<ClickFields> fields) {
        for (ClickFields f : fields) {
            try {
//                delay(5000);
                SeleniumUtil.click(SeleniumUtil.getElement(f.getLocator(), f.getElement(), 5, 2), SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (InterruptedException e) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                TestCase.fail(e.getMessage());
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                TestCase.fail(e.getMessage());
            }

        }
    }

    public static void rightClickRootFolderAndSelectOptn(String strFolderName, String menuOptionLink) {
        try {
            waitTillDivisionLoads();
            SeleniumUtil.rightClickSelectMenuOption("xpath", "//span[contains(./text()='" + strFolderName + "')]", menuOptionLink);//"cssSelector", "span#x-tree-node-text", menuOptionLink);
            waitTillDivisionLoads();
        } catch (Exception e) {
            BaseView.takeScreenshot(strFolderName + ":" + menuOptionLink + ".png");
            logger.info("Error :" + e.getMessage());
        } catch (Throwable throwable) {
            BaseView.takeScreenshot(strFolderName + ":" + menuOptionLink + ".png");
            logger.info("Error :" + throwable.getMessage());
        }
    }

    public static void dragDropToFolder(String fromFolder, String toFolder) {
        try {
            waitTillDivisionLoads();
            SeleniumUtil.dragAndDropElement("xpath", ".//span[./text()='" + fromFolder + "']", "xpath", ".//span[./text()='" + toFolder + "']");
            waitTillDivisionLoads();
        } catch (Exception e) {
            BaseView.takeScreenshot(fromFolder + toFolder + ".png");
            logger.info("Error :" + e.getMessage());
        } catch (Throwable throwable) {
            BaseView.takeScreenshot(fromFolder + toFolder + ".png");
            logger.info("Error :" + throwable.getMessage());
        }
    }

    public static void setAvailableFolderTemplate(List<TypeFields> fields) {
        for (TypeFields f : fields) {
            try {
                SeleniumUtil.select(f.getLocator(), f.getElement(), f.getValue(), SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                logger.info("Error :" + e.getMessage());
            }
        }
    }

    public static void clickAssignMembersBtn(List<ClickFields> fields) {
        try {
            SeleniumUtil.click("xpath", "//button[./text()='Assign Members']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (InterruptedException e) {
            BaseView.takeScreenshot("assignmembers.png");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        } catch (Exception e) {
            BaseView.takeScreenshot("assignmembers.png");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static void clickOnLink(String strText) {
        try {
//            SeleniumUtil.click(SeleniumUtil.getElement("xpath", ".//span[./text()='" + strText + "']",2,2), SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.waitForElementIsClickable("xpath", ".//span[./text()='" + strText + "']", 8, 2);
            WebElement ele = SeleniumUtil.getElement("xpath", ".//span[./text()='" + strText + "']", 8, 2);
            SeleniumUtil.click("xpath", ".//span[./text()='" + strText + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            //SeleniumUtil.waitForNonStaleWebElement(ele,5,2);
        } catch (Exception e) {
            BaseView.takeScreenshot(strText + ".png");
            logger.info("Error :" + e.getMessage());
            //TestCase.fail(e.getMessage());
        }
    }

    public static void setFieldValuesOnEditablePage(List<Field> fields) {

        for (Field f : fields) {
            try {
                if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("type").equalsIgnoreCase("checkbox")) {
                    CommonMethods.selectCheckboxByName(f.getName(), f.getValue());

                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("type").equalsIgnoreCase("text")) {
                    CommonMethods.inputValueByName(f.getName(), f.getValue());

                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getTagName().equalsIgnoreCase("select")) {
                    SeleniumUtil.select("name", f.getName(), f.getValue(), SeleniumUtilities.OBJWAITTIMEOUT);

                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getAttribute("type").equalsIgnoreCase("radio")) {
                    CommonMethods.selectCheckboxByName(f.getName(), f.getValue());

                } else if (BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())).getTagName().equalsIgnoreCase("textarea")) {
                    CommonMethods.inputValueByName(f.getName(), f.getValue());
                }
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    public static void verifyModalWindowName(String expectedMsg) {
        assert expectedMsg != null;

        String msg;

        try {
            msg = LxModalWindow.getModalWindowText();
            SeleniumUtilities.Log.info("Expected Message : " + msg);
        } catch (Exception e) {
            BaseView.takeScreenshot(expectedMsg + ".png");
            TestCase.fail(e.getMessage());
            return;
        }

        if (!msg.contains(expectedMsg)) {
            TestCase.fail(String.format(
                    "Modal dialog has error message '%s' but expected '%s'",
                    msg,
                    expectedMsg
            ));
        }
    }

    public static void selectValueFromDropDown(List<TypeFields> fields) {
        for (TypeFields f : fields) {
            try {
                WebElement ele = BrowserDriver.getCurrentDriver().findElement(By.name(f.getElement()));
                List<WebElement> selEle = ele.findElements(By.tagName("Select"));
                SeleniumUtil.getDropDownOption(selEle.get(0), f.getValue());
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getValue() + ".png");
                logger.info("Error :" + e.getMessage());
            }
        }
    }

    public static void selectValueFromListField(List<TypeFields> fields) {
        for (TypeFields f : fields) {
            try {
                SeleniumUtil.select(f.getLocator(), f.getElement(), f.getValue(), SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                logger.info("Error :" + e.getMessage());
                TestCase.fail(e.getMessage());
            }
        }
    }

    public static void verifyMemberContactFields(List<MemberContactsFields> fields) throws Throwable {
        try {
            // delay(8000);
            //SeleniumUtil.switchToFrameHavingElement("cssselector", "div[id='BOGridMember']");
            CommonMethods.switchToVisibleFrame();
            for (MemberContactsFields f : fields) {
                if (validatedTheColumnsOfTheGrid("", "", f.getType(), 1) == false)
                    Assert.fail(f.getType() + " type does not exist !");

                if (validatedTheColumnsOfTheGrid("", "", f.getName(), 2) == false)
                    Assert.fail(f.getType() + " member does not exist !");
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            BaseView.takeScreenshot("MemeberContacts.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyListOfFolder(List<FolderNameField> field) throws Throwable {
//        SeleniumUtil.switchToFrameHavingElement("cssselector", "div[id^=documentTreePanel]");
        SeleniumUtil.switchToFrameHavingElement("cssselector", ".x-grid-cell-inner.x-grid-cell-inner-treecolumn");
        for (FolderNameField f : field) {
            try {
//                if (!SeleniumUtil.elementShouldContain("cssselector", "div[id^=documentTreePanel]", f.getFolderName()))
                if (!SeleniumUtil.elementShouldContain("cssselector", ".x-grid-cell-inner.x-grid-cell-inner-treecolumn", f.getFolderName()))
                    Assert.fail(f.getFolderName() + " type does not exist !");
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getFolderName() + ".png");
                Assert.fail(e.getMessage());
            }
        }
        SeleniumUtil.switchTodefaultContent();
    }

    public static void verifySchedulerApplied(List<SchedulerField> field) throws Throwable {
//        delay(8000);
        SeleniumUtil.switchToFrame(1);
        for (SchedulerField f : field) {
            try {
                if (!SeleniumUtil.elementShouldContain("cssselector", "div[class^=x-grid-item-container]", f.getSchedulerName()))
                    Assert.fail(f.getSchedulerName() + " type does not exist !");
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getSchedulerName() + ".png");
                Assert.fail(e.getMessage());
            }
        }
        SeleniumUtil.switchTodefaultContent();
    }

    public static void verifyPairOfValues(List<Field> fields) throws Throwable {
        try {
            CommonMethods.switchToVisibleFrame();
            CommonMethods.waitTillDivisionLoads();
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector", "table[class=\'rowColor1\']");
            for (Field f : fields) {
                try {
                    SeleniumUtil.verifySplitDataInTableColumns(tableEle, f.getName(), f.getValue());
                } catch (Exception ex) {
                    BaseView.takeScreenshot(f.getValue() + ".png");
                    logger.info("Error :" + ex.getMessage());
                }
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception ex) {
            BaseView.takeScreenshot("I_verify_pair_if_values_on_non_editable_summary_page.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void verifyPairOfValuesOnNonEditablePage(List<Field> fields) throws Throwable {
        try {
            CommonMethods.switchToVisibleFrame();
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector", "table[class=\'frmColor\']");
            for (Field f : fields) {
                try {
                    SeleniumUtil.verifySplitDataInTableColumns(tableEle, f.getName(), f.getValue());
                } catch (Exception ex) {
                    BaseView.takeScreenshot(f.getValue() + ".png");
                    logger.info("Error :" + ex.getMessage());
                }
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("I_verify_pair_if_values_on_non_editable_summary_page.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void verifyPairOfValuesOnNonEditableSummaryPage(List<Field> fields) throws Throwable {
        try {
            SeleniumUtil.switchToFrameHavingElement("cssSelector", "table[class=\'rowColor1\']");
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector", "table[class=\'rowColor1\']");
            for (Field f : fields) {
                try {
                    SeleniumUtil.verifyDataInTableColumn(tableEle, f.getName(), f.getValue());
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

    public static void hitENTERKey(List<ClickFields> fields) {
        for (ClickFields f : fields) {
            try {
                SeleniumUtil.enter(f.getLocator(), f.getElement(), SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception ex) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                logger.info("Error :" + ex.getMessage());
            }
        }
    }

    public static void verifyNameOnHeader(String strHeaderName) {
        try {
            logger.info(SeleniumUtil.getTextValue("id", "prjBanner", SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            try {
                //delay(5000);
                logger.info(SeleniumUtil.getTextValue("id", "prjBanner", SeleniumUtilities.OBJWAITTIMEOUT));
            } catch (Exception ex) {
                BaseView.takeScreenshot("I_see_the_name_on__header_prjBanner.png");
                logger.info("Error :" + e.getMessage());
                TestCase.fail(e.getMessage());
            }
        }
    }

    public static void deselectRadio(List<ClickFields> fields) {
        for (ClickFields f : fields) {
            try {
                if (SeleniumUtil.getWebElementObject(f.getLocator(), f.getElement()).isSelected()) {
                    SeleniumUtil.click(f.getLocator(), f.getElement(), SeleniumUtilities.OBJWAITTIMEOUT);
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                TestCase.fail(e.getMessage());
            }
        }
    }

    public static void waitForElementVisible(List<ClickFields> fields) {
        for (ClickFields f : fields) {
            try {
                WebDriverWait wait = new WebDriverWait(SeleniumUtil.getWebDriver(), SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
                wait.until(ExpectedConditions.visibilityOf(SeleniumUtil.getWebElementObject(f.getLocator(), f.getElement())));
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getElement() + ".png");
                TestCase.fail(e.getMessage());
            }
        }
    }

    public static void clickEditButtonOfMember(String strAction, String strRow, String strGridName) throws Throwable {
        try {
            boolean existFrame = false;
            SeleniumUtil.switchTodefaultContent();
            CommonMethods.waitTillDivisionLoads();
            SeleniumUtil.getFrameIndex("xpath", "//div[@id='" + strGridName + "']//table[" + strRow + "]//td//div/a[text()='" + strAction + "']");
            SeleniumUtil.focusAndClick("xpath", "//div[@id='" + strGridName + "']//table[" + strRow + "]//td//div/a[text()='" + strAction + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            try {
                SeleniumUtil.switchTodefaultContent();
                CommonMethods.waitTillDivisionLoads();
                SeleniumUtil.getFrameIndex("xpath", "//div[@id='" + strGridName + "']//table[" + strRow + "]//td//div/a[text()='" + strAction + "']");
                SeleniumUtil.focusAndClick("xpath", "//div[@id='" + strGridName + "']//table[" + strRow + "]//td//div/a[text()='" + strAction + "']", SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.switchTodefaultContent();

            } catch (Exception ex) {
                BaseView.takeScreenshot(strGridName + ".png");
                TestCase.fail(e.getMessage());
            }
        }
    }

    public static void ifScrollBarExist(String strSubTab) {
        int count = 0;
        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
        try {
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.linkText(strSubTab)));
        } catch (Exception e) {
            do {
                try {
                    wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".x-box-scroller.x-box-scroller-right")));
                    BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".x-box-scroller.x-box-scroller-right")).click();
                } catch (Exception e1) {
                    break;
                }
                count++;
            } while (!findTab(strSubTab) && count < 15);
        }
    }

    public static boolean findTab(String strSubTab) {
        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.linkText(strSubTab)));
            return true;
        } catch (Exception e2) {
            return false;
        }
    }

    public static void clickOnTab(String strSubTab) throws Throwable {
        SeleniumUtil.switchTodefaultContent();
        try {
            ifScrollBarExist(strSubTab);
//            SeleniumUtil.dblClick("paritallinktext", strSubTab, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
            SeleniumUtil.selectHitEnterKey("paritallinktext", strSubTab, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
            SeleniumUtil.click("paritallinktext", strSubTab, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
        } catch (Exception e) {
            try {
                SeleniumUtil.selectHitEnterKey("paritallinktext", strSubTab, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
            } catch (Exception ex) {
                BaseView.takeScreenshot(strSubTab + ".png");
                logger.info("Error :" + e.getMessage());
                TestCase.fail(e.getMessage());
            }
        } finally {
            try {
                BrowserDriver.getCurrentDriver().findElement(By.partialLinkText(strSubTab)).click();
            } catch (Exception e) {
            }
        }
    }

    public static void navToLeftPanel(String strEntityName) {
        try {
            SeleniumUtil.click("cssselector", "img[src='/all/js/ext-3.4.0/resources/images/default/s.gif']", SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
            SeleniumUtil.click("xpath", ".//span[./text()='" + strEntityName + "']", SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
        } catch (Exception e) {
            BaseView.takeScreenshot(strEntityName + ".png");
            logger.info("Error :" + e.getMessage());
        }
    }

    public static void switchToIframe(String strFrameID) {
        SeleniumUtil.switchTodefaultContent();
        WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=" + strFrameID + "]"));
        BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
    }

    public static void verifyUniqueLinkText(String strLinkText) {
        try {
            SeleniumUtil.waitForElementIsClickable("linktext", strLinkText, 8, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
            String screenValue = SeleniumUtil.getTextValue("linktext", strLinkText, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
            Assert.assertEquals(screenValue, strLinkText);
        } catch (Exception e) {
            BaseView.takeScreenshot(strLinkText + ".png");
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyText(List<Field> fields) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        for (Field f : fields) {
            try {
                int size = BrowserDriver.getCurrentDriver().findElements(By.tagName("td")).size();
                int count = 0;
                for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.tagName("td"))) {
                    count++;
                    if (count < size) {
                        if (ele.getText().contains(f.getValue())) {
                            logger.info("Text value: " + f.getValue() + " is present");
                            break;
                        }
                    } else {
                        TestCase.fail("Text value: " + f.getValue() + " is not present");
                    }
                }

            } catch (Exception e) {
                BaseView.takeScreenshot(f.getValue() + ".png");
                Assert.fail(e.getMessage());
            }
        }
    }

    public static void verifyLabelOnModalWindow(List<Field> fields) throws Throwable {
        for (Field f : fields) {
            try {
                int size = BrowserDriver.getCurrentDriver().findElements(By.tagName("td")).size();
                int count = 0;
                for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.tagName("td"))) {
                    count++;
                    if (count < size) {
                        if (ele.getText().contains(f.getValue())) {
                            logger.info("Text value: " + f.getValue() + " is present");
                            break;
                        }
                    } else {
                        TestCase.fail("Text value: " + f.getValue() + " is not present");
                    }
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(f.getValue() + ".png");
                Assert.fail(e.getMessage());
            }
        }
    }

    public static void waitForInvisibilityOfElement(List<Field> fields) {
        try {
            for (Field f : fields) {
                WebDriverWait wait = new WebDriverWait(SeleniumUtil.getWebDriver(), SeleniumUtil.WAIT_TIME);
                wait.until(ExpectedConditions.invisibilityOfElementLocated(SeleniumUtil.getElementBy(f.getName(), f.getValue())));
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("I_wait_for_elements_not_to_visible.png");
        }
    }

    public static void clickLink(String link) {
        try {
            SeleniumUtil.clickElement("linktext", link, SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
            logger.info("Clicked " + link);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("I_click_on_link_generic_for_all.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void clickOnButton(String strText, String strDescription) {
        try {
            SeleniumUtil.click("xpath", ".//span[contains(./text(),'" + strText + "')]", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot(strText + ".png");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static String getValuesOnEditablePage(String name) {
        String strValue = "";
        if (BrowserDriver.getCurrentDriver().findElement(By.name(name)).getAttribute("type").equalsIgnoreCase("checkbox")) {
            if (BrowserDriver.getCurrentDriver().findElement(By.name(name)).isSelected()) {
                strValue = "true";
            } else {
                strValue = "false";
            }
        } else if (BrowserDriver.getCurrentDriver().findElement(By.name(name)).getAttribute("type").equalsIgnoreCase("text")) {
            strValue = BrowserDriver.getCurrentDriver().findElement(By.name(name)).getAttribute("value");

        } else if (BrowserDriver.getCurrentDriver().findElement(By.name(name)).getTagName().equalsIgnoreCase("select")) {
            Select select = new Select(BrowserDriver.getCurrentDriver().findElement(By.name(name)));
            strValue = select.getFirstSelectedOption().getText().trim();

        } else if (BrowserDriver.getCurrentDriver().findElement(By.name(name)).getAttribute("type").equalsIgnoreCase("radio")) {
            if (BrowserDriver.getCurrentDriver().findElement(By.name(name)).isSelected()) {
                strValue = "true";
            } else {
                strValue = "false";
            }

        } else if (BrowserDriver.getCurrentDriver().findElement(By.name(name)).getTagName().equalsIgnoreCase("textarea")) {
            strValue = BrowserDriver.getCurrentDriver().findElement(By.name(name)).getAttribute("value");

        } else if (BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + name + "'][role='combobox']")).getAttribute("role").equalsIgnoreCase("combobox")) {
            strValue = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id^='" + name + "'][role='combobox']")).getAttribute("value").trim();
        }
        return strValue;
    }

    public static void verifyRunReports(String element, String strRow, String strHeaders, String strValues) {
        int intRowCount = 1;
        List<WebElement> rows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector(element));
        for (WebElement trElement : rows) {
            List<WebElement> Cols = trElement.findElements(By.tagName("td"));
            if (intRowCount == 1) {
                assertTrue(trElement.getText().contains(strHeaders.trim()));
                logger.info(trElement.getText());
            }
            for (WebElement tdElement : Cols) {
                if (intRowCount != 1) {
                    if (tdElement.getText().equalsIgnoreCase(strRow)) {
                        assertTrue(trElement.getText().contains(strValues.trim()));
                        logger.info(trElement.getText());
                        return;
                    }
                }
            }
            intRowCount++;
        }
    }

    public static void verifyRunSubRowReports(String element, String strRow, String strValues) {
        List<WebElement> rows = BrowserDriver.getCurrentDriver().findElements(By.cssSelector(element));
        for (WebElement trElement : rows) {
            List<WebElement> Cols = trElement.findElements(By.tagName("td"));
            for (WebElement tdElement : Cols) {
                if (tdElement.getText().equalsIgnoreCase(strRow)) {
                    assertTrue(trElement.getText().contains(strValues.trim()));
                    logger.info(trElement.getText());
                    return;
                }
            }
        }
    }

    public static void enterGridValues(String gridID, List<List<String>> gridValues) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
        // List<WebElement> editableFields = gridElement.findElements(By.cssSelector("div[id^='roweditor'][class='x-box-target'] div[data-ref='inputWrap']>*"));
        List<WebElement> editableFields = gridElement.findElements(By.cssSelector("div[id^='roweditor'][class='x-box-target'] div.x-field .x-form-field"));

        for (int j = 1; j < gridValues.size(); j++) {
            for (int i = 0; i < gridHeaders.size(); i++) {
                if (headers.get(i).getText().contains(gridHeaders.get(i))) {
                    setElementValue(editableFields.get(i), gridValues.get(j).get(i));
                }
            }
        }
    }

    public static void assertGridValues(String gridID, List<List<String>> gridValues) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
        //List<WebElement> editableFields = gridElement.findElements(By.cssSelector("div[id^='roweditor'][class='x-box-target'] div[data-ref='inputWrap']>*"));
        List<WebElement> editableFields = gridElement.findElements(By.cssSelector("div[id^='roweditor'][class='x-box-target'] div.x-field .x-form-field"));

        for (int j = 1; j < gridValues.size(); j++) {
            for (int i = 0; i < gridHeaders.size(); i++) {
                if (headers.get(i).getText().contains(gridHeaders.get(i))) {
                    assertEquals(getElementValue(editableFields.get(i)), gridValues.get(j).get(i));
                }
            }
        }
    }

    public static String getTimeInDifferentFormat(String strValue) {
        if (strValue.equals("[Today's Date]")) {
            strValue = SeleniumUtil.addDaystoCurrentDate(0);
        } else if (strValue.equals("[Yesterday's Date]")) {
            strValue = SeleniumUtil.addDaystoCurrentDate(-1);
        } else if (strValue.equals("[Yesterday's Date with Hour, min and sec]")) {
            strValue = SeleniumUtil.getCurrentDateWithHourMinSecIn12HourFormat(-1);
        } else if (strValue.equals("[Today's date with Hour, min and Sec]")) {
            strValue = SeleniumUtil.getCurrentDateWithHourMinSecIn12HourFormat(0);
        }
        return strValue;
    }

    public static void setElementValue(WebElement element, String strValue) {
        strValue = getTimeInDifferentFormat(strValue);

        if (!strValue.isEmpty()) {
            if (element.getAttribute("role").equalsIgnoreCase("combobox")) {
                try {
                    element.sendKeys(strValue);
                    element.clear();
                    element.sendKeys(strValue);
                    element.clear();
                } catch (Exception e) {
                }

                if (BrowserDriver.getCurrentDriver()
                        .findElements(By.xpath("//ul/div[text()='" + strValue + "'][contains(@class,'x-boundlist-item')]")).size() > 0) {
                    CommonMethods.selectFromComboBox(element, strValue);
                } else {
                    CommonMethods.selectFromComboBoxUsingModalWindow(element, strValue);
                }
            } else if (element.getAttribute("type").equalsIgnoreCase("checkbox") || element.getAttribute("role").equalsIgnoreCase("checkbox")) {
                element.click();
            } else if (element.getAttribute("role").equalsIgnoreCase("spinbutton")) {
                element.clear();
                element.sendKeys(strValue);
            } else if (element.getAttribute("type").equalsIgnoreCase("text")) {
                element.clear();
                element.sendKeys(strValue);
            } else if (element.getTagName().equalsIgnoreCase("textarea")) {
                element.clear();
                element.sendKeys(strValue);
            } else if (element.getAttribute("type").equalsIgnoreCase("radio")) {
                radioSelection(element, strValue);
            }
        }
    }

    public static void radioSelection(WebElement element, String value) {
        if (value.equals("true")) {
            if (!element.isSelected()) {
                element.click();
            }
        } else if (value.equals("false")) {
            if (element.isSelected()) {
                element.click();
            }
        } else {
            element.click();
        }
    }

    public static String getElementValue(WebElement element) {
        if (element.getAttribute("role").equalsIgnoreCase("combobox")) {
            return element.getAttribute("value");
        } else if (element.getAttribute("type").equalsIgnoreCase("checkbox")) {
            if (element.getAttribute("value").contains("on")) {
                return "true";
            } else if (element.getAttribute("value").contains("off")) {
                return "false";
            } else {
                return element.getAttribute("value");
            }
        } else if (element.getAttribute("role").equalsIgnoreCase("spinbutton")) {
            return element.getAttribute("value");
        } else if (element.getAttribute("type").equalsIgnoreCase("text")) {
            return element.getAttribute("value");
        } else if (element.getAttribute("type").equalsIgnoreCase("radio")) {
            if (element.getAttribute("value").contains("on")) {
                return "true";
            } else if (element.getAttribute("value").contains("off")) {
                return "false";
            } else {
                return element.getAttribute("value");
            }
        } else if (element.getAttribute("type").equalsIgnoreCase("textbox")) {
            return element.getAttribute("value");
        } else return null;
    }

    public static void selectFromComboBox(WebElement element, String value) {
        try {
            for (int count = 0; count < 10; count++) {
//                element.clear();
//                element.sendKeys(value);
                SeleniumUtil.clear(element, SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.type(element, value, SeleniumUtilities.OBJWAITTIMEOUT);

                try {
                    try {
                        BaseView.pushShortTimeout();
                        if (SeleniumUtil.getWebElementObject("xpath", "//ul/div[text()='" + value + "'][contains(@class,'x-boundlist-item')]").isDisplayed()) {
//                            BrowserDriver.getCurrentDriver()
//                                    .findElement(By.xpath(("//ul/div[text()='" + value + "'][contains(@class,'x-boundlist-item')]"))).click();
                            SeleniumUtil.click("xpath", "//ul/div[text()='" + value + "'][contains(@class,'x-boundlist-item')]", SeleniumUtilities.OBJWAITTIMEOUT);
//                            SeleniumUtil.escape(element,SeleniumUtilities.OBJWAITTIMEOUT);
                        } else if (SeleniumUtil.getWebElementObject("xpath", "//li[text()='" + value + "'][contains(@class,'x-boundlist-item')]").isDisplayed()) {
//                            BrowserDriver.getCurrentDriver()
//                                    .findElement(By.xpath(("//li[text()='" + value + "'][contains(@class,'x-boundlist-item')]"))).click();
                            SeleniumUtil.click("xpath", "//li[text()='" + value + "'][contains(@class,'x-boundlist-item')]", SeleniumUtilities.OBJWAITTIMEOUT);
//                            SeleniumUtil.escape(element,SeleniumUtilities.OBJWAITTIMEOUT);
                        }
                    } finally {
                        try {
                            BaseView.pushShortTimeout(1);
//                            BrowserDriver.getCurrentDriver()
//                                    .findElement(By.xpath(("//li[text()='" + value + "'][contains(@class,'x-boundlist-item')]"))).click();
                            SeleniumUtil.click("xpath", "//li[text()='" + value + "'][contains(@class,'x-boundlist-item')]", SeleniumUtilities.OBJWAITTIMEOUT);
//                            SeleniumUtil.escape(element,SeleniumUtilities.OBJWAITTIMEOUT);
                        } catch (Exception e) {
                        }
                        BaseView.popDefaultTimeout();
                    }

                } catch (Exception e) {
                }

//            for (int count = 0; count < 10; count++) {
//                element.clear();
//                //delay(1000);
//                element.sendKeys(value);
//                //delay(3000);
//                try {
//                    try {
//                        BaseView.pushShortTimeout();
//                        if (BrowserDriver.getCurrentDriver()
//                                .findElement(By.xpath(("//ul/div[text()='" + value + "'][contains(@class,'x-boundlist-item')]"))).isDisplayed()) {
//                            BrowserDriver.getCurrentDriver()
//                                    .findElement(By.xpath(("//ul/div[text()='" + value + "'][contains(@class,'x-boundlist-item')]"))).click();
//                        } else if (BrowserDriver.getCurrentDriver()
//                                .findElement(By.xpath(("//li[text()='" + value + "'][contains(@class,'x-boundlist-item')]"))).isDisplayed()) {
//                            BrowserDriver.getCurrentDriver()
//                                    .findElement(By.xpath(("//li[text()='" + value + "'][contains(@class,'x-boundlist-item')]"))).click();
//                        }
//                    } finally {
//                        try{
//                            BaseView.pushShortTimeout(1);
//                            BrowserDriver.getCurrentDriver()
//                                    .findElement(By.xpath(("//li[text()='" + value + "'][contains(@class,'x-boundlist-item')]"))).click();
//                        }catch (Exception e){
//                        }
//                        BaseView.popDefaultTimeout();
//                    }
//
//                } catch (Exception e) {
//                }

                if (element.getAttribute("value").contains(value)) {
                    break;
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot(element + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }


    public static void selectFromComboBoxUsingModalWindow(WebElement element, String value) {
        try {
            //for (int count = 0; count < 10; count++) {
            try {
//                WebElement ele = element.findElement(By.xpath("//parent::div[1]/following-sibling::div[contains(@class,'x-form-trigger')]"));
//                delay(1000);
//                ele.click();
//                BrowserDriver.getCurrentDriver().findElement(By.linkText(value)).click();
//                delay(3000);
                SeleniumUtil.click("xpath", "//parent::div[1]/following-sibling::div[contains(@class,'x-form-trigger')]", SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.click("linktext", value, SeleniumUtilities.OBJWAITTIMEOUT);
            } catch (Exception e) {
            }
            //}
        } catch (Exception Ex) {
            BaseView.takeScreenshot(element + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void setSpinButtonFields(String strName, String strValue) {
        try {
            if (BrowserDriver.getCurrentDriver().findElement(By.name(strName)).getAttribute("role").equalsIgnoreCase("spinbutton") && BrowserDriver.getCurrentDriver().findElement(By.name(strName)).getTagName().equals("input")) {
                int count = Integer.parseInt(strValue);
                CommonMethods.clickSpinButton(strName, count);
            }

        } catch (Exception Ex) {
            BaseView.takeScreenshot(strName + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void clickSpinButton(String name, int count) {
        try {
            if (count > 0) {
                for (int i = count; count > 0; count--) {
                    BrowserDriver.getCurrentDriver().findElement(By.xpath("//input[@name='" + name + "']/parent::div//following-sibling::div[1]/div[contains(@class,'x-form-spinner-up')]")).click();
                }
            } else {
                for (int i = count; count < 0; count++) {
                    BrowserDriver.getCurrentDriver().findElement(By.xpath("//input[@name='" + name + "']/parent::div//following-sibling::div[1]/div[contains(@class,'x-form-spinner-down')]")).click();
                }
            }

        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToInputValueByName.png");
            logger.info("Error :" + Ex.getMessage());
            fail("Error :" + Ex.getMessage());
        }
    }

    public static void verifyListOptions(String name, String value) {
        try {
            for (int count = 0; count < 10; count++) {
                SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']").clear();
                //delay(4000);
                if (!SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']").getAttribute("value").equals("")) {

                    for (String s : SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']").getAttribute("value").split("|")) {
                        SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']").sendKeys(Keys.BACK_SPACE);
                        //delay(1000);
                    }
                }

                SeleniumUtil.getWebElementObject("cssselector", "input[id^='" + name + "'][role = 'combobox']").sendKeys(value);
                //delay(3000);
                try {
                    if (BrowserDriver.getCurrentDriver()
                            .findElement(By.xpath(("//ul/div[text()='" + value + "'][contains(@class,'x-boundlist-item')]"))).isDisplayed()) {
                        break;
                    }
                } catch (Exception e) {
                    BaseView.takeScreenshot(name + ".png");
                    fail("Option is not available to select " + value);
                    logger.info("Error :" + e.getMessage());
                }
            }
        } catch (Exception Ex) {
        }
    }


    public static void verifyOptionsInDropDown(String name,String value) throws Throwable {
        try {
            boolean found = false;
            Select select = new Select(BrowserDriver.getCurrentDriver().findElement(By.name(name)));
            for (WebElement option : select.getOptions()) {
                if (AllContractPagesView.getTextAndByPassException(option).contains(value)) {
                    found = true;
                }
            }
            if (!found) {
                BaseView.takeScreenshot("Option: " + value + "not found.png");
                fail("Option: " + value + "not found");
            }
        } catch (Exception Ex) {
        }
    }

    public static void verifyOptionsNotInDropDown(String name,String value) throws Throwable {
        try {
            boolean found = false;
            Select select = new Select(BrowserDriver.getCurrentDriver().findElement(By.name(name)));
            for (WebElement option : select.getOptions()) {
                if (AllContractPagesView.getTextAndByPassException(option).contains(value)) {
                    found = true;
                }
            }
            if (found) {
                BaseView.takeScreenshot("Option: " + value + " found.png");
                fail("Option: " + value + " found");
            }
        } catch (Exception Ex) {
        }
    }

    public static void addRootFolder() {
        try {
            BaseView.pushShortTimeout();
            SeleniumUtil.waitForElementIsClickable("id", "addRoot-btnWrap", 5, SeleniumUtilities.OBJWAITTIMEOUT);
            BaseView.pushShortTimeout();
            SeleniumUtil.click("id", "addRoot-btnWrap", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to addRootFolder");
            fail("Failed to addRootFolder");
        }
    }

    public static void clickOnDropDown() {
        try {
            SeleniumUtil.click("cssselector", "div[id^='ext-comp'] div[id$='trigger-options']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to click On DropDown");
            fail("Failed to click On DropDown");
        }
    }

    public static void clickOnMinusSign() {
        try {
            SeleniumUtil.click("cssselector", "img[data-qtip='Delete']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to click On Minus Sign");
            fail("Failed to click On Minus Sign");
        }
    }

    public static void assertGridValuesGeneric(String gridID, List<List<String>> gridValues) throws Throwable {
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        moveToElementAndFocus(strElement);
        SeleniumUtil.waitForElementPresent("cssselector", strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        List<WebElement> rows = new ArrayList<>();
        try {
            BaseView.pushShortTimeout();
            if (gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']")).size() > 0) {
                rows = gridElement.findElements(By.cssSelector("tr[class*='!important'][class*='x-grid-row']"));
            } else {
                rows = gridElement.findElements(By.cssSelector("tr[class*='x-grid-row']"));
            }
        } finally {
            BaseView.popDefaultTimeout();
        }


        assertTrue("No member line items are fetched " + rows.size(), rows.size() > 0);

        for (int j = 0; j < rows.size(); j++) {
            for (int i = 0; i < gridHeaders.size(); i++) {
                if (headers.get(0).getText().trim().equals("") && (headers.size() - 1) != i) {
                    if (headers.get(i + 1).getText().equals(gridHeaders.get(i))) {

                        AllContractPagesView.focusWebElement(headers.get(i + 1));
                        String headerValue = headers.get(i + 1).getText();

                        AllContractPagesView.focusWebElement(rows.get(j).findElements(By.cssSelector("td[class*='x-grid-cell']")).get(i + 1));
                        String cellValue = AllContractPagesView.getTextAndByPassException(rows.get(j).findElements(By.cssSelector("td[class*='x-grid-cell']")).get(i + 1));

                        assertEquals("Expected " + cellValue + " is not present under header " + headerValue + " row:" + j + " column:" + i + 1, cellValue.trim(), gridValues.get(j + 1).get(i));
                        logger.info("Expected " + cellValue + " is present under header " + headerValue + " row:" + j + " column:" + i + 1);
                    }
                } else {
                    if (headers.get(i).getText().equals(gridHeaders.get(i))) {

                        AllContractPagesView.focusWebElement(headers.get(i));
                        String headerValue = headers.get(i).getText();

                        AllContractPagesView.focusWebElement(rows.get(j).findElements(By.cssSelector("td[class*='x-grid-cell']")).get(i));
                        String cellValue = AllContractPagesView.getTextAndByPassException(rows.get(j).findElements(By.cssSelector("td[class*='x-grid-cell']")).get(i));
                        assertEquals("Expected " + cellValue + " is not present under header " + headerValue + " row:" + j + " column:" + i, cellValue.trim(), gridValues.get(j + 1).get(i));
                        logger.info("Expected " + cellValue + " is present under header " + headerValue + " row:" + j + " column:" + i);
                    }
                }
            }
        }
    }

    public static void verifyPopupWindowTitle(String strTitle) {
        try {
            SeleniumUtil.waitUntilElementContainsText("tagname", "*", strTitle, 5, SeleniumUtilities.OBJWAITTIMEOUT);
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("*"), strTitle));
//            SeleniumUtil.verifyTextValue("xpath",".//div[contains(./text(),'Tax Payments')]","",SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Failed to verify Popup Window Title");
            fail("Failed to verify Popup Window Title");
        }
    }

    public static void enterGridFieldValues(String gridID, List<List<String>> gridValues) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        List<String> gridHeaders = gridValues.get(0);
        String strElement = AllContractPagesView.getGridElement(gridID);
        moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));
        List<WebElement> editableFields = gridElement.findElements(By.cssSelector("div[id^='taskeditor'] div[class*='x-grid-cell-editor'] *[type]"));

        for (int j = 1; j < gridValues.size(); j++) {
            for (int i = 0; i < gridHeaders.size(); i++) {
                if (headers.get(i).getText().contains(gridHeaders.get(i))) {
                    setDataValueOnEditablePage(editableFields.get(i), gridValues.get(j).get(i));
                }
            }
        }
    }

    public static void setDataValueOnEditablePage(WebElement element, String strValue) {
        if (!strValue.isEmpty()) {
            if (element.getAttribute("role").equalsIgnoreCase("combobox")) {
                CommonMethods.selectFromComboBox(element, strValue);
            }
        } else if (element.getAttribute("type").equalsIgnoreCase("checkbox")) {
            element.click();
        } else if (element.getAttribute("role").equalsIgnoreCase("spinbutton")) {
            element.clear();
            element.sendKeys(strValue);
        } else if (element.getAttribute("type").equalsIgnoreCase("text")) {
            element.clear();
            element.sendKeys(strValue);
        } else if (element.getTagName().equalsIgnoreCase("textarea")) {
            element.clear();
            element.sendKeys(strValue);
        }
    }

    public static void doubleClickOnElement(String strElement) {
        try {
            SeleniumUtil.dblClick("xpath", ".//span[./text()='" + strElement + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("dblClickButton.png");
        }
    }

    public static void verifyHeaderAndValuePairOnNonEditableSummaryPage(List<Field> fields) throws Throwable {
        try {
            SeleniumUtil.switchToFrameHavingElement("cssSelector", "table[class=\'rowColor1\']");
            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector", "table[class=\'rowColor1\']");
            for (Field f : fields) {
                try {
                    SeleniumUtil.verifyHeaderAndValuePairInTableColumn(tableEle, f.getName(), f.getValue());
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

    public static void movetogridlastpage() {
        try {
            WebElement ele = SeleniumUtil.getClickableWebElementObject("cssselector", "a[data-qtip='Last Page'][target='_blank']");
            SeleniumUtil.click(ele, SeleniumUtilities.OBJWAITTIMEOUT);
            for (int i = 0; i < 5; i++) {
                if (!CommonMethods.isDisplayed(ele, 1)) {
                    return;
                }
                SeleniumUtil.click(ele, SeleniumUtilities.OBJWAITTIMEOUT);
            }

        } catch (Exception ex) {
            BaseView.takeScreenshot("movetogridlastpage");
        }
    }

    public static void pressTabKey(String strLoctorType, String strLoctor) {
        try {
            SeleniumUtil.escape(strLoctorType, strLoctor, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.tab(strLoctorType, strLoctor, SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception ex) {
            BaseView.takeScreenshot("movetogridlastpage");
        }
    }

    public static boolean waitTillModalWindow(int... times) {
        int waitTime = defaultWaitTime;
        for (int time : times) {
            waitTime = time;
        }
        try {
            WebDriverWait waitModalWindow = new WebDriverWait(BrowserDriver.getCurrentDriver(), waitTime);
            waitModalWindow.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.x-css-shadow+div.x-window")));
            logger.info("Modal window PRESENT continuing....");
            return true;
        } catch (Exception e) {
            logger.info("Modal window not PRESENT continuing....");
            return false;
        }
    }

    public static void searchMember(String strMember) {
        try {
            SeleniumUtil.clear("cssselector", "input[name^='ext-comp-']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.typeHitEnter("cssselector", "input[name^='ext-comp-']", strMember, SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("Member :" + strMember);
        } catch (Exception e) {
            logger.info("Member :" + e.getMessage());
        }
    }

    public static void inactivate(String strMemeber) {
        try {
            SeleniumUtil.click("xpath", ".//tr/td[contains(./text(),'" + strMemeber + "')]/following-sibling::td[7]/input", SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("Inactivate member");
        } catch (Exception e) {
            logger.info("Inactivate member :" + e.getMessage());
        }
    }

    public static void reactivate(String strMemeber) {
        try {
            SeleniumUtil.click("xpath", ".//tr/td[contains(./text(),'" + strMemeber + "')]/following-sibling::td[6]/input", SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("reactivate member");
        } catch (Exception e) {
            logger.info("reactivate member :" + e.getMessage());
        }
    }

    public static void verifyInactivate(String strMemeber) {
        try {
            org.junit.Assert.assertNotNull(SeleniumUtil.getAttributeValue("xpath", ".//tr/td[contains(./text(),'" + strMemeber + "')]/following-sibling::td[7]/input", "checked", SeleniumUtilities.OBJWAITTIMEOUT));
            logger.info("verify the inactivate member");
        } catch (Exception e) {
            logger.info("verify the inactivate member" + e.getMessage());
        }
    }

    public static void verifyReactivate(String strMemeber) {
        try {
            org.junit.Assert.assertNotNull(SeleniumUtil.getAttributeValue("xpath", ".//tr/td[contains(./text(),'" + strMemeber + "')]/following-sibling::td[6]/input", "checked", SeleniumUtilities.OBJWAITTIMEOUT));
            logger.info("verify the Reactivate member");
        } catch (Exception e) {
            logger.info("verify the Reactivate member" + e.getMessage());
        }
    }

    public static void UpdateActiveStatus() {
        try {
            SeleniumUtil.click("cssselector", "input[value='Update Active Status']", SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("Update Active status");
        } catch (Exception e) {
            logger.info("Update Active status :" + e.getMessage());
        }
    }

    public static void clickOnBrowserButton() {
        try {
            SeleniumUtil.click("cssselector", "input[name='upload']", SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("File upload button");
        } catch (Exception e) {
            logger.info("File upload button :" + e.getMessage());
        }
    }

    public static void verifySelectedContractType(List<Field> fields) {
        try {
            boolean strContractTypeExist = false;
            for (Field f : fields) {
                Select select = new Select(BrowserDriver.getCurrentDriver().findElement(By.name(f.getName())));
                for (int i = 0; i < select.getOptions().size(); i++) {

                    if (select.getOptions().get(i).getText().trim().contains(f.getValue())) {
                        strContractTypeExist = true;
                        break;
                    }
                }
                assertTrue("Verify the selected values :", strContractTypeExist);
            }
        } catch (Exception e) {
            logger.info("Verify selected contract type :" + e.getMessage());
        }
    }

    public static void uploadImage(String dataDir, List<String> files) {
        try {
            String dataFolder = null;
            SeleniumUtil.click("cssselector", "input[name='upload']", SeleniumUtilities.OBJWAITTIMEOUT);
            dataFolder = dataDir;
            File dir = new File(FileUtilities.getCWD(), dataFolder);
            org.junit.Assert.assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());
            for (String fileName : files) {
                logger.info("Upload custom list values " + fileName);
                Thread.sleep(10000);
                File file = new File(dir, fileName);
                String f = file.getPath();
                FileUpload.fileUpload(f.replace("/", "\\"));
                org.junit.Assert.assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());
                Thread.sleep(20000);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("I_import_following_files_from.png");
            Assert.fail("I_import_following_files_from");
        }
    }

    public static void uploadxls(String dataDir, List<String> files) {
        try {
            String dataFolder = null;
            FileUpload.setWindowFocus();
            dataFolder = dataDir;
            SeleniumUtil.click("name", "filename", 5);
            File dir = new File(FileUtilities.getCWD(), dataFolder);
            org.junit.Assert.assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());
            for (String fileName : files) {
                logger.info("Upload custom list values " + fileName);
                Thread.sleep(20000);
                File file = new File(dir, fileName);
                String f = file.getPath();
                FileUpload.fileUpload(f.replace("/", "\\"), "");
                org.junit.Assert.assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());
                Thread.sleep(20000);
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("I_import_following_files_from.png");
            Assert.fail("I_import_following_files_from");
        }
    }

    public static void verifyImageUpload() {
        try {
            SeleniumUtil.textContains("Change Member Photo");
            assertTrue(SeleniumUtil.waitForElementVisibilityOf("id", "_memberPhoto", 6, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyImageupload");
            Assert.fail("verify Image upload");
        }
    }

    /*
    Pass only editable field headers as a parameter
     */
    public static void enterGridValuesOneByOne(String gridID, List<List<String>> gridValues) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        String strElement = AllContractPagesView.getGridElement(gridID);
        moveToElementAndFocus(strElement);
        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

        List<WebElement> editableFields = gridElement.findElements(By.cssSelector("div[id^='roweditor'][class='x-box-target'] div[data-ref='inputWrap']>*"));

        for (int j = 0; j < gridValues.size(); j++) {
            int count = 0;
            do {
                count++;
                setElementValue(editableFields.get(Integer.parseInt(gridValues.get(j).get(2))), gridValues.get(j).get(1));
            }
            while (!(editableFields.get(Integer.parseInt(gridValues.get(j).get(2))).getAttribute("value").contains(gridValues.get(j).get(1))) && count < 10);
        }
    }

    public static void clickBtnHavingValue(String button) {
        try {
            SeleniumUtil.handleUnexpectedAlerts();
            SeleniumUtil.waitForElementIsClickable("xpath", "//*[@*='" + button + "']", 8, SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
//            SeleniumUtil.clickElement("xpath", "//*[@*='" + button + "']", SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
            SeleniumUtil.click("xpath", "//*[@*='" + button + "']", SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
            logger.info("Clicked " + button);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("I_click_on_button.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void clickOnSetupMemberButton() {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", "//button[text()='Setup Members']", 6, SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
            SeleniumUtil.click("xpath", "//button[text()='Setup Members']", SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
            logger.info("Clicked Setup Members");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("clickOnSetupMemberButton");
            fail("Error :" + Ex.getMessage());
        }
    }

    public static void verifyLayoutHearder(String strHeader) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[id='tabPanelHeaderText']", 6, SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
            SeleniumUtil.verifyTextValue("cssselector", "div[id='tabPanelHeaderText']", strHeader, SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("verify Layout Hearder");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("verify Layout Hearder");
            fail("Error :" + Ex.getMessage());
        }
    }

    public static void waitForFieldDoesNotExist(String strHeader) {
        try {
            try {
                SeleniumUtil.waitForElementNotPresent("xpath", ".//*[contains(./text(),'" + strHeader + "')]");
            } catch (Throwable throwable) {
                throwable.printStackTrace();
            }
//            SeleniumUtil.waitUntilElementDisappers("xpath",".//*[contains(./text(),'" + strHeader + "')]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("verify waitForFieldDoesNotExist");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("verify wait For Field Does Not Exist");
            fail("Error :" + Ex.getMessage());
        }
    }

    public static void verifyTableColumn(String strTitle, String strDaysOpen, String strDueDate, String strAssignees, String strFormType, String strCreator) {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[contains(.,'" + strTitle + "')]/parent::td/parent::tr/td[3]", strTitle, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[contains(.,'" + strTitle + "')]/parent::td/parent::tr/td[4]", strDaysOpen, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[contains(.,'" + strTitle + "')]/parent::td/parent::tr/td[5]", strDueDate, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[contains(.,'" + strTitle + "')]/parent::td/parent::tr/td[6]", strAssignees, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[contains(.,'" + strTitle + "')]/parent::td/parent::tr/td[7]", strFormType, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[contains(.,'" + strTitle + "')]/parent::td/parent::tr/td[8]", strCreator, SeleniumUtilities.OBJWAITTIMEOUT));
            logger.info("verify Table Column");
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("verify Table Column");
            fail("Error :" + throwable.getMessage());
        }
    }

    public static void verifyTableColumn(String strTitle, String strFormType) {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[contains(.,'" + strTitle + "')]/parent::div/parent::td/parent::tr/td[3]", strTitle, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//a[contains(.,'" + strTitle + "')]/parent::div/parent::td/parent::tr/td[7]", strFormType, SeleniumUtilities.OBJWAITTIMEOUT));
            logger.info("verify Table Column");
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("verify Table Column");
            fail("Error :" + throwable.getMessage());
        }
    }

    public static void clickOnPluseButton(String strPluseButton) {
        try {
            SeleniumUtil.click("cssselector", "span[style='background-image:url(/en/img/plus-red.png);']", SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("verify clickOnPluseButton");
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("clickOnPluseButton");
            fail("Error :" + throwable.getMessage());
        }
    }

    public static void clickOnModalWindowButton(String strPluseButton) {
        try {
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("cssselector", "span[class='x-btn-inner x-btn-inner-default-small']", 6, SeleniumUtilities.OBJWAITTIMEOUT);
            for (WebElement ele : eles) {
                if (ele.getText().trim().equalsIgnoreCase(strPluseButton.trim())) {
                    SeleniumUtil.click(ele, SeleniumUtilities.OBJWAITTIMEOUT);
                    return;
                }
            }
            logger.info("verify clickOnModalWindowButton");
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("clickOnModalWindowButton");
            fail("Error :" + throwable.getMessage());
        }
    }

    public static void waitForElementVisible(String strSearchText) {
        try {
            SeleniumUtil.textContains(strSearchText);
            logger.info("verify text :" + strSearchText);
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("waitForElementVisible");
            fail("Error :" + throwable.getMessage());
        }
    }

    public static void selectRadioOption(String optionName) {
        try {
            List<WebElement> radios = SeleniumUtil.getWebElementObjects("tagName", "td", 4, 1);
            for (WebElement radio : radios) {
                if (AllContractPagesView.getTextAndByPassException(radio).contains(optionName)) {
                    radio.findElement(By.tagName("input")).click();
                }
            }
            logger.info("verify clickOnModalWindowButton");
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("clickOnModalWindowButton");
            fail("Error :" + throwable.getMessage());
        }
    }

    public static void verifyTableRows(List<String> Field, String strLoctorType, String strLoctor) throws Throwable {
        try {
            String strTableValue = SeleniumUtil.getTextValue(strLoctorType, strLoctor, SeleniumUtilities.OBJWAITTIMEOUT);
            for (String f : Field) {
                try {
                    assertTrue(strTableValue.contains(f));
                } catch (Exception ex) {
                    BaseView.takeScreenshot(f + ".png");
                    logger.info("Error :" + ex.getMessage());
                }
            }

        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyTableRows.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void selectRadioButton(String strRadioCaption) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strRadioCaption + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//*[./text()='" + strRadioCaption + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("selectRadioButton");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void enterValue(String strValue, String strField) throws Throwable {
        try {
            SeleniumUtil.waitForElementVisibilityOf("name", strField, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.clear("name", strField, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", strField, strValue, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("enterValue");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void verifyTab(String strTab) throws Throwable {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.waitForElementVisibilityOf("xpath", ".//span[text()='" + strTab + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyTab");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static String getLatestDownloadedFile() {
        File uploadDirectory = new File(System.getProperty("user.dir") + "/target/DownloadFiles");
        File[] downloadedFiles = uploadDirectory.listFiles();

        if (downloadedFiles.length == 0) {
            logger.info("No files to sort");
            return null;
        } else if (downloadedFiles.length == 1) {
            return downloadedFiles[0].getName();
        } else {
            Arrays.sort(downloadedFiles, new Comparator<File>() {
                @Override
                public int compare(File fileOne, File fileTwo) {
                    return Long.valueOf(fileOne.lastModified()).compareTo(fileTwo.lastModified());
                }
            });
        }
        return downloadedFiles[downloadedFiles.length - 1].getName();
    }


    public static void verifyGridIsEmpty(String gridID, String message) {

        try {
            String strElement = AllContractPagesView.getGridElement(gridID);
            moveToElementAndFocus(strElement);

            WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            wait.until(ExpectedConditions.textToBePresentInElement(gridElement.findElement(By.cssSelector(".x-grid-empty")), message));
            logger.info("Grid is empty " + gridID);
        } catch (Exception e) {
            BaseView.takeScreenshot("Grid is not empty " + gridID);
            fail("Grid is not empty " + gridID + "\n" + e.getMessage());
        }

    }


    public static void navigateToTabs(String secondLevelTab, String thirdLevelTab, String entity) throws Throwable {
        SeleniumUtil.switchTodefaultContent();
        for (int i = 0; i < 10; i++) {
            try {
                secondLevelTab = secondLevelTab.replaceAll(" ", "_");
                SeleniumUtil.click("id", "m2_" + entity + "_" + secondLevelTab, SeleniumUtilities.OBJWAITTIMEOUT);
                BaseView.pushShortTimeout();
                if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + thirdLevelTab + "']")).size() > 0) {
//                    SeleniumUtil.click("linkText", thirdLevelTab, SeleniumUtilities.OBJWAITTIMEOUT);
                    PortfolioNavigationView.collapsePortfolioNavigationTab();
                    CommonMethods.clickOnTab(thirdLevelTab);
                    SeleniumUtil.handleUnexpectedAlerts();
                    CommonMethods.waitTillDivisionLoads();
                    break;
                } else {
                    try {
                        BrowserDriver.getCurrentDriver().findElement(By.xpath("//body")).sendKeys(Keys.F5);
                    } catch (Exception e) {
                    }
                }
            } catch (Exception e) {
                if (i == 10) {
                    if (!SeleniumUtil.isElementExist("xpath", "//span[text()='" + thirdLevelTab + "']")) {
                        BaseView.takeScreenshot("token.png");
                        fail("Failed to click third level tab" + e.getMessage());
                    }
                }
            }
        }
    }

    public static void clickUpdateButtonWhileAddingCustomListLineItems(String strElement) throws Exception {
        boolean exist = true;
        int count = 0;
        do {
            count++;
            SeleniumUtil.waitForElementIsClickable("xpath", "//div[starts-with(@id,'customListGrid')]//span[./text()='" + strElement + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> eles = SeleniumUtil.getWebDriver().findElements(By.xpath("//div[starts-with(@id,'customListGrid')]//span[./text()='" + strElement + "']"));
            for (WebElement ele : eles) {
                if (ele.isDisplayed() && (ele.isEnabled())) {
                    ele.sendKeys("");
                    SeleniumUtil.waitForObjectToLoad(ele);
                    SeleniumUtil.getClickableWebElementObject(ele);
                    Actions builder = new Actions(SeleniumUtil.getWebDriver());
                    builder.moveToElement(ele);
                    builder.click(ele);
                    builder.build().perform();
                    break;
                }
            }
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[starts-with(@id,'customListGrid')]//span[./text()='" + strElement + "']")));
            } catch (Exception e) {
                exist = false;
            }
        } while (!exist && count < 10);
    }

    public static void clickUpdateButtonWhileEditingLineItems(String strElement) throws Exception {
        boolean exist = true;
        int count = 0;
        do {
            count++;
            SeleniumUtil.waitForElementIsClickable("xpath", "//div[starts-with(@id,'roweditorbuttons')]//span[./text()='" + strElement + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> eles = SeleniumUtil.getWebDriver().findElements(By.xpath("//div[starts-with(@id,'roweditorbuttons')]//span[./text()='" + strElement + "']"));
            for (WebElement ele : eles) {
                if (ele.isDisplayed() && (ele.isEnabled())) {
                    ele.sendKeys("");
                    SeleniumUtil.waitForObjectToLoad(ele);
                    SeleniumUtil.getClickableWebElementObject(ele);
                    Actions builder = new Actions(SeleniumUtil.getWebDriver());
                    builder.moveToElement(ele);
                    builder.click(ele);
                    builder.build().perform();
                    break;
                }
            }
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 2);
                wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath(".//div[starts-with(@id,'roweditorbuttons')]//span[./text()='" + strElement + "']")));
            } catch (Exception e) {
                exist = false;
            }
        } while (!exist && count < 10);
    }

    public static void getEntityLxID() throws Throwable {
        try {
            String[] arrEntityID = SeleniumUtil.getElementText("xpath", ".//div[@id='EntityId_label']/parent::td", SeleniumUtilities.OBJWAITTIMEOUT).split("\n");
            GenericSteps.lxRecID = arrEntityID[1];
            logger.info("Fetched entity ID " + GenericSteps.lxRecID);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch entity ID.png");
            org.junit.Assert.fail("Unable to fetch entity ID ");
        }
    }


    public static void verifyField(String strField, String strFieldValue) throws Throwable {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[text()='" + strField + "']/ancestor::td[1]/following-sibling::td[1]", strFieldValue, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyField");
            org.junit.Assert.fail("verifyField");
        }
    }

    public static void verifyFieldInSameColumn(String strField, String strFieldValue) throws Throwable {
        if (strFieldValue.contains("[Month Year]")) {
            strFieldValue = SeleniumUtil.dateFormat("MMMM yyyy", SeleniumUtil.addDaystoCurrentDate(0));

        }else if (strFieldValue.contains("[Today's Date with Hour AM/PM]")) {
            strFieldValue = SeleniumUtil.getCurrentDateWithHourIn12HourFormat(0);
            strFieldValue = strFieldValue.replaceAll("AM","").replaceAll("PM","");
        }

        try {
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strField + "']/parent::td[1]", strFieldValue, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyFieldInSameColumn");
            org.junit.Assert.fail("verifyField");
        }
    }


    public static void verifyFieldInSameColumn(List<List<String>> strField) throws Throwable {
        boolean flag = false;
        try {
            for (int i = 0; i < strField.size(); i++) {
                flag = false;
                List<WebElement> headers = BrowserDriver.getCurrentDriver().findElements(By.xpath(".//*[./text()='" + strField.get(i).get(0) + "']/parent::td[1]"));
                for (WebElement header : headers) {
                    if (AllContractPagesView.getTextAndByPassException(header).contains(strField.get(i).get(1))) {
                        flag = true;
                        //break;
                    }
                }
                if (!flag) {
                    BaseView.takeScreenshot("verifyFieldInSameColumn");
                    fail("Expected " + strField.get(i).get(0) + ":" + strField.get(i).get(1) + " combination is not present");
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyFieldInSameColumn");
            org.junit.Assert.fail("verifyField");
        }

    }

    public static boolean arrayHasSameElements(Integer[] array) {
        boolean allEquals = true;

        for (int i = 1; i < array.length; i++) {
            if (array[i - 1] != array[i])
                allEquals = false;
        }
        return allEquals;
    }

    public static void verifyFieldInSameRow(String strField, String strFieldValue) throws Throwable {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[contains(./text(),'" + strField + "')]/parent::td/parent::tr[1]", strFieldValue, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyFieldInSameRow");
            org.junit.Assert.fail("verifyField");
        }
    }

    public static void verifyTotalErrorsOnImportSummaryTable(String strFailures, String strProcessed) throws Throwable {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//b[./text()='Totals']/parent::td/following-sibling::td[1]", strFailures, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//b[./text()='Totals']/parent::td/following-sibling::td[6]", strProcessed, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyTotalErrorsOnImportSummaryTable");
            org.junit.Assert.fail("verifyField");
        }
    }

    public static void verifyTotalErrorsOnImportSummaryTablePopupWindow(String strFailures, String strProcessed) throws Throwable {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[@id='ResultsSummary_label']/parent::td/table[1]/tbody/tr/td[2]/b", strFailures, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[@id='ResultsSummary_label']/parent::td/table[1]/tbody/tr/td[7]/b", strProcessed, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyTotalErrorsOnImportSummaryTablePopupWindow");
            org.junit.Assert.fail("verifyField");
        }
    }

    public static void verifyTotalErrorsOnImportSummaryTableLogFilePopupWindow(String strFailures, String strProcessed) throws Throwable {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", "html/body/table[2]/tbody/tr[3]/td[2]/b", strFailures, SeleniumUtilities.OBJWAITTIMEOUT));
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", "html/body/table[2]/tbody/tr[3]/td[7]/b", strProcessed, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyTotalErrorsOnImportSummaryTableLogFilePopupWindow");
            org.junit.Assert.fail("verifyField");
        }
    }

    public static void verifyRadioByLabel(String name, String value) {
        java.util.List<WebElement> checkboxes = BrowserDriver.getCurrentDriver().findElements(By.tagName("label"));

        for (WebElement label : checkboxes) {
            if (label.getText().contains(name.trim())) {
                if (value.contains("true")) {
                    if (!BrowserDriver.getCurrentDriver().
                            findElement(By.xpath("//label[text()='" + name + "']/preceding-sibling::input[@role='radio']"))
                            .isSelected()) {
                        //fail("Checkbox is not selected");
                        BaseView.takeScreenshot("Checkbox is not selected.png");
                    }
                } else if (value.contains("false")) {
                    if (BrowserDriver.getCurrentDriver().
                            findElement(By.xpath("//label[text()='" + name + "']/preceding-sibling::input[@role='radio']"))
                            .isSelected()) {
                        // fail("Checkbox is selected");
                        BaseView.takeScreenshot("Checkbox is selected.png");
                    }
                }
            }
        }
    }

    public static void searchEntity(String entityType, String entityName) throws Throwable {
        SeleniumUtil.switchTodefaultContent();
        for (int i = 0; i < 20; i++) {
            try {
                SeleniumUtil.clear("name", "searchText", SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);
                SeleniumUtil.type("name", "searchText", entityName, SeleniumUtil.DEFAULT_TIMEOUT_IN_SECONDS);

                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), SeleniumUtilities.OBJWAITTIMEOUT);
                wait.until(ExpectedConditions.textToBePresentInElementValue(By.name("searchText"), entityName));

                logger.info("Entered text " + entityName + " in search field");
                SeleniumUtil.click("cssselector", "img#advSearchDiv", 5);

                OrgChartView.waitTillModalWindowToOpen();
                BaseView.pushShortTimeout(1);
                if (BrowserDriver.getCurrentDriver().findElements(
                        By.xpath("//div[contains(@class,'x-title-text')][text()='Advanced Search']//ancestor::div[contains(@class,'x-window-header')][starts-with(@id,'lxmodalwindow')]//following-sibling::div//span[text()='Search']")).size() > 0) {
                    CommonMethods.clickOnButton("Cancel");
                    BaseView.popDefaultTimeout();

                } else {
                    WebElement visibleModalWindow = null;
                    BaseView.popDefaultTimeout();
                    for (WebElement modalWindow : BrowserDriver.getCurrentDriver().findElements(By.xpath("//div[starts-with(@id,'lxmodalwindow')][contains(@id,'innerCt')][@class='x-autocontainer-innerCt']"))) {
                        if (modalWindow.isDisplayed()) {
                            visibleModalWindow = modalWindow;
                        }
                    }
                    if (visibleModalWindow != null) {
                        AllContractPagesView.focusWebElement(visibleModalWindow.findElement
                                (By.xpath("//div//*[contains(text(),'My " + entityType + "')]/ancestor::div[1]//following-sibling::table//table[@class='rowColor1']"))
                                .findElement(By.partialLinkText(entityName)));
                        visibleModalWindow.findElement
                                (By.xpath("//div//*[contains(text(),'My " + entityType + "')]/ancestor::div[1]//following-sibling::table//table[@class='rowColor1']"))
                                .findElement(By.partialLinkText(entityName)).click();
                        break;
                    }
                }

            } catch (Exception e) {
                if (i == 19) {
                    BaseView.popDefaultTimeout();
                    BaseView.takeScreenshot("Failed to enter text in search field.png");
                    fail("Failed to enter text in search field\n" + e.getMessage());
                }
            }
        }
    }

    public static void clickOnFormSubmit(String strValue) {
        try {
            SeleniumUtil.click("name", "formSubmit1", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot(strValue);
            Assert.fail(strValue);
        }
    }

    public static void clickOnSubmit() {
        try {
            SeleniumUtil.click("name", "Submit", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("clickOnSubmit");
            Assert.fail("clickOnSubmit");
        }
    }

    public static void verifyRowColumn(String strTitle, String strAssignees) {
        try {
//            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//td[./text()='" + strTitle + "']/following-sibling::td[4]", strAssignees, SeleniumUtilities.OBJWAITTIMEOUT));
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strTitle + "']/parent::td/following-sibling::td[4]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strTitle + "']/parent::td/following-sibling::td[4]", strAssignees, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyRowColumn");
            Assert.fail("verifyRowColumn");
        }
    }

    public static String getLatestModifiedDate() {
        File uploadDirectory = new File(System.getenv("APPDATA") + "\\Mozilla\\Firefox\\Profiles\\");
        File[] downloadedFiles = uploadDirectory.listFiles();

        if (downloadedFiles.length == 0) {
            logger.info("No files to sort");
            return null;
        } else if (downloadedFiles.length == 1) {
            return downloadedFiles[0].getName();
        } else {
            Arrays.sort(downloadedFiles, new Comparator<File>() {
                @Override
                public int compare(File fileOne, File fileTwo) {
                    return Long.valueOf(fileOne.lastModified()).compareTo(fileTwo.lastModified());
                }
            });
        }
        System.out.println(downloadedFiles[downloadedFiles.length - 1].getName());
        return downloadedFiles[downloadedFiles.length - 1].getName();
    }

    public static void clickOnAnotherMemberButton() {
        try {
            SeleniumUtil.click("cssselector", "input[value='Another Member']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("clickOnAnotherMemberButton");
            Assert.fail("clickOnAnotherMemberButton");
        }
    }

    public static void enterTodaysDate(String strEleName) {
        try {
            SeleniumUtil.type("name", strEleName, SeleniumUtil.addDaystoCurrentDate(0), SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("enterTodaysDate");
            Assert.fail("enterTodaysDate");
        }
    }

    public static void verifyNameOnHeaderIfNotFail(String strHeaderName) throws Throwable {
        waitForPageLoad();
        SeleniumUtil.waitForElementIsClickable("id", "prjBanner", 8, SeleniumUtilities.OBJWAITTIMEOUT);
        if (!(SeleniumUtil.verifyTextValue("id", "prjBanner", strHeaderName, SeleniumUtilities.OBJWAITTIMEOUT))) {
//        if (!SeleniumUtil.waitForElementContainText("id", "prjBanner", strHeaderName)) {
            BaseView.takeScreenshot("I_did_not_the_name_on__header_prjBanner.png");
            fail("Expected header is not present found:" + BrowserDriver.getCurrentDriver().findElement(By.id("prjBanner")).getText());
        }
    }

    public static void verifyAssignOnWorkFlow(String strMemeber) throws Throwable {
        try {
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='Assignee(s)']/parent::tr/following-sibling::tr//td[6]", strMemeber, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyAssignOnWorkFlow");
            fail("verifyAssignOnWorkFlow :" + ex.getMessage());
        }
    }

    public static void clickOnButtonButDonotFail(String strElement) throws Exception {
        try {
            SeleniumUtil.click("xpath", ".//span[./text()='" + strElement + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Clicked " + strElement + ".png");
            logger.info("Error :" + e.getMessage());
        }
    }

    public static void verifyHiddenFields(String strName) {
        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            wait.until(ExpectedConditions.invisibilityOfElementLocated(By.name(strName)));
        } catch (Exception Ex) {
            BaseView.takeScreenshot(strName + ".png");
            logger.info("Error :" + Ex.getMessage());
            fail(Ex.getMessage());
        }
    }

    public static void clickBtn(String strElement) throws Throwable {
        try {
            CommonMethods.waitTillDivisionLoads();
            BrowserDriver.getCurrentDriver().findElement(By.xpath(".//span[text()='" + strElement + "']")).click();
        } catch (Exception e) {
            BaseView.takeScreenshot("Clicked " + strElement + ".png");
            logger.info("Error :" + e.getMessage());
            fail("Error :" + e.getMessage());
        }
    }

    public static void clickButtonOfGrid(String buttonName, String gridID) throws Throwable {
        try {
            String strElement = AllContractPagesView.getGridElement(gridID);
            moveToElementAndFocus(strElement);
            WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
            gridElement.findElement(By.xpath(".//a[not(contains(@class,'x-item-disabled'))]//span[contains(text(),'" + buttonName + "')]")).click();
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click modal window button.png");
            TestCase.fail(e.getMessage());
        }
    }

    public static void clickOnExpandImg(String strField) throws Throwable {
        try {
            WebElement ele = (WebElement) SeleniumUtil.getWebElementObjects("xpath", ".//*[./text()='" + strField + "']/preceding-sibling::img", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click(ele, SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to expand");
            TestCase.fail(e.getMessage());
        }
    }

    public static void clickOnFieldLink(String strLink, String strField) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strField + "']/following-sibling::td/a[./text()='" + strLink + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//*[./text()='" + strField + "']/following-sibling::td/a[./text()='" + strLink + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click link");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyTheField(String strField, String strValue) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strField + "']/parent::td", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            String strGetValue = SeleniumUtil.getTextValue("xpath", ".//*[./text()='" + strField + "']/parent::td", SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(strGetValue.equals(strField + "\n" + strValue));
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verify The Field value");
            TestCase.fail(e.getMessage());
        }
    }

    public static void clickOnUpdateButton() throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("id", "submitButton", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("id", "submitButton", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click On Update Button");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyText(String strText) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strText + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strText + "']", strText, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verify Text :" + strText);
            TestCase.fail(e.getMessage());
        }
    }


    public static void clickOnField(String strLink, String strField) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strField + "']/parent::td/following-sibling::td/a[./text()='" + strLink + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//*[./text()='" + strField + "']/parent::td/following-sibling::td/a[./text()='" + strLink + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click On Field");
            TestCase.fail(e.getMessage());
        }
    }

    public static void clickOnFieldJurisdiction(String strLink) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='JurisdictionID']/following-sibling::td/a[./text()='" + strLink + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> ele = BrowserDriver.getCurrentDriver().findElements(By.xpath(".//*[./text()='JurisdictionID']/following-sibling::td/a[./text()='" + strLink + "']"));
            SeleniumUtil.click(ele.get(ele.size() - 4), SeleniumUtilities.OBJWAITTIMEOUT);
            CommonMethods.waitTillDivisionLoads();
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to clickOnFieldJurisdiction");
            TestCase.fail(e.getMessage());
        }
    }

    public static void clickOnRefreshButton() throws Throwable {
        try {
            SeleniumUtil.click("name", "Refresh", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to clickOnRefreshButton");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyRegionValue(String strText, String strValue) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strText + "']/following-sibling::td[1]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strText + "']/following-sibling::td[1]", strValue, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verifyValue");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyMarketValue(String strText, String strValue) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strText + "']/parent::tr[1]/ancestor::td/following-sibling::td[1]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strText + "']/parent::tr[1]/ancestor::td/following-sibling::td[1]", strValue, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verifyMarketValue");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyTheValueOnREPage(String strText, String strValue) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strText + "']/ancestor::td/following-sibling::td[1]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strText + "']/ancestor::td/following-sibling::td[1]", strValue, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verifyTheValueOnREPage");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyTheFieldValue(String strText, String strValue) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strText + "']/parent::td", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strText + "']/parent::td", strValue, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verifyTheFieldValue");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyTheFieldValueWithinRow(String strText, String strValue) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strText + "']/parent::td/following-sibling::td[1]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[./text()='" + strText + "']/parent::td/following-sibling::td[1]", strValue, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verifyTheFieldValueWithinRow");
            TestCase.fail(e.getMessage());
        }
    }

    public static void selectByValueFromDropdown(String strValue, String strDropdown) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("name", strDropdown, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.select("name", strDropdown, strValue, SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to selectByValueFromDropdown");
            TestCase.fail(e.getMessage());
        }
    }

    public static void dragAndDropToLocation(String strFromElement, String strTargetElement) throws Exception {
        try {
            SeleniumUtil.dragAndDropElement("xpath", ".//span[./text()='" + strFromElement + "']", "xpath", ".//span[./text()='" + strTargetElement + "']");
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to dragAndDropToLocation");
            TestCase.fail(e.getMessage());
        }
    }

    public static void dragAndDropDocuments(String strFromElement, String strTargetElement) throws Throwable {
        try {
            SeleniumUtil.dragAndDropDocuments("xpath", ".//*[./text()='" + strFromElement + "']", "xpath", ".//*[./text()='" + strTargetElement + "']");
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.waitTillDivisionLoads();
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to dragAndDropToLocation");
            TestCase.fail(e.getMessage());
        }
    }

    public static void expandTree(String strFolder) throws Exception {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", "//*[text()='" + strFolder + "']/preceding::img[2]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", "//*[text()='" + strFolder + "']/preceding::img[2]", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to expandTree");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verify3Columns(String strHeader, String strCol1, String strCol2, String strCol3) throws Exception {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[contains(./text(),'" + strHeader + "')]/following-sibling::td", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//*[contains(./text(),'" + strHeader + "')]/following-sibling::td[1]", strCol1, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//*[contains(./text(),'" + strHeader + "')]/following-sibling::td[2]", strCol2, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//*[contains(./text(),'" + strHeader + "')]/following-sibling::td[3]", strCol3, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verify3Columns");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyTotal3Columns(String strHeader, String strCol1, String strCol2, String strCol3) throws Exception {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[contains(./text(),'" + strHeader + "')]/parent::td/following-sibling::td", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//*[contains(./text(),'" + strHeader + "')]/parent::td/following-sibling::td[1]", strCol1, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//*[contains(./text(),'" + strHeader + "')]/parent::td/following-sibling::td[2]", strCol2, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//*[contains(./text(),'" + strHeader + "')]/parent::td/following-sibling::td[3]", strCol3, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verifyTotal3Columns");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyRadioLabelName(String name) {
        try {
            BrowserDriver.getCurrentDriver().findElement(By.xpath("//*[text()='" + name + "']/preceding-sibling::input[@type='Radio']"));
            return;

        } catch (Exception Ex) {
            BaseView.takeScreenshot("Radio not present.png");
            logger.info("Error :" + Ex.getMessage());
            fail("Error :" + Ex.getMessage());
        }
        fail("Error : Unable to select Radio by label");
    }


    public static void clickOntheText(String strText) throws Exception {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strText + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//*[./text()='" + strText + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to clickOntheText");
            TestCase.fail(e.getMessage());
        }
    }

    public static List<String> getThirdLevelTabNames() throws Throwable {
        List<String> tabs = new ArrayList<>();
        try {
            for (WebElement tab : SeleniumUtil.getWebElementObjects("cssselector", "span.x-tab-inner", 1, SeleniumUtilities.OBJWAITTIMEOUT)) {
                tabs.add(AllContractPagesView.getTextAndByPassException(tab));
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to clickOntheText");
            TestCase.fail(e.getMessage());
        }
        return tabs;
    }

    public static void tabNotPresent(String tabName) throws Throwable {
        List<String> tabs = getThirdLevelTabNames();
        try {
            for (String tab : tabs) {
                if (!tab.equals(tabName)) {
                    logger.info("Tab not present");
                } else {
                    BaseView.takeScreenshot("Tab not present.png");
                    fail("Tab not present" + tabName);
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("Tab not present.png");
            TestCase.fail(e.getMessage());
        }
    }


    public static void verifyNegativeFieldInSameRow(List<List<String>> strField) throws Throwable {
        try {
            for (int i = 0; i < strField.size(); i++) {

                for (WebElement value : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("*[class$='FieldLabel']"))) {
                    if (value.getText().trim().equals(strField.get(i).get(0))) {
                        value = BrowserDriver.getParent(value);
                        assertEquals(value.findElement(By.xpath(".//following-sibling::td//*")).getText(), strField.get(i).get(1));
                    }
                }
            }

        } catch (Exception e) {
            BaseView.takeScreenshot("verifyFieldInSameRow");
            org.junit.Assert.fail("verifyField");
        }
    }

    public static void clickOnBtnHavingValue(String button) {
        try {
            for (int i = 0; i < 10; i++) {
                WebElement visibleButton = BrowserDriver.getCurrentDriver().
                        findElements(By.xpath("//*[@*='" + button + "']")).
                        get(BrowserDriver.getCurrentDriver().
                                findElements(By.xpath("//*[@*='" + button + "']")).size() - 1);
                if (visibleButton.isDisplayed()) {
                    visibleButton.click();
                    break;
                }
            }
            logger.info("Clicked " + button);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("I_click_on_button.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void verifyFieldDisabled(String strField) throws Throwable {
        try {
            if (SeleniumUtil.getWebElementObject("name", strField).isEnabled()) {
                TestCase.fail(strField + "is enabled");
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyFieldDisabled");
            TestCase.fail(e.getMessage());
        }
    }

    public static void enterValueInFields(String strValue, String strField) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strField + "']/following-sibling::input", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.editableField("xpath", ".//*[./text()='" + strField + "']/following-sibling::input", strValue, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("enterValueInFields");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyEnterValueInFields(String strValue, String strField) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[./text()='" + strField + "']/following-sibling::input", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(strValue.equals(SeleniumUtil.getFieldValue("xpath", ".//*[./text()='" + strField + "']/following-sibling::input", SeleniumUtilities.OBJWAITTIMEOUT)));
        } catch (Exception e) {
            BaseView.takeScreenshot("enterValueInFields");
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyRadioByValue(List<Field> fields) {
        for (Field f : fields) {
            if (f.getValue().contains("true")) {
                if (!BrowserDriver.getCurrentDriver().
                        findElement(By.cssSelector("*[value='" + f.getName() + "']"))
                        .isSelected()) {
                    BaseView.takeScreenshot("Checkbox is not selected.png");
                    fail("Checkbox is not selected.png");

                } else if (f.getValue().contains("false")) {
                    if (BrowserDriver.getCurrentDriver().
                            findElement(By.cssSelector("*[value='" + f.getName() + "']"))
                            .isSelected()) {
                        BaseView.takeScreenshot("Checkbox is selected.png");
                        fail("Checkbox is selected.png");
                    }
                }
            }
        }
    }

    public static void verifyRadioByNameUnderDifferentSection(String sectionName, String label, String value) {
        try {
            if (value.contains("true")) {
                if (!BrowserDriver.getCurrentDriver()
                        .findElement(By.xpath(".//*[contains(text(),'" + label + "')]//input[contains(@name,'" + sectionName + "')]")).isSelected()) {
                    BaseView.takeScreenshot("Checkbox is not selected.png");
                    fail("Checkbox is not selected.png");
                }
            }

            if (value.contains("false")) {
                if (BrowserDriver.getCurrentDriver()
                        .findElement(By.xpath(".//*[contains(text(),'" + label + "')]//input[contains(@name,'" + sectionName + "')]")).isSelected()) {
                    BaseView.takeScreenshot("Checkbox is selected.png");
                    fail("Checkbox is selected.png");
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToSelectRadioByName.png");
            logger.info("Error :" + Ex.getMessage());
            fail("Error :" + Ex.getMessage());
        }
    }

    public static void verifyValueInSameColumn(String expVal) {
        try {
            WebDriver driver = SeleniumUtil.getWebDriver();
            String str = driver.findElement(By.xpath(".//*[text()='" + expVal + "']/parent::td")).getText();
            str = str.replace(str, "").trim();
            assertEquals("",str);
            logger.info(expVal + " is Blank");

        } catch (Exception e) {
            BaseView.takeScreenshot("verifyBlankField");
            fail(e.getMessage());
        }
    }

    public static void selectRadioByValue(List<Field> fields) {
        for (Field f : fields) {
            if (f.getValue().contains("true")) {
                if (!BrowserDriver.getCurrentDriver().
                        findElement(By.cssSelector("*[value='" + f.getName() + "']"))
                        .isSelected()) {
                    BrowserDriver.getCurrentDriver().
                            findElement(By.cssSelector("*[value='" + f.getName() + "']")).click();

                } else if (f.getValue().contains("false")) {
                    if (BrowserDriver.getCurrentDriver().
                            findElement(By.cssSelector("*[value='" + f.getName() + "']"))
                            .isSelected()) {
                        BrowserDriver.getCurrentDriver().
                                findElement(By.cssSelector("*[value='" + f.getName() + "']")).click();
                    }
                }
            }
        }
    }

    public static void selectRadioByNameUnderDifferentSection(String sectionName, String label, String value) {
        try {
            SeleniumUtil.waitForElementVisibilityOf(BrowserDriver.getCurrentDriver()
                    .findElement(By.xpath(".//*[contains(text(),'" + label + "')]//input[contains(@name,'" + sectionName + "')]")), 30);
            if (value.contains("true")) {
                if (!BrowserDriver.getCurrentDriver()
                        .findElement(By.xpath(".//*[contains(text(),'" + label + "')]//input[contains(@name,'" + sectionName + "')]")).isSelected()) {
                    BrowserDriver.getCurrentDriver()
                            .findElement(By.xpath(".//*[contains(text(),'" + label + "')]//input[contains(@name,'" + sectionName + "')]")).click();
                }
            }

            if (value.contains("false")) {
                if (BrowserDriver.getCurrentDriver()
                        .findElement(By.xpath(".//*[contains(text(),'" + label + "')]//input[contains(@name,'" + sectionName + "')]")).isSelected()) {
                    BrowserDriver.getCurrentDriver()
                            .findElement(By.xpath(".//*[contains(text(),'" + label + "')]//input[contains(@name,'" + sectionName + "')]")).click();
                }
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("UnableToSelectRadioByName.png");
            logger.info("Error :" + Ex.getMessage());
            fail("Error :" + Ex.getMessage());
        }
    }

    public static void clickOnVisibleBtnHavingValue(String button) {
        try {
            for (int i = 0; i < 10; i++) {
                for (WebElement visibleButton : BrowserDriver.getCurrentDriver().
                        findElements(By.xpath("//*[@*='" + button + "']"))) {
                    if (visibleButton.isDisplayed()) {
                        visibleButton.click();
                        break;
                    }
                }
            }
            logger.info("Clicked " + button);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("I_click_on_button.png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

	public static void clickOnButtonByAttribute(String strAttributeValue) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath",".//*[@*='"+strAttributeValue+"']",8,SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//*[@*='" + strAttributeValue + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("clickOnButtonByAttribute");
            TestCase.fail(e.getMessage());
        }
    }

    public static void searchText(String strSearchText){
        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("*"), strSearchText));
            logger.info("Verified : " + strSearchText);
        } catch (Exception e) {
            try {
                SeleniumUtil.getWebElementObject("xpath", "//*[contains(text(),\"" + strSearchText + "\")]");
            } catch (Exception ex) {
                BaseView.takeScreenshot(strSearchText + ".png");
                logger.info("Error :" + e.getMessage());
                TestCase.fail(e.getMessage());
            }
        }
    }

    public static void selectValueInFields(String strValue,String strField) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath",".//*[contains(./text(),'"+strField+"')]/following-sibling::*/select",8,SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.select("xpath",".//*[contains(./text(),'"+strField+"')]/following-sibling::*/select",strValue,SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("selectValueInFields");
            TestCase.fail(e.getMessage());
        }
    }

    public static void refreshPage() throws Throwable {
        try {
            SeleniumUtil.pageRefresh();
        } catch (Exception e) {
            BaseView.takeScreenshot("selectValueInFields");
            TestCase.fail(e.getMessage());
        }
    }

    public static void selectGridRow(String gridID, String item) throws Throwable {
        try {
            String strElement = AllContractPagesView.getGridElement(gridID);
            CommonMethods.moveToElementAndFocus(strElement);
            WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));

            int count = 0;
            do {
                count++;
                try {
                    gridElement.findElement(By.xpath("//td//div[contains(text(),'" + item + "')]/ancestor::td/preceding-sibling::td//div[@class='x-grid-row-checker']")).click();
                } catch (StaleElementReferenceException se) {
                    logger.info("Stale element.. continue clicking once element is loaded");

                } catch (Exception e) {
                    if (e.getMessage().contains("element is not clickable")) {
                        logger.info("element is not clickable.. continue clicking once element is loaded");
                    } else {
                        logger.info(e.getMessage());
                    }
                }

            } while (!gridElement
                    .findElement(By.xpath("//td//div[contains(text(),'" + item + "')]/ancestor::td/preceding-sibling::td//div[@class='x-grid-row-checker']/ancestor::table[1]"))
                    .getAttribute("class").contains("x-grid-item-selected") && count < 10);

        } catch (Exception Ex) {
            BaseView.takeScreenshot("selected Template");
            logger.info("Error :" + Ex.getMessage());
            Assert.fail("Error :" + Ex.getMessage());
        }
    }
}