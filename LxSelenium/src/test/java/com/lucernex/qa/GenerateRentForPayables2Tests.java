package com.lucernex.qa;

/**
 * Created by RLE0097 on 26-05-2016.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/GenerateRent/GenerateRentForPayables2.feature",
        },
        format = {"json:target/cucumber.json","html:GenerateRentForPayables2Tests"}
)
public class GenerateRentForPayables2Tests {
}
