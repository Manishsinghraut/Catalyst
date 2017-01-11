package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/AccountingInfo/PercentRentAccruals/OffsetsShouldBeCalculatedProperlyInPercenatgeRentAccruals.feature",
                "target/test-classes/iwms/Contract/AccountingInfo/PercentRentAccruals/PRAccrualsCalculationsForNonProRatedBreakpointSchedule.feature"
        },
        format = {"json:target/cucumber.json", "html:PercentRentAccrual"}
)
public class PercentRentAccrualTests {
}
