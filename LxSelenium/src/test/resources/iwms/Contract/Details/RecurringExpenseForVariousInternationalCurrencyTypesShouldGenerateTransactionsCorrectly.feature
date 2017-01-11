@all
Feature: Recurring expense for various International currency types should generate transactions correctly (Jira Ref: AUTOMATION-1291)

  Scenario Outline: As a delete user I Navigate to  Admin Dashboard > Manage Company > Financial Settings > and select JPY as the 'Home Currency' and click 'Update'
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/"
    And I import following file name:
      | 15686Contract_1291.xml |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Navigate to "15686Contract" and verify the currency type
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify pair of values on non editable summary page
      | name     | value |
      | Currency | USD   |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name   | Third Level Tab |
    | DeleteAccess | Delete Access Access | 15686Contract | Summary         |

  Scenario Outline: As a delete user I Navigate to 15686Contract -> Payment Info -> Recurring Expenses.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame

    And I verify a row from grid "thisDiv" having unique value "Expense" under column header "Expense Group"
      | name             | value        |
      | Expense Type     | Interior     |
      | Expense Category | Expense      |
      | Begin Date       | 01/01/2010   |
      | End Date         | 12/31/2020   |
      | Frequency        | Monthly      |
      | Period Amount    | $30,000.000  |
      | Annual Amount    | $360,000.000 |

    And I click on "edit" row action in the grid "BOGridExpenseSchedule" having the following header "End Date" and cell value "12/31/2020"
      | name            | value       |
      | Begin Date      | 01/01/2010  |
      | End Date        | 12/31/2020  |
      | Approval Status | Review      |
      | Payment Amount  | $30,000.00  |
      | Annual Amount   | $360,000.00 |
      | Rate            | $30.00      |
      | First Payment   | $30,000.00  |
      | Last Payment    | $30,000.00  |


    And I switch to default frame
    And I verify the following fields value on editable page
      | name                                 | value          |
      | ExpenseSchedule_BeginDate            | 01/01/2010     |
      | ExpenseSchedule_EndDate              | 12/31/2020     |
      | ExpenseSchedule_CodeApprovalStatusID | Review         |
      | ExpenseSchedule_PaymentAmount        | $30,000.000    |
      | ExpenseSchedule_AnnualAmount         | $360,000.000   |
      | ExpenseSchedule_PaymentRate          | $30.000        |
      | ExpenseSchedule_FirstPaymentAmount   | $30,000.000    |
      | ExpenseSchedule_LastPaymentAmount    | $30,000.000    |
      | calcOptions                          | Payment Amount |
      | _checkbox_ExpenseSchedule_HoldFlag   | false          |

    And I verify the field "Frequency" is "Monthly"
    And I verify the field "Rentable Area" is "12,000"
    And I verify the field "Rate Per" is "Square Feet"

    And I click on the "Cancel" button
    And I wait for modal window to close


    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
      | name             | value           |
      | Expense Type     | Percentage Rent |
      | Expense Category | Expense         |
      | Begin Date       | 01/01/2010      |
      | End Date         | 12/31/2020      |
      | Frequency        | Monthly         |
      | Period Amount    | $40,000.00      |
      | Annual Amount    | $480,000.00     |

    And I click on "edit" row action in the grid "BOGridExpenseSchedule" having the following header "End Date" and cell value "12/31/2020"
      | name            | value       |
      | Begin Date      | 01/01/2010  |
      | End Date        | 12/31/2020  |
      | Approval Status | Review      |
      | Payment Amount  | $40,000.00  |
      | Annual Amount   | $480,000.00 |
      | Rate            | $40.00      |
      | First Payment   | $40,000.00  |
      | Last Payment    | $40,000.00  |

    And I switch to default frame
    And I verify the following fields value on editable page
      | name                                 | value          |
      | ExpenseSchedule_BeginDate            | 01/01/2010     |
      | ExpenseSchedule_EndDate              | 12/31/2020     |
      | ExpenseSchedule_CodeApprovalStatusID | Review         |
      | ExpenseSchedule_PaymentAmount        | $40,000.00     |
      | ExpenseSchedule_AnnualAmount         | $480,000.00    |
      | ExpenseSchedule_PaymentRate          | $40.00         |
      | ExpenseSchedule_FirstPaymentAmount   | $40,000.00     |
      | ExpenseSchedule_LastPaymentAmount    | $40,000.00     |
      | calcOptions                          | Payment Amount |
      | _checkbox_ExpenseSchedule_HoldFlag   | false          |

    And I verify the field "Frequency" is "Monthly"
    And I verify the field "Rentable Area" is "12,000"
    And I verify the field "Rate Per" is "Square Feet"

    And I click on the "Cancel" button
    And I wait for modal window to close

    And I switch to visible frame
    And I verify a row from grid "thisDiv" having unique value "Base Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Rent       |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | ¥10,000    |
      | Annual Amount    | ¥120,000   |

    And I click on "edit" row action in the grid "BOGridExpenseSchedule" having the following header "End Date" and cell value "12/31/2020"
      | name            | value      |
      | Begin Date      | 01/01/2010 |
      | End Date        | 12/31/2020 |
      | Approval Status | Review     |
      | Payment Amount  | ¥10,000    |
      | Annual Amount   | ¥120,000   |
      | Rate            | ¥10        |
      | First Payment   | ¥10,000    |
      | Last Payment    | ¥10,000    |

    And I switch to default frame
    And I verify the following fields value on editable page
      | name                                 | value          |
      | ExpenseSchedule_BeginDate            | 01/01/2010     |
      | ExpenseSchedule_EndDate              | 12/31/2020     |
      | ExpenseSchedule_CodeApprovalStatusID | Review         |
      | ExpenseSchedule_PaymentAmount        | ¥10,000        |
      | ExpenseSchedule_AnnualAmount         | ¥120,000       |
      | ExpenseSchedule_PaymentRate          | ¥10            |
      | ExpenseSchedule_FirstPaymentAmount   | ¥10,000        |
      | ExpenseSchedule_LastPaymentAmount    | ¥10,000        |
      | calcOptions                          | Payment Amount |
      | _checkbox_ExpenseSchedule_HoldFlag   | false          |

    And I verify the field "Frequency" is "Monthly"
    And I verify the field "Rentable Area" is "12,000"
    And I verify the field "Rate Per" is "Square Feet"

    And I click on the "Cancel" button
    And I wait for modal window to close


    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value       |
      | Expense Type     | CAM         |
      | Expense Category | Expense     |
      | Begin Date       | 01/01/2010  |
      | End Date         | 12/31/2020  |
      | Frequency        | Monthly     |
      | Period Amount    | €20,000.00  |
      | Annual Amount    | €240,000.00 |

    And I click on "edit" row action in the grid "BOGridExpenseSchedule" having the following header "End Date" and cell value "12/31/2020"
      | name            | value       |
      | Begin Date      | 01/01/2010  |
      | End Date        | 12/31/2020  |
      | Approval Status | Review      |
      | Payment Amount  | €20,000.00  |
      | Annual Amount   | €240,000.00 |
      | Rate            | €20.00      |
      | First Payment   | €20,000.00  |
      | Last Payment    | €20,000.00  |

    And I switch to default frame
    And I verify the following fields value on editable page
      | name                                 | value          |
      | ExpenseSchedule_BeginDate            | 01/01/2010     |
      | ExpenseSchedule_EndDate              | 12/31/2020     |
      | ExpenseSchedule_CodeApprovalStatusID | Review         |
      | ExpenseSchedule_PaymentAmount        | €20,000.00     |
      | ExpenseSchedule_AnnualAmount         | €240,000.00    |
      | ExpenseSchedule_PaymentRate          | €20.00         |
      | ExpenseSchedule_FirstPaymentAmount   | €20,000.00     |
      | ExpenseSchedule_LastPaymentAmount    | €20,000.00     |
      | calcOptions                          | Payment Amount |
      | _checkbox_ExpenseSchedule_HoldFlag   | false          |

    And I verify the field "Frequency" is "Monthly"
    And I verify the field "Rentable Area" is "12,000"
    And I verify the field "Rate Per" is "Square Feet"

    And I click on the "Cancel" button
    And I wait for modal window to close


#    And I switch to visible frame
#    And I verify a row from grid "thisDiv" having unique value "Expense" under column header "Expense Group"
#      | name             | value        |
#      | Expense Type     | Interior     |
#      | Expense Category | Expense      |
#      | Begin Date       | 01/01/2010   |
#      | End Date         | 12/31/2020   |
#      | Frequency        | Monthly      |
#      | Period Amount    | $30,000.000  |
#      | Annual Amount    | $360,000.000 |
#
#    And I click on "edit" row action in the grid "BOGridExpenseSchedule" having the following header "End Date" and cell value "12/31/2020"
#      | name            | value        |
#      | Begin Date      | 01/01/2010   |
#      | End Date        | 12/31/2020   |
#      | Approval Status | Review       |
#      | Payment Amount  | $30,000.00   |
#      | Annual Amount   | $360,000.000 |
#      | Rate            | $30.00       |
#      | First Payment   | $30,000.00   |
#      | Last Payment    | $30,000.00   |
#
#
#    And I switch to default frame
#    And I verify the following fields value on editable page
#      | name                                 | value          |
#      | ExpenseSchedule_BeginDate            | 01/01/2010     |
#      | ExpenseSchedule_EndDate              | 12/31/2020     |
#      | ExpenseSchedule_CodeApprovalStatusID | Review         |
#      | ExpenseSchedule_PaymentAmount        | $30,000.000    |
#      | ExpenseSchedule_AnnualAmount         | $360,000.000   |
#      | ExpenseSchedule_PaymentRate          | $30.000        |
#      | ExpenseSchedule_FirstPaymentAmount   | $30,000.000    |
#      | ExpenseSchedule_LastPaymentAmount    | $30,000.000    |
#      | calcOptions                          | Payment Amount |
#      | _checkbox_ExpenseSchedule_HoldFlag   | false          |
#
#    And I verify the field "Frequency" is "Monthly"
#    And I verify the field "Rentable Area" is "12,000"
#    And I verify the field "Rate Per" is "Square Feet"
#
#    And I click on the "Cancel" button
#    And I wait for modal window to close
#
#
#    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
#      | name             | value           |
#      | Expense Type     | Percentage Rent |
#      | Expense Category | Expense         |
#      | Begin Date       | 01/01/2010      |
#      | End Date         | 12/31/2020      |
#      | Frequency        | Monthly         |
#      | Period Amount    | $40,000.00      |
#      | Annual Amount    | $480,000.00     |
#
#    And I click on "edit" row action in the grid "BOGridExpenseSchedule" having the following header "End Date" and cell value "12/31/2020"
#      | name            | value       |
#      | Begin Date      | 01/01/2010  |
#      | End Date        | 12/31/2020  |
#      | Approval Status | Review      |
#      | Payment Amount  | $40,000.00  |
#      | Annual Amount   | $480,000.00 |
#      | Rate            | $40.00      |
#      | First Payment   | $40,000.00  |
#      | Last Payment    | $40,000.00  |
#
#    And I switch to default frame
#    And I verify the following fields value on editable page
#      | name                                 | value          |
#      | ExpenseSchedule_BeginDate            | 01/01/2010     |
#      | ExpenseSchedule_EndDate              | 12/31/2020     |
#      | ExpenseSchedule_CodeApprovalStatusID | Review         |
#      | ExpenseSchedule_PaymentAmount        | $40,000.00     |
#      | ExpenseSchedule_AnnualAmount         | $480,000.00    |
#      | ExpenseSchedule_PaymentRate          | $40.00         |
#      | ExpenseSchedule_FirstPaymentAmount   | $40,000.00     |
#      | ExpenseSchedule_LastPaymentAmount    | $40,000.00     |
#      | calcOptions                          | Payment Amount |
#      | _checkbox_ExpenseSchedule_HoldFlag   | false          |
#
#    And I verify the field "Frequency" is "Monthly"
#    And I verify the field "Rentable Area" is "12,000"
#    And I verify the field "Rate Per" is "Square Feet"
#
#    And I click on the "Cancel" button
#    And I wait for modal window to close


    Then I click on the "Generate Rent" action panel button

    And I set following list fields values on editable page
      | name         | value   |
      | mnToGenerate | January |
    Then I set fields values on editable page
      | name         | value |
      | yrToGenerate | 2016  |

    And I fetch record number while generating rent
    And I click "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "4 Payment Transaction records were generated." message appear after generating rent
