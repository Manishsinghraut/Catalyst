package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 8/26/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/AccountingInfo/StraightLineRent/CalculateStraightLineSchedule.feature",
                "target/test-classes/iwms/Contract/AccountingInfo/StraightLineRent/DeletingActiveInactiveSLPostedStatusDoesExistInOtherSchedules.feature",
                "target/test-classes/iwms/Contract/AccountingInfo/StraightLineRent/DeletionOfStraightLineScheduleSet1.feature",
                "target/test-classes/iwms/Contract/AccountingInfo/StraightLineRent/DeletionOfStraightLineScheduleSet2.feature",
                "target/test-classes/iwms/Contract/AccountingInfo/StraightLineRent/DeletionOfStraightLineScheduleSet3.feature",
                "target/test-classes/iwms/Contract/AccountingInfo/StraightLineRent/ReCalculateStraightLineSchedule.feature",
                "target/test-classes/iwms/Contract/Details/ApprovePayments/FiltersOnApprovePaymentsGrid.feature"
        },
        format = {"json:target/cucumber.json","html:StraightLineRentTests"}
)
public class StraightLineRentTests {
}
