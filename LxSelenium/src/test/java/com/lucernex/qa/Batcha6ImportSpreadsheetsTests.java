package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of spreadsheet import oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
//        "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/PercentageVariableRentOffsetCreateUpdate.feature",
                "target/test-classes/iwms/AdminPage/CostManagement/ComplexSpreadsheetCreateUpdate.feature",
//                "target/test-classes/iwms/AdminPage/PortfolioAdministration/ManageComplexCenterDetailsCreateUpdate.feature",

                "target/test-classes/iwms/AdminPage/MemberAdministration/EmployerSpreadsheetCreateUpdate.feature",

                "target/test-classes/iwms/Facility/Details/FacilitySpreadsheetCreateUpdate.feature",
                "target/test-classes/iwms/AdminPage/CompanyAdministration/ManagePartsAndInventory/ManageSpreadsheetPartsCreateUpdate.feature",
                "target/test-classes/iwms/Entity/ScheduleTemplates/ScheduleSpreadsheet.feature"
//        "target/test-classes/iwms/Project/Details/ProjectCreateUpdate.feature"
//        "target/test-classes/iwms/CapitalProject/Details/CapitalProjectCreateUpdate.feature"
        },
        format = {"json:target/cucumber.json", "html:Batch6ImportSpreadSheets.html"}
)
public class Batcha6ImportSpreadsheetsTests {
}
