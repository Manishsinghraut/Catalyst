package com.lucernex.qa.datamart;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.logging.Logger;

import static junit.framework.TestCase.fail;

/**
 * Represents a Confirm dialog.
 */
public class ConfirmDialog {
    private static final Logger logger = Logger.getLogger(ConfirmDialog.class.getName());

    private final WebDriver driver;
    private WebElement dialog;

    /**
     * Clicks the Yes button on the Confirm dialog.
     */
    public void clickYesButton() {
        int count = 0;

        while (!dialog.isDisplayed()) {
            try {
                this.dialog = BrowserDriver.findElementWithTimeout(By.cssSelector("div[id^=messagebox-]"), 5);
            } catch (InterruptedException e) {
                if (++count > 2) {
                    String screenshotFile = "confirm-dialog-not-seen.png";

                    BaseView.takeScreenshot(screenshotFile);
                    logger.info(String.format("Took screenshot to file '%s'", screenshotFile));
                    fail("Never saw the confirmation dialog!");
                }
            }
        }

        List<WebElement> buttons = dialog.findElements(By.cssSelector("div[role=alertdialog] div[role=toolbar] em button"));

        // Find and click the 'Yes' dialog button.
        for (WebElement b : buttons) {
            if (b.getText().equals("Yes")) {
                b.findElement(By.tagName("span")).click();
                logger.info("Clicked 'Yes' button");
                return;
            }
        }

        String screenshotFile = "yes-button-not-seen.png";

        BaseView.takeScreenshot(screenshotFile);
        logger.info(String.format("Took screenshot to file '%s'", screenshotFile));
        fail("Never saw the 'Yes' button on the confirmation dialog!");
    }

    /**
     * Watches for a Confirm dialog.
     *
     * @return true if dialog seen otherwise false
     */
    public static boolean isPresent() throws InterruptedException {
        WebElement dialog = BrowserDriver.findElementWithTimeout(By.cssSelector("div[id^=messagebox-]"), 5);

        if (dialog == null) {
            return false;
        }

        return dialog.isDisplayed();
    }

    /**
     * Intended to be used by PageFactory.initElements() which calls this constructor.
     */
    public ConfirmDialog(WebDriver driver) throws InterruptedException {
        this.driver = driver;
        this.dialog = BrowserDriver.findElementWithTimeout(By.cssSelector("div[id^=messagebox-]"), 5);
    }
}
