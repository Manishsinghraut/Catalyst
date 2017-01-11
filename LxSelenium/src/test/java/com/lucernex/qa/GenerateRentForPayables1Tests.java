package com.lucernex.qa;

/**
 * Created by RLE0097 on 04-05-2016.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/GenerateRent/GenerateRentForPayables1.feature",
        },
        format = {"json:target/cucumber.json","html:GenerateRentForPayables1Tests"}
)
public class GenerateRentForPayables1Tests {
}
