package com.lucernex.qa;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0097 on 8/26/2015.
 */

@RunWith(Cucumber.class)
@Cucumber.Options(
        features = {
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/AddingGroupedLineItemsAndAdditionalExpensesLineItemsControllableAndNonControllableExpenses.feature",
                //It is integrated in AddingGroupedLineItemsAndAdditionalExpensesLineItemsControllableAndNonControllableExpenses feature file
                // /"target/test-classes/iwms/Contract/PaymentInfo/Recoveries/AddingLineItemForAdminFee.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/AddingPrePaidAmountValuesAndCheckingTheFilters.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/AddingProRataShareInfo.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/AddingPositiveAndNegativeAdjustments.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/ReconcileCannotReconcileMoreThanOneTime.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/EnteringGroupCAPCapPercentAndCapAmountValues.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/NegativeTestingWhenApprovedRevisedAmountDueis0.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/NegativeTestingWhenApprovedRevisedAmountDueIs0.feature",
                "target/test-classes/iwms/Contract/PaymentInfo/Recoveries/RecoveriesValidatePrepaidAmountPopupWhenExpenseGroupTypeAreEmpty.feature"
        },
        format = {"json:target/cucumber.json","html:Batch1ContractRecoveriesTests"}
)
public class Batch1ContractRecoveriesTests {
}
