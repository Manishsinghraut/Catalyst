package com.lucernex.qa.views.components;

import com.lucernex.qa.pages.components.InBrowserPopupPage;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;

/**
 * Created by salomem on 3/25/14.
 */
public class InBrowserPopupView extends BaseView {
    //  Logger
    private static final Logger LOGGER = Logger.getLogger(InBrowserPopupView.class.getName());
    //  Page Object
    private static final InBrowserPopupPage inBrowserPopupPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), InBrowserPopupPage.class);
    private static String knownPopupTitle = "";

    /*  Static methods that interact with the Page Object   */

    /**
     * Returns the popup's header text as a String.
     * @return a String representation of the popup's header text.
     */
    public static String getHeaderText() {
        LOGGER.info("Getting the In Browser Popup header text...");
        return BrowserDriver.getTextFromElement(inBrowserPopupPage.headerText);
    }

    /**
     * Verifies that the In Browser Popup's header text equals the expected header text.
     * @param expetedHeaderText - the exact expected header text.
     */
    public static void verifyHeaderTextEquals(String expetedHeaderText) {
        LOGGER.info("Verifying the Header Text...");
        String headerText = InBrowserPopupView.getHeaderText();

        assertTrue(
            "This popup's header text is not '" + expetedHeaderText + "' as expected!",
            headerText.equals(expetedHeaderText)
        );

        //  Set the known popup title
        knownPopupTitle = expetedHeaderText;
    }

    /**
     * Clicks the close button on the In Browser style popup window.
     */
    public static void clickClose() {
        LOGGER.info("Clicking the close button...");
        BrowserDriver.clickElement(inBrowserPopupPage.closeButton);
    }

    /**
     * Clicks the 'Exit Button' on the top right of the In Browser Popup
     */
    public static void clickTopRightExitButton() {
        LOGGER.info("Clicking the 'Exit Button' on the top right of the " + knownPopupTitle + " popup...");
        BrowserDriver.clickElement(inBrowserPopupPage.exitButton);
    }
}
