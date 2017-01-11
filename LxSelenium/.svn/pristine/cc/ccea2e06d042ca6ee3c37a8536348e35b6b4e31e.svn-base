package com.lucernex.qa.views.admin;

import com.lucernex.qa.pages.admin.ImportDataTabs;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * When the user clicks the Import Data link on the Admin page they will see a page
 * with these tabs: [Import Data, Spreadsheets, Schedule Job, and Job Log]. This
 * class represents a view of those tabs and provides the ability to change the
 * current tab by clicking on it.
 */
public class ImportDataTabsView extends BaseView {
    private static final Logger logger = Logger.getLogger(ImportDataTabsView.class.getName());

    private static final ImportDataTabs importDataTabs = PageFactory.initElements(BrowserDriver.getCurrentDriver(), ImportDataTabs.class);

    public static void clickImportDataTab() {
        logger.info("Clicking Import Data Tab...");
        importDataTabs.importDataTab.click();
    }

    public static void clickSpreadsheetsTab() {
        logger.info("Clicking Spreadsheets Tab...");
        importDataTabs.spreadsheetsTab.click();
    }

    public static void clickScheduleJobTab() {
        logger.info("Clicking Schedule Job Tab...");
        importDataTabs.scheduleJobTab.click();
    }

    public static void clickJobLogTab() {
        logger.info("Clicking Job Log Tab...");
        importDataTabs.jobLogTab.click();
    }



     }
