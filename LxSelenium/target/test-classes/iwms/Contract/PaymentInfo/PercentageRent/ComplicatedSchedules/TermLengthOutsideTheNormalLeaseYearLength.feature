@all
Feature: (Ref : Jira Ticket No : Automation-660) Percent Rent - Term length outside the normal lease year length

  Scenario Outline: I import file for Percent Rent - Term length outside the normal lease year length
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/"
    And I import following file name:
      | PartialTermContract.xml |

  Examples:s
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify sales items
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "Sales" tab
    And I wait for the Loading text to disappear
    And I click sort in header "Sales Period" from grid "thisDiv" in "Sort Ascending"
    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType    | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | Retail Sales | Actual        | 1           | 2016      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 1           | 2015      | $55,000.00       | $55,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 2           | 2016      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 2           | 2015      | $60,000.00       | $60,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 3           | 2016      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 3           | 2015      | $65,000.00       | $65,000.00     | USD      |

    And I click on "Next Page" button in the grid

    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType    | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | Retail Sales | Actual        | 4           | 2015      | $40,000.00       | $40,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 5           | 2015      | $70,000.00       | $70,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 6           | 2015      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 7           | 2015      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 8           | 2015      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 9           | 2015      | $100,000.00      | $100,000.00    | USD      |

    And I click on "Next Page" button in the grid

    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType    | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | Retail Sales | Actual        | 10          | 2015      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 11          | 2015      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 12          | 2016      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 12          | 2015      | $100,000.00      | $100,000.00    | USD      |

  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Entity Name           |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | Partial Term Contract |


  Scenario Outline: As a delete user I ensure that there is a line item for Recurring Expense, Vendor Allocation and Percentage line item & Breakpoint amount
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "Base Rent" under column header "Expense Group"
      | name             | value   |
      | Expense Type     | Rent    |
      | Expense Category | Expense |
      | Begin Date       |         |
      | End Date         |         |
      | Frequency        | None    |
      | Period Amount    |         |
      | Annual Amount    |         |

    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium-Employer" under column header "Vendor"
      | name            | value             |
      | Vendor#         | 1234              |
      | Payment Percent | 100.00000%        |
      | Address         | 5601 Democracy Dr |
      | City            | Plano             |
      | State           | TX                |
      | Begin Date      | 01/01/2015        |
      | End Date        | 03/31/2016        |
      | Notes           |                   |
    And I click on the "Percentage Rent" tab
    And I verify a row from grid "thisDiv" having unique value "01/01/2015" under column header "Begin Date"
      | name                | value                      |
      | End Date            | 03/31/2016                 |
      | Sales Group         | Sales                      |
      | Description         | Partial Term for 15 months |
      | Payment Frequency   | Annually                   |
      | Reporting Frequency | Annually                   |

    And I verify the following fields value on editable page
      | name                                   | value      |
      | PercentageRent_CodeSalesGroupID        | Sales      |
      | PercentageRent_BeginDate               | 01/01/2015 |
      | PercentageRent_EndDate                 | 03/31/2016 |
      | _checkbox_PercentageRent_IsPartialTerm | true       |

    And I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "Sales" under column header "Sales Group"
      | name                  | value      |
      | Begin Date            | 01/01/2015 |
      | End Date              | 03/31/2016 |
      | Portioned Sales Group |            |
      | Natural Rate          |            |
      | Breakpoint Amount #1  | $50,000.00 |
      | Breakpoint Rate #1    | 10.00000%  |
      | Breakpoint Amount #2  |            |
      | Breakpoint Rate #2    |            |
      | Breakpoint Amount #3  |            |
      | Breakpoint Rate #3    |            |
      | Notes                 |            |

    And I click "edit" row action for the row that has "01/01/2015" in column "Begin Date"
    And I switch to default frame
    And I see the "Edit Percentage Rent Breakpoint  ***Required fields in red" modal window
    And I verify the following fields value on editable page
      | name                                       | value      |
      | PercentageRentBreakpoint_CodeSalesGroupID  | Sales      |
      | PercentageRentBreakpoint_BreakpointAmount1 | $50,000.00 |
      | PercentageRentBreakpoint_BreakpointRate1   | 10.00000%  |
    And I click on the "Cancel" button

  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Entity Name           |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | Partial Term Contract |

  Scenario Outline: As a delete user I process payment and verify transactions
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "Percentage Rent" tab
    And I select an option "Percentage Rent (Single BP) Schedule"
    And I wait for the Loading text to disappear
    And I select "January" month and "2015" year from dropdown in schedule details
    And I click on "Refresh" Button
    And I verify line items in the single BP schedule grid "BOGridVirtualSalesPeriod"
      | salesGroup | monthYear       | grossSales | excludedSales | leaseYTDSales | breakpoint | salesPastBreakpoint | rate   | totalPercentRent | amountPaid | percentOwed |
      | Sales      | January, 2015   | $55,000    | $0            |               |            |                     |        |                  |            |             |
      | Sales      | February, 2015  | $60,000    | $0            |               |            |                     |        |                  |            |             |
      | Sales      | March, 2015     | $65,000    | $0            |               |            |                     |        |                  |            |             |
      | Sales      | April, 2015     | $40,000    | $0            |               |            |                     |        |                  |            |             |
      | Sales      | May, 2015       | $70,000    | $0            |               |            |                     |        |                  |            |             |
      | Sales      | June, 2015      | $100,000   | $0            |               |            |                     |        |                  |            |             |
      | Sales      | July, 2015      | $100,000   | $0            |               |            |                     |        |                  |            |             |
      | Sales      | August, 2015    | $100,000   | $0            |               |            |                     |        |                  |            |             |
      | Sales      | September, 2015 | $100,000   | $0            |               |            |                     |        |                  |            |             |
      | Sales      | October, 2015   | $100,000   | $0            |               |            |                     |        |                  |            |             |
      | Sales      | November, 2015  | $100,000   | $0            |               |            |                     |        |                  |            |             |
      | Sales      | December, 2015  | $100,000   | $0            | $990,000      | $49,836    | $940,164            | 10.00% | $94,016.39       |            | $94,016.39  |
      | Sales      | January, 2016   | $100,000   | $0            |               |            |                     |        |                  |            |             |
      | Sales      | February, 2016  | $100,000   | $0            |               |            |                     |        |                  |            |             |
      | Sales      | March, 2016     | $100,000   | $0            | $1,290,000    | $62,295    | $1,227,705          | 10.00% | $122,770.49      |            | $122,770.49 |
