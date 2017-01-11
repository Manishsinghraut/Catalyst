package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by sowmya on 7/15/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/Transactions/CopyTransactionWithAllOptions.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Transactions/CreateOneTimeTransactionWhereVendorAllocationAlreadyExist.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Transactions/GeneratePassThroughPaymentForMasterContract.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Transactions/A_ManuallyProcessingPaymentTransaction.feature"
        },
        format = {"json:target/cucumber.json", "html:Batchc11ContractPaymentTransactions"}
)
public class Batchc11ContractPaymentTransactionsTests {
}
