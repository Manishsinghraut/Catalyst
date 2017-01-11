package com.lucernex.qa;

/**
 * Created by RLE0097 on 06-09-2016.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Project/Details/Schedule/TestingRegressionIndependentTemplate.feature",
                "target/test-classes/iwms/Project/Details/Schedule/CanceledTaskPredecessorSuccessorRelationship.feature",
                "target/test-classes/iwms/Project/Details/Schedule/SinglePredecessorTemplateStartOnDateInFuture.feature",
        },
        format = {"json:target/cucumber.json", "html:ScheduleTemplateComplexTests"}
)
public class ScheduleTemplateComplexTests {
}
