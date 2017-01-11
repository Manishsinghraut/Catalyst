package com.lucernex.qa.views.entity.contract.paymentinfo.receipts;

import com.lucernex.qa.pages.entity.contract.paymentinfo.receipts.ReceiptsPage;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * Created by sergeym on 9/5/2014.
 */
public class ReceiptsPageView extends BaseView {
    private static final Logger logger = Logger.getLogger(ReceiptsPageView.class.getName());

    private static final ReceiptsPage receiptsPage = PageFactory.initElements(
            BrowserDriver.getCurrentDriver(),
            ReceiptsPage.class
    );

    public static void checkForAlertMessage(String arg1) throws InterruptedException {
//        Alert alert = BrowserDriver.getCurrentDriver().switchTo().alert();
//        alert.getText().contains(arg1);
        if (!receiptsPage.errorAlert.getText().contains("Error")) {
            logger.severe("Failed to display error alert");
            throw new InterruptedException();
        }
    }

    public static void amountNotAllocatedIsZero() throws InterruptedException {
        switchToFrameWithField("#PaymentReceipt_CodeReceiptTypeID");
        if (!receiptsPage.amountNotAllocated.getAttribute("value").equals("$0.00")) {
            logger.severe("Failed to find $0.00 in Amount Not Allocated");
            throw new InterruptedException();
        }
        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
    }

    public static void amountNotAllocatedIsNotZero() throws InterruptedException {
        switchToFrameWithField("#PaymentReceipt_CodeReceiptTypeID");
        if (receiptsPage.amountNotAllocated.getAttribute("value").equals("$0.00")) {
            logger.severe("Failed because Amount Not Allocated is zero");
            throw new InterruptedException();
        }
        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
    }

    public static void checkAllCheckbox() throws InterruptedException {
        logger.info("Checking All Checkbox on Prepaid Amount Total popup");
        switchToFrameWithField("#ContractReceiptReconciliationDiv");
        receiptsPage.allCheckBox.click();
        BrowserDriver.getCurrentDriver().switchTo().defaultContent();
    }
}
