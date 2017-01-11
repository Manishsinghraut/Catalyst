package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/AddIndependentTask.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/TaskLookup.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/AddMultiplePredecessorsForScheduleInScheduleTemplate.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/AddPredecessorFromAnotherTemplate.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/AppendScheduleTemplateOnEntity.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/HolidayCalendarSortOrder.feature",

                //Below are Jira Ticket : AUTOMATION-866 - Schedule Tab at Entity Level - Smoke Testing	Scenario's
                "target/test-classes/iwms/Facility/Details/Schedule/ModifyBaselineDates.feature",
                "target/test-classes/iwms/Location/Details/ModifyProjectedDate.feature"

        },
        format = {"json:target/cucumber.json","html:Batchb81ManageScheduleTemplate"}
)
public class Batchb81ManageScheduleTemplateTests {
}
