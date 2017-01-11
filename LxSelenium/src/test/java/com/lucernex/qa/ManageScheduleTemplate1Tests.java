package com.lucernex.qa;

/**
 * Created by RLE0097 on 28-07-2016.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
            "target/test-classes/iwms/Entity/ScheduleTemplates/DeleteGroupAndTaskInSchedule.feature",
            "target/test-classes/iwms/Entity/ScheduleTemplates/ScheduleTestingADDFunctionality.feature",
            "target/test-classes/iwms/Entity/ScheduleTemplates/AssigningTasksOnSchedule.feature",
        },
        format = {"json:target/cucumber.json", "html:ManageScheduleTemplate1Tests"}
)
public class ManageScheduleTemplate1Tests {
}