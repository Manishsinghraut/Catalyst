package com.lucernex.qa.views.iwms.adminpages.companyadministration.manageforms;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.components.ModalDialogPage;
import com.lucernex.qa.utils.AjaxEnabledPageFactory;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import junit.framework.TestCase;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;
import static junit.framework.TestCase.fail;

/**
 * Created by rle0097 on 4/29/2015.
 */
public class FormLayout {
    protected static final ModalDialogPage modalDialogPage = AjaxEnabledPageFactory.ajaxInitElements(BrowserDriver.getCurrentDriver(), ModalDialogPage.class);
    private static final Logger logger = Logger.getLogger(Logger.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void selectRadioButtonByAttributeValue(String strValue,String strElementName){
        WebElement form = modalDialogPage.form;
        List<WebElement> allowReplyRadios = form.findElements(By.cssSelector("input[name="+strElementName+"]"));
        for(int i=0;i<allowReplyRadios.size();i++){
            if(allowReplyRadios.get(i).getAttribute("value").equalsIgnoreCase(strValue)){
                allowReplyRadios.get(i).click();
            }
        }
    }

    public static void selectAllowReplyYesRadioButton(String strAttributeValue){
//        WebElement form = modalDialogPage.form;
//        List<WebElement> allowReplyRadios = form.findElements(By.cssSelector("input[name=AllowReply]"));
//        for(int i=0;i<allowReplyRadios.size();i++){
//            if(allowReplyRadios.get(i).getAttribute("value").equalsIgnoreCase(strTrue)){
//                allowReplyRadios.get(i).click();
//            }
//        }
        selectRadioButtonByAttributeValue(strAttributeValue,"AllowReply");
    }

    public static void selectFieldSetTypeDefaultRadioButton(String strAttributeValue){
        selectRadioButtonByAttributeValue(strAttributeValue,"DerivedCodeSQLTableID");
    }

    public static void selectAllowEditYesRadioButton(String strAttributeValue){
        selectRadioButtonByAttributeValue(strAttributeValue,"AllowEdit");
    }

    public static void selectAllowUserCreateYesRadioButton(String strAttributeValue){
        selectRadioButtonByAttributeValue(strAttributeValue,"AllowUserCreate");
    }

    public static void dragAndDrop(String strFromElement,String strTargetElement) throws Exception {
        //switchToSecondWindow();
        SeleniumUtil.dragAndDropElement("xpath", ".//span[./text()='"+strFromElement+"']", "cssselector", "newcell[id^=extdd-]");
    }

    public static void dragAndDropField(String strFromElement,String strTargetElement) throws Exception {
        SeleniumUtil.dragAndDropElement("xpath", ".//*[@id='editLayoutTable']/tbody/tr[1]/td[2]/el/div/img", "xpath", ".//*[@id='editLayoutTable']/tbody/tr[2]/td[4]/newcell");
    }

    public static void clickSaveLayoutButton() throws Exception {
        SeleniumUtil.click("cssselector","input[value=\"Save Layout\"]",SeleniumUtilities.OBJWAITTIMEOUT);
        SeleniumUtil.handleUnexpectedAlerts();
    }

    public static void clickCloseButton() throws Exception {
        SeleniumUtil.click("cssselector","input[value=\"Close\"]",SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void verifyFieldsOnPopupWindowPageLayout(String strVerifyField) throws Exception {
        boolean boolFieldsStatus = SeleniumUtil.verifyTextValue("cssselector","div[class=\"optionalFieldLabel\"]",strVerifyField,SeleniumUtilities.OBJWAITTIMEOUT);
        assertTrue("Verify fields on pop up window page layout :"+strVerifyField,boolFieldsStatus);
    }

    public static void deleteForms(String strFormName) throws Throwable{
        try{
            waitForGridToLoad();
            SeleniumUtil.clickElement("xpath", "//div[@id='BOGridCodeIssueType']//table//td//div[text()='" + strFormName + "']/parent::td/following-sibling::td//a[2]", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (InterruptedException e) {
            BaseView.takeScreenshot(strFormName + "Delete.png");
            fail(e.getMessage());
        } catch (Exception e) {
            BaseView.takeScreenshot(strFormName+"Delete.png");
            fail(e.getMessage());
        }
    }

    public static void waitForGridToLoad() throws Throwable {
        for (WebElement load : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div#BOGridCodeIssueType div[id^='loadmask']"))) {
            if (load.isDisplayed()) {
                try {
                    Thread.sleep(5000);
                } catch (Exception e) {
                }
            }
            Thread.sleep(5000);
        }
    }

    public static void verifyForms(String strFormName, boolean present) {
        if (present) {
            try {
                if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//div[@id='BOGridCodeIssueType']//table//td//div[text()='" + strFormName + "']")).size() == 1) {
                    logger.info(strFormName + " present");
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(strFormName + "Form.png");
                fail(e.getMessage());
            }

        } else {
            try {
                if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//div[@id='BOGridCodeIssueType']//table//td//div[text()='" + strFormName + "']")).size() == 0) {
                    logger.info(strFormName + " not present");
                }
            } catch (Exception e) {
                BaseView.takeScreenshot(strFormName + "Form.png");
                fail(e.getMessage());
            }
        }
    }

    public static void enterValues(String strFristValues,String strSecondValues) throws Throwable {
        try{
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("cssselector", "input[name^='numberfield-']", 6, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.clear(eles.get(0), SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type(eles.get(0), strFristValues, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.clear(eles.get(1), SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type(eles.get(1), strSecondValues, SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyFieldValues");
            fail(e.getMessage());
        }
    }

    public static void verifyFieldValues(String strFristValues,String strSecondValues,String strSum,String strProduct,String strDivision) throws Throwable {
        try{
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("cssselector", ".x-grid-cell-inner", 6, SeleniumUtilities.OBJWAITTIMEOUT);
            TestCase.assertTrue(SeleniumUtil.getTextValue(eles.get(0), SeleniumUtilities.OBJWAITTIMEOUT).trim().contains(strFristValues.trim()));
            TestCase.assertTrue(SeleniumUtil.getTextValue(eles.get(1), SeleniumUtilities.OBJWAITTIMEOUT).trim().contains(strSecondValues.trim()));
            TestCase.assertTrue(SeleniumUtil.getTextValue(eles.get(2), SeleniumUtilities.OBJWAITTIMEOUT).trim().contains(strSum.trim()));
            TestCase.assertTrue(SeleniumUtil.getTextValue(eles.get(3), SeleniumUtilities.OBJWAITTIMEOUT).trim().contains(strProduct.trim()));
            TestCase.assertTrue(SeleniumUtil.getTextValue(eles.get(4), SeleniumUtilities.OBJWAITTIMEOUT).trim().contains(strDivision.trim()));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyFieldValues");
            fail(e.getMessage());
        }
    }


    public static void enterMathFieldValues(String strTitle,String strFristValues,String strSecondValues) throws Throwable {
        try{
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("cssselector", "textarea[name^='textarea-']", 6, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.clear(eles.get(0), SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type(eles.get(0), strTitle, SeleniumUtilities.OBJWAITTIMEOUT);
            enterValues(strFristValues,strSecondValues);
        } catch (Exception e) {
            BaseView.takeScreenshot("enterMathFieldValues");
            fail(e.getMessage());
        }
    }

    public static void verifyFieldValuesOnSummaryPage(String strTitle,String strNumberXValues,String strNumberYValues,String strAddXandY,String strxdivy,String strMultiplyxy,String strPercentage) throws Throwable {
        try{
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("cssselector", ".x-grid-cell-inner", 6, SeleniumUtilities.OBJWAITTIMEOUT);
            TestCase.assertTrue(SeleniumUtil.getTextValue(eles.get(0), SeleniumUtilities.OBJWAITTIMEOUT).trim().contains(strTitle.trim()));
            TestCase.assertTrue(SeleniumUtil.getTextValue(eles.get(1), SeleniumUtilities.OBJWAITTIMEOUT).trim().contains(strNumberXValues.trim()));
            TestCase.assertTrue(SeleniumUtil.getTextValue(eles.get(2), SeleniumUtilities.OBJWAITTIMEOUT).trim().contains(strNumberYValues.trim()));
            TestCase.assertTrue(SeleniumUtil.getTextValue(eles.get(3), SeleniumUtilities.OBJWAITTIMEOUT).trim().contains(strAddXandY.trim()));
            TestCase.assertTrue(SeleniumUtil.getTextValue(eles.get(4), SeleniumUtilities.OBJWAITTIMEOUT).trim().contains(strxdivy.trim()));
            TestCase.assertTrue(SeleniumUtil.getTextValue(eles.get(5), SeleniumUtilities.OBJWAITTIMEOUT).trim().contains(strMultiplyxy.trim()));
            TestCase.assertTrue(SeleniumUtil.getTextValue(eles.get(6), SeleniumUtilities.OBJWAITTIMEOUT).trim().contains(strPercentage.trim()));
        } catch (Exception e) {
            BaseView.takeScreenshot("verifyFieldValuesOnSummaryPage");
            fail(e.getMessage());
        }
    }

    public static void clickOnLineItem(String strTitle) throws Throwable {
        try{
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("cssselector", ".x-grid-cell-inner", 6, SeleniumUtilities.OBJWAITTIMEOUT);
            if(SeleniumUtil.getTextValue(eles.get(0), SeleniumUtilities.OBJWAITTIMEOUT).trim().contains(strTitle.trim()))
                SeleniumUtil.click(eles.get(0),SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
        } catch (Exception e) {
            BaseView.takeScreenshot("clickOnLineItem");
            fail(e.getMessage());
        }
    }

    public static void verifyTheFieldValueNStyle(String strValue, String strStyle) throws Throwable {
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector", "span[style='"+strStyle+"']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            String strGetValue = SeleniumUtil.getTextValue("cssselector", "span[style='"+strStyle+"']", SeleniumUtilities.OBJWAITTIMEOUT);
            org.junit.Assert.assertTrue(strGetValue.equals(strValue));
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to verify The Field value :"+strValue);
            TestCase.fail(e.getMessage());
        }
    }
}