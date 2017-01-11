package com.lucernex.qa;

/**
 * Created by parameshwars on 6/26/2015.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/AccountingInfo/ContractExpenseAccrualsCreateUpdateDeleteThroughUI.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Transactions/TransactionsCRUDThroughUIUpdated.feature",
                "target/test-classes/iwms/Contract/ListLayoutOnLocationAndFacilitySummaryPageToDisplayAllAssociatedContracts.feature"
        },
        format = {"json:target/cucumber.json","html:Batchb44AllContractPages"}
)
public class Batchb44AllContractPagesTests {
}
