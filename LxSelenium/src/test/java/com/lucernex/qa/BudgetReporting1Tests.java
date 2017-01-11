package com.lucernex.qa;

/**
 * Created by RLE0097 on 22-10-2016.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
            "target/test-classes/iwms/Reports/BudgetReporting/CreatingBudgetMathFieldsTotalValueABudgetReportAndSelectingOptionAsBudgetCategoryCode.feature",
            "target/test-classes/iwms/Reports/BudgetReporting/SelectingASpecificBudgetViewOnTheReport.feature",
        },
        format = {"json:target/cucumber.json", "html:BudgetReporting1Tests"}
)
public class BudgetReporting1Tests {
}
