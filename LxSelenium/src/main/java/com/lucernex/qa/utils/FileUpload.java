package com.lucernex.qa.utils;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.iwms.CommonMethods;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;

import java.awt.*;
import java.awt.datatransfer.StringSelection;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;

/**
 * Created by RLE0097 on 3/31/2015.
 */
public class FileUpload {
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void setClipboardData(String string) {
//        setWindowFocus();
        StringSelection stringSelection = new StringSelection(string);
        Toolkit.getDefaultToolkit().getSystemClipboard().setContents(stringSelection, null);
        Toolkit.getDefaultToolkit().getSystemClipboard().setContents(stringSelection, null);
        Toolkit.getDefaultToolkit().getSystemClipboard().setContents(stringSelection, null);
        Toolkit.getDefaultToolkit().getSystemClipboard().setContents(stringSelection, null);
    }

    public static void setWindowFocus() {
        //Focusing window to upload file
        try {
            BrowserDriver.getCurrentDriver().manage().window().maximize();
            BrowserDriver.getCurrentDriver().manage().window().maximize();
            ((JavascriptExecutor) BrowserDriver.getCurrentDriver()).executeScript("window.focus();");
        } catch (Exception e) {
            try {
                ((JavascriptExecutor) BrowserDriver.getCurrentDriver()).executeScript("window.focus();");
            } catch (Exception ee) {
            }
        }
    }

    public static void fileUpload(String strFilePath) throws AWTException {
        setClipboardData(strFilePath); //"D:\\Member_SS.xlsx");
        //native key strokes for CTRL, V and ENTER keys
        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
//        Robot robot = new Robot();
//        SeleniumUtil.Log.info(strFilePath);
//        Actions action = new Actions(BrowserDriver.getCurrentDriver());
//        action.keyDown(Keys.ALT).sendKeys(String.valueOf('\u0074')).perform();
//        action.keyDown(Keys.ALT).sendKeys(String.valueOf('\u006E')).perform();
//
//        robot.keyPress(KeyEvent.VK_ENTER);
//        robot.keyRelease(KeyEvent.VK_ENTER);
//        robot.keyPress(KeyEvent.VK_CONTROL);
//        robot.keyPress(KeyEvent.VK_V);
//        robot.keyRelease(KeyEvent.VK_V);
//        robot.keyRelease(KeyEvent.VK_CONTROL);
//        try {
//            Thread.sleep(10000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        robot.keyPress(KeyEvent.VK_ENTER);
//        robot.keyRelease(KeyEvent.VK_ENTER);
//        try {
//            Thread.sleep(10000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        robot.keyPress(KeyEvent.VK_ENTER);
//        robot.keyRelease(KeyEvent.VK_ENTER);


        Robot robot = new Robot();
        try {
            Thread.sleep(10000);
        } catch (Exception ex) {
        }
        robot.mouseMove(2, 130);
        robot.mousePress(InputEvent.BUTTON1_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_MASK);
        robot.keyPress(KeyEvent.VK_ENTER);
        robot.keyRelease(KeyEvent.VK_ENTER);
        robot.keyPress(KeyEvent.VK_CONTROL);
        robot.keyPress(KeyEvent.VK_V);
        robot.keyRelease(KeyEvent.VK_V);
        robot.keyRelease(KeyEvent.VK_CONTROL);
        try {
            Thread.sleep(10000);
        } catch (Exception ex) {
        }
        robot.keyPress(KeyEvent.VK_ENTER);
        robot.keyRelease(KeyEvent.VK_ENTER);
    }

