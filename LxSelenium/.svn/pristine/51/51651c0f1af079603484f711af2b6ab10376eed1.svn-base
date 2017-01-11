package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0239 on 03/01/2016.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/RetroPayment/GenerateRetroPaymentWithTwoVendors.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/RetroPayment/RetroPaymentFunctionality.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/RetroPayment/RetroPaymentPaysOnceToTheVendorInCaseOfChangeMidMonth.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/RetroPayment/UsingPostingDateForVendorAllocation.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/RetroPayment/RetroPayment.feature"
        },
        format = {"json:target/cucumber.json", "html:RetroPaymentTests"}
)
public class RetroPaymentTests {
}
