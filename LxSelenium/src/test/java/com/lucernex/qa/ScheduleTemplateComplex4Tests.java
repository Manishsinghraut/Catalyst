package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 06-10-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Project/Details/Schedule/TestingSinglePredecessorRelationshipTemplateWithAssociatedWorkFlow.feature",
                "target/test-classes/iwms/Project/Details/Schedule/MultipleSuccessorScenario4FinishOnDateInFuture.feature",
                "target/test-classes/iwms/Project/Details/Schedule/MultipleSuccessorScenario5FinishOnDateInFuture.feature",
                "target/test-classes/iwms/Project/Details/Schedule/MultipleSuccessorScenario6FinishOnDateInFuture.feature",
                "target/test-classes/iwms/Project/Details/Schedule/MultiplePredecessorTemplateScenario2FinishOnDateInFuture.feature",
        },
        format = {"json:target/cucumber.json", "html:ScheduleTemplateComplex4Tests"}
)
public class ScheduleTemplateComplex4Tests {
}
