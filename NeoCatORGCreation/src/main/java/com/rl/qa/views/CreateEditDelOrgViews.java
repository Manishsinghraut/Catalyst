package com.rl.qa.views;

import com.rl.qa.browsers.BrowserDriver;
import com.rl.qa.steps.LoginSteps;
import com.rl.qa.utils.BaseView;
import com.rl.qa.utils.SeleniumUtilities;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;
import static junit.framework.TestCase.assertFalse;
import static junit.framework.TestCase.fail;

/**
 * Created by RLE0372 on 18-07-2016.
 */
public class CreateEditDelOrgViews {
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private static final Logger logger = Logger.getLogger(LoginSteps.class.getName());


    public static void clickOnSettings() throws InterruptedException {
        try {
            SeleniumUtil.waitForElementIsClickable("linktext", "SETTINGS", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("linktext", "SETTINGS", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("settingsNew");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }

    }

    public static void clickOnOrganizations() {
        try {
            SeleniumUtil.waitForElementIsClickable("linktext", "ORGANIZATIONS", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("linktext", "ORGANIZATIONS", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("ORGANIZATIONS");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnNewButton(String newButtonId) {
        try {
            SeleniumUtil.waitForElementIsClickable("id", newButtonId, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("id", newButtonId, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("newOrg");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void saveOrg() {
        try {
            SeleniumUtil.click("cssselector", "button[class='btn btn-primary btn-mini']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("saveOrg");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void editOrg(String Organization) throws InterruptedException {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[@id='envtable']/tbody/tr/td[text()='" + Organization + "']/../td[4]//a[@title='Edit']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//*[@id='envtable']/tbody/tr/td[text()='" + Organization + "']/../td[4]//a[@title='Edit']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("editOrg");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clearTheField(String idOfEditbox) {
        try {
            SeleniumUtil.waitForElementIsClickable("id", idOfEditbox, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.clear("id", idOfEditbox, SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("Field cleared :" +idOfEditbox);

        } catch (Exception ex) {
            BaseView.takeScreenshot("clearTheField");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void enterNewOrgName(String New_Organization) {
        try {
            SeleniumUtil.waitForElementIsClickable("id", "orgname", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.clear("id", "orgname", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("id", "orgname", New_Organization, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("editOrg");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void delOrg(String New_Organization) {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", ".//*[@id='envtable']/tbody/tr/td[text()='"+New_Organization+"']/../td[4]/div/button", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//*[@id='envtable']/tbody/tr/td[text()='"+New_Organization+"']/../td[4]/div/button", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("delOrg");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnOK() {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", "//button[text()='OK']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", "//button[text()='OK']", SeleniumUtilities.OBJWAITTIMEOUT);
            Thread.sleep(2000);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnOK");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnSettingsFromOrgPage() {
        try {
            SeleniumUtil.waitForElementIsClickable("id", "settingsNew", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("id", "settingsNew", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnOK");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void seeWorkzone(String idOfElement) {
        try {
            SeleniumUtil.waitForElementIsClickable("id", idOfElement, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            assertTrue(SeleniumUtil.verifyTextValue("id", idOfElement, "WORKZONE", SeleniumUtilities.OBJWAITTIMEOUT)); {
                SeleniumUtil.Log.info("Workzone is displayed");
//            } else {
//                SeleniumUtil.Log.info("Workzone is not displayed");
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("seeWorkzone");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }

    }

    public static void verifyEditedOrg(String editedOrg) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath",".//*[@id='envtable']//*[text()='"+editedOrg+"']",8, SeleniumUtilities.OBJWAITTIMEOUT);
            assertTrue(SeleniumUtil.waitUntilElementContainsText("xpath",".//*[@id='envtable']//*[text()='"+editedOrg+"']",editedOrg,5,SeleniumUtilities.OBJWAITTIMEOUT)); {
                logger.info("Verified edited Organization :" +editedOrg);
//            } else {
//                logger.info("Edited Organization" + editedOrg + " does not exist");
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyEditedOrg");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void verifyLoginPage() {
        try {
            SeleniumUtil.waitForElementVisibilityOf("id", "login-form", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.waitUntilElementContainsText("id", "login-form", "Login", 0, SeleniumUtilities.OBJWAITTIMEOUT);
            assertTrue(SeleniumUtil.verifyTextValue("id", "login-form", "Login", SeleniumUtilities.OBJWAITTIMEOUT)); {
                logger.info("Verified : LoginPage");
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyLoginPage");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void verifyStatusOfOrg(String status,String orgName) {
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);
            String org=properties.getProperty("iwms.organization");
            assertTrue(SeleniumUtil.verifyTextValue("xpath", "//td[@datafield='orgname'][text()='"+org+"']/following-sibling::td[@datafield='active']", status, SeleniumUtilities.OBJWAITTIMEOUT));
            logger.info("Verified created organization with :" +status);
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifiedDomain");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void verifyDeletedOrg(String org) {
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);
            String orgName=properties.getProperty("iwms.organization", "not_filtered");
            SeleniumUtil.mouseOver("id","workZoneNew",SeleniumUtilities.OBJWAITTIMEOUT);
            BaseView.pushShortTimeout();
            BaseView.pushShortTimeout();
            Thread.sleep(4000);
            assertFalse(SeleniumUtil.verifyTextValue("xpath", "//*[@datafield='orgname'] [text()='"+orgName+"']",orgName,SeleniumUtilities.OBJWAITTIMEOUT));
            logger.info("Organization does not exists :deleted");
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyDeletedOrg");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }
    public static void verifyCreatedOrg(String organizationName) {
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);
            String orgName=properties.getProperty("iwms.organization");
            BaseView.pushShortTimeout();
            BaseView.pushShortTimeout();
            WebDriver driver=SeleniumUtil.getWebDriver();
            WebDriverWait wait=new WebDriverWait(driver,20);
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//td[@datafield='orgname'][text()='"+orgName+"']")));
            assertTrue(SeleniumUtil.verifyTextValue("xpath", "//td[@datafield='orgname'][text()='"+orgName+"']", orgName, SeleniumUtilities.OBJWAITTIMEOUT));
            logger.info("Verified created organization:" + orgName);
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyCreatedOrg");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }
    public static void verifyDomainName(String domainName,String orgName) {
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);
            String domain = properties.getProperty("iwms.domain");
            String org=properties.getProperty("iwms.organization");
            assertTrue(SeleniumUtil.verifyTextValue("xpath", "//td[@datafield='orgname'][text()='"+org+"']/following-sibling::td[@datafield='domainname']", domain, SeleniumUtilities.OBJWAITTIMEOUT));
            logger.info("Verified created organization with :" + domain);
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifiedDomain");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnStatusButton() {
        try {
            SeleniumUtil.click("xpath", ".//*[@name='checkbox-toggle']/following-sibling::i",SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnStatusButton");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void selectAllInShowDropDown(String expectedValFromDropdown) {
        try {
            SeleniumUtil.selectByVisibleText("id","filteractive",expectedValFromDropdown,SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("selectAllInShowDropDown");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnOkOnAlertPopUp() {
        try {
            SeleniumUtil.handleParticularAlert("You have selected to change the status of this organization. Proceed?");
        } catch (Exception ex) {
            BaseView.takeScreenshot("selectAllInShowDropDown");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnCloseToast() {
        try {
            SeleniumUtil.click("cssselector",".toast-close-button",SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnCloseToast");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void moveCursorOnMenu() {
        try {
            Thread.sleep(2000);
            SeleniumUtil.mouseOver("xpath", "//strong[text()='Menu']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("moveCursorOnMenu");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }
}


