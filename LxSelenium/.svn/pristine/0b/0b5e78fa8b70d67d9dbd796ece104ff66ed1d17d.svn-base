package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of spreadsheet import oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/ExpenseSetupSpreadsheetCreateUpdate.feature",
                "target/test-classes/iwms/AdminPage/MemberAdministration/ContactsCreateUpdate.feature",
                "target/test-classes/iwms/AdminPage/MemberAdministration/MembersAndContactsCreateUpdate.feature",
                "target/test-classes/iwms/Contract/Details/Summary/ContractSpreadsheetCreateUpdate.feature",
                "target/test-classes/iwms/Contract/AbstractInfo/Term/ContractTermsSpreadsheetCreateUpdate.feature",
                "target/test-classes/iwms/Facility/SpaceManagement/SpaceManagement/SpaceManagementSpreadsheetCreateUpdate.feature",
                "target/test-classes/iwms/Location/Details/Summary/LocationSpreadsheetCreateUpdate.feature"
        },
        format = {"json:target/cucumber.json", "html:Batch8ImportSpreadSheets"}
)
public class Batcha8ImportSpreadsheetsTests {
}
