Feature: (Jira Ref: AUTOMATION-508) I create,update and delete contract Expense Setup and verify them in Contract> Payment Info> Recurring Expenses page

  Scenario Outline: I create contract Expense Setup through UI
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
    And I click on the "Add item" action panel button
    Then I verify page title "<Grid title>" after navigation
    And I set following fields value on editable page
      | name                                 | value                  |
      | ExpenseSetup_CodeExpenseGroupID      | CAM                    |
      | ExpenseSetup_CodeExpenseTypeID       | Interior               |
      | ExpenseSetup_CodeExpenseCategoryID   | Rent                   |
      | ExpenseSetup_CodeFrequencyID         | <Field>                |
      | ExpenseSetup_Description             | Description created    |
      | ExpenseSetup_CodeCurrencyTypeID      | USD                    |
      | ExpenseSetup_RentableArea            | 8000                   |
      | ExpenseSetup_CodeBuildingAreaUnitID  | Square Feet            |
      | ExpenseSetup_ProRataShareRate        | 60                     |
      | ExpenseSetup_RemitMessage            | Selenium remit message |
      | ExpenseSetup_InternalReferenceNumber | 1515                   |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I verify row from grid "<Grid ID>" having unique value "<Field>"
      | name             | value    |
      | Expense Group    | CAM      |
      | Expense Type     | Interior |
      | Expense Category | Rent     |
      | Begin Date       |          |
      | End Date         |          |
      | Frequency        | <Field>  |
      | Period Amount    |          |
      | Annual Amount    |          |
#    And I switch to default frame
#    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Frequency"
    Then I click on "Add Expense Vendor Allocation..." grid button
    And I switch to default frame
    And I set following fields value on editable page
      | name                                      | value                                    |
      | ExpenseVendorAllocation_BeginDate         | 05/18/2015                               |
      | ExpenseVendorAllocation_EndDate           | 01/01/2024                               |
      | ExpenseVendorAllocation_PaymentPercentage | 40                                       |
      | ExpenseVendorAllocation_Notes             | Add Expense Vendor Allocation            |
      | ExpenseVendorAllocation_VendorID          | Selenium-Employer                        |
      | ExpenseVendorAllocation_Notes             | Selenium expense Vendor allocation notes |
    And I switch to default frame
    And I click on the "Add" button
    And I click on the "Save Changes" action panel button
#    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Frequency"
#    And I verify row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium expense Vendor allocation notes" under column header "Notes"
    Then I verify page title "<Grid title>" after navigation
    And I verify row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium expense Vendor allocation notes"
      | name            | value                                    |
      | Vendor          | Selenium-Employer                        |
      | Vendor#         | 1234                                     |
      | Payment Percent | 40                                       |
      | Address         | 5601 Democracy Dr                        |
      | City            | Plano                                    |
      | State           | TX                                       |
      | Begin Date      | 05/18/2015                               |
      | End Date        | 01/01/2024                               |
      | Notes           | Selenium expense Vendor allocation notes |
      | Actions         | edit                                     |
#    And I switch to default frame
#    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Frequency"
    Then I click on "Add Expense Schedule..." grid button
    And I click on the "Yes" button in message box
    And I switch to default frame
    And I set following fields value on editable page
      | name                                          | value      |
      | Contract_PaymentsBeginDate                    | 01/01/2016 |
      | Contract_PaymentsEndDate                      | 01/01/2017 |
      | ExpenseSetup_ExpenseSetupWizard_StartingAmout | 50000      |
    And I click on the "Generate Expense Schedule" button
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Frequency"
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I logout

    Examples:
      | Field         | Second Level Tab | Third Level Tab    | Entity Name       | Grid title                  | Grid ID |
      | Semi-Annually | Payment Info     | Recurring Expenses | Selenium-Contract | Contract Expense Setup List | thisDiv |

  Scenario Outline: I update contract Expense Setup through UI
    Given I Login to IWMS using "EditAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Frequency"
    And I set following fields value on editable page
      | name                          | value                         |
      | ExpenseSetup_ProRataShareRate | 70                            |
      | ExpenseSetup_RemitMessage     | Update Selenium remit message |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Frequency"
    And I click "edit" link of the row "1" in grid "BOGridExpenseVendorAllocation"
    And I switch to default frame
    And I set following fields value on editable page
      | name                                      | value                                           |
      | ExpenseVendorAllocation_PaymentPercentage | 50                                              |
      | ExpenseVendorAllocation_Notes             | Update Selenium expense Vendor allocation notes |
    And I click on the "Update" button
    And I click on the "Save Changes" action panel button

    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Frequency"
    And I click "edit" link of the row "1" in grid "BOGridExpenseSchedule"
    And I switch to default frame
    And I set following fields value on editable page
      | name                          | value |
      | ExpenseSchedule_PaymentAmount | 70000 |
    And I click on the "Update" button
    And I click on the "Save Changes" action panel button

    And I logout

    Examples:
      | Field         | Second Level Tab | Third Level Tab    | Entity Name       | Grid title                  | Grid ID |
      | Semi-Annually | Payment Info     | Recurring Expenses | Selenium-Contract | Contract Expense Setup List | thisDiv |

  Scenario Outline: I Delete contract Expense Setup through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab

    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Frequency"
    And I click "delete" link of the row "1" in grid "BOGridExpenseSchedule"
    And I click on the "Yes" button
    And I switch to default frame

#    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Frequency"
    And I click "delete" link of the row "1" in grid "BOGridExpenseVendorAllocation"
    And I click on the "Yes" button
    And I switch to default frame

#    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Frequency"
    And I switch to default frame
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    Then I verify row from grid "<Grid ID>" having unique value "<Field>" not present

    Examples:
      | Field         | Second Level Tab | Third Level Tab    | Entity Name       | Grid title                  | Grid ID |
      | Semi-Annually | Payment Info     | Recurring Expenses | Selenium-Contract | Contract Expense Setup List | thisDiv |