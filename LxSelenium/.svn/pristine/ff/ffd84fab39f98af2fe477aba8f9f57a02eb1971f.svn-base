Feature: Add Multiple Expense Allocations and verify them in Contract> Payment Info> Recurring Expenses page (Jira Ref : AUTOMATION-556)

  Scenario Outline: Add Multiple Expense Allocations and verify them in Contract> Payment Info> Recurring Expenses page
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses"
    And I import following file name:
      | RecurringExpenseContract.xml |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    Then I click on "Add Expense Allocation..." grid button
    And I switch to default frame
    And I set following fields value on editable page
      | name                                   | value                       |
      | ExpenseAllocation_BeginDate            | 01/01/2000                  |
      | ExpenseAllocation_EndDate              | 12/31/2010                  |
      | ExpenseAllocation_AllocationPercentage | 100                         |
      | ExpenseAllocation_OrganizationID       | Selenium-Organization       |
      | ExpenseAllocation_Notes                | Selenium-Organization Notes |
    And I click on the "Add" button
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    Then I click on "Add Expense Allocation..." grid button
    And I switch to default frame
    And I set following fields value on editable page
      | name                                   | value                       |
      | ExpenseAllocation_BeginDate            | 01/01/2010                  |
      | ExpenseAllocation_EndDate              | 12/31/2020                  |
      | ExpenseAllocation_AllocationPercentage | 50                          |
      | ExpenseAllocation_OrganizationID       | Selenium-Organization       |
      | ExpenseAllocation_Notes                | Selenium-Organization Notes |
    And I click on the "Add" button
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    Then I click on "Add Expense Allocation..." grid button
    And I switch to default frame
    And I set following fields value on editable page
      | name                                   | value                       |
      | ExpenseAllocation_BeginDate            | 01/01/2020                  |
      | ExpenseAllocation_EndDate              | 12/31/2036                  |
      | ExpenseAllocation_AllocationPercentage | 50                          |
      | ExpenseAllocation_OrganizationID       | Selenium-Organization       |
      | ExpenseAllocation_Notes                | Selenium-Organization Notes |
    And I click on the "Add" button

  Examples:
    | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
    | Utilities | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |


  Scenario Outline: Add Multiple Expense Allocations and verify them in Contract> Payment Info> Recurring Expenses page
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    Then I click on "Add Expense Allocation..." grid button
    And I switch to default frame
    And I set following fields value on editable page
      | name                                   | value                       |
      | ExpenseAllocation_BeginDate            | 01/01/2000                  |
      | ExpenseAllocation_EndDate              | 12/31/2010                  |
      | ExpenseAllocation_AllocationPercentage | 100                         |
      | ExpenseAllocation_OrganizationID       | Selenium-Organization       |
      | ExpenseAllocation_Notes                | Selenium-Organization Notes |
    And I Click Search Icon in Organization Field
    And I verify Pop-up organization field should display the correct information
      | name     | value                 |
      | Group    | Internal              |
      | Type     | Corporate             |
      | Category | Internal              |
      | Name     | Selenium-Organization |
      |          | Acct Code #1          |
      |          | Acct Code #2          |
      |          | Acct Code #3          |
      |          | Acct Code #4          |
      |          | Acct Code #5          |
      |          | Acct Code #6          |
      |          | Acct Code #7          |
      |          | Acct Code #8          |
    And I click on the "Close"
    And I Click the "..." next to the "ExpenseAllocation_OrganizationID" dropdown
    And I click on the "Close"

  Examples:
    | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
    | Utilities | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |