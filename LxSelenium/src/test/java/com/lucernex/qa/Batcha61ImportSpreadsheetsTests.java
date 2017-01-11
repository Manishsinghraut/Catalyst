package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by parameshwars on 6/20/2015.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/VariableRentOffsetSpreadsheetCreateUpdate.feature",
                "target/test-classes/iwms/Facility/AssetManagement/Equipment/EquipmentSpreadsheetCreateUpdate.feature",
                "target/test-classes/iwms/CapitalProject/Details/CapitalProjectSpreadsheetCreateUpdate.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/RecoveriesAddingAndUpdatingWithSpreadsheetUpload.feature"
        },
        format = {"json:target/cucumber.json", "html:Batch61ImportSpreadSheets.html"}
)
public class Batcha61ImportSpreadsheetsTests {
}
