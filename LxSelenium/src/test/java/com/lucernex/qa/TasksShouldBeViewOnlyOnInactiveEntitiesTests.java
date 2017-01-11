package com.lucernex.qa;

/**
 * Created by RLE0097 on 21-10-2016.
 */
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Entity/ScheduleTemplates/TasksShouldBeViewOnlyOnInactiveEntities.feature",
        },
        format = {"json:target/cucumber.json", "html:TasksShouldBeViewOnlyOnInactiveEntitiesTests"}
)
public class TasksShouldBeViewOnlyOnInactiveEntitiesTests {

}
