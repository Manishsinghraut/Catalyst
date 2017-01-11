package com.lucernex.qa;

/**
 * Created by RLE0097 on 30-05-2016.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Reports/EditableReports/SuccessfullyCloseAFormOnAReport.feature",
                "target/test-classes/iwms/Reports/EditableReports/FormCheckedOutByUserAThenUserBCannotUpdateThatFormInstance.feature",
                "target/test-classes/iwms/Reports/EditableReports/NotesAndDescriptionShouldBeEditableOnReport.feature",
                "target/test-classes/iwms/Reports/EditableReports/EditableReportFieldsOnMemberReport.feature",
        },
        format = {"json:target/cucumber.json", "html:EditableReports3"}
)
public class EditableReports3Tests {
}
