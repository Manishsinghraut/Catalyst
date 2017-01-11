@all
Feature: Calculated Expense Offset with cap amount (Ref : Jira Ticket No : Automation-765)

  Scenario Outline: Import the attached Calculated Expense Offset with Cap Amount contract xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Offset/CalculatedAdjustments/"
    And I import following files:
      | CalculatedExpenseOffsetWithCapAmount.xml |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete
  1. Navigate to the contract "Calculated Expense Offset with Cap Amount"
  2. Navigate to Payment Info->Recurring Expenses and ensure that Expenses Setup line item exist, which includes Vendor Allocation
  3. Navigate to Payment Info->Transactions and ensure that 2 transactions line item exist for different vendor
  4. Navigate to Payment Info->Percentage Rent and ensure that Percentage Rent line item and Artificial BP Schedule exist
  5. Navigate to Payment Info->Sales and ensure that sales data exist for 12 period for 2014

    Given I navigate to entity type "<Item>" named "<Entity Name>" through search option
    And I navigate to second level tab "<Second Level Tab>" and third level "Sales" tab of entity "Contract"
    And I click on the "Sales" tab
    And I wait for the Loading text to disappear
    And I click sort in header "Sales Period" from grid "thisDiv" in "Sort Ascending"
    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType    | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | Retail Sales | Actual        | 1           | 2015      | $110,000.00      | $110,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 2           | 2015      | $127,000.00      | $127,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 3           | 2015      | $132,000.00      | $132,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 4           | 2015      | $128,980.00      | $128,980.00    | USD      |
      | Sales      | Retail Sales | Actual        | 5           | 2015      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 6           | 2015      | $117,000.00      | $117,000.00    | USD      |

    And I click on "Next Page" button in the grid

    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType    | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | Retail Sales | Actual        | 7           | 2015      | $99,987.00       | $99,987.00     | USD      |
      | Sales      | Retail Sales | Actual        | 8           | 2015      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 9           | 2015      | $160,000.00      | $160,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 10          | 2015      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 11          | 2015      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 12          | 2015      | $100,000.00      | $100,000.00    | USD      |

    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
      | name             | value           |
      | Expense Type     | Percentage Rent |
      | Expense Category | Expense         |
      | Begin Date       |                 |
      | End Date         |                 |
      | Frequency        | Monthly         |
      | Period Amount    |                 |
      | Annual Amount    |                 |
    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium-Employer" under column header "Vendor"
      | name            | value             |
      | Vendor#         | 1234              |
      | Payment Percent | 100.00000%        |
      | Address         | 5601 Democracy Dr |
      | City            | Plano             |
      | State           | TX                |
      | Begin Date      | 01/01/2000        |
      | End Date        | 12/31/2020        |
      | Notes           |                   |

    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Vendor A" under column header "Vendor"
      | name            | value        |
      | Vendor#         |              |
      | Payment Percent | 100.00000%   |
      | Address         | 8025 Ohio Dr |
      | City            | Plano        |
      | State           | TX           |
      | Begin Date      | 01/01/2000   |
      | End Date        | 12/31/2020   |
      | Notes           |              |

    And I click on the "Percentage Rent" tab
    And I verify a row from grid "thisDiv" having unique value "01/01/2010" under column header "Begin Date"
      | name                | value      |
      | End Date            | 12/31/2020 |
      | Sales Group         | Sales      |
      | Description         |            |
      | Calculation Method  | Per Period |
      | Payment Frequency   | Monthly    |
      | Reporting Frequency | None       |

    And I click " Add Expense Offset... " button
    And I switch to default frame
    And I select following checkboxes by label
      | name                  |
      | Calculated Adjustment |
    And I set list fields values on editable page
      | name                                  | value                |
      | VariableRentOffset_CodeSalesGroupID   | Sales                |
      | VariableRentOffset_CodeExpenseGroupID | Lease Expense        |
      | VariableRentOffset_CodeExpenseTypeID  | Building Maintenance |
      | VariableRentOffset_CodeOffsetGroupID  | Fixed Offset Group   |
      | VariableRentOffset_CodeOffsetTypeID   | Fixed Offset Type    |
      | VariableRentOffset_CodeCurrencyTypeID | USD                  |
    And I set fields values on editable page
      | name                         | value      |
      | VariableRentOffset_BeginDate | 01/01/2000 |
      | VariableRentOffset_EndDate   | 12/31/2020 |
      | VariableRentOffset_CapAmount | 2000       |

    And I click on the "Add" button
    And I verify a row from grid "BOGridVariableRentOffset" having unique value "01/01/2000" under column header "Begin Date"
      | name          | value                |
      | Sales Group   | Sales                |
      | End Date      | 12/31/2020           |
      | Expense Group | Lease Expense        |
      | Expense Type  | Building Maintenance |
      | Offset Group  | Fixed Offset Group   |
      | Offset Type   | Fixed Offset Type    |
      | Cap Amount    | $2,000.00            |

    And I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "01/01/2010" under column header "Begin Date"
      | name                  | value         |
      | End Date              | 12/31/2020    |
      | Sales Group           | Sales         |
      | Portioned Sales Group |               |
      | Natural Rate          |               |
      | Breakpoint Amount #1  | $1,200,000.00 |
      | Breakpoint Rate #1    | 10.00000%     |
      | Breakpoint Amount #2  |               |
      | Breakpoint Rate #2    |               |
      | Breakpoint Amount #3  |               |
      | Breakpoint Rate #3    |               |

    And I click on the "Transactions" tab
    And I verify all rows count "2" in the grid "thisDiv"
    And I verify a row from grid "thisDiv" having unique value "02/01/2015" under column header "Effective Date"
      | name             | value                |
      | Group            | Lease Expense        |
      | Type             | Building Maintenance |
      | Category         | Expense              |
      | Vendor           | Vendor A             |
      | Vendor#          |                      |
      | One-Time Expense | Yes                  |
      | Total Amount     | $1,500.00            |
      | Primary Tax      |                      |
      | Hold Flag        | No                   |
    And I verify a row from grid "thisDiv" having unique value "02/01/2015" under column header "Effective Date"
      | name             | value                |
      | Group            | Lease Expense        |
      | Type             | Building Maintenance |
      | Category         | Expense              |
      | Vendor           | Selenium-Employer    |
      | Vendor#          | 1234                 |
      | One-Time Expense | Yes                  |
      | Total Amount     | $1,000.00            |
      | Primary Tax      |                      |
      | Hold Flag        | No                   |

    Examples:
      | Item     | Second Level Tab | Entity Name                               |
      | Contract | Payment Info     | Calculated Expense Offset with Cap Amount |


  Scenario Outline: As a delete user I process payment aand verify them in transactions page
    When I navigate to entity type "<Item>" named "<Entity Name>" through search option
    And I navigate to second level tab "<Second Level Tab>" and third level "Percentage Rent" tab of entity "Contract"
    And I wait for the Loading text to disappear
    And I select an option "Percentage Rent (Single BP) Schedule"
    And I wait for the Loading text to disappear
    And I select "February" month and "2015" year from dropdown in schedule details to view the details
    And I click on offset amount link "$2,000.00"
    And I see modal window

    And I verify a unique row in grid "^Grid_" having unique value "02/01/2015" under column header "Effective Date"
      | name         | value                |
      | Group        | Lease Expense        |
      | Type         | Building Maintenance |
      | Category     | Expense              |
      | Vendor       | Vendor A             |
      | Vendor#      |                      |
      | Total Amount | $1,500.00            |
      | Primary Tax  |                      |

    And I verify a unique row in grid "^Grid_" having unique value "02/01/2015" under column header "Effective Date"
      | name         | value                |
      | Group        | Lease Expense        |
      | Type         | Building Maintenance |
      | Category     | Expense              |
      | Vendor       | Selenium-Employer    |
      | Vendor#      | 1234                 |
      | Total Amount | $1,000.00            |
      | Primary Tax  |                      |
    And I click on the "Close" button

    And I click on the "Process Payment" action panel button
    And I see the "Process Payment" modal window
    And I set following list fields values on editable page
      | name         | value    |
      | mnToGenerate | February |
    Then I set fields values on editable page
      | name         | value |
      | yrToGenerate | 2015  |
    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear

    And I click on the "Transactions" tab
    And I verify all rows count "3" in the grid "thisDiv"
    And I verify a row from grid "thisDiv" having unique value "02/28/2015" under column header "Effective Date"
      | name             | value             |
      | Group            | Lease Expense     |
      | Type             | Percentage Rent   |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | $700.00           |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |

    Examples:
      | Item     | Second Level Tab | Entity Name                               |
      | Contract | Payment Info     | Calculated Expense Offset with Cap Amount |

