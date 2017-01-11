package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Budget Tab Tests
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Project/Details/Budget/AddBudgetSummaryPage.feature",
                "target/test-classes/iwms/Project/Details/Budget/BudgetTypeCreation.feature",
                "target/test-classes/iwms/Project/Details/Budget/CreateBudgetTemplate.feature",
                "target/test-classes/iwms/Project/Details/Budget/EditingBudgetValuesViaValuesLink.feature",
                "target/test-classes/iwms/Project/Details/Budget/ApplyBudgetTemplate.feature",
                //Moved to FileUploadAndDownloadTests file
                //"target/test-classes/iwms/Project/Details/Budget/DownloadTemplate.feature",
                // "target/test-classes/iwms/Project/Details/Budget/UploadBudgetValues.feature",
                "target/test-classes/iwms/Project/Details/Budget/CompareBudgetColumns.feature"

        },
        format = {"json:target/cucumber.json", "html:BudgetTab"}
)
public class BudgetTabTests {
}
