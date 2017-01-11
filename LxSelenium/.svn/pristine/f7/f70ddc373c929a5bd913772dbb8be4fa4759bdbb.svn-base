package com.lucernex.qa;
//////////////////////////////////////////////////////////////////////////////
//(c)2014 Lucernex, Inc.
//Author: Toan Dang
//$Revision:  $
//////////////////////////////////////////////////////////////////////////////

import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.Select;

import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import static com.lucernex.qa.PageUtilities.Locators;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

/*
 * 
 * Help to navigate and actions for pages
 * rename to NavigatePage????
 * 
 */
public class PageNavigation {
    private WebDriver driver;
    private PageUtilities utilities;

    public PageNavigation(WebDriver driver) {
        this.driver = driver;
        utilities = new PageUtilities(driver);
    }

    // Binder template, work flow used
    public void clickActionOnGirdbyDIV(String name, String actionName) throws Exception {

        utilities.wait(5);
        List<WebElement> options = driver.findElements(By.tagName("div"));

        for (int i = 0; i < options.size(); i++) {
            //System.out.println("Out: "+options.get(i).getText());
            if (!options.get(i).getText().isEmpty()) {
                //	System.out.println("Out: "+options.get(i).getText());
                if (options.get(i).getText().contains(name)) {
                    //System.out.println("list of :" +options.get(i).getText());
                    List<WebElement> findaction = options.get(i + 1).findElements(By.tagName("a"));

                    for (WebElement faction : findaction) {
                        // System.out.println("Before If:+"+faction.getText());
                        if (faction.getText().equalsIgnoreCase(actionName)) {
                            faction.click();
                            i = options.size() + 100; //break the outer for loop
                            break;
                        }

                    }
                }
            }
        }//end of For


        clickConfirmYesNo("Yes");


    }// end of method

    public void clickActionOnCodeTablebyDIV(String name, String actionName) throws Exception {
        utilities.wait(1);

        String xPathExpression = "//div[contains(text(),'" + name + "')]";

        WebElement codeLineItem = utilities.getWebElement(Locators.xpath, xPathExpression + "/../..");

        codeLineItem.findElement(By.partialLinkText(actionName)).click();
    }


    public void clickActionOnGirdbyTagName(String name, String actionName)
            throws Exception {

        List<WebElement> options = driver.findElements(By.tagName("a"));

        for (int i = 0; i < options.size(); i++) {
            // System.out.println(options.get(i).getText());
            if (options.get(i).getText().contains(name)) {
                // try {

                if (actionName.equalsIgnoreCase("delete")) {
                    options.get(i + 2).click();
                    options = driver.findElements(By.tagName("a"));
                    break;
                } else {
                    options.get(i + 1).click();// hit edit
                    options = driver.findElements(By.tagName("a"));
                    break;
                }
            }

        }
    }

    public void selecdropdownOption(By byIDname, String optionName) {

        WebElement portfolioNames = driver.findElement(byIDname);
        // Select select = new Select(Lxdriver.findElement(byIDname));
        Select select = new Select(portfolioNames);
        select.selectByVisibleText(optionName);

    }

    public void clickPopuledSelectbyName(String imageName, By byclass,
                                         String dropvalueName) throws Exception {

        utilities.click(Locators.id, imageName);// click arrow down to popular dropdown
        // list
        wait(2);
        List<WebElement> options = driver.findElements(byclass);
        for (WebElement option : options) {
            if (option.getText().contains(dropvalueName)) {
                option.click();
                break;
            }
            // System.out.println(option.getText());
        }
    }


    public void clickConfirmYesNo(String action) {
        java.util.Set s = driver.getWindowHandles();

        Iterator ite = s.iterator();

        while (ite.hasNext()) {
            String popupHandle = ite.next().toString();
            // System.out.println(popupHandle);
            if (!popupHandle.contains("Schedule Template Delete")) {
                driver.switchTo().window(popupHandle);
                ///here you can perform operation in pop-up window**
                // After finished your operation in pop-up just select the main
                // window again
                driver.switchTo().window(popupHandle);
                clickButtonbyName(action);

            }
        }

    }


