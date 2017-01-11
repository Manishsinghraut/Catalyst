package com.lucernex.qa.views.iwms.adminpages.companyadministration.managepages;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.components.ModalDialogPage;
import com.lucernex.qa.pages.iwms.adminpages.companyadministration.managepages.PageLayoutPage;
import com.lucernex.qa.utils.AjaxEnabledPageFactory;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;
import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;
import static junit.framework.TestCase.fail;
import static org.junit.Assert.assertNotNull;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

/**
 * Created by rle0097 on 4/29/2015.
 */
public class PageLayoutView {
    protected static final ModalDialogPage modalDialogPage = AjaxEnabledPageFactory.ajaxInitElements(BrowserDriver.getCurrentDriver(), ModalDialogPage.class);
    private static final Logger logger = Logger.getLogger(Logger.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private static final PageLayoutPage pageLayoutPages = PageFactory.initElements(BrowserDriver.getCurrentDriver(), PageLayoutPage.class);

    public static void selectRadioButtonByAttributeValue(String strValue, String strElementName) {
        WebElement form = modalDialogPage.form;
        List<WebElement> allowReplyRadios = form.findElements(By.cssSelector("input[name=" + strElementName + "]"));
        for (int i = 0; i < allowReplyRadios.size(); i++) {
            if (allowReplyRadios.get(i).getAttribute("value").equalsIgnoreCase(strValue)) {
                allowReplyRadios.get(i).click();
            }
        }
    }

    public static void selectAllowEditYesRadioButton(String strAttributeValue) {
        selectRadioButtonByAttributeValue(strAttributeValue, "AllowEdit");
    }

    public static void deletePageLayout(String strLayoutName) {
        try {
            waitForGridToLoad();
            SeleniumUtil.clickElement("xpath", "//div[@id='BOGridPageLayout']//table//td//div[text()='" + strLayoutName + "']/parent::td/following-sibling::td//a[2]", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (InterruptedException e) {
            BaseView.takeScreenshot(strLayoutName + "Delete.png");
            fail(e.getMessage());
        } catch (Exception e) {
            BaseView.takeScreenshot(strLayoutName + "Delete.png");
            fail(e.getMessage());
        }
    }

    public static void editPageLayout(String strLayoutName) {
        try {
            waitForGridToLoad();
            SeleniumUtil.clickElement("xpath", "//div[@id='BOGridPageLayout']//table//td//div[text()='" + strLayoutName + "']/parent::td/following-sibling::td//a[1]", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (InterruptedException e) {
            BaseView.takeScreenshot(strLayoutName + "Edit.png");
            fail(e.getMessage());
        } catch (Exception e) {
            BaseView.takeScreenshot(strLayoutName + "Edit.png");
            fail(e.getMessage());
        }
    }

    public static void waitForGridToLoad() {
        for (WebElement load : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div#BOGridPageLayout div[id^='loadmask']"))) {
            if (load.isDisplayed()) {
                try {
                    Thread.sleep(5000);
                } catch (Exception e) {
                }
            }
        }
        try {
            Thread.sleep(5000);
        } catch (Exception e) {
        }
    }

    public static void pageLayoutActions(String strLayoutName, String action) {
        try {
            waitForGridToLoad();
            SeleniumUtil.clickElement("xpath", "//div[@id='BOGridPageLayout']//table//td//div[text()='" + strLayoutName + "']/parent::td/following-sibling::td//a[text()='" + action + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("Clicked link " + action);
        } catch (InterruptedException e) {
            BaseView.takeScreenshot(strLayoutName + action + ".png");
            fail(e.getMessage());
        } catch (Exception e) {
            BaseView.takeScreenshot(strLayoutName + action + ".png");
            fail(e.getMessage());
        }
    }

    public static void expandMathOperationTree(String folderName) throws Throwable {
        try {
            CommonMethods.waitTillDivisionLoads();
            SeleniumUtil.waitForElementIsClickable("xpath", "//div[@id='mathOperationTreeHolder']//span[text()='" + folderName + "']/preceding-sibling::img[2]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            WebElement folder = BrowserDriver.getCurrentDriver().findElement(By.xpath("//div[@id='mathOperationTreeHolder']//span[text()='" + folderName + "']/preceding-sibling::img[2]"));
            AllContractPagesView.focusWebElement(folder);
            SeleniumUtil.clickElement("xpath", "//div[@id='mathOperationTreeHolder']//span[text()='" + folderName + "']/preceding-sibling::img[2]", 10);
            CommonMethods.waitTillDivisionLoads();
        } catch (Exception e) {
            BaseView.takeScreenshot("ExpandError.png");
            Assert.fail("Unable to expand folder " + e.getMessage());
        }
    }

    public static void selectMathOperationFields(String folderName) {
        try {
            SeleniumUtil.clickElement("xpath", "//div[@id='mathOperationTreeHolder']//span[text()='" + folderName + "']", 10);
        } catch (Exception e) {
            BaseView.takeScreenshot("FixFolder.png");
            Assert.fail("Selected folder " + e.getMessage());
        }
    }

    public static void removeField(String fieldName) throws Throwable {
        try {
            SeleniumUtil.clickElement("xpath", "//div[@id='listLayoutTab']//*[contains(text(),'" + fieldName + "')][@class='optionalFieldLabel']//preceding-sibling::*//a//*[@alt='remove field']", 10);
            assertTrue(SeleniumUtil.waitForElementNotPresent("xpath", "//div[@id='listLayoutTab']//*[contains(text(),'" + fieldName + "')][@class='optionalFieldLabel']", 5));
        } catch (Exception e) {
            BaseView.takeScreenshot("FixFolder.png");
            Assert.fail("Failed remove field from layout " + e.getMessage());
        }
    }

    public static void clickEditOption(String strFieldLabel, String fieldName) {

        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                SeleniumUtil.handleUnexpectedAlerts();
                //SeleniumUtil.clickElement("xpath", "//div[@class='requiredFieldLabel'][contains(text(),'" + fieldName + "')]//preceding-sibling::div//img[@alt='Edit Options']", 10);
                SeleniumUtil.clickElement("xpath", "//div[@class='" + strFieldLabel + "'][contains(text(),'" + fieldName + "')]//preceding-sibling::div//img[@alt='Edit Options']", 10);
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div[id^='lxmodalwindow']")));
                break;
            } catch (Exception e) {
                BaseView.takeScreenshot("EditOptionsError.png");
            }
        }
        if (i == 10) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div[id^='lxmodalwindow']")));
            } catch (Exception e) {
                BaseView.takeScreenshot(fieldName + "EditOptionsError.png");
                Assert.fail("Selected folder " + e.getMessage());
            }
        }
    }

    public static void clickEditOptionButton(String FieldLabel, String fieldName) {
        try {
            SeleniumUtil.clickElement("xpath", "//div[@class='" + FieldLabel + "'][contains(text(),'" + fieldName + "')]//preceding-sibling::div//img[@alt='Edit Options']", 10);
        } catch (Exception e) {
            BaseView.takeScreenshot(fieldName + "EditOptionsError.png");
            Assert.fail("Selected folder " + e.getMessage());
        }
    }

    public static void moveValue() {
        try {
            pageLayoutPages.moveValue.click();
        } catch (Exception e) {
            BaseView.takeScreenshot("EditOptionsError.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void moveField() {
        try {
            pageLayoutPages.moveField.click();
        } catch (Exception e) {
            BaseView.takeScreenshot("EditOptionsError.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void add() {
        try {
            pageLayoutPages.add.click();
        } catch (Exception e) {
            BaseView.takeScreenshot("EditOptionsError.png");
            Assert.fail("Failed to click " + e.getMessage());
        }
    }

    public static void addNewField() {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                SeleniumUtil.handleUnexpectedAlerts();
                pageLayoutPages.addNewField.click();
                SeleniumUtil.handleUnexpectedAlerts();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.presenceOfElementLocated(By.id("insertMenu")));
                break;
            } catch (Exception e) {
                BaseView.takeScreenshot("EditOptionsError.png");
            }
        }
        if (i == 10) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.presenceOfElementLocated(By.id("insertMenu")));
            } catch (Exception e) {
                BaseView.takeScreenshot("EditOptionsError.png");
                Assert.fail("Failed to click + button" + e.getMessage());
            }
        }
    }

    public static void verifyPageLayout(String strPage, boolean present) {
        if (present) {
            try {
                if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//div[@id='BOGridPageLayout']//table//td//div[text()='" + strPage + "']")).size() == 1) {
                    logger.info(strPage + " present");
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(strPage + "Form.png");
                fail(e.getMessage());
            }

        } else {
            try {
                if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//div[@id='BOGridPageLayout']//table//td//div[text()='" + strPage + "']")).size() == 0) {
                    logger.info(strPage + " not present");
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(strPage + "Page.png");
                fail(e.getMessage());
            }
        }
    }

    public static void dragAndDrop(String strFromElement) throws Exception {
        SeleniumUtil.dragAndDropElement("xpath", "//table//span[text()='" + strFromElement + "']", "cssselector", "newcell[id^=extdd-]");
    }

    public static void verifyNameIsNonEditable(String name, String value) {
        try {

            assertTrue("Expected " + name + " is not editable field but found editable or element is not found",
                    BrowserDriver.getCurrentDriver().findElements(By.name(value)).size() == 0);
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyNameIsNonEditable.png");
            junit.framework.Assert.fail(e.getMessage());
        }
    }

    public static void verifyCityStateIsNonEditable(String value) {
        try {

            assertTrue("Expected " + value + " is not editable field but found editable or element is not found",
                    BrowserDriver.getCurrentDriver().findElements(By.id(value)).size() > 0);
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyCityStateIsNonEditable.png");
            junit.framework.Assert.fail(e.getMessage());
        }
    }

    public static void switchToProjectDetailsSummaryTab(String strLabel) {
        try {
            BrowserDriver.getCurrentDriver().switchTo().defaultContent();
            SeleniumUtil.switchToFrameHavingElement("id", strLabel);
        } catch (Exception e) {
            BaseView.takeScreenshot("FailedSwitchToFrame.png");
            junit.framework.Assert.fail(e.getMessage());
        }
    }

    public static void clickEditOptionForOptionalField(String fieldName) {

        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                SeleniumUtil.handleUnexpectedAlerts();
                SeleniumUtil.clickElement("xpath", "//div[contains(@class,'FieldLabel')][contains(text(),'" + fieldName + "')]//preceding-sibling::div//img[@alt='Edit Options']", 10);
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div[id^='lxmodalwindow']")));
                break;
            } catch (Exception e) {
                BaseView.takeScreenshot("EditOptionsError.png");
            }
        }
        if (i == 10) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div[id^='lxmodalwindow']")));
            } catch (Exception e) {
                BaseView.takeScreenshot(fieldName + "EditOptionsError.png");
                Assert.fail("Selected folder " + e.getMessage());
            }
        }
    }

    public static void clickEditOptionForField(String fieldName) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        int i = 0;
        WebElement field = null;
        for (i = 0; i < 10; i++) {
            List<WebElement> labels = SeleniumUtil.getWebElementObjects("xpath", "//div[@class = 'optionalFieldLabel']", 5, 2);
            for (WebElement label : labels) {
                String fetchedFieldName = AllContractPagesView.getTextAndByPassException(label).trim();
                String args[] = fetchedFieldName.split("\n");
                args[0] = args[0].replaceAll("x", "").trim();
                if (args[0].trim().equals(fieldName)) {
                    field = label;
                    BaseView.pushShortTimeout();
                    if(field.findElements(By.xpath(".//ancestor::div[@class = 'optionalFieldLabel']")).size()>0){
                        field = field.findElement(By.xpath(".//ancestor::div[@class = 'optionalFieldLabel']"));
                        break;
                    }
                    BaseView.popDefaultTimeout();
                    break;
                }
            }

            try {
                assertNotNull("Failed to find field name", field);
                break;
            } catch (AssertionError ae) {
                //BaseView.takeScreenshot("EditOptionsError.png");
                if (i == 9) {
                    fail("Failed to find field name" + ae.getMessage());
                }
            }
        }


        for (i = 0; i < 10; i++) {
            try {
                SeleniumUtil.handleUnexpectedAlerts();
                assertNotNull("Failed to find field name", field);
                field.findElement(By.xpath(".//preceding-sibling::div//img[@alt='Edit Options']")).click();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div[id^='lxmodalwindow']")));
                break;
            } catch (Exception e) {
                BaseView.takeScreenshot("EditOptionsError.png");
            }
        }
        if (i == 10) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div[id^='lxmodalwindow']")));
            } catch (Exception e) {
                BaseView.takeScreenshot(fieldName + "EditOptionsError.png");
                Assert.fail("Selected folder " + e.getMessage());
            }
        }
    }

    public static void clickEditOptionForOptionalFields(String fieldName) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        int i = 0;
        WebElement field = null;
        for (i = 0; i < 10; i++) {
            List<WebElement> labels = SeleniumUtil.getWebElementObjects("xpath", "//div[@class = 'optionalFieldLabel']", 5, 2);
            for (WebElement label : labels) {
                String fetchedFieldName = AllContractPagesView.getTextAndByPassException(label).trim();
                String args[] = fetchedFieldName.split("\n");
                args[0] = args[0].replaceAll("x", "").trim();
                if (args[0].trim().equals(fieldName)) {
                    field = label;
                }
               /* if (AllContractPagesView.getTextAndByPassException(label).trim().equals(fieldName)) {
                    field = label;
                }*/
            }

            try {
                assertNotNull("Failed to find field name", field);
                break;
            } catch (AssertionError ae) {
                //BaseView.takeScreenshot("EditOptionsError.png");
                if (i == 9) {
                    fail("Failed to find field name" + ae.getMessage());
                }
            }
        }


        for (i = 0; i < 10; i++) {
            try {
                SeleniumUtil.handleUnexpectedAlerts();
                assertNotNull("Failed to find field name", field);
                //field.findElements(By.xpath("//preceding-sibling::div//img[@alt='Edit Options']")).get(field.findElements(By.xpath("//preceding-sibling::div//img[@alt='Edit Options']")).size() - 3).click();
                field.findElement(By.xpath(".//preceding-sibling::div//img[@alt='Edit Options']")).click();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div[id^='lxmodalwindow']")));
                break;
            } catch (Exception e) {
                BaseView.takeScreenshot("EditOptionsError.png");
            }
        }
        if (i == 10) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div[id^='lxmodalwindow']")));
            } catch (Exception e) {
                BaseView.takeScreenshot(fieldName + "EditOptionsError.png");
                Assert.fail("Selected folder " + e.getMessage());
            }
        }
    }

    public static void clickEditOptionForOptionalFields(String fieldName,String str) throws Throwable {

        int i = 0;
        WebElement field = null;
        for (i = 0; i < 10; i++) {
            List<WebElement> labels = SeleniumUtil.getWebElementObjects("xpath", "//div[@class = 'optionalFieldLabel']", 5, 2);
            for (WebElement label : labels) {
                if (AllContractPagesView.getTextAndByPassException(label).trim().contains(fieldName)) {
                    field = label;
                    SeleniumUtil.click("xpath",".//*[./text()='"+fieldName+"']//preceding-sibling::div//img[@alt='Edit Options']",SeleniumUtilities.OBJWAITTIMEOUT);
                    return;
                }
            }

            try {
                assertNotNull("Failed to find field name", field);
                break;
            } catch (AssertionError ae) {
                //BaseView.takeScreenshot("EditOptionsError.png");
                if (i == 9) {
                    fail("Failed to find field name" + ae.getMessage());
                }
            }
        }


//        for (i = 0; i < 10; i++) {
//            try {
//                SeleniumUtil.handleUnexpectedAlerts();
//                assertNotNull("Failed to find field name", field);
////                field.findElements(By.xpath("//preceding-sibling::div//img[@alt='Edit Options']")).get(field.findElements(By.xpath("//preceding-sibling::div//img[@alt='Edit Options']")).size() - 3).click();
////                field.findElement(By.xpath("//preceding-sibling::div//img[@alt='Edit Options']")).click();
//                SeleniumUtil.click(field.findElement(By.xpath("//preceding-sibling::div//img[@alt='Edit Options']")),SeleniumUtilities.OBJWAITTIMEOUT);
//                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
//                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div[id^='lxmodalwindow']")));
//                break;
//            } catch (Exception e) {
//                BaseView.takeScreenshot("EditOptionsError.png");
//            }
//        }
//        if (i == 10) {
//            try {
//                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
//                wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div[id^='lxmodalwindow']")));
//            } catch (Exception e) {
//                BaseView.takeScreenshot(fieldName + "EditOptionsError.png");
//                Assert.fail("Selected folder " + e.getMessage());
//            }
//        }
    }

    public static void insertNewField(String fieldName) {
        int i = 0;
        for (i = 0; i < 10; i++) {
            try {
                SeleniumUtil.handleUnexpectedAlerts();
                pageLayoutPages.insertField.click();
                SeleniumUtil.handleUnexpectedAlerts();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div[id^='insertMenu']")));
                break;
            } catch (Exception e) {
                BaseView.takeScreenshot("EditOptionsError.png");
            }
        }
        if (i == 10) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div[id^='insertMenu']")));
            } catch (Exception e) {
                BaseView.takeScreenshot("EditOptionsError.png");
                Assert.fail("Failed to click + button" + e.getMessage());
            }
        }
        CommonMethods.selectFolders(fieldName);
    }

    public static void verifyFormExist(String strFieldName) {
        Assert.assertTrue("I verified Sub form:", verifyEleExist("xpath", ".//span[contains(./text(),'" + strFieldName + "')]", strFieldName));
    }

    public static void verifyFieldExist(String strFieldName) {
        Assert.assertTrue("I verified label :", verifyEleExist("cssselector", "#RentableArea_label", strFieldName));
        Assert.assertTrue("I verified filed :", SeleniumUtil.waitForElementVisibilityOf("xpath", ".//div[@id='RentableArea_label']/following-sibling::input[@name=\"ProjectEntity_RentableArea\"]", 6, SeleniumUtilities.OBJWAITTIMEOUT));
    }

    public static void verifyMathFieldExist() {
        Assert.assertTrue("I verified filed :", SeleniumUtil.waitForElementVisibilityOf("id", "math_RAMathField_0_label", 6, SeleniumUtilities.OBJWAITTIMEOUT));
    }

    public static void verifyFieldExistSummaryPage(String strFieldName, String strValue) {
        Assert.assertTrue("I verified label :", verifyEleExist("cssselector", "#RentableArea_label", strFieldName));
        Assert.assertTrue("I verified filed :", verifyEleExist("xpath", ".//div[@id='RentableArea_label']/parent::td", strValue));
    }

    public static void verifyMathFieldExistSummaryPage(String strFieldName, String strValue) {
        Assert.assertTrue("I verified label :", verifyEleExist("id", "math_RAMathField_0_label", strFieldName));
        Assert.assertTrue("I verified filed :", verifyEleExist("xpath", ".//div[@id='math_RAMathField_0_label']/parent::td", strValue));
    }

    public static boolean verifyEleExist(String strLocator, String strObjectLocator, String strFieldName) {
        boolean flag = false;
        try {
            SeleniumUtil.waitForElementIsClickable(strLocator, strObjectLocator, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> labels = SeleniumUtil.getWebElementObjects(strLocator, strObjectLocator, 5, 2);
            for (WebElement label : labels) {
                if (label.getText().trim().contains(strFieldName)) {
                    flag = true;
                    return flag;
                }
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyEleExist");
            Assert.fail("Failed to verifyEleExist" + ex.getMessage());
        }
        return flag;
    }

    public static boolean selectField(String strFieldName) {
        boolean flag = false;
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", "//div[@id='mathOperationTreeHolder']//span[text()='" + strFieldName + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", "//div[@id='mathOperationTreeHolder']//span[text()='" + strFieldName + "']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", "input[name='opt0']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("selectField");
            Assert.fail("Failed to selectField" + ex.getMessage());
        }
        return flag;
    }

    public static boolean clickOnOperationButton(String strOperator) {
        boolean flag = false;
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector", "input[value='" + strOperator + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", "input[value='" + strOperator + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnOperationButton");
            Assert.fail("Failed to clickOnOperationButton" + ex.getMessage());
        }
        return flag;
    }

    public static boolean clickOnBuildLayoutButton(String strPageLayoutButton) {
        boolean flag = false;
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//td[./text()='" + strPageLayoutButton + "']/parent::tr/td[3]/a[contains(.,'build layout')]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//td[./text()='" + strPageLayoutButton + "']/parent::tr/td[3]/a[contains(.,'build layout')]", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnBuildLayoutButton");
            Assert.fail("Failed to clickOnBuildLayoutButton" + ex.getMessage());
        }
        return flag;
    }


    public static void verifyFieldsOnPageLayout(String strField) {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[contains(./text(),'" + strField + "')]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            Assert.assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//*[contains(./text(),'" + strField + "')]", strField, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyFieldsOnPageLayout");
            Assert.fail("Failed to verifyFieldsOnPageLayout" + ex.getMessage());
        }
    }

    public static void verifyFieldsOnNonEditablePage(String strFieldName, String strFieldValue) {
        try {
            boolean flag = false;
            SeleniumUtil.waitForElementIsClickable("xpath", ".//div[@class='optionalFieldLabel']/parent::td", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> getEles = SeleniumUtil.getWebElementObjects("xpath", ".//div[@class='optionalFieldLabel']/parent::td", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            for (WebElement getEle : getEles) {
                if (getEle.getText().contains(strFieldName) && getEle.getText().contains(strFieldValue)) {
                    flag = true;
                    Assert.assertTrue("verify Fields On Non Editable Page", flag);
                    return;
                }
            }
            Assert.assertTrue(flag);
        } catch (Exception ex) {
            BaseView.takeScreenshot("verify Fields On Non Editable Page");
            Assert.fail("Failed to verify Fields On Non Editable Page" + strFieldName + strFieldValue + ex.getMessage());
        }
    }

    public static void verifyFieldsOnFormLayout(String strField) {
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector", "div[class='optionalFieldLabel']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            Assert.assertTrue(SeleniumUtil.verifyTextValue("cssselector", "div[class='optionalFieldLabel']", strField, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyFieldsOnPageLayout");
            Assert.fail("Failed to verify Fields On FormLayout" + ex.getMessage());
        }
    }

    public static void verifyFieldsOnCustomListPageLayout(String strField) {
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector", "div[class='tblHeader']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            Assert.assertTrue(SeleniumUtil.verifyTextValue("cssselector", "div[class='tblHeader']", strField, SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyFieldsOnPageLayout");
            Assert.fail("Failed to verify Fields On FormLayout" + ex.getMessage());
        }
    }

    public static void verifyFieldsOnSummaryPage(String strFieldName) {
        try {
            boolean flag = false;
            SeleniumUtil.waitForElementIsClickable("xpath", ".//span[@class='optionalFieldLabel']/parent::td", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> getEles = SeleniumUtil.getWebElementObjects("xpath", ".//span[@class='optionalFieldLabel']/parent::td", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            for (WebElement getEle : getEles) {
                if (getEle.getText().contains(strFieldName)) {
                    flag = true;
                    Assert.assertTrue("verify Fields On Non Editable Page", flag);
                    return;
                }
            }
            Assert.assertTrue(flag);
        } catch (Exception ex) {
            BaseView.takeScreenshot("verify Fields On Non Editable Page");
            Assert.fail("Failed to verify Fields On Non Editable Page" + strFieldName + ex.getMessage());
        }
    }

    public static void clickOnAddButton() {
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector", "input[value='Add']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", "input[value='Add']", SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnAddButton");
            Assert.fail("click onn the Add Button" + ex.getMessage());
        }
    }

    public static void clickEditOptionForFields(String fieldName) throws Throwable {

        int i = 0;
        WebElement field = null;
        int position = 0;
        for (i = 0; i < 10; i++) {
            List<WebElement> labels = SeleniumUtil.getWebElementObjects("xpath", "//div[contains(@class,'FieldLabel')]/span", 5, 2);
            position = 0;
            for (WebElement label : labels) {
                if (AllContractPagesView.getTextAndByPassException(label).trim().equals(fieldName)) {
                    field = label;
                }
                if (field == null) {
                    position++;
                }
            }

            try {
                assertNotNull("Failed to find field name", field);
                break;
            } catch (AssertionError ae) {
                if (i == 9) {
                    BaseView.takeScreenshot("EditOptionsError.png");
                    fail("Failed to find field name" + ae.getMessage());
                }
            }
        }

        for (i = 0; i < 10; i++) {
            try {
                SeleniumUtil.handleUnexpectedAlerts();
                assertNotNull("Failed to find field name", field);
               // field.findElements(By.xpath(".//parent::div//preceding-sibling::div//img[@alt='Edit Options']")).get(position).click();
                field.findElement(By.xpath(".//parent::div//preceding-sibling::div//img[@alt='Edit Options']")).click();
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                WebElement visibleModalWindow = BrowserDriver.getCurrentDriver().
                        findElements(By.cssSelector("div[id^='lxmodalwindow'].x-window")).
                        get(BrowserDriver.getCurrentDriver().
                                findElements(By.cssSelector("div[id^='lxmodalwindow'].x-window")).size() - 1);
                wait.until(ExpectedConditions.visibilityOf(visibleModalWindow));
                break;
            } catch (Exception e) {
                BaseView.takeScreenshot("EditOptionsError.png");
            }
        }
        if (i == 10) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                WebElement visibleModalWindow = BrowserDriver.getCurrentDriver().
                        findElements(By.cssSelector("div[id^='lxmodalwindow'].x-window")).
                        get(BrowserDriver.getCurrentDriver().
                                findElements(By.cssSelector("div[id^='lxmodalwindow'].x-window")).size()-1);
                wait.until(ExpectedConditions.visibilityOf(visibleModalWindow));
            } catch (Exception e) {
                BaseView.takeScreenshot(fieldName + "EditOptionsError.png");
                Assert.fail("Selected folder " + e.getMessage());
            }
        }
    }
}