package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
    features = {
//        "target/test-classes/iwms/Contract/AbstractInfo/Responsibilities/ResponsibilitiesCRUDThroughUI.feature",
        "target/test-classes/iwms/Contract/AbstractInfo/Term/ContractTermsCRUDThroughUI.feature",
//        "target/test-classes/iwms/Contract/PaymentInfo/AlternateRent/AlternateRentCRUDThroughUI.feature",
//        "target/test-classes/iwms/Contract/PaymentInfo/Allowances/AllowancesCRUDThroughUI.feature",
        "target/test-classes/iwms/Contract/Details/Summary/RentableAreaUpdateThroughUI.feature",
//        "target/test-classes/iwms/Contract/PaymentInfo/Sales/SalesCreateAndSortThroughUI.feature",
        "target/test-classes/iwms/Contract/AccountingInfo/AccrualTransactions/AccrualTransactionCRUDThroughUI.feature",
        "target/test-classes/iwms/Contract/AbstractInfo/KeyDates/ContractKeyDatesCreateUpdateDeleteThroughUI.feature",
        "target/test-classes/iwms/Contract/AbstractInfo/Amendment/ContractAmendmentCreateUpdateDeleteThroughUI.feature"
//        "target/test-classes/iwms/Contract/AbstractInfo/Insurance/ContractInsuranceCreateUpdateDeleteThroughUI.feature",
//        "target/test-classes/iwms/Contract/PaymentInfo/SecurityDeposit/ContractSecurityDepositCreateUpdateDeleteThroughUI.feature",
//        "target/test-classes/iwms/Contract/PaymentInfo/RecurringExpenses/RecurringExpensesCRUDThroughUI.feature",
//        "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/ContractRecoveriesCreateUpdateDeleteThroughUI.feature",
//        "target/test-classes/iwms/Contract/PaymentInfo/PercentageRent/ContractPercentageRentCreateUpdateDeleteThroughUI.feature",
//        "target/test-classes/iwms/Contract/AccountingInfo/ContractExpenseAccrualsCreateUpdateDeleteThroughUI.feature",
//        "target/test-classes/iwms/Contract/AbstractInfo/CoTenancy/ContractCoTenancyCreateUpdateDeleteThroughUI.feature",
//        "target/test-classes/iwms/Contract/PaymentInfo/Transactions/TransactionsCRUDThroughUI.feature",
//        "target/test-classes/iwms/Contract/AbstractInfo/Covenants/ContractCovenantsThroughUI.feature",

       /* //Custom list
        "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageCustomLists/AddCustomListToFormLayout.feature",
        "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageCustomLists/DeleteCustomList.feature",
        "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageCustomLists/CreateCustomList.feature",
        "target/test-classes/iwms/AdminPage/CompanyAdministration/ManageCustomLists/AddLineItems.feature",
        //"target/test-classes/iwms/AdminPage/CompanyAdministration/ManageDataFields/ManageDataFields.feature",
        "target/test-classes/iwms/Project/Details/Forms/UploadCustomListValues.feature"*/
    },
    format = {"json:target/cucumber.json","html:Batchb4AllContractPages"}
)
public class Batchb4AllContractPagesTests {
}
