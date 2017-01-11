package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by sowmya on 08/06/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/ScheduledOffsets/ApplyMultipleScheduleOffsets.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/ScheduledOffsets/MatchByGroupTypeVendorAndApplyOffsetsMultipleTimes.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/ScheduledOffsets/MatchingByVendorAndApplyOffsetsOnTransactionsWithTaxes.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/ScheduledOffsets/MatchByGroupTypeVendorAndTotalOffsetGreaterThaneligibleTransactions.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/ScheduledOffsets/MatchingByGroupAndType.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/ScheduledOffsets/NoMatchCriteriaSpecifiedAndProcessedTransactionsExist.feature"
        },
        format = {"json:target/cucumber.json", "html:Batchc3ScheduledOffsets"}
)
public class Batchc3ScheduledOffsetsTests {
}
