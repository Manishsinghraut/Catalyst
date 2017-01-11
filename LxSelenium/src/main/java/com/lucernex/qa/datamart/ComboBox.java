package com.lucernex.qa.datamart;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

import java.util.ArrayList;
import java.util.List;

import static com.google.common.base.Strings.isNullOrEmpty;

/**
 * Represents a ext-js ComboBox field.
 */
public class ComboBox {
    private final WebDriver driver;

    // Downward pointing arrow button.
    private WebElement downArrowBtn;

    /**
     * Click on the downward pointing arrow button so we can see the drop down
     * list of values.
     */
    public void clickDownArrowButton() {
        downArrowBtn.click();
    }

    /**
     * Returns a list of the presented drop down list choices.
     */
    public List<String> getDropdownChoices() {
        /*
        WebElement list = driver.findElement(By.cssSelector("div[id^=boundlist-]"));

        assertTrue("Drop down choices are not visible!", list.isDisplayed());

        List<WebElement> choices = list.findElements(By.tagName("li"));

        if (choices.isEmpty()) {
            return new ArrayList<String>(1);
        }
        */

        WebElement           div = driver.findElement((By.cssSelector("div.x-boundlist:not([style*='display: none'])")));
        List<WebElement> choices = div.findElements((By.cssSelector("li.x-boundlist-item")));

        if (choices.isEmpty()) {
            return new ArrayList<String>(1);
        }

        List<String> lst = new ArrayList<String>(choices.size());

        for (WebElement choice : choices) {
            lst.add(choice.getAttribute("textContent"));
        }

        return lst;
    }

    /**
     * Attempt to select the specified choice from the dropdown list of choices.
     *
     * @param choice - text of desired dropdown choice
     *
     * @return true if choice found and selected, otherwise false
     */
    public boolean selectDropdownChoice(String choice) {
        WebElement           div = driver.findElement((By.cssSelector("div.x-boundlist:not([style*='display: none'])")));
        List<WebElement> choices = div.findElements((By.cssSelector("li.x-boundlist-item")));

        if (choices.isEmpty()) {
            return false;
        }

        for (WebElement c : choices) {
            String text = c.getAttribute("textContent");

            if (!isNullOrEmpty(text)) {
                if (text.equals(choice)) {
                    new Actions(driver).click(c).perform();
                    return true;
                }
            }
        }

        return false;
    }

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
     */
    public ComboBox(WebDriver driver, WebElement parent) {
        this.driver = driver;

        downArrowBtn = parent.findElement(By.cssSelector("div.x-form-arrow-trigger"));
    }
}
