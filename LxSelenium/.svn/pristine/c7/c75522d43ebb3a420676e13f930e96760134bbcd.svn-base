package com.lucernex.qa.views;

import com.lucernex.qa.pages.Login1Page;
import com.lucernex.qa.pages.Login2Page;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.CucumberContext;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

import static com.google.common.base.Preconditions.checkArgument;
import static junit.framework.Assert.assertTrue;
import static junit.framework.TestCase.fail;

/**
 * Represents the interaction with the pair of IWMS authentication pages.
 */
public class LoginView {
    private static final Logger logger = Logger.getLogger(LoginView.class.getName());

    // Pair of pages that comprise IWMS authentication sequence.
    private static final Login1Page firstPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), Login1Page.class);
    private static final Login2Page secondPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), Login2Page.class);

    /**
     * Verifies that the first page of the login page sequence is visible.
     */
    public static void verifyFirstPageDisplayed() {
        int attempt = 0;

        do {
            try {
                logger.info("Verifying 1st page of login page sequence is visible, attempt " + (attempt + 1) + "...");
                BrowserDriver.waitForElement(firstPage.proceedButton);

                if (firstPage.proceedButton.isDisplayed()) {
                    logger.info("Saw 1st page of login sequence.");
                    return; // found what we were looking for!
                }
            } catch (Exception e) {
                // See if IWMS thinks we are already logged in and logout if that is the case.
                try {
                    WebElement logoutBtn = BrowserDriver.findElementWithTimeout(By.cssSelector("a#logoutBtn"), 10);

                    if (logoutBtn.isDisplayed()) {
                        logoutBtn.click();

                        // Be sure to let CucumberContext know that we logged out.
                        CucumberContext.getCucumberContext().put("loggedIn", Boolean.FALSE);
                        BrowserDriver.getCurrentDriver().manage().deleteAllCookies();

                        // The while loop will retry the attempt to see the 1st page of the login sequence.
                     }
                } catch (Exception e2) {
                    logger.log(Level.INFO, e2.getMessage(), e2);
                }
            }

            try {
                Thread.sleep(2000l);
            } catch (InterruptedException ie) {
                // ignore
            }
        } while(++attempt < 3);

        // If we get here then we didn't see the 1st page.
        Random r = new Random();
        String filename = String.format("verifyFirstPageDisplayed-%d.png", r.nextInt(1000));

        logger.info(String.format("Did not see 1st page of login sequence(2), generating screen shot '%s'", filename));

        BaseView.takeScreenshot(filename);
        fail("Did not see the 1st page of the login sequence(2)!");
    }

    /**
     * Submit first page of login sequence.
     *
     * @param username - IWMS username
     * @param firmname - IWMS firmname
     */
    public static void firstPageSubmit(String username, String firmname) {
        checkArgument(username != null, "Required argument 'username' is null!");
        checkArgument(firmname != null, "Required argument 'firmname' is null!");

        logger.info(
            String.format(
                "Submitting first page of login sequence [username: %s, firmname: %s]...",
                username,
                firmname
            )
        );
        firstPage.userNameField.clear();
        firstPage.userNameField.sendKeys(username);
        firstPage.firmNameField.clear();
        firstPage.firmNameField.sendKeys(firmname);
        firstPage.proceedButton.click();
        logger.info("Submitted first login sequence page.");
    }

    /**
     * Verifies that the second page of the login page sequence is visible.
     */
    public static void verifySecondPageDisplayed() {
        logger.info("Verifying first page of login page sequence is visible...");
        BrowserDriver.waitForElement(secondPage.loginButton);
        assertTrue("Did not see the 2nd page of the login sequence!", secondPage.loginButton.isDisplayed());
    }

    /**
     * Submit second page of login sequence.
     *
     * @param password - IWMS password
     */
    public static void secondPageSubmit(String password) {
        checkArgument(password != null, "Required argument 'password' is null!");

        logger.info("Submitting second page of login sequence...");
        secondPage.passwordField.sendKeys(password);
        secondPage.loginButton.click();
        logger.info("Submitted second login sequence page.");
        CucumberContext.getCucumberContext().put("iwms-login", true);
    }
}
