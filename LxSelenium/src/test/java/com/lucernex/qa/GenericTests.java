package com.lucernex.qa;

/**
 * Created by RLE0097 on 29-07-2016.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
            "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/EditTheLabelOfAGlobalField.feature",
            "target/test-classes/iwms/Entity/ScheduleTemplates/EditingTaskPopupOnScheduleReportShouldReflectChangesOnEntity.feature"
        },
        format = {"json:target/cucumber.json", "html:GenericTests"}
)
    public class GenericTests {
}