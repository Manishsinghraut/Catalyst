package com.lucernex.qa.datamart;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * Represents an Error dialog which can appear in datamart.
 */
public class ErrorDialog {
    private final WebDriver driver;

    // Find OK button of Error dialog.
    @FindBy(how = How.CSS, using="div[role=presentation] div.x-btn em button span.x-btn-inner")
    private WebElement okBtn;

    /**
     * Dismiss the Error dialog by clicking on its OK button.
     */
    public void clickOKButton() {
        okBtn.click();
    }

    /**
     * Watches for an Error dialog.
     *
     * @return true if dialog seen otherwise false
     */
    public static boolean isPresent(WebDriver driver) {
        return driver.findElement(By.cssSelector("div.x-window")) != null;
    }

    /**
     * Intended to be used by PageFactory.initElements() which calls this constructor.
     */
    public ErrorDialog(WebDriver driver) {
        this.driver = driver;
    }
}

