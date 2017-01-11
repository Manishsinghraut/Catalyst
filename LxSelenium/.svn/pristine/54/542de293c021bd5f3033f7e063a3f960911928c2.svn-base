package com.lucernex.qa.views.setupwizards;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.setupwizards.setupwizardsHomePage;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import javax.validation.constraints.AssertTrue;
import java.util.List;
import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;
import static junit.framework.Assert.fail;

/**
 * Created by ToanD on 05/09/2014.
 */
public class SetupWizardCreateProjectView {
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private static final Logger logger = Logger.getLogger(SetupWizardCreateProjectView.class.getName());

    public static void waitTillProjectCreation () {
        try{
            int count = 0;
            while(count<=7&&(BrowserDriver.getCurrentDriver().findElements(By.xpath("//*[contains(text(),'Finished processing')]")).size()==0)){
                count++;
               // Thread.sleep(60000);
            }
            logger.info("Project created");
        }catch(Exception e){
            BaseView.takeScreenshot("Project not created.png");
            logger.info("Project not created");
            Assert.fail(e.getMessage());
        }
    }

    public static void validateSuccessMessageDontThrowError(List<String> text) throws Throwable {
        Boolean flag=false;
        CommonMethods.waitTillDivisionLoads();
        for (String msg : text) {
            try {
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 60);
                flag= wait.until(ExpectedConditions
                        .textToBePresentInElement(BrowserDriver.getCurrentDriver().findElement(By.tagName("*")), msg));
                assertTrue(flag);
                logger.info("text present " + msg + " in page");
            } catch (Exception Ex) {
                BaseView.takeScreenshot("successMessage.png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    public static void createOrganizationChartByDuplicatingOrganizationChartfrom(String strDropDownValue) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        try {
            SeleniumUtil.click("cssselector","input[id='orgTypeRequestDuplicate']",SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.select("name","srcProgramID",strDropDownValue,SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("createOrganizationChartByDuplicatingOrganizationChartfrom :"+strDropDownValue);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("createOrganizationChartByDuplicatingOrganizationChartfrom");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void columnTypeAndclickOnuploadSpreadsheetDropdown(String strColumnType) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        for (int i = 0; i < 10; i++) {
            try {
                BaseView.pushShortTimeout();
                //SeleniumUtil.waitForElementIsClickable("cssselector", ".x-form-field.x-form-required-field.x-form-text.x-form-text-default.x-form-focus.x-field-form-focus.x-field-default-form-focus", 8, SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.click("cssselector", "div[class*='x-form-arrow-trigger']", SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.waitForElementIsClickable("xpath", ".//div[./text()='" + strColumnType + "']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.click("xpath", "//div[text()='" + strColumnType + "']", SeleniumUtilities.OBJWAITTIMEOUT);
                if (BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[role='combobox']")).getAttribute("value").equals(strColumnType)) {
                    break;
                }
            } catch (Exception Ex) {
                if(i==9){
                    BaseView.popDefaultTimeout();
                    BaseView.takeScreenshot("columnTypeAndclickOnuploadSpreadsheetDropdown");
                    logger.info("Error :" + Ex.getMessage());
                    fail("Failed to select column type in the wizard\n"+Ex.getMessage());
                }
            }
        }
        SeleniumUtil.click("cssselector", ".x-form-field.x-form-required-field.x-form-text.x-form-text-default.x-form-focus.x-field-form-focus.x-field-default-form-focus", SeleniumUtilities.OBJWAITTIMEOUT);
        SeleniumUtil.click("cssselector", "div[id^='ext-comp']  [id$='-trigger-options']", SeleniumUtilities.OBJWAITTIMEOUT);
        logger.info("columnTypeAndclickOnuploadSpreadsheetDropdown :" + strColumnType);
    }

    public static void clickOnUploadButton() throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        try {
            SeleniumUtil.click("cssselector", "input[value='Upload Budget']", SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("clickOnUploadButton :");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("clickOnUploadButton");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public static void clickOnDuplicatingOrgChartButton() throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        try {
            SeleniumUtil.Log.info("Wait for close button to be appears");
            SeleniumUtil.waitForElementIsClickable("cssselector", "span[id='copyOrgChartCloseBtn-btnInnerEl']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", "span[id='copyOrgChartCloseBtn-btnInnerEl']", SeleniumUtilities.OBJWAITTIMEOUT);
            logger.info("clickOnDuplicatingOrgChartButton :");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("clickOnDuplicatingOrgChartButton");
            logger.info("Error :" + Ex.getMessage());
        }
    }
}
