Feature: I Add new expense schedule with escalation via expense setup wizard and verify them in Contract> Payment Info> Recurring Expenses page (Jira Ref. AUTOMATION-559)

  Scenario Outline: Calculate by entering payment amount with Lump Sum escalation
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
      | name                                             | value      |
      | Contract_PaymentsBeginDate                       | 01/01/2025 |
      | Contract_PaymentsEndDate                         | 12/31/2030 |
      | ExpenseSetup_ExpenseSetupWizard_TypeOfEscalation | Lump Sum   |
      | ExpenseSetup_ExpenseSetupWizard_StartingAmout    | 4000       |
      | ExpenseSetupWizard_AmountType                    | period     |
    And I click on the "Generate Expense Schedule" button
    And I verify grid row "BOGridExpenseSchedule" having unique value "12/31/2030" under column header "End Date"
      | name            | value      |
      | Begin Date      | 01/01/2025 |
      | End Date        | 12/31/2030 |
      | Approval Status | Review     |
      | Payment Amount  | $4,000.00  |
      | Annual Amount   | $16,000.00 |
      | Rate            | $3.20      |
      | First Payment   | $4,000.00  |
      | Last Payment    | $4,000.00  |
#      Header changed from 'Last Payment Amount' to 'Last Payment'
#      Header changed from 'First Payment Amount' to 'First Payment'
#      | First Payment Amount | $4,000.00  |
#      | Last Payment Amount  | $4,000.00  |
    And I switch to default frame

    Examples:
      | Field    | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
      | Interior | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |

  Scenario Outline: Calculate by entering payment amount with None escalation
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
      | name                                             | value      |
      | Contract_PaymentsBeginDate                       | 01/01/2028 |
      | Contract_PaymentsEndDate                         | 12/31/2029 |
      | ExpenseSetup_ExpenseSetupWizard_TypeOfEscalation | None       |
      | ExpenseSetup_ExpenseSetupWizard_StartingAmout    | 1000       |
      | ExpenseSetupWizard_AmountType                    | period     |
    And I click on the "Generate Expense Schedule" button
    And I verify grid row "BOGridExpenseSchedule" having unique value "12/31/2029" under column header "End Date"
      | name            | value      |
      | Begin Date      | 01/01/2028 |
      | End Date        | 12/31/2029 |
      | Approval Status | Review     |
      | Payment Amount  | $1,000.00  |
      | Annual Amount   | $4,000.00  |
      | Rate            | $0.80      |
#      | First Payment Amount | $1,000.00  |
#      | Last Payment Amount  | $1,000.00  |
#      Header changed from 'Last Payment Amount' to 'Last Payment'
#      Header changed from 'First Payment Amount' to 'First Payment'
      | First Payment   | $1,000.00  |
      | Last Payment    | $1,000.00  |
    And I switch to default frame

    Examples:
      | Field    | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
      | Interior | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |

  Scenario Outline: Calculate by entering payment amount with Percent escalation
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
      | name                                             | value      |
      | Contract_PaymentsBeginDate                       | 01/01/2011 |
      | Contract_PaymentsEndDate                         | 12/31/2015 |
      | ExpenseSetup_ExpenseSetupWizard_TypeOfEscalation | Percent    |
      | ExpenseSetup_ExpenseSetupWizard_StartingAmout    | 2000       |
      | ExpenseSetupWizard_AmountType                    | period     |
    And I click on the "Generate Expense Schedule" button
    And I verify grid row "BOGridExpenseSchedule" having unique value "12/31/2015" under column header "End Date"
      | name            | value      |
      | Begin Date      | 01/01/2011 |
      | End Date        | 12/31/2015 |
      | Approval Status | Review     |
      | Payment Amount  | $2,000.00  |
      | Annual Amount   | $8,000.00  |
      | Rate            | $1.60      |
#      | First Payment Amount | $2,000.00  |
#      | Last Payment Amount  | $2,000.00  |
#      Header changed from 'Last Payment Amount' to 'Last Payment'
#      Header changed from 'First Payment Amount' to 'First Payment'
      | First Payment   | $2,000.00  |
      | Last Payment    | $2,000.00  |
    And I switch to default frame

    Examples:
      | Field    | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
      | Interior | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |