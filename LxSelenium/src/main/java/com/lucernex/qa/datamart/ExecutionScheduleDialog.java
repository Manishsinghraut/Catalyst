package com.lucernex.qa.datamart;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

/**
 * Represents the [Execution Schedule] dialog.
 */
public class ExecutionScheduleDialog {
    private final WebDriver driver;

    // [Execution Schedule] dialog.
    private WebElement dialog;

    // Tab selector buttons.
    private WebElement dailyBtn;
    private WebElement daysPerWeekBtn;

    // Provides selection of interval choices.
    private ComboBox intervalCB = null;

    // Form buttons.
    private WebElement saveBtn;
    private WebElement cancelBtn;

    /**
     * Click the Save button.
     */
    public void clickSaveButton() {
        saveBtn.click();
    }

    /**
     * Click the Cancel button.
     */
    public void clickCancelButton() {
        cancelBtn.click();
    }

    /**
     * Returns true if the Daily tab of the [Execution Schedule] dialog is selected.
     */
    public boolean isDailySelected() {
        String pressed = dailyBtn.getAttribute("aria-pressed");

        assertNotNull("Button 'Daily' does not have the required 'aria-pressed' attribute!", pressed);

        return "true".equals(pressed);
    }

    /**
     * Click the Daily tab button.
     */
    public ComboBox clickDailyButton() {
        if (!isDailySelected()) {
            dailyBtn.click();

            WebElement field = driver.findElement(By.id("minutesFld1"));

            intervalCB = new ComboBox(driver, field);

            return intervalCB;
        }

        return null;
    }

    /**
     * Returns true if the [Days per Week] tab of the [Execution Schedule] dialog is selected.
     */
    public boolean isDaysPerWeekSelected() {
        String pressed = daysPerWeekBtn.getAttribute("aria-pressed");

        assertNotNull("Button 'Days per Week' does not have the required 'aria-pressed' attribute!", pressed);

        return "true".equals(pressed);
    }

    /**
     * Click the [Days per Week] tab button.
     */
    public void clickDaysPerWeekButton() {
        if (!isDaysPerWeekSelected()) {
            daysPerWeekBtn.click();
        }
    }

    // Daily tab fields.
    private WebElement intervalFld;

    /*
    List<WebElement> listElements = TestUtil.getWebDriver().findElements((By.cssSelector(".x-boundlist:not([style*='display: none'])")));
    for(WebElement ele : listElements){
        if(ele.getAttribute("textContent").equals(TestUtil.getValue(DateTimeConstants.TIMEZONE_INPUT_VALUE))) {
            // print out ele.getAttribute("textContent") if you want
            // ele.click(); ElementNotVisible exception may be thrown
            new Actions(TestUtil.getWebDriver()).click(ele).perform();
            break;
        }
    }
}
/click the down arrow image on the right of the ComboBox and assumes that there is a label before the component
selenium.click("//label[text()='My Combo List']/following-sibling::div/descendant::img[contains(@class, 'x-form-arrow-trigger')]");

//wait for a drop down list of options to be visible
selenium.waitForCondition("var value = selenium.isElementPresent('//div[contains(@class, 'x-combo-list') and contains(@style, 'visibility: visible')]'); value == true", "60000");

//click the required drop down item based on the text of the target item
selenium.click("//div[contains(@class, 'x-combo-list')]/descendant::div[contains(@class, 'x-combo-list-item')][text()='My Value']");

//wait for the drop down list of options to be no longer visible
selenium.waitForCondition("var value = selenium.isElementPresent('//div[contains(@class, 'x-combo-list') and contains(@style, 'visibility: visible')]'); value == false", "60000");


     */
    public ExecutionScheduleDialog(WebDriver driver) {
        this.driver = driver;

        dialog = driver.findElement(By.id("scheduleForm"));

        assertTrue("[Execution Schedule] dialog is not visible!", dialog.isDisplayed());

        WebElement tabsToolbar = dialog.findElement(By.cssSelector("div.x-toolbar-docked-top"));

        List<WebElement> buttons = tabsToolbar.findElements(By.tagName("button"));

        assertEquals(2, buttons.size());

        dailyBtn       = buttons.get(0);
        daysPerWeekBtn = buttons.get(1);

        WebElement dialogButtons = dialog.findElement(By.cssSelector("div.x-toolbar-footer-docked-bottom"));

        buttons = dialogButtons.findElements(By.tagName("button"));

        assertEquals(2, buttons.size());

        saveBtn   = buttons.get(0);
        cancelBtn = buttons.get(1);
    }
}
