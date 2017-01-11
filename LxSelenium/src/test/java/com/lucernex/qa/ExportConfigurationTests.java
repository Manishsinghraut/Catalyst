package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Admin oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/ExportConfiguration/ExportBudgetFolderScheduleTemplateFromOneFirmToAnotherFirm.feature",
                "target/test-classes/iwms/ExportConfiguration/ToImportExportWorkOrderForms.feature"

        },
        format = {"json:target/cucumber.json", "html:ExportConfiguration"}
)
public class ExportConfigurationTests {
}
