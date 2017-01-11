package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0239 on 16-12-2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/FiltersOnApprovePaymentsGrid.feature"
        },
        format = {"json:target/cucumber.json","html:ApprovePaymentsMemberLevelDisabled3"}
)
public class ApprovePaymentsMemberLevelDisabled3Tests {

}
