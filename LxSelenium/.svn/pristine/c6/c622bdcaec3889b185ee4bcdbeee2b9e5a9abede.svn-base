package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 8/12/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/TermLengthOutsideTheNormalLeaseYearLength.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/CreditTransactionGenerated.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/CreditTransactionNotGenerated.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/PercentageRentScheduleWithMinMaxAmount.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/SalesWithinMonthButOutsideOfPercentRentSetupDates.feature"
        },
        format = {"json:target/cucumber.json", "html:BatchD11PercentageRentComplicatedSchedules"}
)
public class BatchD11PercentageRentComplicatedSchedulesTests {
}