    public void clickButtonbyName(String buttonName) {

        try {

            List<WebElement> options = driver.findElements(By.tagName("button"));
            for (WebElement option : options) {
                ////System.out.println("Searching ---: "+option.getText());
                //if (option.getText().contains(buttonName)) {
                if (option.getText().contentEquals(buttonName)) {
                    option.click();
                    break;
                }
            }
        } catch (StaleElementReferenceException e) {
            System.out.println("Attempting to recover from StaleElementReferenceException ...");
        }

    }


    public void goToURL(String urlName) throws Exception {

        driver.navigate().to(urlName);
        utilities.wait(1);
    }

    public void selectLabelInDropDownOption(By byid, String optionLabel)
            throws Exception {
        utilities.wait(1);
        Select select = new Select(driver.findElement(byid));
        select.selectByVisibleText(optionLabel);
        utilities.wait(1);
    }

    public void selectValueInDropDownOption(By byid, String optionValue)
            throws Exception {
        utilities.wait(1);
        Select select = new Select(driver.findElement(byid));
        select.selectByValue(optionValue);
        utilities.wait(1);
    }


    public void verifyTestStepORTestCase(String testcasename, String strexpected) throws InterruptedException {

        //	final WebDriverException exception =new WebDriverException();

        try {
            if (driver.findElement(By.cssSelector("body")).getText().contains(strexpected)) {
                //System.out.println("Passed - "+testcasename +". "+ strexpected+" was NOT on this page");
            } else {
                String msg = "Failed - " + testcasename + ". " + strexpected + " was NOT on this page";
                System.out.println(msg);
                fail(msg);
            }
            //throw new WebDriverException(exception.getMessage());
        }
        //	}
        catch (WebDriverException e) {
            //	throw new WebDriverException(e.getMessage());
        }
    }

    @SuppressWarnings("deprecation")
    public void FailedTestStepORTestCase(String testcasename, String strexpected) throws InterruptedException {

        //final WebDriverException exception =new WebDriverException();

        try {
            if (driver.findElement(By.cssSelector("body")).getText().contains(strexpected)) {
                System.out.println("Failed - " + testcasename + ". " + strexpected + "on this page");
            } else {
                //System.out.println("Failed - "+testcasename +". "+ strexpected+" was NOT on this page");
            }
            //throw new WebDriverException(exception.getMessage());
        }
        //	}
        catch (WebDriverException e) {
            //	throw new WebDriverException(e.getMessage());
        }
    }

    // @SuppressWarnings("deprecation")
    public void verifyTextPresent(String text) {

        //	assertTrue(driver.getPageSource().contains(text));
        assertTrue(driver.getPageSource().contains(text));
    }

    public void verifyTextNotPresent(String text) {

        //	assertTrue(driver.getPageSource().contains(text),true);
        assertFalse(driver.getPageSource().contains(text));

    }

    private void assertFalse(boolean b) {
//		// TODO Auto-generated method stub

    }

    public boolean isStringExist(String stringexpectname) {
        boolean stringexist = false;

        if (driver.getPageSource().contains(stringexpectname)) {
            stringexist = true;
        }
        return stringexist;

    }


    public void clickLink(String linkname) throws Exception {

        utilities.waitForElementDisplayed(Locators.linktext, linkname);
        utilities.click(Locators.linktext, linkname);
        utilities.wait(1);
    }

    public void clickPartialLink(String linkname) throws Exception {
        utilities.waitForElementDisplayed(Locators.paritallinktext, linkname);
        utilities.click(Locators.paritallinktext, linkname);
        utilities.wait(1);
    }


    public void gotoAdminPage() throws Exception {

        //utilities.wait(3);
        utilities.click(Locators.name, "Admin");
        utilities.wait(1);
    }


    public String getDate(int addyear) {

        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR) + addyear;
        int date = cal.get(Calendar.DATE);
        int Month = cal.get(Calendar.MONTH) + 1;
        String currentDate = (Month + "/" + date + "/" + year);
        return currentDate;
    }

    public String RandomName() throws Exception {
        int digit = 10;
        StringBuilder sb = new StringBuilder(12458);
        Random rand = new Random();

        sb.append(rand.nextInt(9) + 1);// can't be 0

        int limit = digit - 1;
        for (int i = 0; i < limit; i++)
            sb.append(rand.nextInt(10));

        return sb.toString();
    }


}

