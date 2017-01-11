package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/GenerateRent/GenerateRentForReceivables1.feature",
        },
        format = {"json:target/cucumber.json","html:RecurringExpensesGenerateRent4Tests"}
)
public class RecurringExpensesGenerateRent4Tests {
}
