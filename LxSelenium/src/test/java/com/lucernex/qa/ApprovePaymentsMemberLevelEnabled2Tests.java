package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0239 on 16-12-2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelEnabled/ApprovalLevelOnMemberRecord.feature",
                "target/test-classes/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelEnabled/ApprovalLevelLimitsOnPortfolioSummaryPage.feature",
                "target/test-classes/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelEnabled/ZApprovalLimitsOnMemberRecords.feature",
                "target/test-classes/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelEnabled/ChangingApprovalLimits.feature"
        },
        format = {"json:target/cucumber.json", "html:ApprovePaymentsMemberLevelEnabled2"}
)
public class ApprovePaymentsMemberLevelEnabled2Tests {

}
