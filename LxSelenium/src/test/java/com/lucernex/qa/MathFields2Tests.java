package com.lucernex.qa;

/**
 * Created by RLE0097 on 24-10-2016.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 23-10-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Project/Details/Summary/SummaryPageWithCustomListWithMathFields.feature",
        },
        format = {"json:target/cucumber.json","html:MathFields2Tests"}
)
public class MathFields2Tests {
}
