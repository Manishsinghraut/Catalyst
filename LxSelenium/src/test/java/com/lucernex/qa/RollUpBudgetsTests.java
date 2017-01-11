package com.lucernex.qa;

/**
 * Created by RLE0097 on 21-07-2016.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/SetupWizards/CapitalProgramwizardBudgetColumnTypeshouldretainAvalue.feature",
                "target/test-classes/iwms/CapitalProgram/RollUpBudgets/CapitalProgramRollUpBudgets.feature",
                "target/test-classes/iwms/CapitalProgram/RollUpBudgets/SortBudgetLineItemOnCapitalProgramTab.feature",
                "target/test-classes/iwms/CapitalProgram/RollUpBudgets/RollUpBudgetsFromAddFacProjectActionPanel.feature",
                "target/test-classes/iwms/CapitalProgram/RollUpBudgets/CapitalProgramWizardRollUpBudgets.feature"
        },
        format = {"json:target/cucumber.json", "html:RollUpBudgetsTests"}
)
public class RollUpBudgetsTests {
}
