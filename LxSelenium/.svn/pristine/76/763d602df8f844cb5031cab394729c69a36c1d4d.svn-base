package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 22-08-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Portfolio/Details/AddingCurrencyAtPortfolioLevelShouldReflectTheCorrectCurrencyOnExpenseScheduleAndTransaction.feature",
                "target/test-classes/iwms/Portfolio/Details/AddingFirmLevelCurrencyShouldReflectCorrectCurrencyOnTheRecurringExpenseAndTransaction.feature",
        },
        format = {"json:target/cucumber.json", "html:CurrencyTests"}
)
public class CurrencyTests {
}
