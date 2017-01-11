package com.lucernex.qa;

/**
 * Created by parameshwars on 6/26/2015.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/Receipts/ReceiptsCRUDThroughUI.feature"
        },
        format = {"json:target/cucumber.json", "html:Batchb45AllContractPages"}
)
public class Batchb45AllContractPagesTests {
}
