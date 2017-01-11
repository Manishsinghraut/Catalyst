package com.lucernex.qa.utils;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.HomeView;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * Created by salomem on 5/19/14.
 */
public class Navigation extends BaseView{
    public static Logger LOGGER = Logger.getLogger(Navigation.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void navigateTo(String targetLoc) throws InterruptedException {
        LOGGER.info("Attempting to navigate to the target location " + targetLoc + "...");
        try {
            //  Try by the link text first
            LOGGER.info("Searching for the target location by link text...");
            BaseView.pushShortTimeout();
            try {

                SeleniumUtil.click(SeleniumUtil.getElement("linktext", targetLoc, 20, 2),SeleniumUtilities.OBJWAITTIMEOUT);
//                BrowserDriver.findElementWithTimeout(By.linkText(targetLoc), 30).click();
            }
            catch(Exception ex) {
                SeleniumUtil.click(SeleniumUtil.getElement("linktext", targetLoc, 20, 2),SeleniumUtilities.OBJWAITTIMEOUT);
//                SeleniumUtil.click("linktext", targetLoc, SeleniumUtilities.OBJWAITTIMEOUT);
            }
            LOGGER.info("Clicked on " + targetLoc + "...");
        } catch (TimeoutException ex) {
            //  Try by the element
            LOGGER.info("Did not find the target location by link text...");
            HomeView.clickToolButton(targetLoc);
        } catch (NoSuchElementException ex) {
            //  Try by the element
            LOGGER.info("Did not find the target location by link text...");
            HomeView.clickToolButton(targetLoc);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseView.popDefaultTimeout();
        }
    }
}