#    And I verify "4 Payment Transaction record was generated." message appear after generating rent
#    Then I verify "processed." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear

    And I switch to default frame
    And I click on the "Transactions" tab
    And I switch to visible frame
    And I verify a row from grid "thisDiv" having unique value "Base Rent" under column header "Group"
      | name             | value             |
      | Effective Date   | 01/01/2016        |
      | Group            | Base Rent         |
      | Type             | Rent              |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | No                |
      | Total Amount     | ¥10,000           |
      | Primary Tax      | ¥0                |
      | Hold Flag        | No                |

    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Group"
      | name             | value             |
      | Effective Date   | 01/01/2016        |
      | Group            | CAM               |
      | Type             | CAM               |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | No                |
      | Total Amount     | €20,000.00        |
      | Primary Tax      | €0.00             |
      | Hold Flag        | No                |

    And I verify a row from grid "thisDiv" having unique value "Expense" under column header "Group"
      | name             | value             |
      | Effective Date   | 01/01/2016        |
      | Group            | Expense           |
      | Type             | Interior          |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | No                |
      | Total Amount     | $30,000.000       |
      | Primary Tax      | $0.000            |
      | Hold Flag        | No                |

    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Group"
      | name             | value             |
      | Effective Date   | 01/01/2016        |
      | Group            | Lease Expense     |
      | Type             | Percentage Rent   |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | No                |
      | Total Amount     | $40,000.00        |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |

  Examples:
    | Login User   | Login full username  | Entity Name   | Second Level Tab | Third Level Tab    |
    | DeleteAccess | Delete Access Access | 15686Contract | Payment Info     | Recurring Expenses |