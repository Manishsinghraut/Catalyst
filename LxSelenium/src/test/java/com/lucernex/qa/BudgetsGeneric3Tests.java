package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 12-12-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Project/Details/Budget/BudgetsGeneric/BudgetTemplateNameModifiedShouldReflectChangeOnExistingBudgetTypesOnEntities.feature",
                "target/test-classes/iwms/Project/Details/Budget/BudgetsGeneric/UpdateBudgetColumnAndBudgetItemValueViaSpreadsheet.feature",
                "target/test-classes/iwms/Project/Details/Budget/BudgetsGeneric/VerifyAuditingAndDrilldownToShowBudgetImpactingFormsDataForBudgetLineItems.feature"

        },
        format = {"json:target/cucumber.json", "html:BudgetsGeneric3"}
)
public class BudgetsGeneric3Tests {
}
