package com.lucernex.qa.utils;

/**
 * Created by RLE0097 on 5/27/2015.
 */



import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.iwms.CommonMethods;
import org.apache.log4j.Logger;
import org.openqa.selenium.support.PageFactory;

import java.awt.*;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import java.io.File;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import static com.lucernex.qa.utils.ForceWaitForItem.delay;


public class FileDownloader {
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private static final Logger LOG = Logger.getLogger(FileDownloader.class);

    /**
     * Perform the file/image download.
     *
     * @param loctor
     * @param element
     * @return
     * @throws IOException
     * @throws NullPointerException
     */
    public static void fileDownloader(String loctor, String element) {
        try {
            SeleniumUtil.click(loctor, element, SeleniumUtilities.OBJWAITTIMEOUT);
            delay(6000);
            Robot robot = new Robot();
            robot.keyPress(KeyEvent.VK_ALT);
            robot.keyPress(KeyEvent.VK_S);
            robot.keyRelease(KeyEvent.VK_ALT);
            robot.keyRelease(KeyEvent.VK_S);
            robot.keyPress(KeyEvent.VK_ENTER);
            robot.keyRelease(KeyEvent.VK_ENTER);
        } catch (Exception ex) {
            LOG.info(ex.getMessage());
        }
    }

    public static void fileDownload() {
        try {
            //We cannot use webdriver methods to wait for download completion hence using delay
            delay(4000);

            FileUpload.setWindowFocus();
            FileUpload.setWindowFocus();
            Robot robot = new Robot();
            robot.mouseMove(2,130);
//            robot.mousePress(InputEvent.BUTTON1_MASK);
//            robot.mouseRelease(InputEvent.BUTTON1_MASK);
//            robot.keyPress(KeyEvent.VK_ALT);
//            robot.keyPress(KeyEvent.VK_S);
//            robot.keyRelease(KeyEvent.VK_ALT);
//            robot.keyRelease(KeyEvent.VK_S);
//            try {
//                Thread.sleep(10000);
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
//            robot.keyPress(KeyEvent.VK_ALT);
//            robot.keyPress(KeyEvent.VK_S);
//            robot.keyRelease(KeyEvent.VK_ALT);
//            robot.keyRelease(KeyEvent.VK_S);
//            try {
//                Thread.sleep(10000);
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
//            robot.keyPress(KeyEvent.VK_ENTER);
//            robot.keyRelease(KeyEvent.VK_ENTER);
//            try {
//                Thread.sleep(10000);
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
//            robot.keyPress(KeyEvent.VK_ENTER);
//            robot.keyRelease(KeyEvent.VK_ENTER);
            delay(4000);
            robot.keyPress(KeyEvent.VK_ALT);
            robot.keyPress(KeyEvent.VK_S);
            robot.keyPress(KeyEvent.VK_ENTER);
            robot.keyRelease(KeyEvent.VK_ENTER);
            delay(4000);
            robot.keyRelease(KeyEvent.VK_ALT);
            robot.keyRelease(KeyEvent.VK_S);
            robot.keyPress(KeyEvent.VK_ENTER);
            robot.keyRelease(KeyEvent.VK_ENTER);
        } catch (Exception ex) {
            LOG.info(ex.getMessage());
        }
    }

    public static void renameFiles() {
        File dir = new File(System.getProperty("user.dir")+"/target/DownloadFiles/");
        if (dir.isDirectory()) { // make sure it's a directory
            for (final File f : dir.listFiles()) {
                try {
                    File newfile = new File(System.getProperty("user.dir")+"/target/DownloadFiles/newfile.xls");

                    if (f.renameTo(newfile)) {
                        System.out.println("Rename succesful");
                    } else {
                        System.out.println("Rename failed");
                    }
                } catch (Exception e) {
                    // TODO: handle exception
                    e.printStackTrace();
                }
            }
        }
    }

    public static String getLatestDownloadedFile() throws Throwable{
        return CommonMethods.getLatestDownloadedFile();
    }

    public static String getLatestDirectory() throws Throwable{
        return CommonMethods.getLatestModifiedDate();
    }
}