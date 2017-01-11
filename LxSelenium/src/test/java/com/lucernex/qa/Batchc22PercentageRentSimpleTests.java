package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by sowmya on 7/29/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/PercentageRentScheduleWithNaturalBreakPoint.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/MutuallyExclusiveBPRatesforDifferentPercentRentRecords.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ExclusionRateCalculationsForPercentageRent.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/PeriodAnnualGrossUpCreditShouldGeneratedInCaseTheLastYearOfLeaseIsPartial.feature"
        },
        format = {"json:target/cucumber.json", "html:Batchc22PercentageRentSimple"}
)
public class Batchc22PercentageRentSimpleTests {
}
