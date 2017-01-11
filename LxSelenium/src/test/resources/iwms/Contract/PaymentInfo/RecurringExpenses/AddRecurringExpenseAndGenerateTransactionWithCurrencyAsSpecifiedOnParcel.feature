@all
Feature: (Jira - Automation- 1293) Add Recurring Expense and Generate Transaction with Currency as specified on Parcel

  Scenario Outline: As a delete user I import entity xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/"
    And I import following files:
      | 15689_Entity_1293.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario: As a delete user I verify currency type is not at company level
    When I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID |       |
    Then I verify the following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID |       |
    And I click on "Update" Button
    Then I verify the following message "Successfully updated Company"

  Scenario Outline:  As delete user I navigate locations summary page and verify the Currency type
    When I navigate to entity type "<Entity Type>" named "<Entity Name>" through search option
    And I click on "Summary" tab
    Then I verify "<Entity Name>" name on the header
    And I wait for the Loading text to disappear
    And I verify the field "<Currency>" is "" in a same row in "General Information"

    Examples:
      | Entity Type | Entity Name     | Currency      |
      | Locations   | 15689 Location  | Currency      |
      | Portfolios  | 15689 Portfolio | Currency Type |

  Scenario Outline:  As delete user I navigate to parcel, portfolio and contract summary page and verify the Currency type
    When I navigate to entity type "<Entity Type>" named "<Entity Name>" through search option
    And I click on "Summary" tab
    Then I verify "<Entity Name>" name on the header
    And I verify the following details in non editable summary page in frame grid
      | <Row Header> |                 |
      | <Currency>   | <Currency Type> |
    And I switch to default frame

    Examples:
      | Entity Type | Entity Name    | Row Header          | Currency Type | Currency      |
      | Parcels     | 15689 Parcel   | General Information | JPY           | Currency Type |
      | Contracts   | 15689 Contract | Financials          | JPY           | Currency      |

  Scenario:  As delete user I add vendor allocation and expense schedule
    When I navigate to entity type "Contracts" named "15689 Contract" through search option
    And I navigate to "Payment Info"
    And I click on "Recurring Expenses" tab
    And I click on the "Add item" action panel button
    And I wait for the Loading text to disappear
    And I verify the following fields value on editable page
      | name                            | value |
      | ExpenseSetup_CodeCurrencyTypeID | JPY   |

    And I set following fields value on editable page
      | name                               | value     |
      | ExpenseSetup_CodeExpenseGroupID    | Rent      |
      | ExpenseSetup_CodeExpenseCategoryID | Expense   |
      | ExpenseSetup_CodeExpenseTypeID     | Base Rent |
      | ExpenseSetup_CodeFrequencyID       | Monthly   |

    And I click on the "Save Changes" action panel button
    And I verify the following values in frame grid "thisDiv"
      | Expense Group | Expense Type | Expense Category | Begin Date | End Date | Frequency | Period Amount | Annual Amount |
      | Rent          | Base Rent    | Expense          |            |          | Monthly   |               |               |
    And I click " Add Expense Vendor Allocation... " button
    And I wait for "Add Expense Vendor Allocation  ***Required fields in red" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name                              | value      |
      | ExpenseVendorAllocation_BeginDate | 01/01/2000 |
      | ExpenseVendorAllocation_EndDate   | 12/31/2020 |

    And I set following fields value on editable page
      | name                                      | value             |
      | ExpenseVendorAllocation_VendorID          | Selenium-Employer |
      | ExpenseVendorAllocation_PaymentPercentage | 100               |
    And I click on the "Add" button
    And I verify the following values in frame grid "BOGridExpenseVendorAllocation"
      | Vendor            | Vendor# | Payment Percent | Address           | City  | State | Begin Date | End Date   | Notes |
      | Selenium-Employer | 1234    | 100.00000%      | 5601 Democracy Dr | Plano | TX    | 01/01/2000 | 12/31/2020 |       |
    And I click " Add Expense Schedule... " button
    And I wait for "Adding Expense Schedule" modal window to open in frame page
    And I click on the "No" button
    And I wait for "Add Expense Schedule  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                          | value |
      | ExpenseSchedule_PaymentAmount | 3000  |
      | ExpenseSchedule_Description   |       |
    And I click on the "Add" button
#    And I wait for "Save Changes?" modal window to open in frame page
    And I wait for the Loading text to disappear
    And I click "Yes" button and do not fail if element not exist
    And I click on the "Save Changes" action panel button
    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount | Annual Amount | Rate | First Payment | Last Payment | Notes |
      | 01/01/2000 | 12/31/2020 | Review          | ¥3,000         | ¥36,000       | ¥2   | ¥3,000        | ¥3,000       |       |
    And I click "edit" row action in the non frame grid "BOGridExpenseSchedule" having the following header and cell values
      | name       | value      |
      | Begin Date | 01/01/2000 |
    And I wait for "Edit Expense Schedule  ***Required fields in red" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name                               | value      |
      | ExpenseSchedule_BeginDate          | 01/01/2000 |
      | ExpenseSchedule_EndDate            | 12/31/2020 |
      | ExpenseSchedule_PaymentAmount      | ¥3,000     |
      | ExpenseSchedule_AnnualAmount       | ¥36,000    |
      | ExpenseSchedule_PaymentRate        | ¥2         |
      | ExpenseSchedule_FirstPaymentAmount | ¥3,000     |
      | ExpenseSchedule_LastPaymentAmount  | ¥3,000     |
    And I click on the "Cancel" button


  Scenario:  As delete user I generate transaction and verify the currency type
    When I click on the "Generate Rent" action panel button
    And I wait for "Generate Payments" modal window to open in non frame page
    And I set fields values on editable page
      | name         | value |
      | yrToGenerate | 2016  |
    Then I set following list fields values on editable page
      | name         | value   |
      | mnToGenerate | January |
    And I click "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear

    And I click on the "Transactions" tab
    Then I verify the following values in frame grid "thisDiv"
      | Effective Date | Group | Type      | Category | Vendor            | Vendor# | One-Time Expense | Total Amount | Primary Tax | Hold Flag |
      | 01/01/2016     | Rent  | Base Rent | Expense  | Selenium-Employer | 1234    | No               | ¥3,000       | ¥0          | No        |
    And I verify the following fields value on editable page
      | name                                  | value  |
      | PaymentTransaction_InvoiceAmount      | ¥3,000 |
      | PaymentTransaction_TaxAmount1         | ¥0     |
      | PaymentTransaction_TaxAmount2         | ¥0     |
      | PaymentTransaction_TaxAmount3         | ¥0     |
      | PaymentTransaction_TotalAmount        | ¥3,000 |
      | PaymentTransaction_CodeCurrencyTypeID | JPY    |