    public static void fileUpload(String strFilePath, String strEnter) throws AWTException {
        setClipboardData(strFilePath); //"D:\\Member_SS.xlsx");
        //native key strokes for CTRL, V and ENTER keys
//        Robot robot = new Robot();
//        robot.keyPress(KeyEvent.VK_ENTER);
//        robot.keyRelease(KeyEvent.VK_ENTER);
//
//        robot.keyPress(KeyEvent.VK_TAB);
//        robot.keyRelease(KeyEvent.VK_TAB);
//        try {
//            Thread.sleep(5000);
//        }catch (Exception ex){
//        }
//        robot.keyPress(KeyEvent.VK_ALT);
//        robot.keyPress(KeyEvent.VK_N);
//        robot.keyRelease(KeyEvent.VK_ALT);
//        robot.keyRelease(KeyEvent.VK_N);
//
//        robot.keyPress(KeyEvent.VK_CONTROL);
//        robot.keyPress(KeyEvent.VK_V);
//        robot.keyRelease(KeyEvent.VK_V);
//        robot.keyRelease(KeyEvent.VK_CONTROL);
//        try {
//            Thread.sleep(10000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        robot.keyPress(KeyEvent.VK_ENTER);
//        robot.keyRelease(KeyEvent.VK_ENTER);
//        try {
//            Thread.sleep(10000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        robot.keyPress(KeyEvent.VK_ENTER);
//        robot.keyRelease(KeyEvent.VK_ENTER);
//        try {
//            Thread.sleep(10000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        robot.keyPress(KeyEvent.VK_ENTER);
//        robot.keyRelease(KeyEvent.VK_ENTER);

        Robot robot = new Robot();
        try {
            Thread.sleep(10000);
        } catch (Exception ex) {
        }
        robot.mouseMove(2, 130);
        robot.mousePress(InputEvent.BUTTON1_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_MASK);
        robot.keyPress(KeyEvent.VK_ENTER);
        robot.keyRelease(KeyEvent.VK_ENTER);
        robot.keyPress(KeyEvent.VK_CONTROL);
        robot.keyPress(KeyEvent.VK_V);
        robot.keyRelease(KeyEvent.VK_V);
        robot.keyRelease(KeyEvent.VK_CONTROL);
        try {
            Thread.sleep(10000);
        } catch (Exception ex) {
        }
        robot.keyPress(KeyEvent.VK_ENTER);
        robot.keyRelease(KeyEvent.VK_ENTER);

    }

    public static void clickAttachDocumentButton() throws Exception {
        SeleniumUtil.getFrameIndex("cssselector", "img[title='Attach Document']");
        SeleniumUtil.click("cssselector", "img[title='Attach Document']", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void selectFolderToAttachDocument() throws Exception {
        SeleniumUtil.click("cssselector", "span[id='title_1']", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void clickFileUploadLink() throws Exception {
        SeleniumUtil.click("cssselector", ".rowColor2>a", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void enterDescriptionText() throws Exception {
        SeleniumUtil.type("cssselector", "input[name='description']", "Selenium test file Upload", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void clickOnBrowseButton(String strLocator, String strElement) throws Exception {
        SeleniumUtil.click(strLocator, strElement, SeleniumUtilities.OBJWAITTIMEOUT);
//        SeleniumUtil.click("cssselector","input[id='filename']",SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void clickOnUploadButton() throws Exception {
        SeleniumUtil.dblClick("xpath", ".//span[contains(text(),'Upload')]", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void clickOnImportButton() throws Exception {
        SeleniumUtil.click("id", "importBtn", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void selectContinueTillTheEnd() throws Exception {
        SeleniumUtil.click("xpath", "//label[contains(.,'Continue till the end')]/preceding-sibling::input", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void clickOnUploadbutton() throws Exception {
        SeleniumUtil.click("xpath", ".//span[./text()='Upload']", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void clickMagnifyfyDocumentButton() throws Throwable {
        CommonMethods.switchToVisibleFrame();
        SeleniumUtil.click("cssselector", "img[title='View Details']", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void clickMagnifyfyForLocalDownload() throws Throwable {
        SeleniumUtil.click("cssselector", "img[title='Download for local Viewing']", SeleniumUtilities.OBJWAITTIMEOUT);
    }

    public static void clickMagnifyfyForlDownload() throws Throwable {
        SeleniumUtil.click("cssselector", "img[title='Download']", SeleniumUtilities.OBJWAITTIMEOUT);
    }
}


