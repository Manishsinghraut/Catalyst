package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Entity/ScheduleTemplates/CompleteSuccessorTasksWithNegativeLeadLag.feature",
        "target/test-classes/iwms/Entity/ScheduleTemplates/DeactivatingAssignedAssigneesOnTasks.feature",
        "target/test-classes/iwms/Entity/ScheduleTemplates/NegativeTestingAddingTaskGroupWithTheSameName.feature",
        "target/test-classes/iwms/Entity/ScheduleTemplates/ApplyingStandAloneTemplateToAnEntity.feature",
    },
    format = {"json:target/cucumber.json", "html:Batchb84ManageScheduleTemplate"}
)
public class Batchb84ManageScheduleTemplateTests {
}
