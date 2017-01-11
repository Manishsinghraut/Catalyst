package com.lucernex.qa.views.iwms.contract.paymentinfo.recurring_expenses;

import com.lucernex.qa.browsers.BrowserDriver;
import org.openqa.selenium.By;

import java.util.logging.Logger;

/**
 * Created by RLE0239 on 26-02-2016.
 */
public class RetroPaymentView {
    private static final Logger logger = Logger.getLogger(RetroPaymentView.class.getName());

    public static void deselectUsePostingDateForVendorAllocation() {
        BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id*='usePostingDateForVendorAllocation']")).click();
    }

    public static void deselectMarkRetroPaymentsAsOneTimePayments() {
        BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[componentid='markAsOneTimePayment']")).click();
    }

    public static void selectSendEmailCheckbox() {
        BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[componentid='sendEmail']")).click();
    }

    public static void selectUsePostingDateForVendorAllocation() {
        if(!BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id*='usePostingDateForVendorAllocation']")).getAttribute("value").contains("true")){
            BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[id*='usePostingDateForVendorAllocation']")).click();
        }
    }
}
