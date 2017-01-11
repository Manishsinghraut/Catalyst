package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by sowmya on 7/15/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ConfigurePercentRentSchedule.feature"
        },
        format = {"json:target/cucumber.json", "html:BatchF1ConfigurePercentRentSchedule"}
)
public class BatchF1ConfigurePercentRentScheduleTests {
}