#      | salesGroup | monthYear       | grossSales | excludedSales | leaseYTDSales | breakpoint | salesPastBreakpoint | rate   | totalPercentRent | amountPaid | percentOwed |
#      | Sales      | January, 2015   | $55,000    | $0            |               |            |                     |        |                  |            |             |
#      | Sales      | February, 2015  | $60,000    | $0            |               |            |                     |        |                  |            |             |
#      | Sales      | March, 2015     | $65,000    | $0            |               |            |                     |        |                  |            |             |
#      | Sales      | April, 2015     | $40,000    | $0            |               |            |                     |        |                  |            |             |
#      | Sales      | May, 2015       | $70,000    | $0            |               |            |                     |        |                  |            |             |
#      | Sales      | June, 2015      | $100,000   | $0            |               |            |                     |        |                  |            |             |
#      | Sales      | July, 2015      | $100,000   | $0            |               |            |                     |        |                  |            |             |
#      | Sales      | August, 2015    | $100,000   | $0            |               |            |                     |        |                  |            |             |
#      | Sales      | September, 2015 | $100,000   | $0            |               |            |                     |        |                  |            |             |
#      | Sales      | October, 2015   | $100,000   | $0            |               |            |                     |        |                  |            |             |
#      | Sales      | November, 2015  | $100,000   | $0            |               |            |                     |        |                  |            |             |
#      | Sales      | December, 2015  | $100,000   | $0            | $990,000.00   | $49,836.06 | $940,164            | 10.00% | $94,016          |            | $94,016.39  |
#      | Sales      | January, 2016   | $100,000   | $0            |               |            |                     |        |                  |            |             |
#      | Sales      | February, 2016  | $100,000   | $0            |               |            |                     |        |                  |            |             |
#      | Sales      | March, 2016     | $100,000   | $0            | $1,290,000.00 | $62,295.08 | $1,227,705          | 10.00% | $122,770         |            | $122,770.49 |

    And I click on the "Process Payment" action panel button
    And I see the "Process Payment" modal window
    And I set following list fields values on editable page
      | name         | value |
      | mnToGenerate | March |
    Then I set fields values on editable page
      | name         | value |
      | yrToGenerate | 2016  |
    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear
    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "03/31/2016" under column header "Effective Date"
      | name             | value             |
      | Group            | Base Rent         |
      | Type             | Rent              |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | $122,770.49       |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |

  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Entity Name           |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | Partial Term Contract |