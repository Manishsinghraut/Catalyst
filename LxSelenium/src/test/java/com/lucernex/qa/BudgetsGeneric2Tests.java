package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 31-03-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Project/Details/Budget/BudgetsGeneric/BudgetCostFieldAbilityToIncludeMathExpression.feature",
                "target/test-classes/iwms/Project/Details/Budget/BudgetsGeneric/DisplayingLineItemCodeOnTheBudgetSummaryPage.feature",
                "target/test-classes/iwms/Project/Details/Budget/BudgetsGeneric/BudgetMathFieldsZeroShouldBeDisplayedIfAColumnInTheMathIs0.feature",
                "target/test-classes/iwms/Project/Details/Budget/BudgetsGeneric/CSICodesListCheck.feature",
                "target/test-classes/iwms/Project/Details/Budget/BudgetsGeneric/XmlImportsForBudgetColumnBudgetColumnItemValueRecordsWithoutUsingTheLxIDClientIDAttributes.feature"

        },
        format = {"json:target/cucumber.json", "html:"}
)
public class BudgetsGeneric2Tests {
}
