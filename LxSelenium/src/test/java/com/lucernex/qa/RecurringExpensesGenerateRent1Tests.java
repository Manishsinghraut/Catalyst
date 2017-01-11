package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by sowmya on 6/10/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/GenerateRent/GenerateRentVariousPaymentDueDaySpecifiedForAnnuallyFrequency.feature",
        },
        format = {"json:target/cucumber.json","html:RecurringExpensesGenerateRent1Tests"}
)
public class RecurringExpensesGenerateRent1Tests {
}
