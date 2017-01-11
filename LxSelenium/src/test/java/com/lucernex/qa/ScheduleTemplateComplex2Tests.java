package com.lucernex.qa;

/**
 * Created by RLE0097 on 27-09-2016.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Project/Details/Schedule/SinglePredecessorTemplateFinishOnDateInFuture.feature",
                "target/test-classes/iwms/Project/Details/Schedule/MultiplePredecessorTemplateScenario1FinishOnDateInFuture.feature",
                "target/test-classes/iwms/Project/Details/Schedule/MultiplePredecessorTemplateStartOnDateInFuture.feature",
                "target/test-classes/iwms/Project/Details/Schedule/ScheduleDatesShouldBeUpdatedWhenUsingScheduleImportSpreadsheet.feature",
                "target/test-classes/iwms/Entity/ScheduleTemplateComplex/CancelingSuccessorShouldSetPredecessorLeadLagTo0.feature"
        },
        format = {"json:target/cucumber.json", "html:ScheduleTemplateComplex2Tests"}
)
public class ScheduleTemplateComplex2Tests {
}
