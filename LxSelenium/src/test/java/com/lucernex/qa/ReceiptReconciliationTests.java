package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 8/26/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/Receipts/ApplyingCashReceiptsToNonARPaymentTransactionRecords.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Receipts/ReceiptsReconcileFunctionShouldUpdateBankRoutingNumAndBankAccountNumOnPaymentInformationSection.feature",
                //Included under smoke
                //"target/test-classes/iwms/Contract/PaymentInfo/Receipts/ReceiptReconciliation.feature"
        },
        format = {"json:target/cucumber.json", "html:ReceiptReconciliation"}
)
public class ReceiptReconciliationTests {
}