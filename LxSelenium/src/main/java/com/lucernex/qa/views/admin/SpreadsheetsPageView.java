package com.lucernex.qa.views.admin;

import com.lucernex.qa.data.TemplateType;
import com.lucernex.qa.pages.admin.SpreadsheetsPage;
import com.lucernex.qa.browsers.BrowserDriver;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * Represents the Spreadsheet tab as provided via the Import Data admin link.
 * This class offers a way to select a spreadsheet template and download it.
 */
public class SpreadsheetsPageView {
    private static final Logger logger = Logger.getLogger(SpreadsheetsPageView.class.getName());

    private static final SpreadsheetsPage spreadsheetsPage = PageFactory.initElements(
        BrowserDriver.getCurrentDriver(),
        SpreadsheetsPage.class
    );

    public static void chooseTemplate(TemplateType tt) {
        logger.info("Choosing template: " + tt.name());
        spreadsheetsPage.templateSelect.sendKeys(tt.getValue());
     }

    public static void clickDownloadButton() {
        logger.info("Clicking Download button...");
        spreadsheetsPage.downloadButton.click();
    }

    public static void clickContractList(TemplateType subContract) {
        logger.info("Clicking template contract: " +subContract);
        spreadsheetsPage.contractSelect.sendKeys(subContract.getValue());
    }


  }
