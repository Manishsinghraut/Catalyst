package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Set of Expense accrural oriented test cases.
 */
@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/AccountingInfo/ExpenseAccruals/1_Precondition_SetSecurityAccess.feature",
                "target/test-classes/iwms/Contract/AccountingInfo/ExpenseAccruals/AutoSortOnExpenseAccrualsScheduleGridAfterAddingNewItem.feature",
                "target/test-classes/iwms/Contract/AccountingInfo/ExpenseAccruals/GenerateExpenseAccrualUsingCreateWizard.feature",
                "target/test-classes/iwms/Contract/AccountingInfo/ExpenseAccruals/ProcessedAccrualTransactionCannotBeDeleted.feature",
                "target/test-classes/iwms/Contract/AccountingInfo/ExpenseAccruals/SetUpANewExpenseAccrualManualSetup.feature",
                "target/test-classes/iwms/Contract/AccountingInfo/ExpenseAccruals/DeletingAllAccrualsForASpecificTimePeriod.feature",
                "target/test-classes/iwms/Contract/AccountingInfo/ExpenseAccruals/DeletingAllAccrualsForASpecificPostDateAndBatchNumber.feature",
                "target/test-classes/iwms/Contract/AccountingInfo/ExpenseAccruals/PrintableViewExpenseAccruals.feature",
        },
        format = {"json:target/cucumber.json", "html:ExpenseAccruals"}
)
public class ExpenseAccrualsTests {
}
