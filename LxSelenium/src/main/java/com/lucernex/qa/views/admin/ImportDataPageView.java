package com.lucernex.qa.views.admin;

import com.lucernex.qa.PageUtilities;
import com.lucernex.qa.pages.admin.ImportDataPage;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.io.File;
import java.util.List;
import java.util.logging.Logger;

import static com.google.common.base.Preconditions.checkArgument;
import static com.lucernex.qa.utils.ForceWaitForItem.delay;
import static junit.framework.Assert.assertTrue;

public class ImportDataPageView extends BaseView {

    static File file;

    private static final Logger logger = Logger.getLogger(ImportDataPageView.class.getName());

    private static final ImportDataPage importDataPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), ImportDataPage.class);
    private static final PageUtilities pageUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), PageUtilities.class);


    /**
     * Verifies that the IWMS admin page is visible.
     */
    public static void verifyAdminPageDisplayed() {
        logger.info("Verifying Import Data page is visible...");
        BrowserDriver.waitForElement(importDataPage.chooseFileButton);
        assertTrue("Did not see the IWMS Import Data page!", importDataPage.chooseFileButton.isDisplayed());
    }

    public static void chooseFile(File file) {
        checkArgument(file != null, "Required argument 'file' is null!");
        checkArgument(file.exists(), "Specified file '$s' not found!");

        logger.info("Choosing the file to upload...");
        importDataPage.chooseFileButton.sendKeys(file.getAbsolutePath());

    }


    public static void clickImportButton() {
        logger.info("Clicking Import button...");
        importDataPage.importButton.click();
    }

    public static void clickContinueTillEndButton() {
        logger.info("Clicking Continue till end button...");
        List<WebElement> radioGroup  = importDataPage.continueTillEndRadioButton;
        for (WebElement webElement : radioGroup) {
            if("false".equals(webElement.getAttribute("value"))) {
                webElement.click();
                break;
            }
        }
    }
    public static void isProcessingDone() {
        logger.info("Checking Processing Done...");
        boolean boolwait = false;
        while (!boolwait) {
          // importDataPage.isProcessingDome.isDisplayed();
            boolwait = isStringExist("Processing Done");
        }

        }

    public static void submitFileToImport(String file) throws Exception {

        System.out.print("file: "+file.toString());

        pageUtil.typeInto(PageUtilities.Locators.name, "dataFile", file);
    }

    public static void clickResetButton() {
        logger.info("Clicking Reset button...");
        importDataPage.resetButton.click();
    }


    public static boolean isStringExist(String stringexpectname) {
        boolean stringexist = false;

        if (BrowserDriver.getCurrentDriver().getPageSource().contains(stringexpectname)) {
            stringexist = true;
        }

        return stringexist;
    }


    public static void importOneFiles( String fullPathFile) throws Exception {
        submitFileToImport(fullPathFile);

        clickImportButton();
        isProcessingDone();
//        delay(4000);
        AdminPageView.verifyImportDataSheetDisplayed();
        clickResetButton();
        delay(3000);
    }
}




