@all
Feature: Verifying Cap Percent for Group Exclusion and Sales Type Exclusions (Ref : Jira Ticket No : Automation-767)

  Scenario Outline: Import the attached Cap percent for Group Exclusion and Sales Type Exclusions. xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ExclusionsAndSalesGroupAlias/"
    And I import following file name:
      | CapPercentForGroupExclusionAndSalesTypeExclusions(6).xml |

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

    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium-Employer" under column header "Vendor"
      | name            | value             |
      | Vendor#         | 1234              |
      | Payment Percent | 100.00000%        |
      | Address         | 5601 Democracy Dr |
      | City            | Plano             |
      | State           | TX                |
      | Begin Date      | 01/01/2000        |
      | End Date        | 12/31/2020        |

    And I click on the "Percentage Rent" tab
    And I verify a row from grid "thisDiv" having unique value "Sales" under column header "Sales Group"
      | name                | value      |
      | Begin Date          | 01/01/2000 |
      | End Date            | 12/31/2020 |
      | Description         |            |
      | Calculation Method  | Cumulative |
      | Payment Frequency   | Monthly    |
      | Reporting Frequency | Monthly    |
    And I click on the "Sales" tab
    And I click sort in header "Sales Period" from grid "thisDiv" in "Sort Ascending"
    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType               | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | Credit Card Sales Group | Actual        | 1           | 2015      | $1,000.00        | $1,000.00      | USD      |
      | Sales      | Employee Sales          | Actual        | 1           | 2015      | $5,000.00        | $5,000.00      | USD      |
      | Sales      | Retail Sales            | Actual        | 1           | 2015      | $1,000.00        | $1,000.00      |          |
      | Sales      | Credit Card Sales Group | Actual        | 12          | 2015      | $2,000.00        | $2,000.00      | USD      |
      | Sales      | Employee Sales          | Actual        | 12          | 2015      | $6,000.00        | $6,000.00      | USD      |
      | Sales      | Retail Sales            | Actual        | 12          | 2015      | $2,000.00        | $2,000.00      | USD      |

  Examples:
    | Login User   | Login full username  | Item     | Entity Name                                               |
    | DeleteAccess | Delete Access Access | Contract | Cap percent for Group Exclusion and Sales Type Exclusions |

  Scenario Outline: As a delete user I verify Cap Percent for Group Exclusion and Sales Type Exclusions is being applied as expected
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "Payment Info"
    And I click on the "Percentage Rent" tab
    And I verify a row from grid "thisDiv" having unique value "Sales" under column header "Sales Group"
      | name                | value      |
      | Begin Date          | 01/01/2000 |
      | End Date            | 12/31/2020 |
      | Description         |            |
      | Calculation Method  | Cumulative |
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
      | name                                 | value |
      | SalesExclusionCap_CodeSalesGroupID   | Sales |
      | SalesExclusionCap_CodeCurrencyTypeID | USD   |
    And I set following fields value on editable page
      | name                         | value      |
      | SalesExclusionCap_BeginDate  | 01/01/2015 |
      | SalesExclusionCap_EndDate    | 12/31/2030 |
      | SalesExclusionCap_CapPercent | 10         |

    And I click on the "Add" button
    And I verify a row from grid "BOGridSalesExclusionCap" having unique value "<Exclusion Group>" under column header "Exclusion Group"
      | name        | value      |
      | Sales Group | Sales      |
      | Begin Date  | 01/01/2015 |
      | End Date    | 12/31/2030 |
      | Cap Percent | 10.00000%  |
      | Cap Amount  |            |
      | Notes       |            |

    And I click " Add Sales Exclusion... " button
    And I switch to default frame
    And I see the "Add Sales Exclusion  ***Required fields in red" modal window
    And I set list fields values on editable page
      | name                              | value                   |
      | SalesExclusion_CodeSalesGroupID   | Sales                   |
      | SalesExclusion_CodeSalesTypeID    | Credit Card Sales Group |
      | SalesExclusion_CodeCurrencyTypeID | USD                     |

    And I set following fields value on editable page
      | name                      | value      |
      | SalesExclusion_CapPercent | 10         |
      | SalesExclusion_BeginDate  | 01/01/2015 |
      | SalesExclusion_EndDate    | 11/30/2020 |

    And I click on the "Add" button
    And I verify a row from grid "BOGridSalesExclusion" having unique value "Sales" under column header "Sales Group"
      | name            | value                   |
      | Sales Type      | Credit Card Sales Group |
      | Exclusion Group |                         |
      | Begin Date      | 01/01/2015              |
      | End Date        | 11/30/2020              |
      | Cap Percent     | 10.00000%               |
      | Cap Amount      |                         |
      | Notes           |                         |

    And I click " Add Sales Exclusion... " button
    And I switch to default frame
    And I see the "Add Sales Exclusion  ***Required fields in red" modal window
    And I set list fields values on editable page
      | name                              | value          |
      | SalesExclusion_CodeSalesGroupID   | Sales          |
      | SalesExclusion_CodeSalesTypeID    | Employee Sales |
      | SalesExclusion_CodeCurrencyTypeID | USD            |

    And I set following fields value on editable page
      | name                      | value      |
      | SalesExclusion_CapPercent | 10         |
      | SalesExclusion_BeginDate  | 01/01/2015 |
      | SalesExclusion_EndDate    | 11/30/2020 |
    And I click on the "Add" button
    And I verify a row from grid "BOGridSalesExclusion" having unique value "Sales" under column header "Sales Group"
      | name            | value          |
      | Sales Type      | Employee Sales |
      | Exclusion Group |                |
      | Begin Date      | 01/01/2015     |
      | End Date        | 11/30/2020     |
      | Cap Percent     | 10.00000%      |
      | Cap Amount      |                |
      | Notes           |                |

    And I select an option "Percentage Rent (Single BP) Schedule"
    And I select "January" month and "2015" year from dropdown in schedule details
    And I click on "Refresh" Button

    And I verify line items in the single BP schedule grid "BOGridVirtualSalesPeriod"
      | salesGroup | monthYear       | grossSales | excludedSales | leaseYTDSales | breakpoint | salesPastBreakpoint | rate   | totalPercentRent | amountPaid | percentOwed |
      | Sales      | January, 2015   | $7,000     | $6,000        | $1,000        | $120,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | February, 2015  |            |               | $1,000        | $120,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | March, 2015     |            |               | $1,000        | $120,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | April, 2015     |            |               | $1,000        | $120,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | May, 2015       |            |               | $1,000        | $120,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | June, 2015      |            |               | $1,000        | $120,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | July, 2015      |            |               | $1,000        | $120,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | August, 2015    |            |               | $1,000        | $120,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | September, 2015 |            |               | $1,000        | $120,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | October, 2015   |            |               | $1,000        | $120,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | November, 2015  |            |               | $1,000        | $120,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      | Sales      | December, 2015  | $10,000    | $-2,600       | $13,600       | $120,000   | $0                  | 10.00% | $0.00            |            | $0.00       |
      |            |                 | $17,000    | $3,400        |               |            |                     |        |                  | $0.00      |             |

#      | salesGroup | monthYear       | grossSales | excludedSales | leaseYTDSales | breakpoint  | salesPastBreakpoint | rate   | totalPercentRent | amountPaid | percentOwed |
#      | Sales      | January, 2015   | $7,000     | $6,000        | $1,000.00     | $120,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | February, 2015  |            |               | $1,000.00     | $120,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | March, 2015     |            |               | $1,000.00     | $120,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | April, 2015     |            |               | $1,000.00     | $120,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | May, 2015       |            |               | $1,000.00     | $120,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | June, 2015      |            |               | $1,000.00     | $120,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | July, 2015      |            |               | $1,000.00     | $120,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | August, 2015    |            |               | $1,000.00     | $120,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | September, 2015 |            |               | $1,000.00     | $120,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | October, 2015   |            |               | $1,000.00     | $120,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | November, 2015  |            |               | $1,000.00     | $120,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      | Sales      | December, 2015  | $10,000    | $-2,600       | $13,600.00    | $120,000.00 | $0                  | 10.00% | $0               |            | $0.00       |
#      |            |                 | $17,000    | $3,400        |               |             |                     |        |                  | $0.00      |             |

    And I click on "$6,000" link
    And I see modal window

    And I verify a unique row in grid "^Grid_" having unique value "Sales" under column header "Sales Group"
      | name               | value                   |
      | Sales Type         | Credit Card Sales Group |
      | Sales Category     | Actual                  |
      | Sales Period       | 1                       |
      | Sales Year         | 2015                    |
      | Gross Sales Amount | $1,000.00               |
      | Net Sales Amount   | $1,000.00               |

    And I verify a unique row in grid "^Grid_" having unique value "Sales" under column header "Sales Group"
      | name               | value          |
      | Sales Type         | Employee Sales |
      | Sales Category     | Actual         |
      | Sales Period       | 1              |
      | Sales Year         | 2015           |
      | Gross Sales Amount | $5,000.00      |
      | Net Sales Amount   | $5,000.00      |


    And I verify a unique row in grid "^Grid_" having unique value "Sales" under column header "Sales Group"
      | name               | value        |
      | Sales Type         | Retail Sales |
      | Sales Category     | Actual       |
      | Sales Period       | 1            |
      | Sales Year         | 2015         |
      | Gross Sales Amount | $1,000.00    |
      | Net Sales Amount   | $1,000.00    |

    And I click on the "Close" button


  Examples:
    | Login User   | Login full username  | Item     | Entity Name                                               | Exclusion Group |
    | DeleteAccess | Delete Access Access | Contract | Cap percent for Group Exclusion and Sales Type Exclusions | Merchandise     |