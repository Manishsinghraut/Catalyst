@all @smoke @smoke2
Feature: I create,update and delete contract expense accruals and verify them in Contract> Abstract Info> expense accruals page (Jira Ref:AUTOMATION-516)

  Scenario Outline: I create contract expense accruals through UI
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
      | name                                       | value                     |
      | ExpenseAccrualSetup_CodeExpenseGroupID     | Lease Expense             |
      | ExpenseAccrualSetup_CodeExpenseTypeID      | Percentage Rent           |
      | ExpenseAccrualSetup_CodeAccrualTypeID      | Accrual                   |
      | ExpenseAccrualSetup_CodeExpenseCategoryID  | Expense                   |
      | ExpenseAccrualSetup_Description            | Selenium Test Description |
      | ExpenseAccrualSetup_CodeCurrencyTypeID     | USD                       |
      | ExpenseAccrualSetup_RentableArea           | 10000                     |
      | ExpenseAccrualSetup_CodeBuildingAreaUnitID | Square Feet               |
      | ExpenseAccrualSetup_AccrualMessage         | Selenium Accrual Message  |
      | ExpenseAccrualSetup_Notes                  | Selenium Test Note        |

    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I verify row from grid "<Grid ID>" having unique value "<Field>"
      | name                   | value           |
      | Group                  | Lease Expense   |
      | Type                   | Percentage Rent |
      | Category               | Expense         |
      | Record Type            |                 |
      | Begin Period           |                 |
      | End Period             |                 |
      | Current Period Expense |                 |
      | Current Annual Expense |                 |
    And I click on the " Add Expense Accrual Schedule... "
    And I switch to default frame
    And I set following fields value on editable page
      | name                                      | value                                 |
      | ExpenseAccrualSchedule_BeginPeriod        | 1                                     |
      | ExpenseAccrualSchedule_BeginYear          | 2015                                  |
      | ExpenseAccrualSchedule_EndPeriod          | 1                                     |
      | ExpenseAccrualSchedule_EndYear            | 2015                                  |
      | ExpenseAccrualSchedule_AnnualAmount       | 80000                                 |
      | ExpenseAccrualSchedule_PeriodAmount       | 6666                                  |
      | ExpenseAccrualSchedule_AccrualRate        | 16000                                 |
      | ExpenseAccrualSchedule_FirstPaymentAmount | 6666                                  |
      | ExpenseAccrualSchedule_LastPaymentAmount  | 6666                                  |
      | ExpenseAccrualSchedule_Notes              | Selenium Add Expense Accrual Schedule |
    And I click on the "Add" button
    And I click on the "Save Changes" action panel button
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "0" from grid "id" "<Grid ID>"
#    And I click "edit" link of the row "1" in grid "BOGridExpenseAccrualSchedule"
    And I click "edit" link of the row "1" in grid "BOGridExpenseAccrualSchedule"
    And I set following fields value on editable page
      | name                                | value |
      | ExpenseAccrualSchedule_AnnualAmount | 70000 |
    And I click on the "Update" button
    And I click "delete" link of the row "1" in grid "BOGridExpenseAccrualSchedule"
    And I click on the "Yes" button
    And I logout

  Examples:
    | Field         | Second Level Tab | Third Level Tab  | Entity Name       | Grid title            | Grid ID |
    | Lease Expense | Accounting Info  | Expense Accruals | Selenium-Contract | Expense Accruals List | thisDiv |

  Scenario Outline: I update contract expense accruals through UI
    Given I Login to IWMS using "EditAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "0" from grid "id" "<Grid ID>"
    And I set following fields value on editable page
      | name                                | value |
      | ExpenseAccrualSchedule_AnnualAmount | 90000 |
#    And I click on the "Update" button
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I logout

  Examples:
    | Field         | Second Level Tab | Third Level Tab  | Entity Name       | Grid title            | Grid ID |
    | Lease Expense | Accounting Info  | Expense Accruals | Selenium-Contract | Expense Accruals List | thisDiv |

  Scenario Outline: I Delete contract expense accruals through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "0" from grid "id" "<Grid ID>"
    And I switch to default frame
#    And I click on the "Delete item" action panel button
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    Then I verify row from grid "<Grid ID>" having unique value "<Field>" not present
    And I logout

  Examples:
    | Field         | Second Level Tab | Third Level Tab  | Entity Name       | Grid title            | Grid ID | Field         |
    | Lease Expense | Accounting Info  | Expense Accruals | Selenium-Contract | Expense Accruals List | thisDiv | Lease Expense |
