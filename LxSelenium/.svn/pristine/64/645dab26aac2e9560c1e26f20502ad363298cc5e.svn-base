@all
Feature: (Ref : Jira Ticket No : Automation-702) Exclusion for Sales group Alias

  Scenario Outline: I import file for Exclusion for Sales group Alias
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ExclusionsAndSalesGroupAlias/"
    And I import following file name:
      | ExclusionForSalesGroupAliasUpdated.xml |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I  1. verify Recurring expenses line items
  2. verify percentage rent line items
  3. verify sales line items

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
      | name             | value           |
      | Expense Type     | Percentage Rent |
      | Expense Category | Expense         |
      | Begin Date       |                 |
      | End Date         |                 |
      | Frequency        | None            |
      | Period Amount    |                 |
      | Annual Amount    |                 |
    And I click on the "Percentage Rent" tab
    And I verify a row from grid "thisDiv" having unique value "Sales" under column header "Sales Group"
      | name                | value      |
      | Begin Date          | 01/01/2014 |
      | End Date            | 12/31/2020 |
      | Description         |            |
      | Calculation Method  | Per Period |
      | Payment Frequency   | Monthly    |
      | Reporting Frequency | Monthly    |
    And I verify a unique row in grid "thisDiv" having unique value "Sales-Marketing" under column header "Sales Group"
      | name                | value      |
      | Begin Date          | 01/01/2014 |
      | End Date            | 12/31/2020 |
      | Description         |            |
      | Calculation Method  | Per Period |
      | Payment Frequency   | Monthly    |
      | Reporting Frequency | Monthly    |
    And I click on the "Sales" tab
    And I click sort in header "Sales Period" from grid "thisDiv" in "Sort Ascending"
    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType         | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | Credit Card Sales | Actual        | 1           | 2015      | $1,200.00        | $1,200.00      | USD      |
      | Sales      | Refurbish Income  | Actual        | 1           | 2015      | $2,000.00        | $2,000.00      | USD      |
      | Sales      | Retail Sales      | Actual        | 1           | 2015      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Credit Card Sales | Actual        | 2           | 2015      | $2,000.00        | $2,000.00      | USD      |
      | Sales      | Refurbish Income  | Actual        | 2           | 2015      | $3,000.00        | $3,000.00      | USD      |
      | Sales      | Retail Sales      | Actual        | 2           | 2015      | $500,000.00      | $100,000.00    | USD      |
    And I click on "Next Page" button in the grid
    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType         | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | Credit Card Sales | Actual        | 3           | 2015      | $2,500.00        | $2,500.00      | USD      |
      | Sales      | Refurbish Income  | Actual        | 3           | 2015      | $5,000.00        | $5,000.00      | USD      |
      | Sales      | Retail Sales      | Actual        | 3           | 2015      | $165,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales      | Actual        | 4           | 2015      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales      | Actual        | 5           | 2015      | $100,000.00      | $100,000.00    | USD      |
      | Sales      | Retail Sales      | Actual        | 6           | 2015      | $100,000.00      | $100,000.00    | USD      |

    Examples:
      | Login User   | Login full username  | Item     | Entity Name                     |
      | DeleteAccess | Delete Access Access | Contract | Exclusion for Sales group Alias |

  Scenario Outline: As a delete user I  1. add sales exclusion cap
  2. add sales exclusion

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "Payment Info"
    And I click on the "Percentage Rent" tab
    And I verify a row from grid "thisDiv" having unique value "Sales" under column header "Sales Group"
      | name                | value      |
      | Begin Date          | 01/01/2014 |
      | End Date            | 12/31/2020 |
      | Description         |            |
      | Calculation Method  | Per Period |
      | Payment Frequency   | Monthly    |
      | Reporting Frequency | Monthly    |

    And I click " Add Sales Exclusion Cap... " button
    And I switch to default frame
    And I see the "Add Sales Exclusion Cap  ***Required fields in red" modal window
    And I click on the '...' of the type field "SalesExclusionCap_CodeExclusionCapID"
    And I see modal window
    And I click "Add item..." button
    And I set following fields value on editable page
      | name           | value                |
      | ShortName      | <Exclusion Group>    |
      | ActualLongName | Auto Exclusion Group |
    And I click 'Add' button to add line items
    And I set list fields values on editable page
      | name                                 | value             |
      | SalesExclusionCap_CodeSalesGroupID   | Sales-Marketing   |
      | SalesExclusionCap_CodeExclusionCapID | <Exclusion Group> |
      | SalesExclusionCap_CodeCurrencyTypeID | USD               |
    And I set following fields value on editable page
      | name                        | value      |
      | SalesExclusionCap_BeginDate | 01/01/2000 |
      | SalesExclusionCap_EndDate   | 12/31/2020 |
      | SalesExclusionCap_CapAmount | 1000       |

    And I click on the "Add" button
    And I verify a row from grid "BOGridSalesExclusionCap" having unique value "<Exclusion Group>" under column header "Exclusion Group"
      | name        | value           |
      | Sales Group | Sales-Marketing |
      | Begin Date  | 01/01/2000      |
      | End Date    | 12/31/2020      |
      | Cap Percent |                 |
      | Cap Amount  | $1,000.00       |
      | Notes       |                 |

    And I click " Add Sales Exclusion... " button
    And I switch to default frame
    And I see the "Add Sales Exclusion  ***Required fields in red" modal window
    And I set list fields values on editable page
      | name                            | value             |
      | SalesExclusion_CodeSalesGroupID | Sales             |
      | SalesExclusion_CodeSalesTypeID  | Credit Card Sales |

    And I click on the "Add" button
    And I verify a row from grid "BOGridSalesExclusion" having unique value "Sales" under column header "Sales Group"
      | name            | value             |
      | Sales Type      | Credit Card Sales |
      | Exclusion Group |                   |
      | Begin Date      | 01/01/2000        |
      | End Date        | 12/31/2020        |
      | Cap Percent     |                   |
      | Cap Amount      |                   |
      | Notes           |                   |

    And I click " Add Sales Exclusion... " button
    And I switch to default frame
    And I see the "Add Sales Exclusion  ***Required fields in red" modal window
    And I set list fields values on editable page
      | name                               | value             |
      | SalesExclusion_CodeSalesGroupID    | Sales-Marketing   |
      | SalesExclusion_CodeSalesTypeID     | Credit Card Sales |
      | SalesExclusion_ExclusionGroupCapID | <Exclusion Group> |
    And I click on the "Add" button
    And I verify a row from grid "BOGridSalesExclusion" having unique value "Sales-Marketing" under column header "Sales Group"
      | name            | value             |
      | Sales Type      | Credit Card Sales |
      | Exclusion Group | <Exclusion Group> |
      | Begin Date      | 01/01/2000        |
      | End Date        | 12/31/2020        |
      | Cap Percent     |                   |
      | Cap Amount      |                   |
      | Notes           |                   |

    And I click " Add Sales Exclusion... " button
    And I switch to default frame
    And I see the "Add Sales Exclusion  ***Required fields in red" modal window
    And I set list fields values on editable page
      | name                               | value             |
      | SalesExclusion_CodeSalesGroupID    | Sales-Marketing   |
      | SalesExclusion_CodeSalesTypeID     | Refurbish Income  |
      | SalesExclusion_ExclusionGroupCapID | <Exclusion Group> |
    And I click on the "Add" button
    And I verify a row from grid "BOGridSalesExclusion" having unique value "Sales-Marketing" under column header "Sales Group"
      | name            | value             |
      | Sales Type      | Refurbish Income  |
      | Exclusion Group | <Exclusion Group> |
      | Begin Date      | 01/01/2000        |
      | End Date        | 12/31/2020        |
      | Cap Percent     |                   |
      | Cap Amount      |                   |
      | Notes           |                   |
    And I select an option "Percentage Rent (Single BP) Schedule"
    And I select "January" month and "2015" year from dropdown in schedule details
    And I click on "Refresh" Button
    And I verify line items in the single BP schedule page having grid id "BOGridVirtualSalesPeriod"
      | salesGroup      | monthYear       | grossSales | excludedSales | leaseYTDSales | breakpoint | salesPastBreakpoint | rate   | totalPercentRent | amountPaid | percentOwed |
      | Sales           | January, 2015   | $103,200   | $1,200        | $102,000.00   | $8,333     | $93,667             | 10.00% | $9,367           |            | $9,366.67   |
      | Sales           | February, 2015  | $505,000   | $2,000        | $103,000.00   | $8,333     | $94,667             | 10.00% | $18,833          |            | $9,466.67   |
      | Sales           | March, 2015     | $172,500   | $2,500        | $105,000.00   | $8,333     | $96,667             | 10.00% | $28,500          |            | $9,666.67   |
      | Sales           | April, 2015     | $100,000   | $0            | $100,000.00   | $8,333     | $91,667             | 10.00% | $37,667          |            | $9,166.67   |
      | Sales           | May, 2015       | $100,000   | $0            | $100,000.00   | $8,333     | $91,667             | 10.00% | $46,833          |            | $9,166.67   |
      | Sales           | June, 2015      | $100,000   | $0            | $100,000.00   | $8,333     | $91,667             | 10.00% | $56,000          |            | $9,166.67   |
      | Sales           | July, 2015      |            |               | $0.00         | $8,333     | $0                  | 10.00% | $56,000          |            | $0.00       |
      | Sales           | August, 2015    |            |               | $0.00         | $8,333     | $0                  | 10.00% | $56,000          |            | $0.00       |
      | Sales           | September, 2015 |            |               | $0.00         | $8,333     | $0                  | 10.00% | $56,000          |            | $0.00       |
      | Sales           | October, 2015   |            |               | $0.00         | $8,333     | $0                  | 10.00% | $56,000          |            | $0.00       |
      | Sales           | November, 2015  |            |               | $0.00         | $8,333     | $0                  | 10.00% | $56,000          |            | $0.00       |
      | Sales           | December, 2015  |            |               | $0.00         | $8,333     | $0                  | 10.00% | $56,000          |            | $0.00       |
      | Sales-Marketing | January, 2015   | $103,200   | $3,200        | $100,000.00   | $4,167     | $95,833             | 5.00%  | $4,792           |            | $4,791.67   |
      | Sales-Marketing | February, 2015  | $505,000   | $5,000        | $100,000.00   | $4,167     | $95,833             | 5.00%  | $9,583           |            | $4,791.67   |
      | Sales-Marketing | March, 2015     | $172,500   | $7,500        | $100,000.00   | $4,167     | $95,833             | 5.00%  | $14,375          |            | $4,791.67   |
      | Sales-Marketing | April, 2015     | $100,000   | $0            | $100,000.00   | $4,167     | $95,833             | 5.00%  | $19,167          |            | $4,791.67   |
      | Sales-Marketing | May, 2015       | $100,000   | $0            | $100,000.00   | $4,167     | $95,833             | 5.00%  | $23,958          |            | $4,791.67   |
      | Sales-Marketing | June, 2015      | $100,000   | $0            | $100,000.00   | $4,167     | $95,833             | 5.00%  | $28,750          |            | $4,791.67   |
      | Sales-Marketing | July, 2015      |            |               | $0.00         | $4,167     | $0                  | 5.00%  | $28,750          |            | $0.00       |
      | Sales-Marketing | August, 2015    |            |               | $0.00         | $4,167     | $0                  | 5.00%  | $28,750          |            | $0.00       |
      | Sales-Marketing | September, 2015 |            |               | $0.00         | $4,167     | $0                  | 5.00%  | $28,750          |            | $0.00       |
      | Sales-Marketing | October, 2015   |            |               | $0.00         | $4,167     | $0                  | 5.00%  | $28,750          |            | $0.00       |
      | Sales-Marketing | November, 2015  |            |               | $0.00         | $4,167     | $0                  | 5.00%  | $28,750          |            | $0.00       |
      | Sales-Marketing | December, 2015  |            | $-14,700      | $14,700.00    | $4,167     | $10,533             | 5.00%  | $29,277          |            | $526.67     |

    Examples:
      | Login User   | Login full username  | Item     | Entity Name                     | Exclusion Group    |
      | DeleteAccess | Delete Access Access | Contract | Exclusion for Sales group Alias | AutoExclusionGroup |