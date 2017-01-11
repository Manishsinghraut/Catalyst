package com.lucernex.qa.views.components;

import com.lucernex.qa.pages.components.AddItemPopupPage;
import com.lucernex.qa.browsers.BrowserDriver;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;

/**
 * Created by salomem on 3/29/14.
 */
public class AddItemPopupView extends InBrowserPopupView {
    //  Logger
    private static final Logger LOGGER = Logger.getLogger(AddItemPopupView.class.getName());
    //  Page Object
    private static final AddItemPopupPage addItemPopupPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), AddItemPopupPage.class);

    public static void enterName(String name) {
        LOGGER.info("Entering " + name + " into the name field...");
        addItemPopupPage.nameInputField.clear();
        addItemPopupPage.nameInputField.sendKeys(name);
    }

    public static void enterDescription(String description) {
        LOGGER.info("Entering " + description + " into the description field...");
        addItemPopupPage.descriptionInputField.clear();
        addItemPopupPage.descriptionInputField.sendKeys(description);
    }

    public static void clickAdd() {
        LOGGER.info("Clicking the Add button...");
        BrowserDriver.clickElement(addItemPopupPage.addButton);
    }

    public static void verifyMessageDisplayed(String expectedMessage) {
        LOGGER.info("Verifying that '" + expectedMessage + "' is the message displayed...");
        String msgDisplayed = BrowserDriver.getTextFromElement(addItemPopupPage.errorMsgLabel);

        assertTrue(
            "The message displayed does not contain the expected message '" + expectedMessage + ".'",
            msgDisplayed.contains(expectedMessage)
        );
    }

    public static void verifyLinkToDuplicateDisplayed() {
        LOGGER.info("Verifying that the link to the duplicate item is displayed...");
        assertTrue("Link to duplicate is not displayed!", addItemPopupPage.duplicateLink.isDisplayed());
    }
}
