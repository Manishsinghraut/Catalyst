package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of spreadsheet import oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Project/Details/Summary/ProjectSpreadsheetCreateUpdate.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Sales/CanadianDollarAbbreviationIsCAD.feature",
                "target/test-classes/iwms/Contract/Details/Summary/MonthToMonthFlag.feature",
                "target/test-classes/iwms/Project/Details/Summary/CompetitorSpreadSheet.feature",

        },
        format = {"json:target/cucumber.json", "html:Batch611ImportSpreadSheets.html"}
)

public class Batcha611ImportSpreadsheetsTests {
}
