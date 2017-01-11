package com.lucernex.qa;

/**
 * Created by RLE0097 on 11/18/2015.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Entity/ManageEntity/StatusShouldBeSameInManageEntityAndEntitySummaryPage.feature"
        },
        format = {"json:target/cucumber.json", "html:ManageEntity1"}
)

public class ManageEntity1Tests {
}
