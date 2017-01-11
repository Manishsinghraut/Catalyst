package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 09-09-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Project/Details/Schedule/MultipleSuccessorScenario1StartOnDateInFuture.feature",
                "target/test-classes/iwms/Project/Details/Schedule/MultipleSuccessorScenario2StartOnDateInFuture.feature",
                "target/test-classes/iwms/Project/Details/Schedule/MultipleSuccessorScenario3StartOnDateInFuture.feature",
        },
        format = {"json:target/cucumber.json", "html:ScheduleTemplateComplex1Tests"}
)
public class ScheduleTemplateComplex1Tests {
}
