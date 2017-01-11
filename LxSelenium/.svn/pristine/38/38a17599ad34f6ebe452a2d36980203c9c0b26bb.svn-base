@all
Feature: Adding Firm Level Currency Should reflect correct currency on the Recurring Expense and transaction (Jira Ref: AUTOMATION-1289)

  Scenario Outline: As a delete user I Navigate to  Admin Dashboard > Manage Company > Financial Settings > and select JPY as the 'Home Currency' and click 'Update'
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID | JPY   |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/Details/"
    And I import following file name:
      | CurrencyEntities-15684_1289.xml |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Navigate to "CurrencyPortfolio-15684" and verify the currency type
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify pair of values on non editable summary page
      | name          | value |
      | Currency Type | JPY   |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name             | Third Level Tab |
    | DeleteAccess | Delete Access Access | CurrencyPortfolio-15684 | Summary         |

  Scenario Outline: As a delete user I Navigate to "CurrencyContract-15684" -> Payment Info -> Recurring Expenses.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame

    And I verify the following fields value on editable page
      | name                            | value |
      | ExpenseSetup_CodeCurrencyTypeID | JPY   |
    And I switch to default frame
    And I click on the "Add item" action panel button
    And I switch to visible frame
    And I set following fields value on editable page
      | name                               | value     |
      | ExpenseSetup_CodeExpenseGroupID    | Rent      |
      | ExpenseSetup_CodeExpenseTypeID     | Base Rent |
      | ExpenseSetup_CodeExpenseCategoryID | Expense   |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    Then I click on " Add Expense Schedule... " grid button
    And I click on the "Yes" button in message box
    And I switch to default frame
    And I verify the following fields value on editable page
      | name                            | value |
      | ExpenseSetup_CodeCurrencyTypeID | JPY   |
    And I set following fields value on editable page
      | name                                          | value      |
      | Contract_PaymentsBeginDate                    | 01/01/2015 |
      | Contract_PaymentsEndDate                      | 12/31/2030 |
      | ExpenseSetup_ExpenseSetupWizard_StartingAmout | 2000       |
    And I click on the "Generate Expense Schedule" button

    And I verify a row from grid "thisDiv" having unique value "Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Base Rent  |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2015 |
      | End Date         | 12/31/2030 |
      | Frequency        | Monthly    |
      | Period Amount    | ¥2,000     |
      | Annual Amount    | ¥24,000    |

    And I verify grid row "BOGridExpenseSchedule" having unique value "12/31/2030" under column header "End Date"
      | name            | value      |
      | Begin Date      | 01/01/2015 |
      | End Date        | 12/31/2030 |
      | Approval Status | Review     |
      | Payment Amount  | ¥2,000     |
      | Annual Amount   | ¥24,000    |
      | Rate            |            |
      | First Payment   | ¥2,000     |
      | Last Payment    | ¥2,000     |

    And I switch to default frame
    And I click on the "Transactions" tab
    And I switch to visible frame

    And I verify the following fields value on editable page
      | name                                  | value |
      | PaymentTransaction_CodeCurrencyTypeID | JPY   |
    And I switch to default frame
    And I click on the "Add item" action panel button
    And I switch to visible frame
    And I set following fields value on editable page
      | name                                     | value      |
      | PaymentTransaction_CodeExpenseGroupID    | Rent       |
      | PaymentTransaction_CodeExpenseTypeID     | Base Rent  |
      | PaymentTransaction_CodeExpenseCategoryID | Expense    |
      | PaymentTransaction_EffectiveDate         | 01/01/2016 |
      | PaymentTransaction_InvoiceAmount         | 2000       |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I verify a row from grid "thisDiv" having unique value "01/01/2016" under column header "Effective Date"
      | name             | value      |
      | Effective Date   | 01/01/2016 |
      | Group            | Rent       |
      | Type             | Base Rent  |
      | Category         | Expense    |
      | Vendor           |            |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | ¥2,000     |
      | Primary Tax      |            |
      | Hold Flag        | No         |

  Examples:
    | Login User   | Login full username  | Entity Name            | Second Level Tab | Third Level Tab    |
    | DeleteAccess | Delete Access Access | CurrencyContract-15684 | Payment Info     | Recurring Expenses |

  Scenario Outline: As a delete user I Navigate to Admin Dashboard > Manage Company > Financial Settings > and select [Select] as the 'Home Currency'
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID |       |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |