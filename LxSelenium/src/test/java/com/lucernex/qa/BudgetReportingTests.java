package com.lucernex.qa;

/**
 * Created by RLE0097 on 12-10-2016.
 */


import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 31-03-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
            "target/test-classes/iwms/Reports/BudgetReporting/CreatingABudgetReportAndSelectingOptionAsBudgetLineItem.feature",
            "target/test-classes/iwms/Reports/BudgetReporting/CreateABudgetCategoryReportAndApplyABudgetView.feature",
            "target/test-classes/iwms/Reports/BudgetReporting/CreatingBudgetReportWithJavaScriptExpression.feature",
            "target/test-classes/iwms/Reports/BudgetReporting/CreateReportCopyingExistingBudgetReport.feature",
            "target/test-classes/iwms/Reports/BudgetReporting/SortingReportByBudgetCategoryCode.feature",
            "target/test-classes/iwms/Reports/BudgetReporting/AddingSortingAndGroupingToBudgetLineItemReport.feature",
        },
        format = {"json:target/cucumber.json", "html:BudgetReportingTests"}
)
public class BudgetReportingTests {
}
