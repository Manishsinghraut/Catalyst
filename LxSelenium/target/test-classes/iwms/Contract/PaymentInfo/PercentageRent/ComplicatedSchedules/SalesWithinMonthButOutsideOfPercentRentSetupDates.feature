@all
Feature: (Ref : Jira Ticket No : Automation-658) Sales within month but outside of Percent Rent Setup Dates

  Scenario Outline: I import file for Sales within month but outside of Percent Rent Setup Dates
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/"
    And I import following file name:
      | SalesWithinMonthButOutsideOfPercentRentSetupDates-658.xml |

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
      | salesGroup  | salesType | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales Lease | Add Sales | Actual        | 1           | 2000      | $2,000,000.00    | $2,000,000.00  | USD      |
      | Sales Lease | Add Sales | Actual        | 2           | 2000      | $1,000,000.00    | $1,000,000.00  | USD      |
      | Sales Lease | Add Sales | Actual        | 3           | 2000      | $2,000,000.00    | $2,000,000.00  | USD      |
      | Sales Lease | Add Sales | Actual        | 4           | 2000      | $1,500,000.00    | $1,500,000.00  | USD      |
      | Sales Lease | Add Sales | Actual        | 5           | 2000      | $1,500,000.00    | $1,500,000.00  | USD      |

    And I verify the following fields value on editable page
      | name                | value      |
      | Sales_EffectiveDate | 05/31/2000 |

  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                                                |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | Sales within month but outside of Percent Rent Setup Dates |

  Scenario Outline:As a delete user I verify Sales within month but outside of Percent Rent Setup Dates
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear in grid
    And I click on the "Add item" action panel button
    And I wait for the Loading text to disappear
    And I verify a row from grid "thisDiv" having unique value "01/01/2000" under column header "Begin Date"
      | name                | value       |
      | End Date            | 05/25/2000  |
      | Sales Group         | Sales Lease |
      | Description         |             |
      | Calculation Method  | Per Period  |
      | Payment Frequency   | Monthly     |
      | Reporting Frequency | Monthly     |

    And I verify the following fields value on editable page
      | name                                    | value           |
      | PercentageRent_CodeSalesGroupID         | Sales Lease     |
      | PercentageRent_BeginDate                | 01/01/2000      |
      | PercentageRent_EndDate                  | 05/25/2000      |
      | PercentageRent_CodeBillingFrequencyID   | Monthly         |
      | PercentageRent_CodeReportingFrequencyID | Monthly         |
      | PercentageRent_CodeExpenseGroupID       | Lease Expense   |
      | PercentageRent_CodeExpenseTypeID        | Percentage Rent |
      | PercentageRent_CodeCurrencyTypeID       | USD             |
      | PercentageRent_CodePercentageRentTypeID | Per Period      |

    And I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "01/01/2000" under column header "Begin Date"
      | name                 | value         |
      | End Date             | 05/25/2020    |
      | Sales Group          | Sales Lease   |
      | Breakpoint Amount #1 | $1,000,000.00 |
      | Breakpoint Rate #1   | 10.00000%     |
      | Breakpoint Amount #2 |               |
      | Breakpoint Rate #2   |               |
      | Breakpoint Amount #3 |               |
      | Breakpoint Rate #3   |               |

  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                                                |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Sales within month but outside of Percent Rent Setup Dates |


  Scenario Outline: As a delete user I verify month of May should pull in the sales value
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear in grid
    And I select an option "Percentage Rent (Single BP) Schedule"
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name                      | value   |
      | CurrentSelectorDate_month | January |
      | CurrentSelectorDate_year  | 2000    |
    And I click on "Refresh" Button
    And I verify line items in the single BP schedule grid "BOGridVirtualSalesPeriod"
      | salesGroup  | monthYear      | grossSales | excludedSales | leaseYTDSales | breakpoint | salesPastBreakpoint | rate   | totalPercentRent | amountPaid | percentOwed |
      | Sales Lease | January, 2000  | $2,000,000 | $0            | $2,000,000    | $82,994    | $1,917,006          | 10.00% | $191,700.59      |            | $191,700.59 |
      | Sales Lease | February, 2000 | $1,000,000 | $0            | $1,000,000    | $82,994    | $917,006            | 10.00% | $283,401.18      |            | $91,700.59  |
      | Sales Lease | March, 2000    | $2,000,000 | $0            | $2,000,000    | $82,994    | $1,917,006          | 10.00% | $475,101.77      |            | $191,700.59 |
      | Sales Lease | April, 2000    | $1,500,000 | $0            | $1,500,000    | $82,994    | $1,417,006          | 10.00% | $616,802.36      |            | $141,700.59 |
      | Sales Lease | May, 2000      | $1,500,000 | $0            | $1,500,000    | $66,931    | $1,433,069          | 10.00% | $760,109.29      |            | $143,306.93 |

  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                                                |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Sales within month but outside of Percent Rent Setup Dates |