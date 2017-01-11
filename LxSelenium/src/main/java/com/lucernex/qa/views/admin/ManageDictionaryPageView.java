package com.lucernex.qa.views.admin;

import com.lucernex.qa.pages.admin.ManageDictionaryPage;
import com.lucernex.qa.browsers.BrowserDriver;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * Represents the Spreadsheet tab as provided via the Import Data admin link.
 * This class offers a way to select a spreadsheet template and download it.
 */
public class ManageDictionaryPageView {
    private static final Logger logger = Logger.getLogger(ManageDictionaryPageView.class.getName());

    private static final ManageDictionaryPage dictionaryPage = PageFactory.initElements(
        BrowserDriver.getCurrentDriver(),
        ManageDictionaryPage.class
    );

    public static void checkAppendGlobalCheckbox() {
        logger.info("Checking Append Global Dictionary checkbox");
        dictionaryPage.appendGlobalCheckbox.click();
     }

    public static void clickDownloadButton() {
        logger.info("Clicking Download Current Dictionary button ...");
        dictionaryPage.DownloadDictionaryButton.click();
    }

  }
