package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 26-05-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/CreateExpenseScheduleNegativeTestCRUDThroughUI.feature",
        },
        format = {"json:target/cucumber.json","html:Batchb62RecurringExpensesBasicTests"}
)
public class Batchb62RecurringExpensesBasicTests {
}
