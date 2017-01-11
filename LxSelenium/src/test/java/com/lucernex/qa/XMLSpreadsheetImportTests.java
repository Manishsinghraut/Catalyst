package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 13-10-2016.
 */


@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Contract/AbstractInfo/KeyDates/ImportKeyDatesToUpdateDaysOrPeriodForNoticeAndTicklerAction.feature",
        "target/test-classes/iwms/AdminPage/MemberAdministration/XMLImportsWhenNumberFormatUsesCommaAndDecimals.feature",
        "target/test-classes/iwms/Project/Details/Budget/LocksValueImportsAndNoLocksValueImportsForBudgets.feature",
    },
    format = {"json:target/cucumber.json","html:XMLSpreadsheetImportTests"}
)
public class XMLSpreadsheetImportTests {
}
