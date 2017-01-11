package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0239 on 16-12-2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/ApprovePaymentsEntityMember.feature",
                "target/test-classes/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/ApprovePaymentsPortfolioMember.feature",
                "target/test-classes/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/ChangingStatusOfOneTimePayments.feature",
                "target/test-classes/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/SetApprovalStatusToApprovedThroughXml.feature",
        },
        format = {"json:target/cucumber.json", "html:ApprovePaymentsMemberLevelDisabled1"}
)
public class ApprovePaymentsMemberLevelDisabled1Tests {

}
