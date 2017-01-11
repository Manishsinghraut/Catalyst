@all
Feature: Adding Grouped line items and Additional Expenses line items (Controllable and Non Controllable Expenses)(Jira Ref : AUTOMATION-720)

  Scenario Outline: I import file for Recoveries Contract entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following file name:
#      | RecoveriesContractSetup.xml |
      | RecoveriesContractSetup-720.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I create contract Recoveries through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "CAM" under column header "Recovery Group"
#    And I set following fields value on editable page
#      | name                                          | value       |
#      | ExpenseRecovery_CodeRecoveryGroupID           | CAM         |
#      | ExpenseRecovery_CodeRecoveryTypeID            | Interior    |
#      | ExpenseRecovery_BeginDate                     | 01/01/2014  |
#      | ExpenseRecovery_EndDate                       | 12/31/2014  |
#      | ExpenseRecovery_CodeApprovalStatusID          | Review      |
#      | ExpenseRecovery_CodeExpenseGroupID            | Lease       |
#      | ExpenseRecovery_CodeExpenseTypeID             | CAM         |
#      | ExpenseRecovery_CodeCalculationMethodID       | Passthrough |
#      | ExpenseRecovery_CodeEscalationPaymentMethodID | Check       |
#      | ExpenseRecovery_CodeExpRecBasedOnID           | Actual      |
#      | ExpenseRecovery_RecoveryPeriodDaysNoZeroDef   | 365         |
#      | ExpenseRecovery_BaseYear                      | 2014        |
#      | ExpenseRecovery_RecoveryPeriod                | 12          |
#      | ExpenseRecovery_ReportedAdminFeePercentage    | 15          |
#      | ExpenseRecovery_ApprovedAdminFeePercentage    | 15          |
#      | ExpenseRecovery_ReportedGLA                   | 1500        |
#      | ExpenseRecovery_ApprovedGLA                   | 1500        |
#      | ExpenseRecovery_BudgetedGLA                   |             |
#      | ExpenseRecovery_ReportedRentableArea          | 5000        |
#      | ExpenseRecovery_ApprovedRentableArea          | 5000        |
#      | ExpenseRecovery_BudgetedRentableArea          | 0           |
#      | ExpenseRecovery_ReportedProRataShareRate      | 33          |
#      | ExpenseRecovery_ApprovedProRataShareRate      | 33          |
#      | ExpenseRecovery_BudgetedProRataShareRate      | 0           |
#    And I switch to default frame
#    And I click on the "Save Changes" action panel button
    And I Scroll down and click on the Grouped Expenses	-Reported
    And I switch to default frame
#    And I click on the "Add Expense Recovery Item..." button
#    And I set following fields value on editable page
#      | name                                               | value    |
#      | ExpenseRecoveryItem_CodeRecoveryItemGroupID        | Exterior    |
#      | ExpenseRecoveryItem_CodeRecoveryItemTypeID         | Landscape |
#      | ExpenseRecoveryItem_CodeApprovalStatusID           | Review |
#      | ExpenseRecoveryItem_ApprovedAdminFeePrcntNoZeroDef | 1000     |
#      | ExpenseRecoveryItem_ReportedAmount                 | 55000    |
#      | ExpenseRecoveryItem_BudgetedAmount                 | 1000     |
#      | ExpenseRecoveryItem_ApprovedAmount                 | 10000    |
#    And I click on the "Add" button
    And I click on the "Finish" button
    And I Scroll down and click on the Additional Expenses- Reported
    And I switch to default frame
#    And I click on the "Finish" button


    Examples:
      | Entity Name             | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
      | Recoveries Contract-720 | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |


  Scenario Outline: I create contract Recoveries through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "CAM" under column header "Recovery Group"
    And I set following fields value on editable page
      | name                                       | value |
      | ExpenseRecovery_ReportedAdminFeePercentage |       |
      | ExpenseRecovery_ReportedAdminFeePercentage | 15    |
    And I click row from grid "<Grid ID>" having unique value "CAM" under column header "Recovery Group"
    And I verify the subtotal "$258,750.00" will be recalculate based on the "15%" of admin fee under reported
#    And I switch to default frame
    And I click on the "Save Changes" action panel button

    Examples:
      | Entity Name             | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
#      | Recoveries Contract | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |
      | Recoveries Contract-720 | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |