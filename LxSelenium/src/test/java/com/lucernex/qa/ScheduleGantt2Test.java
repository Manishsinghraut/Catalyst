package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 31-03-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Project/Details/Schedule/EditingTaskInfoFromTaskBarsOnGanttViewContinuedPart2.feature"
        },
        format = {"json:target/cucumber.json", "html:ScheduleGantt2"}
)

public class ScheduleGantt2Test {
}