package com.lucernex.qa;

/**
 * Created by RLE0097 on 16-05-2016.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by sowmya on 6/10/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/GenerateRent/GenerateRentVariousPaymentDueDaySpecifiedForMonthlyFrequency.feature",
        },
        format = {"json:target/cucumber.json","html:RecurringExpensesGenerateRent2Tests"}
)
public class RecurringExpensesGenerateRent2Tests {
}
