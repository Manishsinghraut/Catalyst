package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Location/Details/Schedule/EditScheduleTaskFromReportAndDashboard.feature",
                "target/test-classes/iwms/SetupWizards/BuildSequenceNumberAndSiteSequenceNumberInPageLayout.feature",
                "target/test-classes/iwms/Entity/ScheduleTemplates/AddingAScheduleTaskGroupWithSameNameShouldPromptUserToEnterADifferentName.feature",
        },
        format = {"json:target/cucumber.json", "html:EditScheduleTaskFromDashboard"}
)
public class EditScheduleTaskFromDashboardTests {
}
