package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 31-03-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Location/Details/Schedule/CriticalPathToggleBaselineTaskBarsAndTimeSpan.feature",
                "target/test-classes/iwms/Location/Details/Schedule/SearchAndSortFunctionalityOnSchedule.feature",
                "target/test-classes/iwms/Project/Details/Schedule/ApplyAScheduleTemplateWithMultiplePredecessorOnEntity.feature",
                "target/test-classes/iwms/Entity/ScheduleTemplates/SelectingAndUnselectingAColumn.feature",
                //To be automated later has issue
                //"target/test-classes/iwms/Location/Details/Schedule/TestingzoominzoomoutzoomtofitandFullScreenfunctionalityonScheduletab.feature",

        },
        format = {"json:target/cucumber.json", "html:ScheduleGantt"}
)
public class ScheduleGanttTest {
}
