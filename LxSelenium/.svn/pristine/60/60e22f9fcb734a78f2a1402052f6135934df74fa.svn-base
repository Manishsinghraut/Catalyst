package com.lucernex.qa.views.entity.contract.paymentinfo.recoveries;

import com.lucernex.qa.pages.entity.contract.paymentinfo.recoveries.RecoveriesPage;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

import static org.junit.Assert.fail;

/**
 * Created by sergeym on 7/22/2014.
 */
public class RecoveriesPageView extends BaseView{

    private static final Logger logger = Logger.getLogger(RecoveriesPageView.class.getName());
    private static String total = "0";

    private static final RecoveriesPage recoveriesPage = PageFactory.initElements(
            BrowserDriver.getCurrentDriver(),
            RecoveriesPage.class
    );

    public static void clickPrepaidAmountTotalButton() throws InterruptedException {
        logger.info("Clicking prepaid amount total magnifying glass button");
        switchToFrameWithField("#divExpenseRecoveryPrepaidAmount");
        recoveriesPage.prepaidAmountTotalButton.click();
        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
    }

    public static void checkAllCheckbox() throws InterruptedException {
        logger.info("Checking All Checkbox on Prepaid Amount Total popup");
        switchToFrameWithField("#ExpenseRecoveryPrepaidAmountDiv");
        recoveriesPage.allCheckBox.click();
        total = recoveriesPage.prepaidAmountTotal.getAttribute("value");
        logger.info("Prepaid Amount Total is = " + total);
        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
    }

    public static void checkTotalUpdatedCorrectly() throws InterruptedException {
        logger.info("Checking if Prepaid Amount Total is updated");
        switchToFrameWithField("#divExpenseRecoveryPrepaidAmount");
        String prepaidAmount = recoveriesPage.prepaidAmountField.getAttribute("value");
        logger.info("Prepaid Amount Field is = " + prepaidAmount);
        if (!prepaidAmount.equals(total)) {
            logger.severe("Prepaid Amount Field is not set correctly from the Total field.");
            throw new InterruptedException();
        }
        logger.info("Prepaid Amount Field is set correctly from Total field.");
    }

    public static void checkRecoveryGroupLabel() {
        BrowserDriver.waitForElement(recoveriesPage.recoveryGroupLabel);

        if (! recoveriesPage.recoveryGroupLabel.isDisplayed()) {
            takeScreenshot("looking-for-recoveries-page.png");
            fail("Did not see the Recovery Group label on the Recoveries Page!");
        }

    }
}
