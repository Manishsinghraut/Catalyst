package com.lucernex.qa;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 8/26/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/RecoveryUpdateEscrow.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/RecoverySetupCheckingAndCheckingAllBoxes.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/ReconcileAllocateByExistingVendor.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/ReconcileSelectingDifferentVendorAndCatchUpPayment.feature"

        },
        format = {"json:target/cucumber.json","html:Batch11ContractRecoveriesTests"}
)
public class Batch11ContractRecoveriesTests {
}
