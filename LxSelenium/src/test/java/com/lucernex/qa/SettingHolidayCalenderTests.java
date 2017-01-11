package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by sowmya on 6/10/2016
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/SettingHolidayCalendar.feature"
        },
        format = {"json:target/cucumber.json","html:SettingHolidayCalender"}
)
public class SettingHolidayCalenderTests {
}
