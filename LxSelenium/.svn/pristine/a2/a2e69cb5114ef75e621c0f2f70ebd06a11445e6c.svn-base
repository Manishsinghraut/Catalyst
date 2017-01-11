package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 8/12/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/FixedOffset/SemiAnnuallyPerPeriodPRCalculation.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/FixedOffset/AnnuallyAnnualPerPeriodPRCalculation.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/FixedOffset/SemiAnnuallyCumulativePRCalculation.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/FixedOffset/SemiAnnuallyPerPeriodGrossUpPeriodPRCalculation.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/FixedOffset/AdjustmentThatDoesNotSpanTheWholePRYear.feature"
        },
        format = {"json:target/cucumber.json", "html:BatchD2PercentageRentFixedOffset"}
)
public class BatchD2PercentageRentFixedOffsetTests {
}
