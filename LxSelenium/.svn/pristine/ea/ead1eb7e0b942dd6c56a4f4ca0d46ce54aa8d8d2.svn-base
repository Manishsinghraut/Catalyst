package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/SetCrashScheduleAfterApplyingTemplate.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/SettingHolidayCalendarAtPortfolioLevel.feature",
                "target/test-classes/iwms/Facility/Details/Schedule/ChangingTheTaskStatusToCanceledShouldChangeTheDurationToZero.feature",
                "target/test-classes/iwms/Location/Details/Schedule/UpdatingPredecessorTaskDatesShouldUpdateSuccessorTaskDates.feature",
                //IWMS-21387
                //"target/test-classes/iwms/Project/Details/Schedule/DeleteDependenciesOnTask.feature"
        },
        format = {"json:target/cucumber.json","html:Batchb822ManageScheduleTemplate"}
)
public class Batchb822ManageScheduleTemplateTests {
}
