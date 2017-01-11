package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Admin oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/ImportConfiguration/ExportBudgetFolderScheduleTemplateFromOneFirmToAnotherFirm.feature",
                "target/test-classes/iwms/ImportConfiguration/ToImportExportWorkOrderForms.feature"

        },
        format = {"json:target/cucumber.json", "html:ImportConfiguration"}
)
public class ImportConfigurationTests {
}
