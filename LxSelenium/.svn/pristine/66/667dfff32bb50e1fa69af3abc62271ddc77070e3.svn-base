package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Entity/ScheduleTemplates/ReportingOnSchedules.feature"
        },
        format = {"json:target/cucumber.json", "html:ScheduleReport"}
)
public class ScheduleReportsTests {
}
