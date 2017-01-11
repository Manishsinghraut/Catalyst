package com.lucernex.qa.views.components;

import com.lucernex.qa.pages.admin.AdminPage;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.SeleniumUtilities;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.google.common.base.Preconditions.checkArgument;
import static com.google.common.base.Preconditions.checkNotNull;
import static junit.framework.Assert.assertTrue;

/**
 * //TODO - check if used, else delete
 * Represents a popup modal window that is for confirmation.
 */
public class ConfirmationPopupView {
    private static final AdminPage adminPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), AdminPage.class);
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private String title;
    private Map<String,WebElement> name2button = new HashMap<String,WebElement>();

    /**
     * Returns the modal dialog's title.
     */
    public String getTitle() {
        return title;
    }

    public void clickButton(String button) {
        checkArgument(button != null, "Required argument 'button' is null!");

        WebElement buttonWE = name2button.get(button);

        assertTrue(String.format("Button '%s' not found!", button), buttonWE != null);

        buttonWE.click();
    }

    public ConfirmationPopupView() throws InterruptedException {
        this(null);
    }

    public ConfirmationPopupView(String expectedTitle) throws InterruptedException {
        WebElement dialog = null;

        for (int i = 0; i < 5; i++) {
           // EXT Change List<WebElement> matches = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div.x-resizable-pinned"));
            SeleniumUtil.waitForElementVisibilityOf("cssselector", "div.lxmodalwindow", 5, 2);
            List<WebElement> matches = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div.lxmodalwindow"));

            // Unfortunately we have no way to uniquely identify the modal
            // confirmation component as we will be multiple matches but
            // only one is visible at a time.
            if (matches != null && matches.size() > 0) {
                for (WebElement we : matches) {
                    if ( ((expectedTitle == null || expectedTitle.equals("")) && we.isDisplayed()) // No title is given, select the first displayed one
                            || (we.getText().contains(expectedTitle)) ) {
                        dialog = we;

                        break;
                    }
                }
            }

//            Thread.sleep(500l);
        }

        checkNotNull(dialog, "Did not find a popup confirmation dialog!");

        // NEW EXT WebElement titleWE = dialog.findElement(By.cssSelector("span.x-window-header-text"));
        WebElement titleWE = dialog.findElement(By.cssSelector("div.x-title-text"));
        checkNotNull(titleWE, "Did not see the title of the popup confirmation dialog!");

        this.title = titleWE.getText();

        // NEW EXT List<WebElement> buttons = dialog.findElements(By.cssSelector("button.x-btn-text"));

        WebElement footer = dialog.findElement(By.cssSelector("div.x-toolbar-footer"));
        // added footer for the Buttons on the confirmation pop up - was not able to locate buttons directly via modal window
        List<WebElement> buttons = footer.findElements(By.cssSelector("span.x-btn-inner"));

        checkNotNull(buttons, "Did not see any buttons in the popup confirmation dialog!");

        for (WebElement button : buttons) {
            String label = button.getText();
            System.out.println("The label is ___@@@@" + label);

            if (label != null) {
                name2button.put(label, button);
            }
        }
    }
}
