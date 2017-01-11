package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Report actions oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Reports/PrintableViewOfReport.feature",
                "target/test-classes/iwms/Reports/RerunReportFromReportResults.feature",
                "target/test-classes/iwms/Reports/RunReportButtonConfiguration.feature",
                "target/test-classes/iwms/Reports/FlatFileReportAlignment.feature"
        },

        format = {"json:target/cucumber.json", "html:ReportActions"}
)
public class ReportActionsTests {
}
