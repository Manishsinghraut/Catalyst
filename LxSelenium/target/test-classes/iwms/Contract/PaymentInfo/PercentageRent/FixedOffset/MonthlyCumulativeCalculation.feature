@all
Feature: (Ref : Jira Ticket No : Automation-672) Fixed Offset- Monthly-Cumulative Calculation

  Scenario Outline: I import file for Fixed Offset - Monthly-Cumulative Calculation
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/FixedOffset/"
    And I import following file name:
      | 7FixedOffsetMonthlyCumulative.xml |

  Examples:s
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify sales items
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "Sales" tab
    And I wait for the Loading text to disappear
    And I click sort in header "Sales Period" from grid "thisDiv" in "Sort Ascending"
    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType    | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | Retail Sales | Actual        | 1           | 2014      | $300,000.00      | $300,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 2           | 2014      | $200,000.00      | $200,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 3           | 2014      | $200,000.00      | $200,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 4           | 2014      | $200,000.00      | $200,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 5           | 2014      | $150,000.00      | $150,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 6           | 2014      | $200,000.00      | $200,000.00    | USD      |

    And I click on "Next Page" button in the grid

    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType    | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | Retail Sales | Actual        | 7           | 2014      | $200,000.00      | $200,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 8           | 2014      | $200,000.00      | $200,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 9           | 2014      | $130,000.00      | $130,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 10          | 2014      | $200,000.00      | $200,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 11          | 2014      | $200,000.00      | $200,000.00    | USD      |
      | Sales      | Retail Sales | Actual        | 12          | 2014      | $200,000.00      | $200,000.00    | USD      |

  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                       |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |


  Scenario Outline: As a delete user I verify Recurring expenses, vendor allocation, precent rent,offset and break point line items
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"

    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
      | name             | value           |
      | Expense Type     | Percentage Rent |
      | Expense Category | Expense         |
      | Begin Date       |                 |
      | End Date         |                 |
      | Frequency        | Annually        |
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
      | Actions         | edit              |

    And I click on the "Percentage Rent" tab
    And I verify a row from grid "thisDiv" having unique value "01/01/2000" under column header "Begin Date"
      | name                | value      |
      | End Date            | 12/31/2020 |
      | Sales Group         | Sales      |
      | Description         |            |
      | Calculation Method  | Cumulative |
      | Payment Frequency   | Monthly    |
      | Reporting Frequency |            |

    And I verify the following fields value on editable page
      | name                                    | value           |
      | PercentageRent_CodeSalesGroupID         | Sales           |
      | PercentageRent_BeginDate                | 01/01/2000      |
      | PercentageRent_EndDate                  | 12/31/2020      |
      | PercentageRent_CodeBillingFrequencyID   | Monthly         |
      | PercentageRent_CodeExpenseGroupID       | Lease Expense   |
      | PercentageRent_CodeExpenseTypeID        | Percentage Rent |
      | PercentageRent_CodePercentageRentTypeID | Cumulative      |

    And I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "01/01/2000" under column header "Begin Date"
      | name                 | value       |
      | End Date             | 12/31/2020  |
      | Sales Group          | Sales       |
      | Breakpoint Amount #1 | $100,000.00 |
      | Breakpoint Rate #1   | 10.00000%   |
      | Breakpoint Amount #2 | $200,000.00 |
      | Breakpoint Rate #2   | 5.00000%    |
      | Breakpoint Amount #3 |             |
      | Breakpoint Rate #3   |             |

    And I verify a row from grid "BOGridVariableRentOffset" having unique value "01/01/2000" under column header "Begin Date"
      | name                | value              |
      | End Date            | 12/31/2020         |
      | Sales Group         | Sales              |
      | Expense Group       |                    |
      | Expense Type        |                    |
      | Offset Group        | Fixed Offset Group |
      | Offset Type         | Fixed Offset Type  |
      | Fixed Offset Amount | $600.00            |
      | Cap Percent         |                    |
      | Cap Amount          |                    |

  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                       |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |


  Scenario Outline: As a delete user I verify calculated amounts
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "Percentage Rent" tab
    And I wait for the Loading text to disappear
    And I select an option "Percentage Rent (Single BP) Schedule"
    And I wait for the Loading text to disappear
    And I select "December" month and "2014" year from dropdown in schedule details
    And I click on "Refresh" Button
    And I verify the Percentage Rent (Single BP) Schedule values at the bottom of the page
      | name                  | value       |
      | Total Percentage Rent | $119,000.00 |
      | Amount Already Paid   | $0.00       |
      | Percentage Rent Owed  | $119,000.00 |
      | Offset Amount         | $7,200.00   |
      | Net Amount Due        | $111,800.00 |

    And I verify line items in the single BP schedule grid "BOGridVirtualSalesPeriod"
      | salesGroup | monthYear       | grossSales | excludedSales | leaseYTDSales | breakpoint | salesPastBreakpoint | rate   | totalPercentRent | amountPaid | percentOwed |
      | Sales      | January, 2014   | $300,000   | $0            | $300,000      | $100,000   | $100,000            | 10.00% | $15,000.00       |            | $15,000.00  |
      | Sales      | February, 2014  | $200,000   | $0            | $500,000      | $100,000   | $100,000            | 10.00% | $25,000.00       |            | $25,000.00  |
      | Sales      | March, 2014     | $200,000   | $0            | $700,000      | $100,000   | $100,000            | 10.00% | $35,000.00       |            | $35,000.00  |
      | Sales      | April, 2014     | $200,000   | $0            | $900,000      | $100,000   | $100,000            | 10.00% | $45,000.00       |            | $45,000.00  |
      | Sales      | May, 2014       | $150,000   | $0            | $1,050,000    | $100,000   | $100,000            | 10.00% | $52,500.00       |            | $52,500.00  |
      | Sales      | June, 2014      | $200,000   | $0            | $1,250,000    | $100,000   | $100,000            | 10.00% | $62,500.00       |            | $62,500.00  |
      | Sales      | July, 2014      | $200,000   | $0            | $1,450,000    | $100,000   | $100,000            | 10.00% | $72,500.00       |            | $72,500.00  |
      | Sales      | August, 2014    | $200,000   | $0            | $1,650,000    | $100,000   | $100,000            | 10.00% | $82,500.00       |            | $82,500.00  |
      | Sales      | September, 2014 | $130,000   | $0            | $1,780,000    | $100,000   | $100,000            | 10.00% | $89,000.00       |            | $89,000.00  |
      | Sales      | October, 2014   | $200,000   | $0            | $1,980,000    | $100,000   | $100,000            | 10.00% | $99,000.00       |            | $99,000.00  |
      | Sales      | November, 2014  | $200,000   | $0            | $2,180,000    | $100,000   | $100,000            | 10.00% | $109,000.00      |            | $109,000.00 |
      | Sales      | December, 2014  | $200,000   | $0            | $2,380,000    | $100,000   | $100,000            | 10.00% | $119,000.00      |            | $119,000.00 |
