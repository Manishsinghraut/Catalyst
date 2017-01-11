@all
Feature: I verify the Mutually Exclusive BP Rates for Different Percent Rent Records (Jira Ref : AUTOMATION-641)

  Scenario Outline: I import file for Mutually Exclusive BP Rates for PR
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
      | MutuallyExclusiveBPRatesForPR.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify sales items of Mutually Exclusive BP Rates for PR entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "Sales" tab
    And I wait for the Loading text to disappear
    And I click sort in header "Sales Period" from grid "thisDiv" in "Sort Ascending"
    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType    | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | Retail Sales | Actual        | 1           | 2014      | $30,000.00       | $30,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 2           | 2014      | $20,000.00       | $20,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 3           | 2014      | $20,000.00       | $20,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 4           | 2014      | $20,000.00       | $20,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 5           | 2014      | $15,000.00       | $15,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 6           | 2014      | $20,000.00       | $20,000.00     | USD      |

    And I click on "Next Page" button in the grid

    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType    | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | Retail Sales | Actual        | 7           | 2014      | $20,000.00       | $20,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 8           | 2014      | $20,000.00       | $20,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 9           | 2014      | $13,000.00       | $13,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 10          | 2014      | $20,000.00       | $20,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 11          | 2014      | $20,000.00       | $20,000.00     | USD      |
      | Sales      | Retail Sales | Actual        | 12          | 2014      | $20,000.00       | $20,000.00     | USD      |

    Examples:
      | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                        |
      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Mutually Exclusive BP Rates for PR |


  Scenario Outline: As a delete user I verify Recurring expenses, vendor allocation, precent rent,offset and break point line items of Mutually Exclusive BP Rates for PR entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
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
    And I verify row from grid "thisDiv" having unique value "AliasA" under column header "Sales Group"
      | name                | value      |
      | Begin Date          | 01/01/2000 |
      | End Date            | 12/31/2020 |
      | Sales Group         | AliasA     |
      | Description         |            |
      | Calculation Method  |            |
      | Payment Frequency   | Annually   |
      | Reporting Frequency | Annually   |
    And I verify row from grid "thisDiv" having unique value "Sales" under column header "Sales Group"
      | name                | value      |
      | Begin Date          | 01/01/2000 |
      | End Date            | 12/31/2020 |
      | Sales Group         | Sales      |
      | Description         |            |
      | Calculation Method  |            |
      | Payment Frequency   | Annually   |
      | Reporting Frequency | Annually   |
    And I verify row from grid "BOGridPercentageRentBreakpoint" having unique value "AliasA" under column header "Sales Group"
      | name                  | value      |
      | Begin Date            | 01/01/2000 |
      | End Date              | 12/31/2020 |
      | Sales Group           | AliasA     |
      | Portioned Sales Group |            |
      | Natural Rate          |            |
      | Breakpoint Amount #1  | $5,000.00  |
      | Breakpoint Rate #1    | 5.00000%   |
      | Breakpoint Amount #2  |            |
      | Breakpoint Rate #2    |            |
      | Breakpoint Amount #3  |            |
      | Breakpoint Rate #3    |            |
    And I verify row from grid "BOGridPercentageRentBreakpoint" having unique value "Sales" under column header "Sales Group"
      | name                  | value      |
      | Begin Date            | 01/01/2000 |
      | End Date              | 12/31/2020 |
      | Sales Group           | Sales      |
      | Portioned Sales Group |            |
      | Natural Rate          |            |
      | Breakpoint Amount #1  | $10,000.00 |
      | Breakpoint Rate #1    | 10.00000%  |
      | Breakpoint Amount #2  |            |
      | Breakpoint Rate #2    |            |
      | Breakpoint Amount #3  |            |
      | Breakpoint Rate #3    |            |

    Examples:
      | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                        |
      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Mutually Exclusive BP Rates for PR |


  Scenario Outline: As a delete user I process payment of Mutually Exclusive BP Rates for PR entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "Percentage Rent" tab
    And I wait for the Loading text to disappear
    And I select an option "Percentage Rent (Single BP) Schedule"
    And I wait for the Loading text to disappear
    And I select "December" month and "2014" year from dropdown in schedule details to view the details

    And I verify the following values in frame grid "BOGridVirtualSalesPeriod"
      | Sales Group | Month/Year     | Gross Sales | Excluded Sales | Lease YTD Sales | Breakpoint | Sales Past Breakpoint | Rate   | Total %Rent | Amount Previously Paid | %Rent Owed |
      | Sales       | December, 2014 | $20,000     | $0             | $238,000        | $10,000    | $228,000              | 10.00% | $22,800.00  |                        | $22,800.00 |
      | AliasA      | December, 2014 | $20,000     | $0             | $238,000        | $5,000     | $233,000              | 5.00%  | $11,650.00  |                        | $11,650.00 |

    And I verify the "Percentage Rent (Single BP) Schedule" values at the bottom of the page
      | name                  | value      |
      | Total Percentage Rent | $34,450.00 |
      | Amount Already Paid   | $0.00      |
      | Percentage Rent Owed  | $34,450.00 |
      | Offset Amount         | $0.00      |
      | Net Amount Due        | $34,450.00 |

    And I click on the "Process Payment" action panel button
    And I set following list fields values on editable page
      | name         | value    |
      | mnToGenerate | December |
    Then I set fields values on editable page
      | name         | value |
      | yrToGenerate | 2014  |
    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear

    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "$34,450.00" under column header "Total Amount"
      | name             | value             |
      | Effective Date   | 12/31/2014        |
      | Group            | Lease Expense     |
      | Type             | Percentage Rent   |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | $34,450.00        |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |


    Examples:
      | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                        |
      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Mutually Exclusive BP Rates for PR |




