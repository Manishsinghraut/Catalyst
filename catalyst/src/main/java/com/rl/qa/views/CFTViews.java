package com.rl.qa.views;

import com.rl.qa.browsers.BrowserDriver;
import com.rl.qa.utils.BaseView;
import com.rl.qa.utils.SeleniumUtilities;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import static junit.framework.TestCase.fail;

/**
 * Created by RLE0097 on 21-06-2016.
 */
public class CFTViews {
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    public static WebElement PagesFrame;
    public static void clickOnWorkZoneLink(){
        try {
            SeleniumUtil.waitForElementIsClickable("id", "workZoneNew",8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("id", "workZoneNew", SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("clickOnWorkZoneLink");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOntheLink(String strLink){
        try {
            SeleniumUtil.waitForElementIsClickable("paritallinktext", strLink, 10, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("paritallinktext", strLink, SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("clickOntheLink");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnLink(String strLink){
        try {
            SeleniumUtil.getFrameIndex("linktext", strLink);
            SeleniumUtil.waitForElementIsClickable("linktext", strLink, 10, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("linktext", strLink, SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("clickOnLink");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOntheCssselectorField(String strcssselectorField){
        try {
            SeleniumUtil.click("cssselector", strcssselectorField, SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("clickOntheCssselectorField");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void selectBlueprintAndClickOnLaunchButton(String strBlueprint){
        try {
            SeleniumUtil.click("cssselector", "li[title='"+strBlueprint+"']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", ".btn.pull-left.btn-primary.launchBtn.launchBtnMargin", SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("selectBlueprintAndClickOnLaunchButton");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnOKButton(String strButton){
        try {
            SeleniumUtil.click("xpath", ".//button[./text()='"+strButton+"']", SeleniumUtilities.OBJWAITTIMEOUT);
            Thread.sleep(5000);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("clickOnOKButton");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void enterStackName(String strStackName){
        try {
            SeleniumUtil.type("id", "cftInput",strStackName, SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("enterStackName");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnButtonButton(){
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector", "input[value='Submit']", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", "input[value='Submit']", SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("clickOnButtonButton");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void verifyStackName(String strStackName,String strStatus){
        try {
            Thread.sleep(120000);
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "div[data-stackname='" + strStackName + "']", 18, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.waitUntilElementContainsText("cssselector","div[data-stackname='"+strStackName+"'] span[class='stackStatus']",strStatus,200,SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("verifyStackName");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnMoreInfoofInstanceCard(String strCardName){
        try {
            SeleniumUtil.click("xpath", ".//span[@data-original-title='"+strCardName+"']/parent::div/following-sibling::div[1]/div/span/a", SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("clickOnMoreInfoofInstanceCard");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void getIPAddress(String strCardName){
        try {
            String IPAddress = SeleniumUtil.getTextValue("xpath", ".//span[@data-original-title='"+strCardName+"']/parent::div/following-sibling::div[2]/div/span[1]", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.Log.info("IP Address :"+IPAddress);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("getIPAddress");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnConfirmatinButton(){
        try {
            SeleniumUtil.click("cssselector", "#launchResultContainer > div > div > div.modal-footer > button", SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("clickOnConfirmatinButton");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void seeDashboard(){
        try {
            SeleniumUtil.waitForElementIsClickable("id", "Workspace1", 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.waitUntilElementNotContainsText("id", "Workspace1","WORKZONE", 8,SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("seeDashboard");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void expendTheTree(String strTreeHead){
        try {
            if(SeleniumUtil.waitForElementVisibilityOf("xpath", ".//a[text()='"+strTreeHead+"']/ancestor::li/span[@class='expand-collapse click-expand fa fa-angle-right']", 2, SeleniumUtilities.OBJWAITTIMEOUT)) {
                SeleniumUtil.waitForElementIsClickable("paritallinktext", strTreeHead, 8, SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.click("paritallinktext", strTreeHead, SeleniumUtilities.OBJWAITTIMEOUT);
            }
        }
        catch(Exception ex){
            BaseView.takeScreenshot("expendTheTree");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnTrack(){
        try {
            SeleniumUtil.click("id", "trackNew",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("clickOnTrack");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnLineChartNotifications(String strLabel){
        try {
//            SeleniumUtil.getFrameIndex("xpath", ".//a[contains(./text(),'"+strLabel+"')]/ancestor::li/span[@class='icon fa fa-line-chart']");
            SeleniumUtil.click("xpath", ".//a[contains(./text(),'"+strLabel+"')]/ancestor::li/span[@class='icon fa fa-line-chart']",SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception ex){
            BaseView.takeScreenshot("clickOnLineChartNotifications");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnFileNotifications(String strLabel){
        try {
//            SeleniumUtil.getFrameIndex("xpath", ".//a[contains(./text(),'"+strLabel+"')]/ancestor::li/span[@class='icon fa fa-lg fa-fw fa-files-o']");
            SeleniumUtil.click("xpath", ".//a[contains(./text(),'"+strLabel+"')]/ancestor::li/span[@class='icon fa fa-lg fa-fw fa-files-o']",SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception ex){
            BaseView.takeScreenshot("clickOnFileNotifications");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void clickOnDesktopNotifications(String strLabel){
        try {
            SeleniumUtil.click("xpath", ".//a[contains(./text(),'"+strLabel+"')]/ancestor::li/span[@class='icon fa fa-fw fa-1x fa-desktop']",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("clickOnDesktopNotifications");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void getPrivateIPAddress(String strCardName){
        try {
            String IPAddress = SeleniumUtil.getTextValue("cssselector", "span[class='ip-cell-private']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.Log.info("IP Address :"+IPAddress);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("getPrivateIPAddress");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void verifyPublicIPAddress(String strCardName){
        try {
            String IPAddress = SeleniumUtil.getTextValue("xpath", ".//*[./text()='"+strCardName+"']/parent::div/following-sibling::div[1]/span[@class='ip-cell-public']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.Log.info("Public IP Address :"+IPAddress);
        }
        catch(Exception ex){
            BaseView.takeScreenshot("verifyPublicIPAddress");
            SeleniumUtil.Log.info("Error :" + ex.getMessage());
            fail(ex.getMessage());
        }
    }

    public static void switchToFrame() throws Throwable {
        SeleniumUtil.Log.info("Switching to default frame....");
        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
        boolean isFrameVisible = false;
        SeleniumUtil.Log.info("Started finding visible frame....");
        for (WebElement frame : BrowserDriver.getCurrentDriver().findElements(By.tagName("iframe"))) {
            //System.out.println(frame.getAttribute("src"));
            if (frame.isDisplayed()) {
                PagesFrame = frame;
                isFrameVisible = true;
                SeleniumUtil.Log.info("Visible frame found, exiting loop");
                break;
            }
        }
        if (!isFrameVisible) {
            fail("No frames are visible hence not switching to frame");
        }
        //Waits till the "Loading.." text disappears
        BrowserDriver.getCurrentDriver().switchTo().frame(PagesFrame);
        SeleniumUtil.Log.info("Switched to Third level Tab continuing....");
    }
}
