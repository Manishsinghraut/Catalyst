package com.lucernex.qa;

/**
 * Created by RLE0097 on 30-05-2016.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Reports/EditableReports/EditableWorkflowReport.feature",
        "target/test-classes/iwms/Reports/EditableReports/EntityReportOnScheduleFields-EditableFields.feature",
        "target/test-classes/iwms/Reports/EditableReports/ReadOnlyFieldTestingOnEditableReports.feature"
    },
    format = {"json:target/cucumber.json", "html:EditableReports1"}
)
public class EditableReports1Tests {
}
