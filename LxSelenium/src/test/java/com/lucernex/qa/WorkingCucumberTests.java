package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Note: The Cucumber runner will run the specified .feature files in alphabetical
 *       order so make sure you don't have one .feature file that depends on another.
 *       The order the .feature files are listed below is not the order in which
 *       they will execute!
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
//            "target/test-classes/iwms/AdminPage/AdminPageSmokeTest.feature",
//            "target/test-classes/iwms/AdminPage/ManageFirmDictionary/Dictionary.feature",
//            "target/test-classes/iwms/AdminPage/SSL_URL.feature",
//            "target/test-classes/iwms/DataImport/ExcelSpreadsheetImport.feature",
//            "target/test-classes/iwms/Facility/AssetManagement/Equipment/MoveAsset.feature",
//            "target/test-classes/iwms/Login.feature",
//            "target/test-classes/iwms/AdminPage/ManageDefinedFields/AddCodeItem.feature",
//            "target/test-classes/iwms/AdminPage/ManageDefinedFields/ManageFirmDropDowns.feature",
//            "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/PercentageRentOffsetPayments.feature",
//            "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/PercentageRentOffset.feature",
//            "target/test-classes/iwms/Contract/PaymentInfo/Transactions/PassThroughPayment.feature",
//            "target/test-classes/iwms/AdminPage/MemberAdministration/ManageEmployers.feature",
//            "target/test-classes/iwms/AdminPage/MemberAdministration/ManageMembers.feature",
//            "target/test-classes/iwms/AdminPage/MemberAdministration/ManageFolderTemplates.feature",
//            //Import Spreadsheets
//            "target/test-classes/iwms/Project/Details/CompetitorCreate.feature",
//            "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/PercentageVariableRentOffsetCreateUpdate.feature",
//            "target/test-classes/iwms/Facility/AssetManagement/Equipment/EquipmentCreateUpdate.feature",
//            "target/test-classes/iwms/AdminPage/PortfolioAdministration/ManageComplexCenterDetailsCreateUpdate.feature",
//            "target/test-classes/iwms/AdminPage/MemberAdministration/EmployerCreateUpdate.feature",
//            "target/test-classes/iwms/Facility/Details/FacilityCreateUpdate.feature",
//            "target/test-classes/iwms/AdminPage/CompanyAdministration/ManagePartsCreateUpdate.feature",
//            "target/test-classes/iwms/Project/Details/ProjectCreateUpdate.feature",
//            "target/test-classes/iwms/CapitalProject/Details/CapitalProjectCreateUpdate.feature",
//            "target/test-classes/iwms/Contract/PaymentInfo/Transactions/CheckPaymentUpdate.feature",
//            "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/SalesExclusionCreateUpdate.feature",
//            "target/test-classes/iwms/Contract/PaymentInfo/Sales/SalesCreate.feature",
//            "target/test-classes/iwms/Contract/AbstractInfo/Amendment/AmendmentCreateUpdate.feature",
//            "target/test-classes/iwms/Contract/PaymentInfo/Allowances/AllowancesCreateUpdate.feature",
//            "target/test-classes/iwms/Contract/AbstractInfo/Responsibilities/ResponsibilitiesCreateUpdate.feature",
//            "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/PercentageRentBreakpointCreateUpdate.feature",
//            "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/PercentageRentCreateUpdate.feature",
//            "target/test-classes/iwms/Contract/AbstractInfo/Covenants/CovenantsCreateUpdate.feature",
//            "target/test-classes/iwms/Contract/AbstractInfo/Insurance/InsuranceCreateUpdate.feature",
//            "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/RecurringExpensesAdd.feature",
//            "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/RecurringExpensesEdit.feature",
//            "target/test-classes/iwms/AdminPage/MemberAdministration/ContactsCreateUpdate.feature",
//            "target/test-classes/iwms/AdminPage/MemberAdministration/MembersAndContactsCreateUpdate.feature",
//            "target/test-classes/iwms/Contract/Details/Summary/ContractCreateUpdate.feature",
//            "target/test-classes/iwms/Contract/AbstractInfo/Term/ContractTermsCreateUpdate.feature",
//            "target/test-classes/iwms/Facility/SpaceManagement/SpaceManagement/SpaceManagementCreateUpdate.feature",
//            "target/test-classes/iwms/Location/Details/Summary/LocationCreateUpdate.feature",
//            "target/test-classes/iwms/Parcel/Details/Summary/ParcelCreateUpdate.feature",
//            "target/test-classes/iwms/Site/Details/Survey/SiteSurveyUpdate.feature",
//            "target/test-classes/iwms/Portfolio/REPlanner/REPlanner/TargetsCreate.feature",
//            "target/test-classes/iwms/Portfolio/REPlanner/REPlanner/TargetsCreate.feature",
//            "target/test-classes/iwms/Site/Details/Summary/SiteCreateUpdate.feature",
//            "target/test-classes/iwms/CapitalProject/Details/Forms/FormsAndCustomListCreateUpdate.feature",
//            //Org Chart
//            "target/test-classes/iwms/Portfolio/OrgChart/1A_AddParentRegion.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1B_AddSubRegion.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1C_AddMarketToSubRegion.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1D_OrgChartDisplay.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1E_DeleteMarketAddedToSubRegion.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1F_AddMarketToParentRegion.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1G_DeleteMarketAddedToParentRegion.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1H_EditSubRegion.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1I_DeleteSubRegion.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1J_MigrateOrgChartToReferenceAndRestore.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1K_MigrateOrgChartToRestoreOriginal.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1L_MigratingOrgChartDifferentRegionsNegativeTest.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1M_MigratingOrgChartCreatenewRegionsuponMigration.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1N_EditParentRegion.feature",
//            "target/test-classes/iwms/Portfolio/OrgChart/1O_DeleteParentRegion.feature",
//            //Create Entities
//            "target/test-classes/iwms/SetupWizards/1A_CreatePortfolio.feature",
//            "target/test-classes/iwms/SetupWizards/1B_CreatePrototype.feature",
//            "target/test-classes/iwms/SetupWizards/1C_CreateSite.feature",
//            "target/test-classes/iwms/SetupWizards/1D_CreateFacility.feature",
//            "target/test-classes/iwms/SetupWizards/1E_CreateLocation.feature",
//            "target/test-classes/iwms/SetupWizards/1F_CreateParcel.feature",
//            "target/test-classes/iwms/SetupWizards/1G_CreateContract.feature",
//            "target/test-classes/iwms/SetupWizards/1H_CreateProject.feature",
//            "target/test-classes/iwms/SetupWizards/1I_CreateCapitalProgram.feature",
//            "target/test-classes/iwms/SetupWizards/1J_ConvertCaptialProgram.feature",
//            "target/test-classes/iwms/SetupWizards/1K_ConvertSitetoProject.feature",
//            "target/test-classes/iwms/SetupWizards/1L_ImportFacilityWhenCreateCapitalProject.feature",
//
//            "target/test-classes/iwms/AdminPage/ManageScheduleTemplates/ManageScheduleTemplates.feature",
//
//            //ManageForms
//            "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageForms/AddFormLayout.feature",
//            "target/test-classes/iwms/Project/Details/Forms/1A_AddFormToEntity.feature",
//            "target/test-classes/iwms/Project/Details/Forms/1B_ViewForm.feature",
//            "target/test-classes/iwms/Project/Details/Forms/1C_CheckOutForm.feature",
//            //"target/test-classes/iwms/Project/Details/Forms/1D_CloseForm.feature",
//            //"target/test-classes/iwms/Project/Details/Forms/1E_ReOpenForm.feature",
//            "target/test-classes/iwms/Project/Details/Forms/1F_PrintableViewForm.feature",
//            "target/test-classes/iwms/Project/Details/Forms/1G_ReplyToForm.feature",
//
//            //Manage Page Layout
//            "target/test-classes/iwms/AdminPage/CompanyAdministration/ManagePageLayouts/1A_AddPageLayout.feature",
//            "target/test-classes/iwms/AdminPage/CompanyAdministration/ManagePageLayouts/1C_DeletePageLayout.feature",
//            "target/test-classes/iwms/AdminPage/CompanyAdministration/ManagePageLayouts/1C_DeleteSubPageLayout.feature"
        },
        format = {"json:target/cucumber.json"})
public class WorkingCucumberTests {
}
