package com.lucernex.qa.views.dashboard;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import junit.framework.TestCase;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static com.lucernex.qa.views.BaseView.takeScreenshot;
import static junit.framework.Assert.assertTrue;
import static junit.framework.Assert.fail;

/**
 * Created by RLE0097 on 07-06-2016.
 */
public class DashBoardView {
    private static final Logger logger = Logger.getLogger(DashBoardView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private String dataFolder = null;

    public static void verifyCustomHTMLModuleTitle(String strText,String strFontSize,String strFontColor) {
        try{
            SeleniumUtil.waitForElementVisibilityOf("xpath", ".//*[./text()='"+strText+"']", 8,SeleniumUtilities.DEFAULT_SLEEP_TIME_IN_SECONDS);
            WebElement fontSizeEle= SeleniumUtil.getWebElementObject("xpath", ".//*[./text()='"+strText+"']");
            assertTrue(fontSizeEle.getAttribute("size").equals(strFontSize));
            assertTrue(fontSizeEle.getAttribute("color").equals("FF0000"));

            WebElement backgroundColorEle= SeleniumUtil.getWebElementObject("xpath", ".//*[./text()='"+strText+"']/parent::span");
            assertTrue(backgroundColorEle.getAttribute("style").equals("background-color: rgb(255, 255, 0);"));


//            SeleniumUtil.waitForElementVisibilityOf("cssselector", "html>body", 8,SeleniumUtilities.DEFAULT_SLEEP_TIME_IN_SECONDS);
//            WebElement backgroundColorEle= SeleniumUtil.getWebElementObject("cssselector", "html>body>span");
//            backgroundColorEle.getAttribute("style").equals("background-color: rgb(255, 255, 0);");
//
//            WebElement fontSizeEle= SeleniumUtil.getWebElementObject("cssselector", "html>body>span>font");
//            fontSizeEle.getAttribute("size").equals(strFontSize);
//            fontSizeEle.getAttribute("color").equals("FF0000");
//            assertTrue(SeleniumUtil.waitForElementContainText("cssselector", "html>body", strText));
        }
        catch(Exception ex){
            takeScreenshot("verifyCustomHTMLModuleTitle");
            logger.info("verify Custom HTML Module Title");
        }
    }

    public static void enterText(String strText) {
        try{

            SeleniumUtil.click("cssselector",".x-btn-icon-el.x-btn-icon-el-default-toolbar-small.x-edit-sourceedit",SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector",".x-btn-icon-el.x-btn-icon-el-default-toolbar-small.x-edit-sourceedit",SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.clear("cssselector", "div[id^='htmlText'] textarea", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("cssselector", "div[id^='htmlText'] textarea", strText, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector",".x-btn-icon-el.x-btn-icon-el-default-toolbar-small.x-edit-sourceedit",SeleniumUtilities.OBJWAITTIMEOUT);

////            SeleniumUtil.dblClick("cssselector", "html>body>span", SeleniumUtilities.OBJWAITTIMEOUT);
//
//            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("html>body>h1")).sendKeys(Keys.chord(Keys.CONTROL, "a"));
//
//            SeleniumUtil.click("cssselector","span[class='x-btn-icon-el x-btn-icon-el-default-toolbar-small x-edit-backcolor']",SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.click("cssselector","a[class='color-FFFF00 x-color-picker-item'] span",SeleniumUtilities.OBJWAITTIMEOUT);
//
////            SeleniumUtil.dblClick("cssselector", "html>body>span", SeleniumUtilities.OBJWAITTIMEOUT);
//            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("html>body>h1")).sendKeys(Keys.chord(Keys.CONTROL, "a"));
//            SeleniumUtil.click("cssselector","span[class='x-btn-icon-el x-btn-icon-el-default-toolbar-small x-edit-increasefontsize']",SeleniumUtilities.OBJWAITTIMEOUT);
////            SeleniumUtil.dblClick("cssselector", "html>body>span", SeleniumUtilities.OBJWAITTIMEOUT);
//            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("html>body>h1")).sendKeys(Keys.chord(Keys.CONTROL, "a"));
//            SeleniumUtil.click("cssselector","span[class='x-btn-icon-el x-btn-icon-el-default-toolbar-small x-edit-increasefontsize']",SeleniumUtilities.OBJWAITTIMEOUT);
//
//
////            BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".x-btn-icon-el.x-btn-icon-el-default-toolbar-small.x-edit-sourceedit")).click();
////            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id^='htmlText'] textarea")).clear();
////            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div[id^='htmlText'] textarea")).sendKeys(strText);
//
////            SeleniumUtil.type("name","htmlText",strText,SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            takeScreenshot("enterText");
            logger.info("enterText");
        }
    }

    public static void enterDashBoardTabName(String strText) {
        try{
            SeleniumUtil.type("cssselector","input[name^='messagebox']",strText,SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            takeScreenshot("enterDashBoardTabName");
            logger.info("enterDashBoardTabName");
        }
    }

    public static void dragAndDropModule(String strFrom,String strTo) throws Throwable {
        try{
//            try {
//                List<WebElement> closeEles = SeleniumUtil.getWebElementObjects("cssselector", "img[class='x-tool-img x-tool-close']", 6, SeleniumUtilities.OBJWAITTIMEOUT);
//                for (WebElement closeEle : closeEles) {
//                    SeleniumUtil.click(closeEle, SeleniumUtilities.OBJWAITTIMEOUT);
//                }
//            }
//            catch(Exception ex){
//            }

            strTo=strTo.replace(" ","_")+"-innerCt";
            SeleniumUtil.waitForElementIsClickable("xpath", ".//span[./text()='" + strFrom + "']",8,SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.dragAndDropElement("xpath", ".//span[./text()='" + strFrom + "']", "cssselector", "div[id='"+strTo+"']");
        }
        catch(Exception e){
            BaseView.takeScreenshot("dragAndDropModule");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyModule(String strModule) throws Throwable {
        try{
            assertTrue(SeleniumUtil.verifyTextValue("cssselector", "div[class='x-title-text x-title-text-default-framed x-title-item']", strModule, SeleniumUtilities.OBJWAITTIMEOUT));
        }
        catch(Exception e){
            BaseView.takeScreenshot("verifyModule");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyDashboardTabOrder(List<String> expected) throws Throwable {
        try{
            int i=1;
            for (String tab : expected) {
                assertTrue(SeleniumUtil.verifyTextValue("xpath", ".//div[contains(@id,'tabbar')]/a[" + i + "]", tab, SeleniumUtilities.OBJWAITTIMEOUT));
                i++;
            }
        }
        catch(Exception e){
            BaseView.takeScreenshot("verifyDashboardTabOrder");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static void dragAndDropModuleInOrder(String strFrom,int intX,int intY) throws Throwable {
        try{
            intY=-intY;
            SeleniumUtil.dragAndDropElementXYOffSet("xpath", ".//span[./text()='" + strFrom + "']", intX, intY);
        }
        catch(Exception e){
            BaseView.takeScreenshot("dragAndDropModuleInOrder");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyModulesOrderOnDashBoard(List<String> expected) throws Throwable {
        try{
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[class='x-title-text x-title-text-default-framed x-title-item']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            for (String tab : expected) {
                assertTrue(SeleniumUtil.verifyTextValue("cssselector", "div[class='x-title-text x-title-text-default-framed x-title-item']", tab, SeleniumUtilities.OBJWAITTIMEOUT));
            }
        }
        catch(Exception e){
            BaseView.takeScreenshot("verifyModulesOrderOnDashBoard");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static void stretchTheModule() throws Throwable {
        try{
            SeleniumUtil.dragAndDropElement("cssselector", "div[id^=ext-comp] [id$='east-handle']", "cssselector", "div[id^='panel-'][id$='-east-handle']");
        }
        catch(Exception e){
            BaseView.takeScreenshot("stretchTheModule");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static void verifyWhoAssigned(String strUser,String strWhoAssigned) throws Throwable {
        try{
            Boolean boolHeader=false,boolValue=false;
            List<WebElement> eleHeaders=SeleniumUtil.getWebElementObjects("cssselector", "span[class='x-column-header-text-wrapper'] span", 6, SeleniumUtilities.OBJWAITTIMEOUT);
            for(WebElement eleHeader:eleHeaders){
                if(eleHeader.getText().contains(strWhoAssigned)){
                    boolHeader=true;
                    break;
                }
            }

            List<WebElement> eleValues=SeleniumUtil.getWebElementObjects("cssselector","table[id^='gridview'] tbody tr td",6,SeleniumUtilities.OBJWAITTIMEOUT);
            for(WebElement eleValue:eleValues){
                if(eleValue.getText().contains(strUser)){
                    boolValue=true;
                    break;
                }
            }
            assertTrue(boolHeader.equals(boolValue));
        }
        catch(Exception e){
            BaseView.takeScreenshot("verifyWhoAssigned");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static void selectText(String strText){
        try {
            SeleniumUtil.switchToFrame("iframe[id='htmlText-inputCmp-iframeEl']");
            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("html>body>h1")).sendKeys(Keys.chord(Keys.CONTROL, "a"));
            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception e){
            BaseView.takeScreenshot("selectText");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("selectText");
            logger.info("Error :" + throwable.getMessage());
            TestCase.fail(throwable.getMessage());
        }
    }

    public static void switchToCustomHTMLFrame(){
        try {
            WebElement iframe = null;
            logger.info("Switching to default frame....");
            BrowserDriver.getCurrentDriver().switchTo().defaultContent();
            boolean isFrameVisible = false;
            BrowserDriver.getCurrentDriver().switchTo().defaultContent();
            for (WebElement frame : BrowserDriver.getCurrentDriver().findElements(By.tagName("iframe"))) {
                if (frame.isDisplayed()) {
                    iframe = frame;
                    isFrameVisible = true;
                    logger.info("Visible frame found, exiting loop" + "FrameName=" + frame.getAttribute("id"));
                    break;
                }
            }
            if (!isFrameVisible) {
                Assert.fail("No frames are visible hence not switching to frame");
            }
            //Waits till the "Loading.." text disappears
            BrowserDriver.getCurrentDriver().switchTo().frame(iframe);
            logger.info("Switched to visible continuing....");
        }
        catch(Exception e){
            BaseView.takeScreenshot("SwitchToCustomHTMLFrame");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        } catch (Throwable throwable) {
            BaseView.takeScreenshot("SwitchToCustomHTMLFrame");
            logger.info("Error :" + throwable.getMessage());
            TestCase.fail(throwable.getMessage());
        }
    }

    public static void clickOnFontColorIcon(String strText){
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector",".x-btn-icon-el.x-btn-icon-el-default-toolbar-small.x-edit-forecolor",8,SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector",".x-btn-icon-el.x-btn-icon-el-default-toolbar-small.x-edit-forecolor",SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("cssselector", ".color-FF0000.x-color-picker-item", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            for(WebElement ele:eles){
                if(ele.isDisplayed()) {
                    SeleniumUtil.click(ele, SeleniumUtilities.OBJWAITTIMEOUT);
                }
            }
//            SeleniumUtil.click("cssselector", ".color-FF0000.x-color-picker-item", SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("clickOnFontColorIcon");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static void clickOnBackColorIcon(String strText){
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector",".x-btn-icon-el.x-btn-icon-el-default-toolbar-small.x-edit-backcolor",8,SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector",".x-btn-icon-el.x-btn-icon-el-default-toolbar-small.x-edit-backcolor",SeleniumUtilities.OBJWAITTIMEOUT);
            List<WebElement> eles = SeleniumUtil.getWebElementObjects("cssselector", ".color-FFFF00.x-color-picker-item", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            for(WebElement ele:eles){
                if(ele.isDisplayed()) {
                    SeleniumUtil.click(ele, SeleniumUtilities.OBJWAITTIMEOUT);
                }
            }
//            SeleniumUtil.click("cssselector", ".color-FFFF00.x-color-picker-item", SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("clickOnBackColorIcon");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static void clickOnGrowTextIcon(String strText){
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector", ".x-btn-icon-el.x-btn-icon-el-default-toolbar-small.x-edit-increasefontsize", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            for(int i=0;i<5;i++) {
                SeleniumUtil.click("cssselector", ".x-btn-icon-el.x-btn-icon-el-default-toolbar-small.x-edit-increasefontsize", SeleniumUtilities.OBJWAITTIMEOUT);
            }
        }
        catch(Exception e){
            BaseView.takeScreenshot("clickOnGrowTextIcon");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static void clickRadioTotal(){
        try {
            SeleniumUtil.click("xpath",".//div//*[text()='Total:']//ancestor::div[1]//following-sibling::div//input[@role='radio']",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("clickRadioTotal");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static void enterLineFieldValue(String lineFieldValue){
        try {
            SeleniumUtil.type("xpath", ".//div//*[text()='Line Field:']//ancestor::div[1]//following-sibling::div//input[@type='text']", lineFieldValue,SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("xpath", ".//div//*[text()='Line Field:']", SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("clickRadioTotal");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

    public static void selectPortfolio(String portfolio){
        try {
            SeleniumUtil.click("xpath", ".//li[text()='"+portfolio+"']",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("clickRadioTotal");
            logger.info("Error :" + e.getMessage());
            TestCase.fail(e.getMessage());
        }
    }

}