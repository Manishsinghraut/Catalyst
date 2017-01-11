package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 08-06-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/DashBoard/CustomHTMLModule.feature",
                "target/test-classes/iwms/DashBoard/CreateNewDashboard.feature",
                "target/test-classes/iwms/DashBoard/DefaultDashboard.feature",
        },
        format = {"json:target/cucumber.json", "html:DashBoardTests"}
)
public class DashBoardTests {
}