#      | salesGroup | monthYear       | grossSales | excludedSales | leaseYTDSales | breakpoint  | salesPastBreakpoint | rate   | totalPercentRent | amountPaid | percentOwed |
#      | Sales      | January, 2014   | $300,000   | $0            | $300,000.00   | $100,000.00 | $100,000            | 10.00% | $15,000          |            | $15,000.00  |
#      | Sales      | February, 2014  | $200,000   | $0            | $500,000.00   | $100,000.00 | $100,000            | 10.00% | $25,000          |            | $25,000.00  |
#      | Sales      | March, 2014     | $200,000   | $0            | $700,000.00   | $100,000.00 | $100,000            | 10.00% | $35,000          |            | $35,000.00  |
#      | Sales      | April, 2014     | $200,000   | $0            | $900,000.00   | $100,000.00 | $100,000            | 10.00% | $45,000          |            | $45,000.00  |
#      | Sales      | May, 2014       | $150,000   | $0            | $1,050,000.00 | $100,000.00 | $100,000            | 10.00% | $52,500          |            | $52,500.00  |
#      | Sales      | June, 2014      | $200,000   | $0            | $1,250,000.00 | $100,000.00 | $100,000            | 10.00% | $62,500          |            | $62,500.00  |
#      | Sales      | July, 2014      | $200,000   | $0            | $1,450,000.00 | $100,000.00 | $100,000            | 10.00% | $72,500          |            | $72,500.00  |
#      | Sales      | August, 2014    | $200,000   | $0            | $1,650,000.00 | $100,000.00 | $100,000            | 10.00% | $82,500          |            | $82,500.00  |
#      | Sales      | September, 2014 | $130,000   | $0            | $1,780,000.00 | $100,000.00 | $100,000            | 10.00% | $89,000          |            | $89,000.00  |
#      | Sales      | October, 2014   | $200,000   | $0            | $1,980,000.00 | $100,000.00 | $100,000            | 10.00% | $99,000          |            | $99,000.00  |
#      | Sales      | November, 2014  | $200,000   | $0            | $2,180,000.00 | $100,000.00 | $100,000            | 10.00% | $109,000         |            | $109,000.00 |
#      | Sales      | December, 2014  | $200,000   | $0            | $2,380,000.00 | $100,000.00 | $100,000            | 10.00% | $119,000         |            | $119,000.00 |

  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                       |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |


  Scenario Outline: As a delete user I process payment
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "Percentage Rent" tab
    And I wait for the Loading text to disappear
    And I select an option "Percentage Rent (Single BP) Schedule"
    And I wait for the Loading text to disappear
    And I click on the "Process Payment" action panel button
    And I see the "Process Payment" modal window
    And I set following list fields values on editable page
      | name         | value   |
      | mnToGenerate | <Month> |
    Then I set fields values on editable page
      | name         | value |
      | yrToGenerate | 2014  |
    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear
    And I click on the "Transactions" tab
    And I click sort in header "Effective Date" from grid "thisDiv" in "Sort Descending"
    And I verify a row from grid "thisDiv" having unique value "<Date>" under column header "Effective Date"
      | name             | value             |
      | Group            | Lease Expense     |
      | Type             | Percentage Rent   |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | <Total Amount>    |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |

  Examples:
    | Date       | Total Amount | Month     | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                       |
    | 01/31/2014 | $14,400.00   | January   | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |
    | 02/28/2014 | $9,400.00    | February  | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |
    | 03/31/2014 | $9,400.00    | March     | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |
    | 04/30/2014 | $9,400.00    | April     | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |
    | 05/31/2014 | $6,900.00    | May       | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |
    | 06/30/2014 | $9,400.00    | June      | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |
    | 07/31/2014 | $9,400.00    | July      | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |
    | 08/31/2014 | $9,400.00    | August    | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |
    | 09/30/2014 | $5,900.00    | September | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |
    | 10/31/2014 | $9,400.00    | October   | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |
    | 11/30/2014 | $9,400.00    | November  | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |
    | 12/31/2014 | $9,400.00    | December  | DeleteAccess | Delete Access Access | Contract | Payment Info     | 7.Fixed Offset-Monthly-Cumulative |