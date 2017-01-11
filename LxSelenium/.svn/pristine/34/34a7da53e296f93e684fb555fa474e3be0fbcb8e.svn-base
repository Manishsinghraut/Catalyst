package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by sowmya on 7/15/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/Transactions/CopyTransactionWithoutVendorAllocation.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Transactions/GeneratePassThroughPaymentForNonMasterContract.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Transactions/PaymentTransactionPromptingToCaluculateTax.feature"
        },
        format = {"json:target/cucumber.json", "html:Batchc1ContractPaymentTransactions"}
)
public class Batchc1ContractPaymentTransactionsTests {
}
