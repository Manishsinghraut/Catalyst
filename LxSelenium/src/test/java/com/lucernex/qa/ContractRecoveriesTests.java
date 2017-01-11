package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 23-05-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/AddingDeductionsAndRecoveries.feature"
                //deleted below script
                //"target/test-classes/iwms/Contract/PaymentInfo/Recoveries/AddingDeductionsAndRecoveries1.feature",
        },
        format = {"json:target/cucumber.json","html:ContractRecoveriesTests"}
)
public class ContractRecoveriesTests {
}
