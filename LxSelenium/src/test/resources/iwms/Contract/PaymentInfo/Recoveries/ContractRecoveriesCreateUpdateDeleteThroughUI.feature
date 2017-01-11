@all @smoke @smoke3
Feature: I create,update and delete contract Recoveries and verify them in Contract> Abstract Info> Recoveries page

  Scenario Outline: I create contract Recoveries through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Add item" action panel button
    Then I verify page title "<Grid title>" after navigation
    And I set following fields value on editable page
      | name                                          | value              |
      | ExpenseRecovery_CodeRecoveryGroupID           | CAM                |
      | ExpenseRecovery_CodeRecoveryTypeID            | Interior           |
      | ExpenseRecovery_BeginDate                     | 05/15/2015         |
      | ExpenseRecovery_EndDate                       | 05/31/2016         |
      | ExpenseRecovery_CodeApprovalStatusID          | Review             |
      | ExpenseRecovery_CodeExpenseGroupID            | CAM                |
      | ExpenseRecovery_CodeExpenseTypeID             | Interior           |
      | ExpenseRecovery_CodePaymentFrequencyID        | Monthly            |
      | ExpenseRecovery_CodeReconciliationFrequencyID | Annually           |
      | ExpenseRecovery_ReconciledFlag                | true               |
      | ExpenseRecovery_CodeCalculationMethodID       | Passthrough        |
      | ExpenseRecovery_CodeEscalationPaymentMethodID | Check              |
      | ExpenseRecovery_RecoveryPeriodDaysNoZeroDef   | 365                |
      #      | ExpenseRecovery_CodeProRataShareMethodID      |                 |
      #      | ExpenseRecovery_BaseYear                     | 2016               |
      | ExpenseRecovery_BaseYearAmount                | 40000              |
      | ExpenseRecovery_RecoveryPeriod                | 12                 |
      | ExpenseRecovery_RecoveryExclusions            | Selenium Test Note |
      | ExpenseRecovery_ReportedGLA                   | 2000               |
      | ExpenseRecovery_ApprovedGLA                   | 2000               |
      | ExpenseRecovery_BudgetedGLA                   | 2000               |
      | ExpenseRecovery_ReportedRentableArea          | 10000              |
      | ExpenseRecovery_ApprovedRentableArea          | 10000              |
      | ExpenseRecovery_BudgetedRentableArea          | 10000              |
      | ExpenseRecovery_ReportedProRataShareRate      | 100                |
      | ExpenseRecovery_ApprovedProRataShareRate      | 100                |
      | ExpenseRecovery_BudgetedProRataShareRate      | 100                |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
#    And I click on the "Yes" button in message box
    And I click on the "<Third Level Tab>" tab
#    And I verify row from grid "<Grid ID>" having unique value "<Field>"
#      | name            | value      |
#      | Recovery Group  | CAM        |
#      | Recovery Type   | Interior   |
#      | Begin Date      | 05/15/2015 |
#      | End Date        | 05/31/2016 |
#      | Recovery Period | 12         |
#      | Reported Amount | 2000       |
#      | Percent Change  | 100        |
#      | Approved Amount | 2000       |
#      | Pre-Paid Amount | 2000       |
#      | Amount Due      |            |
    And I logout

    Examples:
      | Field      | Second Level Tab | Third Level Tab | Entity Name       | Grid title                     | Grid ID |
      | 05/15/2015 | Payment Info     | Recoveries      | Selenium-Contract | Contract Expense Recovery List | thisDiv |

  Scenario Outline: I update contract Recoveries through UI
    Given I Login to IWMS using "EditAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "2" from grid "id" "<Grid ID>"
    And I set following fields value on editable page
      | name                               | value                     |
      | ExpenseRecovery_BaseYearAmount     | 50000                     |
      | ExpenseRecovery_RecoveryExclusions | Update Selenium Test Note |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "2" from grid "id" "<Grid ID>"
    And I click on the Grouped Expenses Reported value link
    And I switch to default frame
    And I click on the "Add Expense Recovery Item..." button
    And I set following fields value on editable page
      | name                                               | value    |
      | ExpenseRecoveryItem_CodeRecoveryItemGroupID        | Lobby    |
      | ExpenseRecoveryItem_CodeRecoveryItemTypeID         | Cleaning |
      | ExpenseRecoveryItem_CodeApprovalStatusID           | Approved |
      | ExpenseRecoveryItem_ApprovedAdminFeePrcntNoZeroDef | 1000     |
      | ExpenseRecoveryItem_ReportedAmount                 | 10000    |
      | ExpenseRecoveryItem_BudgetedAmount                 | 1000     |
      | ExpenseRecoveryItem_ApprovedAmount                 | 10000    |
    And I click on the "Add" button
    And I click on the "Finish" button
    And I set following fields value on editable page
      | name                                     | value |
      | ExpenseRecovery_ReportedGLA              | 4000  |
      | ExpenseRecovery_ApprovedGLA              | 4000  |
      | ExpenseRecovery_BudgetedGLA              | 4000  |
      | ExpenseRecovery_ReportedRentableArea     | 20000 |
      | ExpenseRecovery_ApprovedRentableArea     | 20000 |
      | ExpenseRecovery_BudgetedRentableArea     | 20000 |
      | ExpenseRecovery_ReportedProRataShareRate | 200   |
      | ExpenseRecovery_ApprovedProRataShareRate | 200   |
      | ExpenseRecovery_BudgetedProRataShareRate | 200   |
    And I switch to default frame
    And I logout

    Examples:
      | Field      | Second Level Tab | Third Level Tab | Entity Name       | Grid title                     | Grid ID |
      | 05/15/2015 | Payment Info     | Recoveries      | Selenium-Contract | Contract Expense Recovery List | thisDiv |

  Scenario Outline: I Delete contract Recoveries through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "2" from grid "id" "<Grid ID>"
    And I switch to default frame
    #And I click on the "Delete item" action panel button
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    Then I verify row from grid "<Grid ID>" having unique value "<Field>" not present

    Examples:
      | Field      | Second Level Tab | Third Level Tab | Entity Name       | Grid title                     | Grid ID |
      | 05/15/2015 | Payment Info     | Recoveries      | Selenium-Contract | Contract Expense Recovery List | thisDiv |
