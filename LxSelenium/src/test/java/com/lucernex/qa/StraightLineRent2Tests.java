package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 8/26/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Contract/AccountingInfo/StraightLineRent/DeletingActiveInactiveSLPostedStatusDoesExistInOtherSchedules.feature",
        "target/test-classes/iwms/Contract/AccountingInfo/StraightLineRent/ReCalculateStraightLineSchedule.feature",
    },
    format = {"json:target/cucumber.json","html:StraightLineRent2Tests"}
)
public class StraightLineRent2Tests {
}
