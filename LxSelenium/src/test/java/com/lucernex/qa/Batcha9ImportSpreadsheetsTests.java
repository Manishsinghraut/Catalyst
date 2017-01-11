package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of spreadsheet import oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Parcel/Details/Summary/ParcelSpreadsheetCreateUpdate.feature",
                "target/test-classes/iwms/Portfolio/REPlanner/REPlanner/TargetSpreadsheet.feature",
                "target/test-classes/iwms//AdminPage/CompanyAdministration/ManageExchangeRates/ExchangeRateSpreadsheet.feature",
                "target/test-classes/iwms/Portfolio/REPlanner/REPlanner/Targets.feature"
        },
        format = {"json:target/cucumber.json", "html:Batch9ImportSpreadSheets"}
)
public class Batcha9ImportSpreadsheetsTests {
}
