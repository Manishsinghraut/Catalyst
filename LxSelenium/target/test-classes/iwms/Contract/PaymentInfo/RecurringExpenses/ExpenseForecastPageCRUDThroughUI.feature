Feature: The list of employers can be very long, so the 'In Use' checkbox was created to narrow down the list. When the checkbox is selected only vendors that have been used in that contract will appear. and verify them in Contract> Payment Info> Recurring Expenses page (Jira Ref. AUTOMATION-555)

  Scenario Outline: I 'In Use' checkbox was created to narrow down the list. When the checkbox is selected only vendors that have been used in that contract will appear. and verify them in Contract> Payment Info> Recurring Expenses page
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
    And I Select Contract Expense Forecast from Page dropdown
    And I switch to visible frame
    And I set following fields value on editable page
      | name     | value         |
      | efShowBy | Calendar Year |
    And I verify "Expense Forecast should be displayed for all expense type in the grid"
      | 2000        |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $128,400.00 |
    And I verify "Expense Forecast should be displayed for all expense type in the grid"
      | 2001        |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $128,400.00 |
    And I verify "Expense Forecast should be displayed for all expense type in the grid"
      | 2002        |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $128,400.00 |

    And I set following fields value on editable page
      | name          | value     |
      | efExpenseType | All Types |
    And I verify "Expense Forecast should be displayed for all expense type in the grid"
      | 2000        |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $128,400.00 |
    And I verify "Expense Forecast should be displayed for all expense type in the grid"
      | 2001        |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $128,400.00 |
    And I verify "Expense Forecast should be displayed for all expense type in the grid"
      | 2002        |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $128,400.00 |

    And I set following fields value on editable page
      | name          | value     |
      | efExpenseType | Base Rent |
    And I verify "Expense Forecast should be displayed for all expense type in the grid"
      | 2000        |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $120,000.00 |
    And I verify "Expense Forecast should be displayed for all expense type in the grid"
      | 2001        |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $120,000.00 |
    And I verify "Expense Forecast should be displayed for all expense type in the grid"
      | 2002        |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $10,000.00  |
      | $120,000.00 |
    And I set following fields value on editable page
      | name          | value       |
      | efShowBy      | Fiscal Year |
      | efExpenseType | All Types   |
    And I verify Fiscal Year Contract Expense Forecast should be displayed for all expense type in the grid
      | 2000        |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $128,400.00 |
    And I verify Fiscal Year Contract Expense Forecast should be displayed for all expense type in the grid
      | 2001        |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $128,400.00 |
    And I verify Fiscal Year Contract Expense Forecast should be displayed for all expense type in the grid
      | 2002        |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $10,700.00  |
      | $128,400.00 |
    And I switch to default frame

  Examples:
    | Second Level Tab | Third Level Tab    | Entity Name       | Grid title                  |
    | Payment Info     | Recurring Expenses | Selenium-Contract | Contract Expense Setup List |