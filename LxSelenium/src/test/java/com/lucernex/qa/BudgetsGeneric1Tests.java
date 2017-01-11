package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 31-03-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Project/Details/Budget/BudgetsGeneric/CreateBudgetColumnAndBudgetItemValueViaSpreadsheet.feature",
                "target/test-classes/iwms/Project/Details/Budget/BudgetsGeneric/DuplicateBudgetTemplateFromAnotherTemplate.feature",
                "target/test-classes/iwms/Project/Details/Budget/BudgetsGeneric/BudgetIndexVariable.feature",
                "target/test-classes/iwms/Project/Details/Budget/BudgetsGeneric/TheArrowsToRearrangeABudgetTemplate.feature",
                "target/test-classes/iwms/Project/Details/Budget/BudgetsGeneric/EditBudgetSummaryPage.feature"

        },
        format = {"json:target/cucumber.json", "html:BudgetsGeneric1"}
)
public class BudgetsGeneric1Tests {
}
