@all
Feature: I update Expense Setup and verify them in  Contract > Payment Info > Recurring Expenses page

  Background:
    Given I Login to IWMS using "EditAccess" access credentials

  Scenario Outline: I update Expense Setup and verify them in  Contract > Payment Info > Recurring Expenses page
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses"
    And I import following file name:
      | Update_ExpenseSetup.xlsx |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select last row from the grid "thisDiv"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/Update_ExpenseSetup.xlsx"
    Then I verify in grid "thisDiv" in row "5" by reading data from spread sheet row "6"
      | name          | value                           |
      | Frequency     | ExpenseSetup.CodeFrequencyID    |
      | Expense Group | ExpenseSetup.CodeExpenseGroupID |
      | Expense Type  | ExpenseSetup.CodeExpenseTypeID  |
    And I click in grid "thisDiv" in row "5" by reading data from spread sheet row "6"
      | name          | value                           |
      | Expense Group | ExpenseSetup.CodeExpenseGroupID |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/Update_ExpenseSetup.xlsx"
    Then I verify in grid "BOGridExpenseVendorAllocation" in row "1" by reading data from spread sheet row "8"
      | name            | value                                     |
      | Vendor          | ExpenseVendorAllocation.VendorID          |
      | Payment Percent | ExpenseVendorAllocation.PaymentPercentage |
    And I verify date values in grid "BOGridExpenseSchedule" in row "1" by reading data from spread sheet row "8"
      | name       | value                             |
      | Begin Date | ExpenseVendorAllocation.BeginDate |
      | End Date   | ExpenseVendorAllocation.EndDate   |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/Update_ExpenseSetup.xlsx"
    Then I compare attribute value on editable page by reading data from spread sheet row "6"
      | name                     | value                    |
      | ExpenseSetup_Description | ExpenseSetup.Description |
    And I verify date values in grid "BOGridExpenseVendorAllocation" in row "1" by reading data from spread sheet row "8"
      | name  | value                    |
      | Notes | ExpenseSetup.Description |
    And I verify date values in grid "BOGridExpenseAllocation" in row "1" by reading data from spread sheet row "9"
      | name       | value                       |
      | Begin Date | ExpenseAllocation.BeginDate |
      | End Date   | ExpenseAllocation.EndDate   |
    Then I verify in grid "BOGridExpenseAllocation" in row "1" by reading data from spread sheet row "9"
      | name                  | value                                  |
      | Allocation Percentage | ExpenseAllocation.AllocationPercentage |
    And I click "edit" link of the row "1" in grid "BOGridExpenseSchedule"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/Update_ExpenseSetup.xlsx"
    And I verify all fields values on editable page comparing with "7" th row of spreadsheet
      | name                        | value                       |
      | ExpenseSchedule_Description | ExpenseSchedule.Description |
    And I logout

  Examples:
    | Item     | Secondary Tab | Third Level Tab    | Entity Name       |
    | Contract | Payment Info  | Recurring Expenses | Selenium-Contract |
