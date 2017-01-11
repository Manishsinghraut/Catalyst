package com.lucernex.qa;

/**
 * Created by RLE0097 on 20-10-2016.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/Details/RecurringExpenseForVariousInternationalCurrencyTypesShouldGenerateTransactionsCorrectly.feature",
        },
        format = {"json:target/cucumber.json", "html:Currency1Tests"}
)
public class Currency1Tests {
}
