Feature: Add new Group, Type, Category values to dropdown and verify them in Contract> Payment Info> Recurring Expenses page

  Scenario Outline: Add new Group to dropdown and verify them in Contract> Payment Info> Recurring Expenses page
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
    And I Click the "..." next to the "ExpenseSetup_CodeExpenseGroupID" dropdown
    And I switch to default frame
#    Then I click on the " Add item... "
     #Space is removed from the button name
    Then I click on the "Add item..."
    And I set following fields value on editable page
      | name           | value                      |
      | ShortName      | Selenium Group             |
      | ActualLongName | Selenium Group Description |
    And I click on the "Add" button
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    And I Click the "..." next to the "ExpenseSetup_CodeExpenseGroupID" dropdown
    And I verify the following fields value on editable page
      | name                            | value          |
      | ExpenseSetup_CodeExpenseGroupID | Selenium Group |
    And I switch to default frame

    Examples:
      | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
      | Utilities | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |

  Scenario Outline: Add new Type values to dropdown and verify them in Contract> Payment Info> Recurring Expenses page
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    And I Click the "..." next to the "ExpenseSetup_CodeExpenseTypeID" dropdown
    And I switch to default frame
#    Then I click on the " Add Expense Type Code... "
    #Space is removed from the button name
    Then I click on the "Add Expense Type Code..."
    And I set following fields value on editable page
      | name                     | value                     |
      | ShortName                | Selenium Exense Type      |
      | ActualLongName           | Selenium Type Description |
      | ParentCodeExpenseGroupID | Lease Expense             |
      | APExportBaseNumber       | 150                       |
      | ExpAccrualAcct1Number    | 188                       |
    And I click on the "Add" button
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    And I Click the "..." next to the "ExpenseSetup_CodeExpenseTypeID" dropdown
    And I verify the following fields value on editable page
      | name                           | value                |
      | ExpenseSetup_CodeExpenseTypeID | Selenium Exense Type |
    And I switch to default frame


    Examples:
      | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
      | Utilities | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |

  Scenario Outline: Add new Category values to dropdown and verify them in Contract> Payment Info> Recurring Expenses page
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    And I Click the "..." next to the "ExpenseSetup_CodeExpenseCategoryID" dropdown
    And I switch to default frame
#    Then I click on the " Add item... "
     #Space is removed from the button name
    Then I click on the "Add item..."
    And I set following fields value on editable page
      | name           | value                         |
      | ShortName      | Selenium Category             |
      | ActualLongName | Selenium Category Description |
    And I click on the "Add" button
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    And I verify the following fields value on editable page
      | name                               | value             |
      | ExpenseSetup_CodeExpenseCategoryID | Selenium Category |
    And I switch to default frame

    Examples:
      | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
      | Utilities | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |