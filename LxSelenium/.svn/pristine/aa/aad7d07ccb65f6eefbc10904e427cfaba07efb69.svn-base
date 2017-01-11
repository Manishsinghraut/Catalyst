@all
Feature: (Ref : Jira Ticket No : Automation-701) Percent Rent with exclusions

  Scenario Outline: I import file for Calculating Percent Rent when using alias sales group
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ExclusionsAndSalesGroupAlias/"
    And I import following file name:
      | PercentRentWithExclusions.xml |

  Examples:s
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I add sales types and sales items

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "Payment Info"
    And I click on the "Sales" tab
    And I click on the "Add item" action panel button
    And I check for complete frame 'loading...'
    And I set following fields value on editable page
      | name                      | value        |
      | Sales_SalesPeriod         | 12           |
      | Sales_SalesYear           | 2015         |
      | Sales_GrossSalesAmount    | 100000       |
      | Sales_NetSalesAmount      | 100000       |
      | Sales_CodeSalesCategoryID | Actual       |
      | Sales_CodeSalesGroupID    | Sales        |
      | Sales_CodeCurrencyTypeID  | USD          |
      | Sales_CodeSalesTypeID     | Retail Sales |
      | Sales_CodeCurrencyTypeID  | USD          |


    And I click on the "Save Changes" action panel button

    And I click on the "Add item" action panel button
    And I check for complete frame 'loading...'
    And I set following fields value on editable page
      | name                      | value                   |
      | Sales_SalesPeriod         | 12                      |
      | Sales_SalesYear           | 2015                    |
      | Sales_GrossSalesAmount    | 1000                    |
      | Sales_NetSalesAmount      | 1000                    |
      | Sales_CodeSalesCategoryID | Actual                  |
      | Sales_CodeSalesGroupID    | Sales                   |
      | Sales_CodeCurrencyTypeID  | USD                     |
      | Sales_CodeSalesTypeID     | Credit Card Sales - 701 |
      | Sales_CodeCurrencyTypeID  | USD                     |

    And I click on the "Save Changes" action panel button

    And I click on the "Add item" action panel button
    And I check for complete frame 'loading...'
    And I set following fields value on editable page
      | name                   | value |
      | Sales_SalesPeriod      | 12    |
      | Sales_SalesYear        | 2015  |
      | Sales_GrossSalesAmount | 5000  |
      | Sales_NetSalesAmount   | 5000  |

    And I set list fields values on editable page
      | name                      | value                |
      | Sales_CodeSalesGroupID    | Sales                |
      | Sales_CodeSalesCategoryID | Actual               |
      | Sales_CodeCurrencyTypeID  | USD                  |
      | Sales_CodeSalesTypeID     | Employee Sales - 701 |
      | Sales_CodeCurrencyTypeID  | USD                  |

    And I click on the "Save Changes" action panel button

    And I click sort in header "Sales Type" from grid "thisDiv" in "Sort Ascending"
    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType               | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | Credit Card Sales - 701 | Actual        | 12          | 2015      | $1,000.00        | $1,000.00      | USD      |
      | Sales      | Employee Sales - 701    | Actual        | 12          | 2015      | $5,000.00        | $5,000.00      | USD      |
      | Sales      | Retail Sales            | Actual        | 12          | 2015      | $100,000.00      | $100,000.00    | USD      |

  Examples:
    | Login User   | Login full username  | Item     | Entity Name                  |
    | DeleteAccess | Delete Access Access | Contract | Percent Rent With Exclusions |


  Scenario Outline: As a delete user
  1. I Create Sales Exclusion
  2. I verify The Percent Rent (Multi BP) Schedule should be displayed correctly.
  3. I verify Credit Card Fees should be deducted from the Gross Sales amount to derive the Net Sales.
  4. I verify credit Card Fees is listed as an exclusion it needs to be deducted from the Gross Sales

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "Payment Info"
    And I click on the "Percentage Rent" tab
    And I click on row from grid "thisDiv" having unique value "Sales" under column header "Sales Group"
      | name              | value     |
      | Payment Frequency | Quarterly |
    And I click " Add Sales Exclusion... " button
    And I switch to default frame
    And I see the "Add Sales Exclusion  ***Required fields in red" modal window
    And I set following fields value on editable page
      | name                              | value      |
      | SalesExclusion_BeginDate          | 02/05/2015 |
      | SalesExclusion_EndDate            | 02/28/2016 |
      | SalesExclusion_CodeCurrencyTypeID | USD        |

    And I set list fields values on editable page
      | name                            | value                   |
      | SalesExclusion_CodeSalesGroupID | Sales                   |
      | SalesExclusion_CodeSalesTypeID  | Credit Card Sales - 701 |
    And I click on the "Add" button

    And I check for complete frame 'loading...'
    And I click " Add Sales Exclusion... " button
    And I switch to default frame
    And I see the "Add Sales Exclusion  ***Required fields in red" modal window
    And I set following fields value on editable page
      | name                              | value      |
      | SalesExclusion_BeginDate          | 02/05/2015 |
      | SalesExclusion_EndDate            | 02/28/2016 |
      | SalesExclusion_CodeCurrencyTypeID | USD        |
    And I set list fields values on editable page
      | name                            | value                |
      | SalesExclusion_CodeSalesGroupID | Sales                |
      | SalesExclusion_CodeSalesTypeID  | Employee Sales - 701 |
    And I click on the "Add" button
    And I check for complete frame 'loading...'
    And I select an option "Percentage Rent (Single BP) Schedule"
    And I select "January" month and "2015" year from dropdown in schedule details
    And I click on "Refresh" Button
    And I verify line items in the single BP schedule grid "BOGridVirtualSalesPeriod"
      | salesGroup | monthYear       | grossSales | excludedSales | leaseYTDSales | breakpoint | salesPastBreakpoint | rate   | totalPercentRent | amountPaid | percentOwed |
      | Sales      | January, 2015   |            |               |               |            |                     |        |                  |            |             |
      | Sales      | February, 2015  |            |               |               |            |                     |        |                  |            |             |
      | Sales      | March, 2015     |            |               | $0            | $100,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | April, 2015     |            |               |               |            |                     |        |                  |            |             |
      | Sales      | May, 2015       |            |               |               |            |                     |        |                  |            |             |
      | Sales      | June, 2015      |            |               | $0            | $100,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | July, 2015      |            |               |               |            |                     |        |                  |            |             |
      | Sales      | August, 2015    |            |               |               |            |                     |        |                  |            |             |
      | Sales      | September, 2015 |            |               | $0            | $100,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | October, 2015   |            |               |               |            |                     |        |                  |            |             |
      | Sales      | November, 2015  |            |               |               |            |                     |        |                  |            |             |
      | Sales      | December, 2015  | $105,000   | $6,000        | $99,000       | $100,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
#      | salesGroup | monthYear       | grossSales | excludedSales | leaseYTDSales | breakpoint  | salesPastBreakpoint | rate   | totalPercentRent | amountPaid | percentOwed |
#      | Sales      | January, 2015   |            |               |               |             |                     |        |                  |            |             |
#      | Sales      | February, 2015  |            |               |               |             |                     |        |                  |            |             |
#      | Sales      | March, 2015     |            |               | $0.00         | $100,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | April, 2015     |            |               |               |             |                     |        |                  |            |             |
#      | Sales      | May, 2015       |            |               |               |             |                     |        |                  |            |             |
#      | Sales      | June, 2015      |            |               | $0.00         | $100,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | July, 2015      |            |               |               |             |                     |        |                  |            |             |
#      | Sales      | August, 2015    |            |               |               |             |                     |        |                  |            |             |
#      | Sales      | September, 2015 |            |               | $0.00         | $100,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | October, 2015   |            |               |               |             |                     |        |                  |            |             |
#      | Sales      | November, 2015  |            |               |               |             |                     |        |                  |            |             |
#      | Sales      | December, 2015  | $105,000   | $6,000        | $99,000.00    | $100,000.00 | $0                  | 10.00% | $0               |            | $0.00       |


  Examples:
    | Login User   | Login full username  | Item     | Entity Name                  |
    | DeleteAccess | Delete Access Access | Contract | Percent Rent With Exclusions |