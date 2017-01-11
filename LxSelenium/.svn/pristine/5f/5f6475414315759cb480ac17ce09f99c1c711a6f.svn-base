Feature: I Adding Expense Schedule selecting Expense Setup Wizard and verify them in Contract> Payment Info> Recurring Expenses page (Jira Ref : AUTOMATION-556)

  Scenario Outline: Calculate by entering payment amount
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
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Type"
    Then I click on " Add Expense Schedule... " grid button
    And I click on the "Yes" button in message box
    And I switch to default frame
    And I set following fields value on editable page
      | name                                          | value      |
      | Contract_PaymentsBeginDate                    | 01/01/2016 |
      | Contract_PaymentsEndDate                      | 12/31/2019 |
      | ExpenseSetup_ExpenseSetupWizard_StartingAmout | 80000      |
      | ExpenseSetupWizard_AmountType                 | period     |
    And I click on the "Generate Expense Schedule" button
    Then I verify a row from grid "BOGridExpenseSchedule" having unique value "12/31/2019" under column header "End Date"
#    And I verify grid row "BOGridExpenseSchedule" having unique value "12/31/2019" under column header "End Date"
      | name            | value       |
      | Begin Date      | 01/01/2016  |
      | End Date        | 12/31/2019  |
      | Approval Status | Review      |
      | Payment Amount  | $80,000.00  |
      | Annual Amount   | $960,000.00 |
      | Rate            | $192.00     |
#      | First Payment Amount | $80,000.00  |
#      | Last Payment Amount  | $80,000.00  |
#      Header changed from 'Last Payment Amount' to 'Last Payment'
#      Header changed from 'First Payment Amount' to 'First Payment'
      | First Payment   | $80,000.00  |
      | Last Payment    | $80,000.00  |
    And I switch to default frame

    Examples:
      | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
      | Base Rent | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |

  Scenario Outline: Calculate by entering annual amount
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Type"
    Then I click on " Add Expense Schedule... " grid button
    And I click on the "Yes" button in message box
    And I switch to default frame
    And I set following fields value on editable page
      | name                                          | value      |
      | Contract_PaymentsBeginDate                    | 01/01/2020 |
      | Contract_PaymentsEndDate                      | 12/31/2024 |
      | ExpenseSetup_ExpenseSetupWizard_StartingAmout | 5000       |
      | ExpenseSetupWizard_AmountType                 | annual     |
    And I click on the "Generate Expense Schedule" button
    Then I verify a row from grid "BOGridExpenseSchedule" having unique value "12/31/2024" under column header "End Date"
#    And I verify grid row "BOGridExpenseSchedule" having unique value "12/31/2024" under column header "End Date"
      | name            | value      |
      | Begin Date      | 01/01/2020 |
      | End Date        | 12/31/2024 |
      | Approval Status | Review     |
      | Payment Amount  | $416.67    |
      | Annual Amount   | $5,000.00  |
      | Rate            | $1.00      |
      | First Payment   | $416.67    |
      | Last Payment    | $416.67    |
#      Header changed from 'Last Payment Amount' to 'Last Payment'
#      Header changed from 'First Payment Amount' to 'First Payment'
#      | First Payment Amount | $416.67    |
#      | Last Payment Amount  | $416.67    |
    And I switch to default frame


    Examples:
      | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
      | Base Rent | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |