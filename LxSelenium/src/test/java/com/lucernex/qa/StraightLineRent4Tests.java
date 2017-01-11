package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 16-05-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Contract/AccountingInfo/StraightLineRent/DeletionOfStraightLineScheduleSet1.feature",
    },
    format = {"json:target/cucumber.json","html:StraightLineRent4Tests"}
)
public class StraightLineRent4Tests {
}
