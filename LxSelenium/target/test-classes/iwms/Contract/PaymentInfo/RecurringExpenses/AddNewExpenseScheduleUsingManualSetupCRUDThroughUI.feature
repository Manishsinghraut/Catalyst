Feature: I Add new expense schedule using manual setup and verify them in Contract> Payment Info> Recurring Expenses page (Jira Ref.AUTOMATION-560)

  Scenario Outline:  Calculate using Payment Amount
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
    Then I click on " Add Expense Schedule... " grid button
    And I click on the "No" button in message box
    And I switch to default frame
    And I set following fields value on editable page
      | name                                 | value      |
      | ExpenseSchedule_BeginDate            | 01/01/2010 |
      | ExpenseSchedule_EndDate              | 12/31/2015 |
      | ExpenseSchedule_CodeApprovalStatusID | Review     |
    And I Enter "1000" into the "PaymentAmount" field and hit tab
    And I verify the following fields value on editable page
      | name                               | value      |
      | ExpenseSchedule_PaymentAmount      | $1,000.00  |
      | ExpenseSchedule_AnnualAmount       | $12,000.00 |
      | ExpenseSchedule_PaymentRate        | $2.40      |
      | ExpenseSchedule_FirstPaymentAmount | $1,000.00  |
      | ExpenseSchedule_LastPaymentAmount  | $1,000.00  |
    And I click on the "Add" button
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "12/31/2015" under column header "End Date"
#    And I verify grid row "BOGridExpenseSchedule" having unique value "12/31/2015" under column header "End Date"
      | name            | value      |
      | Begin Date      | 01/01/2010 |
      | End Date        | 12/31/2015 |
      | Approval Status | Review     |
      | Payment Amount  | $1,000.00  |
      | Annual Amount   | $12,000.00 |
      | Rate            | $2.40      |
      | First Payment   | $1,000.00  |
      | Last Payment    | $1,000.00  |
#      Header changed from 'Last Payment Amount' to 'Last Payment'
#      Header changed from 'First Payment Amount' to 'First Payment'
#      | First Payment Amount | $1,000.00  |
#      | Last Payment Amount  | $1,000.00  |

    And I switch to default frame

    Examples:
      | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
      | Utilities | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |


  Scenario Outline: Calculate using Annual Amount
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    Then I click on " Add Expense Schedule... " grid button
    And I click on the "No" button in message box
    And I switch to default frame
    And I set following fields value on editable page
      | name                                 | value      |
      | ExpenseSchedule_BeginDate            | 01/01/2016 |
      | ExpenseSchedule_EndDate              | 12/31/2020 |
      | ExpenseSchedule_CodeApprovalStatusID | Review     |
    And I Enter "30000" into the "AnnualAmount" field and hit tab
    And I verify the following fields value on editable page
      | name                               | value      |
      | ExpenseSchedule_PaymentAmount      | $2,500.00  |
      | ExpenseSchedule_AnnualAmount       | $30,000.00 |
      | ExpenseSchedule_PaymentRate        | $6.00      |
      | ExpenseSchedule_FirstPaymentAmount | $2,500.00  |
      | ExpenseSchedule_LastPaymentAmount  | $2,500.00  |
    And I click on the "Add" button
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "12/31/2020" under column header "End Date"
#    And I verify grid row "BOGridExpenseSchedule" having unique value "12/31/2020" under column header "End Date"
      | name            | value      |
      | Begin Date      | 01/01/2016 |
      | End Date        | 12/31/2020 |
      | Approval Status | Review     |
      | Payment Amount  | $2,500.00  |
      | Annual Amount   | $30,000.00 |
      | Rate            | $6.00      |
      | First Payment   | $2,500.00  |
      | Last Payment    | $2,500.00  |
#      Header changed from 'Last Payment Amount' to 'Last Payment'
#      Header changed from 'First Payment Amount' to 'First Payment'
#      | First Payment Amount | $2,500.00  |
#      | Last Payment Amount  | $2,500.00  |
    And I switch to default frame

    Examples:
      | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
      | Utilities | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |

  Scenario Outline:  Calculate using Rate
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    Then I click on " Add Expense Schedule... " grid button
    And I click on the "No" button in message box
    And I switch to default frame
    And I set following fields value on editable page
      | name                                 | value      |
      | ExpenseSchedule_BeginDate            | 01/01/2021 |
      | ExpenseSchedule_EndDate              | 12/31/2025 |
      | ExpenseSchedule_CodeApprovalStatusID | Review     |
    And I Enter "10" into the "PaymentRate" field and hit tab
    And I verify the following fields value on editable page
      | name                               | value      |
      | ExpenseSchedule_PaymentAmount      | $4,166.67  |
      | ExpenseSchedule_AnnualAmount       | $50,000.00 |
      | ExpenseSchedule_PaymentRate        | $10.00     |
      | ExpenseSchedule_FirstPaymentAmount | $4,166.67  |
      | ExpenseSchedule_LastPaymentAmount  | $4,166.67  |
    And I click on the "Add" button
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "12/31/2025" under column header "End Date"
#    And I verify grid row "BOGridExpenseSchedule" having unique value "12/31/2025" under column header "End Date"
      | name            | value      |
      | Begin Date      | 01/01/2021 |
      | End Date        | 12/31/2025 |
      | Approval Status | Review     |
      | Payment Amount  | $4,166.67  |
      | Annual Amount   | $50,000.00 |
      | Rate            | $10.00     |
      | First Payment   | $4,166.67  |
      | Last Payment    | $4,166.67  |
#      Header changed from 'Last Payment Amount' to 'Last Payment'
#      Header changed from 'First Payment Amount' to 'First Payment'
#      | First Payment Amount | $4,166.67  |
#      | Last Payment Amount  | $4,166.67  |
    And I switch to default frame

    Examples:
      | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
      | Utilities | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |

