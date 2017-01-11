package com.lucernex.qa;

/**
 * Created by RLE0097 on 17-11-2016.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/PercentageRentScheduleWithArtificialBreakPoint.feature",
        },
        format = {"json:target/cucumber.json", "html:PercentageRentScheduleWithArtificialBreakPointTests"}
)
public class PercentageRentScheduleWithArtificialBreakPointTests {
}
