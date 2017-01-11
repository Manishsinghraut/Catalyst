Feature: Create Expense Schedule Negative testing and verify them in Contract> Payment Info> Recurring Expenses page (Jira ref. AUTOMATION-562)

  Scenario Outline: Create Expense Schedule Negative testing on yes pop window
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
      | name                                          | value |
      | Contract_PaymentsBeginDate                    |       |
      | Contract_PaymentsEndDate                      |       |
      | ExpenseSetup_ExpenseSetupWizard_StartingAmout |       |
    And I click on the "Generate Expense Schedule" button
    Then I see the error message "Start Date must be specified" in the Lx Modal Window
    Then I see the error message "End Date must be specified" in the Lx Modal Window
    Then I see the error message "Starting Amount must be specified" in the Lx Modal Window

  Examples:
    | Field    | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
    | Interior | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |


  Scenario Outline: Create Expense Schedule Negative testing on yes pop window
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
    And I click on the "No" button in message box
    And I switch to default frame
    And I set following fields value on editable page
      | name                               | value |
      | ExpenseSchedule_BeginDate          |       |
      | ExpenseSchedule_EndDate            |       |
      | ExpenseSchedule_PaymentAmount      |       |
      | ExpenseSchedule_AnnualAmount       |       |
      | ExpenseSchedule_PaymentRate        |       |
      | ExpenseSchedule_FirstPaymentAmount |       |
      | ExpenseSchedule_LastPaymentAmount  |       |
    And I click on the "Add" button
    Then I see the error message "Annual Amount must be specified" in the Lx Modal Window
    Then I see the error message "Payment Amount must be specified" in the Lx Modal Window
    Then I see the error message "Begin Date must be specified" in the Lx Modal Window
    Then I see the error message "End Date must be specified" in the Lx Modal Window

  Examples:
    | Field    | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
    | Interior | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |
