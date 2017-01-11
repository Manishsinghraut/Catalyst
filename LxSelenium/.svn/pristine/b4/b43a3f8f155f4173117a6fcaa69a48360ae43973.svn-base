@all
Feature: (JIRA ticket - AUTOMATION-409, AUTOMATION-1194)I create and update Expense Setup and verify them in  Contract > Payment Info > Recurring Expenses page

  Scenario Outline: I create Expense Setup through spreadsheet and verify them in  Contract > Payment Info > Recurring Expenses page
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses"
    And I import following files:
      | Spreadsheet_Import__Contract-1194.xml |
      | CreateExpenseSpreadsheet-1194.xlsx    |
      | ExpenseSetupRecIDReport-1194.xml      |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on row from grid "thisDiv" having unique value "Utilities" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Water      |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2000 |
      | End Date         | 12/31/2015 |
      | Frequency        | Monthly    |
      | Period Amount    |            |
      | Annual Amount    |            |
    And I verify the field "Begin Date" is "01/01/2000" in a same row in "Expense Setup"
    And I verify the field "End Date" is "12/31/2015" in a same row in "Expense Setup"
    And I verify the following fields value on editable page
      | name                                 | value                            |
      | ExpenseSetup_CodeExpenseGroupID      | Utilities                        |
      | ExpenseSetup_CodeExpenseTypeID       | Water                            |
      | ExpenseSetup_CodeExpenseCategoryID   | Expense                          |
      | ExpenseSetup_CodeCurrencyTypeID_     | USD                              |
      | ExpenseSetup_Description             | This will be created upon import |
      | ExpenseSetup_CodeFrequencyID         | Monthly                          |
      | ExpenseSetup_RentableArea            | 34                               |
      | ExpenseSetup_CodeBuildingAreaUnitID  | Square Feet                      |
      | ExpenseSetup_ProRataShareRate        | 25.00000%                        |
      | ExpenseSetup_RemitMessage            | Creation                         |
      | ExpenseSetup_InternalReferenceNumber | Test                             |
      | ExpenseSetup_CodePaymentMethodID     | Check                            |
      | ExpenseSetup_PaymentDueDay           | 12                               |
    And I verify the field "Primary Tax" is "" in "Expense Schedule / Escalations"
    And I verify the field "Secondary Tax" is "" in "Expense Schedule / Escalations"
    And I verify the field "Tertiary Tax" is "" in "Expense Schedule / Escalations"
    And I verify the field "In Alternate Rent?" is "No" in "Expense Schedule / Escalations"
    And I verify the following fields value on editable page
      | name                                     | value      |
      | ExpenseSetup_CodeProrationMethodID       | Annual 360 |
      | _checkbox_ExpenseSetup_ApplyTax1Flag     | false      |
      | _checkbox_ExpenseSetup_ApplyTax2Flag     | false      |
      | _checkbox_ExpenseSetup_ApplyTax3Flag     | false      |
      | _checkbox_ExpenseSetup_TaxesIncludedFlag | false      |
    And I verify the following values in frame grid "BOGridExpenseVendorAllocation"
      | Vendor            | Vendor# | Payment Percent | Address           | City  | State | Begin Date | End Date   | Notes                            |
      | Selenium-Employer | 1234    | 100.00000%      | 5601 Democracy Dr | Plano | TX    | 01/01/2000 | 12/31/2015 | This will be created upon import |
    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount | Annual Amount | Rate  | First Payment | Last Payment | Notes                              |
      | 01/01/2000 | 12/31/2015 | Review          | $500.00        | $6,000.00     | $1.20 | $500.00       | $500.00      | Note this needs to be paid monthly |
    And I verify the following values in frame grid "BOGridExpenseAllocation"
      | Begin Date | End Date   | Effective Date | Organization          | Allocation Percentage | Acct#1       | Acct#2 | Acct#3 | Acct#4 |
      | 01/01/2000 | 12/31/2015 | 01/01/2000     | Selenium-Organization | 25.00000%             | 000012548569 |        |        |        |
    And I verify the following fields value on editable page
      | name                                         | value    |
      | _checkbox_ExpenseSetup_IsReceivable          | true     |
      | _checkbox_ExpenseSetup_ReconcilableExpense   | false    |
      | _checkbox_ExpenseSetup_ReadyForPaymentFlag   | true     |
      | _checkbox_ExpenseSetup_HoldFlag              | false    |
      | _checkbox_ExpenseSetup_IncludeInPlanForecast | true     |
      | ExpenseSetup_CodePlanForecastGroupID         | [SELECT] |
      | ExpenseSetup_PlanForecastNotes               | Test     |
      | ExpenseSetup_Notes                           | Creation |
      | ExpenseSetup_CovenantID                      | <SELECT> |
      | ExpenseSetup_Section                         | Creation |
      | ExpenseSetup_AmendmentID                     | [SELECT] |
    And I verify the field "AP Export Base Number" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "Expense Accrual Acct #1" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "AP Export Tax #1" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "RE Tax Accrual Acct #1" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "Percent Rent Accrual Acct #1" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "AP Export Prepaid Number" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "Expense Accrual Acct #2" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "AP Export Tax #2" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "RE Tax Accrual Acct #2" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "Percent Rent Accrual Acct #2" is "" in "Internal Account Coding (based on Expense Type)"

    And I click on row from grid "thisDiv" having unique value "Lease" under column header "Expense Group"
      | name             | value           |
      | Expense Type     | Percentage Rent |
      | Expense Category | Rent            |
      | Begin Date       | 01/01/2000      |
      | End Date         | 12/31/2015      |
      | Frequency        | None            |
      | Period Amount    |                 |
      | Annual Amount    |                 |
    And I verify the field "Begin Date" is "01/01/2000" in a same row in "Expense Setup"
    And I verify the field "End Date" is "12/31/2015" in a same row in "Expense Setup"
    And I verify the following fields value on editable page
      | name                                 | value                            |
      | ExpenseSetup_CodeExpenseGroupID      | Lease                            |
      | ExpenseSetup_CodeExpenseTypeID       | Percentage Rent                  |
      | ExpenseSetup_CodeExpenseCategoryID   | Rent                             |
      | ExpenseSetup_CodeCurrencyTypeID_     | USD                              |
      | ExpenseSetup_Description             | This will be created upon import |
      | ExpenseSetup_CodeFrequencyID         | None                             |
      | ExpenseSetup_RentableArea            | 45                               |
      | ExpenseSetup_CodeBuildingAreaUnitID  | Square Feet                      |
      | ExpenseSetup_ProRataShareRate        | 50.00000%                        |
      | ExpenseSetup_RemitMessage            | Creation                         |
      | ExpenseSetup_InternalReferenceNumber | Test 2                           |
      | ExpenseSetup_CodePaymentMethodID     | Cash                             |
      | ExpenseSetup_PaymentDueDay           | 2                                |
    And I verify the field "Primary Tax" is "" in "Expense Schedule / Escalations"
    And I verify the field "Secondary Tax" is "" in "Expense Schedule / Escalations"
    And I verify the field "Tertiary Tax" is "" in "Expense Schedule / Escalations"
    And I verify the field "In Alternate Rent?" is "No" in "Expense Schedule / Escalations"
    And I verify the following fields value on editable page
      | name                                     | value      |
      | ExpenseSetup_CodeProrationMethodID       | Annual 365 |
      | _checkbox_ExpenseSetup_ApplyTax1Flag     | true       |
      | _checkbox_ExpenseSetup_ApplyTax2Flag     | true       |
      | _checkbox_ExpenseSetup_ApplyTax3Flag     | true       |
      | _checkbox_ExpenseSetup_TaxesIncludedFlag | true       |
    And I verify the following values in frame grid "BOGridExpenseVendorAllocation"
      | Vendor            | Vendor# | Payment Percent | Address           | City  | State | Begin Date | End Date   | Notes                            |
      | Selenium-Employer | 1234    | 50.00000%       | 5601 Democracy Dr | Plano | TX    | 01/01/2000 | 12/31/2015 | This will be created upon import |
    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount | Annual Amount | Rate  | First Payment | Last Payment | Notes                             |
      | 01/01/2000 | 12/31/2015 | Review          | $100.00        | $1,000.00     | $2.00 | $250.00       | $250.00      | Note this needs to be paid yearly |
    And I verify the following values in frame grid "BOGridExpenseAllocation"
      | Begin Date | End Date   | Effective Date | Organization          | Allocation Percentage | Acct#1       | Acct#2 | Acct#3 | Acct#4 |
      | 01/01/2000 | 12/31/2015 | 01/01/2000     | Selenium-Organization | 50.00000%             | 000012548569 |        |        |        |
    And I verify the following fields value on editable page
      | name                                         | value    |
      | _checkbox_ExpenseSetup_IsReceivable          | true     |
      | _checkbox_ExpenseSetup_ReconcilableExpense   | true     |
      | _checkbox_ExpenseSetup_ReadyForPaymentFlag   | false    |
      | _checkbox_ExpenseSetup_HoldFlag              | true     |
      | _checkbox_ExpenseSetup_IncludeInPlanForecast | false    |
      | ExpenseSetup_CodePlanForecastGroupID         | [SELECT] |
      | ExpenseSetup_PlanForecastNotes               | Test     |
      | ExpenseSetup_Notes                           | Creation |
      | ExpenseSetup_CovenantID                      | <SELECT> |
      | ExpenseSetup_Section                         | Creation |
      | ExpenseSetup_AmendmentID                     | [SELECT] |
    And I verify the field "AP Export Base Number" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "Expense Accrual Acct #1" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "AP Export Tax #1" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "RE Tax Accrual Acct #1" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "Percent Rent Accrual Acct #1" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "AP Export Prepaid Number" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "Expense Accrual Acct #2" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "AP Export Tax #2" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "RE Tax Accrual Acct #2" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "Percent Rent Accrual Acct #2" is "" in "Internal Account Coding (based on Expense Type)"

    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Reports Grid ID>" having the following header and cell values
      | name        | value                      |
      | Report Name | Expense Setup RecID Report |
    And I switch to "Report" child window
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/UpdateExpenseSpreadsheet-1194.xlsx"
    And I fetch entity ID from report under header "Expense Setup RecID" for entity "Spreadsheet Import-Contract-Testing-15278" in row "1"
    And I set cell value in spread sheet row "6" under header "ExpenseSetup " of column index "3"
    And I fetch entity ID from report under header "Expense Schedule RecID" for entity "Spreadsheet Import-Contract-Testing-15278" in row "1"
    And I set cell value in spread sheet row "7" under header "ExpenseSchedule" of column index "3"
    And I fetch entity ID from report under header "Vendor Allocation RecID" for entity "Spreadsheet Import-Contract-Testing-15278" in row "1"
    And I set cell value in spread sheet row "8" under header "ExpenseVendorAllocation" of column index "3"
    And I fetch entity ID from report under header "Allocation RecID" for entity "Spreadsheet Import-Contract-Testing-15278" in row "1"
    And I set cell value in spread sheet row "9" under header "ExpenseAllocation " of column index "3"
    And I close the "Report" child window
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Item     | Secondary Tab | Third Level Tab    | Entity Name                               | Reports Grid ID |
      | DeleteAccess | Delete Access Access | Contract | Payment Info  | Recurring Expenses | Spreadsheet Import-Contract-Testing-15278 | ^editBOGrid     |


  Scenario Outline: I update Expense Setup through spreadsheet and verify them in  Contract > Payment Info > Recurring Expenses page
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses"
    And I import following files:
      | UpdateExpenseSpreadsheet-1194.xlsx |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
      | name             | value                |
      | Expense Type     | Building Maintenance |
      | Expense Category | Rent                 |
      | Begin Date       | 01/01/2000           |
      | End Date         | 12/31/2015           |
      | Frequency        | None                 |
      | Period Amount    |                      |
      | Annual Amount    |                      |
    And I verify the field "Begin Date" is "01/01/2000" in a same row in "Expense Setup"
    And I verify the field "End Date" is "12/31/2015" in a same row in "Expense Setup"
    And I verify the following fields value on editable page
      | name                                 | value                            |
      | ExpenseSetup_CodeExpenseGroupID      | Lease Expense                    |
      | ExpenseSetup_CodeExpenseTypeID       | Building Maintenance             |
      | ExpenseSetup_CodeExpenseCategoryID   | Rent                             |
      | ExpenseSetup_CodeCurrencyTypeID_     | USD                              |
      | ExpenseSetup_Description             | This will be updated upon import |
      | ExpenseSetup_CodeFrequencyID         | None                             |
      | ExpenseSetup_RentableArea            | 45                               |
      | ExpenseSetup_CodeBuildingAreaUnitID  | Square Feet                      |
      | ExpenseSetup_ProRataShareRate        | 50.00000%                        |
      | ExpenseSetup_RemitMessage            | Update                           |
      | ExpenseSetup_InternalReferenceNumber | Test 2                           |
      | ExpenseSetup_CodePaymentMethodID     | Cash                             |
      | ExpenseSetup_PaymentDueDay           | 2                                |
    And I verify the field "Primary Tax" is "" in "Expense Schedule / Escalations"
    And I verify the field "Secondary Tax" is "" in "Expense Schedule / Escalations"
    And I verify the field "Tertiary Tax" is "" in "Expense Schedule / Escalations"
    And I verify the field "In Alternate Rent?" is "No" in "Expense Schedule / Escalations"
    And I verify the following fields value on editable page
      | name                                     | value      |
      | ExpenseSetup_CodeProrationMethodID       | Annual 360 |
      | _checkbox_ExpenseSetup_ApplyTax1Flag     | true       |
      | _checkbox_ExpenseSetup_ApplyTax2Flag     | true       |
      | _checkbox_ExpenseSetup_ApplyTax3Flag     | true       |
      | _checkbox_ExpenseSetup_TaxesIncludedFlag | true       |
    And I verify the following values in frame grid "BOGridExpenseVendorAllocation"
      | Vendor            | Vendor# | Payment Percent | Address           | City  | State | Begin Date | End Date   | Notes                            |
      | Selenium-Employer | 1234    | 100.00000%      | 5601 Democracy Dr | Plano | TX    | 01/01/2000 | 12/31/2015 | This will be updated upon import |
    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount | Annual Amount | Rate  | First Payment | Last Payment | Notes                             |
      | 01/01/2000 | 12/31/2015 | Review          | $100.00        | $1,000.00     | $2.00 | $250.00       | $250.00      | Note this needs to be paid yearly |
    And I verify the following values in frame grid "BOGridExpenseAllocation"
      | Begin Date | End Date   | Effective Date | Organization          | Allocation Percentage | Acct#1       | Acct#2 | Acct#3 | Acct#4 |
      | 01/01/2000 | 12/31/2015 | 01/01/2000     | Selenium-Organization | 50.00000%             | 000012548569 |        |        |        |
    And I verify the following fields value on editable page
      | name                                         | value    |
      | _checkbox_ExpenseSetup_IsReceivable          | true     |
      | _checkbox_ExpenseSetup_ReconcilableExpense   | true     |
      | _checkbox_ExpenseSetup_ReadyForPaymentFlag   | false    |
      | _checkbox_ExpenseSetup_HoldFlag              | true     |
      | _checkbox_ExpenseSetup_IncludeInPlanForecast | false    |
      | ExpenseSetup_CodePlanForecastGroupID         | [SELECT] |
      | ExpenseSetup_PlanForecastNotes               | Test     |
      | ExpenseSetup_Notes                           | Creation |
      | ExpenseSetup_CovenantID                      | <SELECT> |
      | ExpenseSetup_Section                         | Update   |
      | ExpenseSetup_AmendmentID                     | [SELECT] |
    And I verify the field "AP Export Base Number" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "Expense Accrual Acct #1" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "AP Export Tax #1" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "RE Tax Accrual Acct #1" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "Percent Rent Accrual Acct #1" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "AP Export Prepaid Number" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "Expense Accrual Acct #2" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "AP Export Tax #2" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "RE Tax Accrual Acct #2" is "" in "Internal Account Coding (based on Expense Type)"
    And I verify the field "Percent Rent Accrual Acct #2" is "" in "Internal Account Coding (based on Expense Type)"

    Examples:
      | Login User | Login full username | Item     | Secondary Tab | Third Level Tab    | Entity Name                               |
      | EditAccess | Edit Access Access  | Contract | Payment Info  | Recurring Expenses | Spreadsheet Import-Contract-Testing-15278 |

#@all
#Feature: (JIRA ticket - AUTOMATION-409, AUTOMATION-1194)I create and update Expense Setup and verify them in  Contract > Payment Info > Recurring Expenses page
#
#  Scenario Outline: I create Expense Setup through spreadsheet and verify them in  Contract > Payment Info > Recurring Expenses page
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses"
#    And I import following file name:
#      | Create_ExpenseSetup.xlsx |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/Create_ExpenseSetup.xlsx"
#    Then I verify a row from grid "thisDiv" by reading data from excel sheet row "6"
#      | name          | value                           |
#      | Frequency     | ExpenseSetup.CodeFrequencyID    |
#      | Expense Group | ExpenseSetup.CodeExpenseGroupID |
#      | Expense Type  | ExpenseSetup.CodeExpenseTypeID  |
#    Then I compare attribute value on editable page by reading data from spread sheet row "6"
#      | name                     | value                    |
#      | ExpenseSetup_Description | ExpenseSetup.Description |
#
#    Then I verify a row from grid "BOGridExpenseVendorAllocation" by reading data from excel sheet row "8"
#      | name            | value                                     |
#      | Vendor          | ExpenseVendorAllocation.VendorID          |
#      | Payment Percent | ExpenseVendorAllocation.PaymentPercentage |
#      | Begin Date      | ExpenseVendorAllocation.BeginDate         |
#      | End Date        | ExpenseVendorAllocation.EndDate           |
#      | Notes           | ExpenseVendorAllocation.Notes             |
#
#    Then I verify a row from grid "BOGridExpenseAllocation" by reading data from excel sheet row "9"
#      | name                  | value                                  |
#      | Begin Date            | ExpenseAllocation.BeginDate            |
#      | End Date              | ExpenseAllocation.EndDate              |
#      | Allocation Percentage | ExpenseAllocation.AllocationPercentage |
#
#    And I click "edit" link of the row "1" in grid "BOGridExpenseSchedule"
#    And I verify all fields values on editable page comparing with "7" th row of spreadsheet
#      | name                        | value                       |
#      | ExpenseSchedule_Description | ExpenseSchedule.Description |
#    And I click on the "Cancel" button
#    And I wait for "Edit Expense Schedule ***Required fields in red" modal window to close
#    And I logout
#
#    Examples:
#      | Login User   | Login full username  | Item     | Secondary Tab | Third Level Tab    | Entity Name       |
#      | DeleteAccess | Delete Access Access | Contract | Payment Info  | Recurring Expenses | Selenium-Contract |
#
#
#  Scenario Outline: I update Expense Setup through spreadsheet and verify them in  Contract > Payment Info > Recurring Expenses page
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses"
#    And I import following file name:
#      | Update_ExpenseSetup.xlsx |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/Create_ExpenseSetup.xlsx"
#    Then I verify a row from grid "thisDiv" by reading data from excel sheet row "6"
#      | name          | value                           |
#      | Frequency     | ExpenseSetup.CodeFrequencyID    |
#      | Expense Group | ExpenseSetup.CodeExpenseGroupID |
#      | Expense Type  | ExpenseSetup.CodeExpenseTypeID  |
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/Update_ExpenseSetup.xlsx"
#    Then I compare attribute value on editable page by reading data from spread sheet row "6"
#      | name                     | value                    |
#      | ExpenseSetup_Description | ExpenseSetup.Description |
#
#    Then I verify a row from grid "BOGridExpenseVendorAllocation" by reading data from excel sheet row "8"
#      | name  | value                         |
#      | Notes | ExpenseVendorAllocation.Notes |
#
#    Then I verify a row from grid "BOGridExpenseAllocation" by reading data from excel sheet row "9"
#      | name                  | value                                  |
#      | Allocation Percentage | ExpenseAllocation.AllocationPercentage |
#
#    And I click "edit" link of the row "1" in grid "BOGridExpenseSchedule"
#    And I verify all fields values on editable page comparing with "7" th row of spreadsheet
#      | name                        | value                       |
#      | ExpenseSchedule_Description | ExpenseSchedule.Description |
#    And I click on the "Cancel" button
#    And I wait for "Edit Expense Schedule ***Required fields in red" modal window to close
#    And I logout
#
#    Examples:
#      | Login User | Login full username | Item     | Secondary Tab | Third Level Tab    | Entity Name       |
#      | EditAccess | Edit Access Access  | Contract | Payment Info  | Recurring Expenses | Selenium-Contract |