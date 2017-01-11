package com.lucernex.qa.views.admin;

import com.google.common.collect.ImmutableMap;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.admin.AdminPage;
import com.lucernex.qa.pages.admin.ImportDataPage;
import com.lucernex.qa.utils.AjaxEnabledPageFactory;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import org.openqa.selenium.By;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

import static junit.framework.TestCase.assertTrue;

/**
 * When the user clicks on one of the Admin button they will see a page of links
 * to the administration components and this class represents that set of links.
 */
public class AdminPageView extends BaseView {
    private static final Logger logger = Logger.getLogger(AdminPageView.class.getName());

    private static final AdminPage adminPage = AjaxEnabledPageFactory.ajaxInitElements(BrowserDriver.getCurrentDriver(), AdminPage.class);
    private static final ImportDataPage importDataPage = AjaxEnabledPageFactory.ajaxInitElements(BrowserDriver.getCurrentDriver(), ImportDataPage.class);
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    /**
     * Verifies that the IWMS admin page is visible.
     */
    public static void verifyAdminPageDisplayed() {
        logger.info("Verifying admin page is visible...");
        BrowserDriver.waitForElement(adminPage.systemAdministratorDashboardLabel);
        assertTrue("Did not see the IWMS admin page!", adminPage.systemAdministratorDashboardLabel.getText()
                .contains("Administrator Dashboard"));
        logger.info("Saw admin page.");
    }

    // Tilda localization rules don't always follow a predicable pattern so we
    // need an explicit mapping in those cases, hence this map.
    static final ImmutableMap<String, String> localized =
        new ImmutableMap.Builder<String, String>()
            .put("Manage Members/Contacts", "~~Manage Members#~/~~Contacts#~")
            .build();

    /**
     * Clicks on the Admin page link.
     *
     * @param link - user visible text of desired link [e.g. "Import Data"]
     */
    public static void clickLink(String link) {
//        WebElement we = null;
//
//        try {
//            we = BrowserDriver.getCurrentDriver().findElement(By.partialLinkText(link));
//        } catch (NoSuchElementException e) {
//            String tilda = localized.get(link);
//
//            // Try again using the tilda text equivalent.
//            if (tilda != null) {
//                we = BrowserDriver.getCurrentDriver().findElement(By.linkText(tilda));
//            }
//        }
//
//        assertTrue(String.format("Did not see the admin '%s' link!", link), we.isDisplayed());
//
//        we.click();
        try {
//            SeleniumUtil.selectHitEnterKey("linktext", link, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
            SeleniumUtil.waitForElementIsClickable("paritallinktext", link, 8, SeleniumUtilities.OBJWAITTIMEOUT);
//            SeleniumUtil.selectHitEnterKey("paritallinktext", link, SeleniumUtilities.DEFAULT_TIMEOUT_IN_SECONDS);
            SeleniumUtil.click("paritallinktext", link, SeleniumUtilities.OBJWAITTIMEOUT);
		} catch (Exception e) {
			logger.info("Error : " + e.getMessage());
		}
        
    }
    public static void clickLinkByName(String linkName) throws Exception{
        logger.info("Navigating to page : " + linkName);
         BrowserDriver.getCurrentDriver().findElement(By.partialLinkText(linkName)).click();
    }
    public static void clickJobFunctionCode() {
        logger.info("Clicking the Job Function Code...");
        BrowserDriver.clickElement(adminPage.jobFunctionCode);
    }

    public static void clickJobTitleCode() {
        logger.info("Clicking the Job Title Code...");
        BrowserDriver.clickElement(adminPage.jobTitleCode);
    }

    /**
     * Verifies that the page footer is visible.
     */
    public static void verifyFooterDisplayed() {
        logger.info("Verifying footer is visible on Admin page...");
        BrowserDriver.waitForElement(adminPage.footerDiv);
        assertTrue("Did not see the page footer!", adminPage.footerDiv.isDisplayed());
        logger.info("Saw footer on Admin page.");
    }

    /**
     * Verifies that the Job Function Code link is visible
     */
    public static void verifyJobFunctionCodeDisplayed() {
        logger.info("Verifying that [Job Function Code] is visible on the admin page...");
        BrowserDriver.waitForElement(adminPage.jobFunctionCode);
        assertTrue("Job Function Code is not visible, but it should be!", adminPage.jobFunctionCode.isDisplayed());
        logger.info("Saw [Job Function Code] on admin page.");
    }

    /**
     * Verifies that the Job Function Code link is not visible
     */
    public static void verifyJobFunctionCodeNotDisplayed() {
        logger.info("Verifying that [Job Function Code] is not visible on the admin page...");
        assertTrue("Job Function Code is visible, but it should not be!", !isElementPresentNoWait(adminPage.jobFunctionCode));
        logger.info("As expected, did not see [Job Function Code] on admin page.");
    }

    public static void verifyJobTitleCodeDisplayed() {
        logger.info("Verifying that [Job Title Code] is visible on the admin page...");
        BrowserDriver.waitForElement(adminPage.jobTitleCode);
        assertTrue("Job Title Code is not visible, but it should be!", adminPage.jobTitleCode.isDisplayed());
        logger.info("Saw [Job Title Code] on admin page.");
    }

    public static void verifyJobTitleCodeNotDisplayed() {
        logger.info("Verifying that [Job Title Code] is not visible on the admin page...");
        assertTrue("Job Title Code is visible, but it should not be!", !isElementPresentNoWait(adminPage.jobTitleCode));
        logger.info("As expected, did not see [Job Title Code] on admin page.");
    }

    public static void verifyUserClassCodeDisplayed() {
        logger.info("Verifying that [User Class Code] is visible on the admin page...");
        assertTrue("User Class Code is not visible, but it should be!",
                BrowserDriver.waitForElement(adminPage.userClassCode).isDisplayed());
        logger.info("Saw [User Class Code] on admin page.");
    }

    public static void verifyUserClassCodeNotDisplayed() {
        logger.info("Verifying that [User Class Code] is not visible on the admin page...");
        assertTrue("User Class Code is visible, but it should not be!", !isElementPresentNoWait(adminPage.userClassCode));
        logger.info("As expected, did not see [User Class Code] on admin page.");
    }

    public static void verifyImportDataSheetDisplayed() {
        logger.info("Verifying that imported data spreadsheet contains no error");
        SeleniumUtil.waitForElementVisibilityOf(adminPage.Error,5,2);
        assertTrue("Imported data spreadsheet contains error", adminPage.Error.isDisplayed());
        logger.info("Imported spreadsheet had no errors.");
    }
}