#@all
#Feature: I verify the Mutually Exclusive BP Rates for Different Percent Rent Records (Jira Ref : AUTOMATION-641)
#
#  Scenario Outline: I import file for Mutually Exclusive BP Rates for PR
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
#    And I import following file name:
#      | MutuallyExclusiveBPRatesForPR.xml |
#
#    Examples:
#      | Login User   | Login full username  |
#      | DeleteAccess | Delete Access Access |
#
#  Scenario Outline: As a delete user I verify sales items of Mutually Exclusive BP Rates for PR entity
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "Sales" tab
#    And I wait for the Loading text to disappear
#    And I click sort in header "Sales Period" from grid "thisDiv" in "Sort Ascending"
#    And I verify line items in the grid "thisDiv"
#      | salesGroup | salesType    | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
#      | Sales      | Retail Sales | Actual        | 1           | 2014      | $30,000.00       | $30,000.00     | USD      |
#      | Sales      | Retail Sales | Actual        | 2           | 2014      | $20,000.00       | $20,000.00     | USD      |
#      | Sales      | Retail Sales | Actual        | 3           | 2014      | $20,000.00       | $20,000.00     | USD      |
#      | Sales      | Retail Sales | Actual        | 4           | 2014      | $20,000.00       | $20,000.00     | USD      |
#      | Sales      | Retail Sales | Actual        | 5           | 2014      | $15,000.00       | $15,000.00     | USD      |
#      | Sales      | Retail Sales | Actual        | 6           | 2014      | $20,000.00       | $20,000.00     | USD      |
#
#    And I click on "Next Page" button in the grid
#
#    And I verify line items in the grid "thisDiv"
#      | salesGroup | salesType    | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
#      | Sales      | Retail Sales | Actual        | 7           | 2014      | $20,000.00       | $20,000.00     | USD      |
#      | Sales      | Retail Sales | Actual        | 8           | 2014      | $20,000.00       | $20,000.00     | USD      |
#      | Sales      | Retail Sales | Actual        | 9           | 2014      | $13,000.00       | $13,000.00     | USD      |
#      | Sales      | Retail Sales | Actual        | 10          | 2014      | $20,000.00       | $20,000.00     | USD      |
#      | Sales      | Retail Sales | Actual        | 11          | 2014      | $20,000.00       | $20,000.00     | USD      |
#      | Sales      | Retail Sales | Actual        | 12          | 2014      | $20,000.00       | $20,000.00     | USD      |
#
#    Examples:
#      | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                        |
#      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Mutually Exclusive BP Rates for PR |
#
#
#  Scenario Outline: As a delete user I verify Recurring expenses, vendor allocation, precent rent,offset and break point line items of Mutually Exclusive BP Rates for PR entity
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#
#    And I click on the "Recurring Expenses" tab
#    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
#      | name             | value           |
#      | Expense Type     | Percentage Rent |
#      | Expense Category | Expense         |
#      | Begin Date       |                 |
#      | End Date         |                 |
#      | Frequency        | Annually        |
#      | Period Amount    |                 |
#      | Annual Amount    |                 |
#    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium-Employer" under column header "Vendor"
#      | name            | value             |
#      | Vendor#         | 1234              |
#      | Payment Percent | 100.00000%        |
#      | Address         | 5601 Democracy Dr |
#      | City            | Plano             |
#      | State           | TX                |
#      | Begin Date      | 01/01/2000        |
#      | End Date        | 12/31/2020        |
#      | Notes           |                   |
#      | Actions         | edit              |
#
#    And I click on the "Percentage Rent" tab
#    And I verify row from grid "thisDiv" having unique value "AliasA" under column header "Sales Group"
#      | name                | value      |
#      | Begin Date          | 01/01/2000 |
#      | End Date            | 12/31/2020 |
#      | Sales Group         | AliasA     |
#      | Description         |            |
#      | Calculation Method  |            |
#      | Payment Frequency   | Annually   |
#      | Reporting Frequency | Annually   |
#    And I verify row from grid "thisDiv" having unique value "Sales" under column header "Sales Group"
#      | name                | value      |
#      | Begin Date          | 01/01/2000 |
#      | End Date            | 12/31/2020 |
#      | Sales Group         | Sales      |
#      | Description         |            |
#      | Calculation Method  |            |
#      | Payment Frequency   | Annually   |
#      | Reporting Frequency | Annually   |
#    And I verify row from grid "BOGridPercentageRentBreakpoint" having unique value "AliasA" under column header "Sales Group"
#      | name                  | value      |
#      | Begin Date            | 01/01/2000 |
#      | End Date              | 12/31/2020 |
#      | Sales Group           | AliasA     |
#      | Portioned Sales Group |            |
#      | Natural Rate          |            |
#      | Breakpoint Amount #1  | $5,000.00  |
#      | Breakpoint Rate #1    | 5.00000%   |
#      | Breakpoint Amount #2  |            |
#      | Breakpoint Rate #2    |            |
#      | Breakpoint Amount #3  |            |
#      | Breakpoint Rate #3    |            |
#    And I verify row from grid "BOGridPercentageRentBreakpoint" having unique value "Sales" under column header "Sales Group"
#      | name                  | value      |
#      | Begin Date            | 01/01/2000 |
#      | End Date              | 12/31/2020 |
#      | Sales Group           | Sales      |
#      | Portioned Sales Group |            |
#      | Natural Rate          |            |
#      | Breakpoint Amount #1  | $10,000.00 |
#      | Breakpoint Rate #1    | 10.00000%  |
#      | Breakpoint Amount #2  |            |
#      | Breakpoint Rate #2    |            |
#      | Breakpoint Amount #3  |            |
#      | Breakpoint Rate #3    |            |
#
#    Examples:
#      | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                        |
#      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Mutually Exclusive BP Rates for PR |
#
#
#  Scenario Outline: As a delete user I process payment of Mutually Exclusive BP Rates for PR entity
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "Percentage Rent" tab
#    And I wait for the Loading text to disappear
#    And I select an option "Percentage Rent (Single BP) Schedule"
#    And I wait for the Loading text to disappear
#    And I select "December" month and "2014" year from dropdown in schedule details to view the details
#
#    And I verify the following values in frame grid "BOGridVirtualSalesPeriod"
#      | Sales Group | Month/Year     | Gross Sales | Excluded Sales | Lease YTD Sales | Breakpoint | Sales Past Breakpoint | Rate   | Total %Rent | Amount Previously Paid | %Rent Owed |
#      | Sales       | December, 2014 | $20,000     | $0             | $238,000.00     | $10,000.00 | $228,000.00           | 10.00% | $22,800.00  |                        | $22,800.00 |
#      | AliasA      | December, 2014 | $20,000     | $0             | $238,000.00     | $5,000.00  | $233,000.00           | 5.00%  | $11,650.00  |                        | $11,650.00 |
#
#    And I verify the "Percentage Rent (Single BP) Schedule" values at the bottom of the page
#      | name                  | value      |
#      | Total Percentage Rent | $34,450.00 |
#      | Amount Already Paid   | $0.00      |
#      | Percentage Rent Owed  | $34,450.00 |
#      | Offset Amount         | $0.00      |
#      | Net Amount Due        | $34,450.00 |
#
#    And I click on the "Process Payment" action panel button
#    And I set following list fields values on editable page
#      | name         | value    |
#      | mnToGenerate | December |
#    Then I set fields values on editable page
#      | name         | value |
#      | yrToGenerate | 2014  |
#    And I click on the "OK" button
#    Then I verify "1 Contract was processed." message appear after generating rent
#    And I verify "1 Payment Transaction record was generated." message appear after generating rent
#    And I click "OK" button
#    And I wait for the Loading text to disappear
#
#    And I click on the "Transactions" tab
#    And I verify a row from grid "thisDiv" having unique value "$34,450.00" under column header "Total Amount"
#      | name             | value             |
#      | Effective Date   | 12/31/2014        |
#      | Group            | Lease Expense     |
#      | Type             | Percentage Rent   |
#      | Category         | Expense           |
#      | Vendor           | Selenium-Employer |
#      | Vendor#          | 1234              |
#      | One-Time Expense | Yes               |
#      | Total Amount     | $34,450.00        |
#      | Primary Tax      | $0.00             |
#      | Hold Flag        | No                |
#
#
#    Examples:
#      | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                        |
#      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Mutually Exclusive BP Rates for PR |