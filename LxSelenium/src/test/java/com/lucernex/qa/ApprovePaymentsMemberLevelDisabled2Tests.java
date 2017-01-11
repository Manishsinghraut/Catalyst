package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0239 on 16-12-2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/ChangeStatusOfRecurringExpenseSchedule.feature",
                "target/test-classes/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/CheckingStatusForExpenseSchedulesThatHaveBeenModified.feature",
                "target/test-classes/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/NegativeChangeStatusOfOneTimeTransactionThatHasBeenProcessed.feature"
        },
        format = {"json:target/cucumber.json","html:ApprovePaymentsMemberLevelDisabled2"}
)
public class ApprovePaymentsMemberLevelDisabled2Tests {

}
