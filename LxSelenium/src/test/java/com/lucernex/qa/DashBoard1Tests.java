package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 20-10-2016.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/DashBoard/News.feature",
                "target/test-classes/iwms/DashBoard/MyFormAssignments.feature"
        },
        format = {"json:target/cucumber.json", "html:DashBoard1Tests"}
)
public class DashBoard1Tests {
}
