package com.rl.qa.views;

import com.rl.qa.browsers.BrowserDriver;
import com.rl.qa.steps.CreateEditDelDesignerSteps;
import com.rl.qa.utils.BaseView;
import com.rl.qa.utils.SeleniumUtilities;
import org.apache.log4j.Logger;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.io.InputStream;
import java.util.Properties;

import static junit.framework.Assert.assertTrue;
import static junit.framework.TestCase.fail;

/**
 * Created by rle0346 on 3/8/16.
 */
public class CreateEditDelDesignerViews {
    private static final Logger logger = Logger.getLogger(CreateEditDelDesignerSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void clickOnUsersSetupLink(String strUserSetupLink) {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", "//a[text()='" + strUserSetupLink + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", "//a[text()='" + strUserSetupLink + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnUsersSetupLink");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }


    public static void clickOnUsersLink(String strUserLink) {
        try {
            SeleniumUtil.waitForElementIsClickable("xpath", "//a[text()='" + strUserLink + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", "//a[text()='" + strUserLink + "']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnUsersLink");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }


    }


    public static void clickOnNewButton() {
        try {
            SeleniumUtil.waitForElementIsClickable("id", "newUser", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("id", "newUser", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnNewButton");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }

    }

    public static void enterLoginName(String strDesignerName) {
        try {
            //SeleniumUtil.waitForElementVisibilityOf("loginname", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("id", "loginname", strDesignerName, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("enterLoginName");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }

    }

    public static void enterEmailAddress(String strEmailAddress) {
        try {
            //SeleniumUtil.waitForElementVisibilityOf("loginname", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.clear("id" ,"email", 8);
            SeleniumUtil.type("id", "email", strEmailAddress, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("enterEmailAddress");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }

    }

    public static void enterPassword(String strPassword) {
        try {
            //SeleniumUtil.waitForElementVisibilityOf("loginname", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("id", "password", strPassword, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("enterPassword");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }

    }

    public static void enterConfirmPassword(String strConfPassword) {
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);
            String userPassword=properties.getProperty("iwms.designeruserpassword", "not_filtered");
            SeleniumUtil.type("id", "cnfPassword", userPassword, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("enterConfirmPassword");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }


    }


    public static void selectOrganization(String strOrganization) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", "//span[text()='All']", 8);
            SeleniumUtil.click("xpath", "//span[text()='All']", 8);
            SeleniumUtil.waitForElementVisibilityOf("xpath", "//div[text()='"+strOrganization+"']", 8);
            SeleniumUtil.click("xpath", "//div[text()='"+strOrganization+"']", 8);

        } catch (Exception ex) {
            BaseView.takeScreenshot("selectOrganization");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }


    }

    public static void selectRole(String arg0) {
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);
            String userRole=properties.getProperty("iwms.role", "not_filtered");
            SeleniumUtil.waitForElementVisibilityOf("xpath", "//label[text()='" + userRole + "']/input/../i", 8);
            SeleniumUtil.click("xpath", "//label[text()='" + userRole + "']/input/../i", 8);

        } catch (Exception ex) {
            BaseView.takeScreenshot("selectRole");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }


    }

    public static void selectTeam(String strOrganization) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", "//label[text()='" + strOrganization + "_Admins']/input/../i", 8);
            SeleniumUtil.click("xpath", "//label[text()='" + strOrganization + "_Admins']/input/../i", 8);

            SeleniumUtil.waitForElementVisibilityOf("xpath", "//label[text()='" + strOrganization + "_Admins']/input/../i", 8);
            SeleniumUtil.click("xpath", "//label[text()='" + strOrganization + "_DEV']/input/../i", 8);

            SeleniumUtil.waitForElementVisibilityOf("xpath", "//label[text()='" + strOrganization + "_Admins']/input/../i", 8);
            SeleniumUtil.click("xpath", "//label[text()='" + strOrganization + "_QA']/input/../i", 8);

            SeleniumUtil.waitForElementVisibilityOf("xpath", "//label[text()='" + strOrganization + "_Admins']/input/../i", 8);
            SeleniumUtil.click("xpath", "//label[text()='" + strOrganization + "_DevOps']/input/../i", 8);


        } catch (Exception ex) {
            BaseView.takeScreenshot("selectTeam");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }


    }

    public static void clickSaveButton() {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", "//button[@class='btn btn-primary btn-mini']", 8);
            SeleniumUtil.click("xpath", "//button[@class='btn btn-primary btn-mini']", 8);
        } catch (Exception ex) {
            BaseView.takeScreenshot("clickSaveButton");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickEditDesignerButton(String strDesigner) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//*[@id='envtable']/tbody/tr/td[text()='"+strDesigner+"']/../td[5]/div/a[@title='Edit']", 8);
            SeleniumUtil.click("xpath", ".//*[@id='envtable']/tbody/tr/td[text()='"+strDesigner+"']/../td[5]/div/a[@title='Edit']", 8);

        } catch (Exception ex) {
            BaseView.takeScreenshot("clickEditDesignerButton");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }

    }


    public static void verifyDesignerUserCreation(String arg0) {
        try {
            BaseView.pushShortTimeout();
            BaseView.pushShortTimeout();
            Thread.sleep(10000);
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);
            String designerUserName=properties.getProperty("iwms.designerusername", "not_filtered");
            SeleniumUtil.waitUntilElementContainsText("xpath", ".//*[@id='envtable']//td[@datafield='loginname' and text()='"+designerUserName+"']", designerUserName, 0, 10);
            logger.info("User is verified");
            assertTrue (SeleniumUtil.verifyTextValue("xpath", ".//*[@id='envtable']//td[@datafield='loginname' and text()='"+designerUserName+"']",designerUserName,SeleniumUtilities.OBJWAITTIMEOUT));
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyDesignerUserCreation");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }

    }



    public static void VerifyEmailAddress(String arg0, String arg1) {
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);
            String designerUserName=properties.getProperty("iwms.designerusername","not_filtered");
            String emailId=properties.getProperty("iwms.emailaddress", "not_filtered");
            assertTrue(SeleniumUtil.verifyTextValue("xpath", "//*[@datafield='loginname' and text()='"+designerUserName+"']/following-sibling::td[@datafield='email' and text()='"+emailId+"']", emailId , 10));
            logger.info("Designer user Email Address is verified");
        } catch (Exception ex) {
            BaseView.takeScreenshot("VerifyEmailAddress");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }


    public static void VerifyDesignerRoleInTable(String strDesigner, String strRole) {
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);
            String designerUserName=properties.getProperty("iwms.designerusername","not_filtered");
            String role=properties.getProperty("iwms.role", "not_filtered");
            assertTrue(SeleniumUtil.verifyTextValue("xpath", "//*[@datafield='loginname' and text()='"+designerUserName+"']/following-sibling::td[@datafield='userrolename' and text()='"+role+"']",role, 10));
            logger.info("Designer user Role is verified");
        } catch (Exception ex) {
            BaseView.takeScreenshot("VerifyDesignerRoleInTable");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }

    }


    public static void VerifyOrganizationInTable(String strDesigner, String strOrganization) {
        try {
            //WebElement wb=  SeleniumUtil.getElement("xpath", "//td[text()='" +strDesignerUser+"'][1]", 8, 8);
            //logger.info(wb);
            //SeleniumUtil.waitForElementVisibilityOf(wb, 8, 8);
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream stream = classLoader.getResourceAsStream("lx-selenium.properties");
            Properties properties = new Properties();
            properties.load(stream);
            String designerUserName=properties.getProperty("iwms.designerusername","not_filtered");
            String org=properties.getProperty("iwms.organization", "not_filtered");
            assertTrue(SeleniumUtil.verifyTextValue("xpath", "//*[@datafield='loginname' and text()='"+designerUserName+"']/following-sibling::td[@datafield='orgname' and text()='"+org+"']", org , 10));
            logger.info("Assigned organization to Designer is verified");
        } catch (Exception ex) {
            BaseView.takeScreenshot("VerifyOrganizationInTable");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }

    }



    public static void VerifyLoginNameDisabled() {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", "//input[@disabled]", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.getAttributeValue("xpath", "//input[@disabled]", "disabled", 8);
        } catch (Exception ex) {
            BaseView.takeScreenshot("VerifyLoginNameDisabled");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());


        }
    }



    public static void clickOnUpdatePasswordCheckbox()
    {
        try
        {
            SeleniumUtil.click("id", "chkadduserldap", 8);

        }
        catch (Exception ex) {
            BaseView.takeScreenshot("clickOnUpdatePasswordCheckbox");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());


        }
    }


    public static void clickOnDeleteButton(String strDesigner)
    {
        try
        {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//*[@id='envtable']/tbody/tr/td[text()='"+strDesigner+"']/../td[5]/div/a[@title='Delete']/i", 8);
            SeleniumUtil.click("xpath", ".//*[@id='envtable']/tbody/tr/td[text()='"+strDesigner+"']/../td[5]/div/a[@title='Delete']/i", 8);

        } catch (Exception ex) {
            BaseView.takeScreenshot("clickOnDeleteButton");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());


        }
    }

    public static void clickOnOkButton(String strOk)
    {
        try
        {
            SeleniumUtil.waitForElementVisibilityOf("xpath", "//button[text()='"+strOk+"']", 8);
            SeleniumUtil.click("xpath", "//button[text()='"+strOk+"']", 8);

        }
        catch (Exception ex) {
            BaseView.takeScreenshot("clickOnOkButton");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());


        }
    }


    public static void verfiyEmailAddressUpdated(String strEmailAddress) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", "//td[text()='"+strEmailAddress+"']", 8);
            SeleniumUtil.waitUntilElementContainsText("xpath", "//td[text()='"+strEmailAddress+"']", strEmailAddress , 0, 10);

        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyDesignerUserCreation");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }

    }



    public static void selectDefaultTeam(String strDefaultTeam) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", "//label[text()='"+strDefaultTeam+"']/input/../i", 8);
            SeleniumUtil.click("xpath", "//label[text()='"+strDefaultTeam+"']/input/../i", 8);

        } catch (Exception ex) {
            BaseView.takeScreenshot("selectTeam");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }

    }


    public static void verifyButtonIsEnabled(String org, String edit) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//*[@id='envtable']//td[text()='"+org+"']/following-sibling::td//*[@title='"+edit+"']",5, SeleniumUtilities.OBJWAITTIMEOUT);
            WebElement wb=SeleniumUtil.getElement("xpath",".//*[@id='envtable']//td[text()='"+org+"']/following-sibling::td//*[@title='"+edit+"']",SeleniumUtilities.OBJWAITTIMEOUT);
            assertTrue(SeleniumUtil.assertNotNull(wb));{
                logger.info(edit +" is Enabled");
//            } else {
//                logger.info(edit +" is disbled");
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyButtonIsEnabled");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }    }

    public static void verifyDeletedUser(String strDesigner) {
        try {
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//*[@id='envtable']//*[text()='"+strDesigner+"']/following-sibling::td[2]",1, SeleniumUtilities.OBJWAITTIMEOUT);
            if (SeleniumUtil.isElementExist("xpath", ".//*[@id='envtable']//*[text()='"+strDesigner+"']")) {
                logger.info("This User exists : Not deleted");
            } else {
                logger.info("This User does not exists : Org deleted");
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("verifyDeletedUser");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

}


