package com.lucernex.qa;
//////////////////////////////////////////////////////////////////////////////
//(c)2014 Lucernex, Inc.
//Author: Toan Dang
//$Revision:  $
//////////////////////////////////////////////////////////////////////////////
import com.google.common.io.Files;
import org.junit.rules.ErrorCollector;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.File;
import java.io.IOException;
import java.util.List;

/*
 * 
 * Mouse or Key stroke actions for pages
 * Input Locator
 *
 * 
 */
public class PageUtilities {
    public static final int DEFAULTWAITTIME = 10;
    private int waitTime;
    // what locator actions are available in LX webdriver
    public ErrorCollector collector = new ErrorCollector();
    private WebDriver driver;

    public enum Locators {
        xpath, id, name, classname, paritallinktext, linktext, tagname
    };

    public PageUtilities(WebDriver driver) {
        this(driver, PageUtilities.DEFAULTWAITTIME);
    }

    public PageUtilities (WebDriver driver, int elementWaitTime) {
        this.driver = driver;
        this.waitTime = elementWaitTime;
    }

    public void wait(int seconds) throws InterruptedException {
        Thread.sleep(seconds * 1000);
    }

    public void wait(double seconds) throws InterruptedException {
        Thread.sleep(Double.doubleToLongBits(seconds * 1000));
    }

    public void click(Locators locator, String element)
            throws InvalidSelectorException, NoSuchElementException {
        click(getWebElement(locator, element));
    }

    public void click(WebElement element) {
        Actions selAction = new Actions(driver);
        selAction.click(element).perform();
    }

    // a method to simulate the mouse hovering over an element
    public void hover(Locators locator, String element) throws Exception {
        hover(getWebElement(locator, element));
    }

    public void hover(WebElement element) throws Exception {
        Actions selAction = new Actions(driver);
        selAction.moveToElement(element).perform();
    }

    // our generic selenium type functionality
    public void type(Locators locator, String element, String text)
            throws Exception {

        waitForElementDisplayed(locator, element); // wait still display before
        // type
        type(getWebElement(locator, element), text);
    }

    public void type(WebElement element, String text) throws Exception {
        Actions selAction = new Actions(driver);
        selAction.sendKeys(element, text).perform();
    }

    public void typeInto(Locators locator, String expression, String inputText) throws Exception {
        this.typeInto(this.getWebElement(locator, expression), inputText);
    }

    public void typeInto(WebElement element, String inputText) throws Exception {
        element.sendKeys(inputText);
    }

    public void clear(Locators locator, String element) throws Exception {
        getWebElement(locator, element).clear();

    }

    public void waitForElementDisplayed(Locators locator, String element)
            throws Exception {
        waitForElementDisplayed(getWebElement(locator, element), 5);
    }

    public void waitForElementDisplayed(Locators locator, String element,
                                        int seconds) throws Exception {
        waitForElementDisplayed(getWebElement(locator, element), seconds);
    }

    public void waitForElementDisplayed(WebElement element) throws Exception {
        waitForElementDisplayed(element, 5);
    }

    public void waitForElementDisplayed(WebElement element, int seconds)
            throws Exception {
        long end = System.currentTimeMillis() + (seconds * 1000);
        while (System.currentTimeMillis() < end) {
            if (element.isDisplayed()) {
                break;
            }
        }
    }

    // //////////////////////////////////
    // extra base selenium functionality
    // //////////////////////////////////

    // a method to grab the web element using selenium webdriver
    public WebElement getWebElement(Locators locator, String element)
            throws NotFoundException {
        By byElement;
        switch (locator) { // determine which locator item we are interested in
            case xpath: {
                byElement = By.xpath(element);
                break;
            }
            case id: {
                byElement = By.id(element);
                break;
            }
            case name: {
                byElement = By.name(element);
                break;
            }
            case classname: {
                byElement = By.className(element);
                break;
            }
            case linktext: {
                byElement = By.linkText(element);
                break;
            }
            case paritallinktext: {
                byElement = By.partialLinkText(element);
                break;
            }
            case tagname: {
                byElement = By.tagName(element);
                break;
            }

            default: {
                throw new InvalidSelectorException(locator
                        + " is not a valid Selector.");
            }
        }
        //WebElement query = driver.findElement(byElement); // grab our element based on the locator
        WebDriverWait wait = new WebDriverWait(this.driver, this.waitTime);
        WebElement query = wait.until(ExpectedConditions.presenceOfElementLocated(byElement));
        return query; // return our query
    }

    /**
     * Find all the elements within the current page using the given Locators and element name.
     *
     * @param locator - the locating mechanism to use.
     * @param element - the name of the element to search for.
     * @return A list of all WebElements, or an empty list if nothing matches.
     */
    public List<WebElement> getWebElements(Locators locator, String element) {
        return driver.findElements(this.getBy(locator, element));
    }

    /**
     * Return a By using the giver Locator and element name.
     *
     * @param locator - the locating mechanism to use.
     * @param element - the name of the element to search for.
     * @return A By, the locating mechanism to use to find the element.
     */
    private By getBy(Locators locator, String element) {
        By byElement;
        switch (locator) { // determine which locator item we are interested in
            case xpath: {
                byElement = By.xpath(element);
                break;
            }
            case id: {
                byElement = By.id(element);
                break;
            }
            case name: {
                byElement = By.name(element);
                break;
            }
            case classname: {
                byElement = By.className(element);
                break;
            }
            case linktext: {
                byElement = By.linkText(element);
                break;
            }
            case paritallinktext: {
                byElement = By.partialLinkText(element);
                break;
            }
            case tagname: {
                byElement = By.tagName(element);
                break;
            }
            default: {
                throw new InvalidSelectorException(locator
                        + " is not a valid Selector.");
            }
        }

        return byElement;
    }

    // a method to obtain screenshots
    public void takeScreenshot(String action) throws IOException {
        // make our screenshot name friendly
        action = action.replaceAll("[^a-zA-Z0-9]", "");

        // take a screenshot
        File scrFile = ((TakesScreenshot) driver)
                .getScreenshotAs(OutputType.FILE);
        // Now I can do whatever I need to do with it, for example copy
        // somewhere
        Files.copy(
            scrFile,
            new File("target/" + System.currentTimeMillis() + action + ".png")
        );
    }
}

