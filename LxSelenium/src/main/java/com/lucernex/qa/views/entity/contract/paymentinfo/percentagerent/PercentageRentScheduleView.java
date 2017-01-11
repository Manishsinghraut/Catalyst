package com.lucernex.qa.views.entity.contract.paymentinfo.percentagerent;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.entity.contract.paymentinfo.percentagerent.PercentageRentSchedulePage;
import com.lucernex.qa.views.BaseView;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.Select;

import java.util.logging.Logger;

import static junit.framework.Assert.assertTrue;
import static junit.framework.Assert.fail;

/**
 * @since 1.0.0
 * @author Andrew.Subichev
 */
public class PercentageRentScheduleView extends BaseView {
    private static final Logger logger = Logger.getLogger(PercentageRentScheduleView.class.getName());
    private static final String PR_FRAME = "Percentage Rent";

    private static PercentageRentSchedulePage percentageRentPage = PageFactory.initElements(
            BrowserDriver.getCurrentDriver(),
            PercentageRentSchedulePage.class
    );

    /**
     * Selects month and year on percentage Rent schedule screen and refreshes the results
     *
     * @param monthName
     * @param yearName
     * @throws InterruptedException
     */
    public static void selectMonthAndYear(String monthName, String yearName) throws InterruptedException {

        assertTrue("Month name is not specified", StringUtils.isNotEmpty(monthName));
        assertTrue("Year name is not specified", StringUtils.isNotEmpty(yearName));
        logger.info(String.format("Attempting to select month - '%s' and year - '%s' on PRP schedule page", monthName, yearName));

        switchToFrameByTitle(PR_FRAME);

        if (percentageRentPage.selectedMonth.isDisplayed() &&
            percentageRentPage.selectedYear.isDisplayed() &&
            percentageRentPage.refreshButton.isDisplayed()) {

            Select dropDownMonth = new Select(percentageRentPage.selectedMonth);
            dropDownMonth.selectByVisibleText(monthName);

            Select dropDownYear = new Select(percentageRentPage.selectedYear);
            dropDownYear.selectByVisibleText(yearName);

            percentageRentPage.refreshButton.click();

        } else {
            fail("Didn't find the month and/or year and refresh button on PRP schedule page");
        }

        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
    }


    public static void clickLink(String linkText) {
        try {
            switchToFrameByTitle(PR_FRAME);
            waitForElement(By.linkText(linkText));
        } catch (InterruptedException e) {
            System.out.println("Could not find link text");
        }
        BrowserDriver.getCurrentDriver().findElement(By.linkText(linkText)).click();
        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
    }


}
