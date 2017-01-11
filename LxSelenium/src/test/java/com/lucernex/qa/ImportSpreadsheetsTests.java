package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of spreadsheet import oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
        "target/test-classes/iwms/Project/Details/CompetitorCreate.feature",
        "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/PercentageVariableRentOffsetCreateUpdate.feature",
        "target/test-classes/iwms/Facility/AssetManagement/Equipment/EquipmentCreateUpdate.feature",
        "target/test-classes/iwms/AdminPage/PortfolioAdministration/ManageComplexCenterDetailsCreateUpdate.feature",
        "target/test-classes/iwms/AdminPage/MemberAdministration/EmployerCreateUpdate.feature",
        "target/test-classes/iwms/Facility/Details/FacilityCreateUpdate.feature",
        "target/test-classes/iwms/AdminPage/CompanyAdministration/ManagePartsCreateUpdate.feature",
        "target/test-classes/iwms/Project/Details/ProjectCreateUpdate.feature",
        "target/test-classes/iwms/CapitalProject/Details/CapitalProjectCreateUpdate.feature",
        "target/test-classes/iwms/Contract/PaymentInfo/Transactions/CheckPaymentUpdate.feature",
        "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/SalesExclusionCreateUpdate.feature",
        "target/test-classes/iwms/Contract/PaymentInfo/Sales/SalesCreate.feature",
        "target/test-classes/iwms/Contract/AbstractInfo/Amendment/AmendmentCreateUpdate.feature",
        "target/test-classes/iwms/Contract/PaymentInfo/Allowances/AllowancesCreateUpdate.feature",
        "target/test-classes/iwms/Contract/AbstractInfo/Responsibilities/ResponsibilitiesCreateUpdate.feature",
        "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/PercentageRentBreakpointCreateUpdate.feature",
        "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/PercentageRentCreateUpdate.feature",
        "target/test-classes/iwms/Contract/AbstractInfo/Covenants/CovenantsCreateUpdate.feature",
        "target/test-classes/iwms/Contract/AbstractInfo/Insurance/InsuranceCreateUpdate.feature",
        "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/RecurringExpensesAdd.feature",
        "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/RecurringExpensesEdit.feature",
        "target/test-classes/iwms/AdminPage/MemberAdministration/ContactsCreateUpdate.feature",
        "target/test-classes/iwms/AdminPage/MemberAdministration/MembersAndContactsCreateUpdate.feature",
        "target/test-classes/iwms/Contract/Details/Summary/ContractCreateUpdate.feature",
        "target/test-classes/iwms/Contract/AbstractInfo/Term/ContractTermsCreateUpdate.feature",
        "target/test-classes/iwms/Facility/SpaceManagement/SpaceManagement/SpaceManagementCreateUpdate.feature",
        "target/test-classes/iwms/Location/Details/Summary/LocationCreateUpdate.feature",
        "target/test-classes/iwms/Parcel/Details/Summary/ParcelCreateUpdate.feature",
        "target/test-classes/iwms/Site/Details/Survey/SiteSurveyUpdate.feature",
        "target/test-classes/iwms/Portfolio/REPlanner/REPlanner/TargetsCreate.feature",
        "target/test-classes/iwms/Portfolio/REPlanner/REPlanner/TargetsCreate.feature",
        "target/test-classes/iwms/Site/Details/Summary/SiteCreateUpdate.feature",
        "target/test-classes/iwms/CapitalProject/Details/Forms/FormsAndCustomListCreateUpdate.feature"
    },
    format = {"json:target/cucumber.json","html:ImportSpreadSheets.html"}
)
public class ImportSpreadsheetsTests {
}
