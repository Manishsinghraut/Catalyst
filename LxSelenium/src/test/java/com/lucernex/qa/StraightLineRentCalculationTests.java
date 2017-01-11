package com.lucernex.qa;

/**
 * Created by RLE0097 on 24-11-2016.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Contract/AccountingInfo/StraightLineRent/AmortizeMethodForStraightLineCashAndExpenseSetToPerPeriodAndProRatePeriodsSetToYes.feature",
        "target/test-classes/iwms/Contract/AccountingInfo/StraightLineRent/AmortizeMethodForStraightLineCashAndExpenseSetToPerPeriodAndProRatePeriodsSetToNo.feature",
    },
    format = {"json:target/cucumber.json", "html:StraightLineRentCalculationTests"}
)
public class StraightLineRentCalculationTests {
}
