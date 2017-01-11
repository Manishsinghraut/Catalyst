package com.lucernex.qa;

/**
 * Created by RLE0097 on 23-05-2016.
 */

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 16-05-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
            "target/test-classes/iwms/Contract/AccountingInfo/StraightLineRent/DeletionOfStraightLineScheduleSet3.feature"
        },
        format = {"json:target/cucumber.json","html:StraightLineRent7Tests"}
)
public class StraightLineRent7Tests {
}
