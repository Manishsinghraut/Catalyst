package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Entity/ScheduleTemplates/EditTask.feature",
                "target/test-classes/iwms/Entity/ScheduleTemplates/StatusShouldChangeToInProcessFromNotBegunWhenPercentComplete.feature",
                "target/test-classes/iwms/Entity/ScheduleTemplates/ScheduleToolTip.feature",
                "target/test-classes/iwms/Entity/ScheduleTemplates/DeleteTheScheduleTaskAssociatedWithTheWorkFlow.feature",
                "target/test-classes/iwms/Location/Details/Schedule/DeleteGroupAndTaskInSchedule.feature",
                "target/test-classes/iwms/Entity/ScheduleTemplates/CreateAnEmptyScheduleDeleteAnEmptySchedule.feature"
        },
        format = {"json:target/cucumber.json", "html:Batchb85ManageScheduleTemplate"}
)
public class Batchb85ManageScheduleTemplateTests {
}