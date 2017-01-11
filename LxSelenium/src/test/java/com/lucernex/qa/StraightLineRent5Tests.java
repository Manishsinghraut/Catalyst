package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 17-05-2016.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/AccountingInfo/StraightLineRent/DeletionOfStraightLineScheduleSet2.feature",
        },
        format = {"json:target/cucumber.json","html:StraightLineRent5Tests"}
)
public class StraightLineRent5Tests {
}