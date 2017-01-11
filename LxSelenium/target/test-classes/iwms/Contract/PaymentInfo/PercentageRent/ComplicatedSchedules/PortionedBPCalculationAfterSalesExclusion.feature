@all
Feature: To calculate portioned breakpoints AFTER exclusions (Jira Ref : AUTOMATION-666)

  Scenario Outline: I import file for Portioned BP calculation after Sales Exclusion entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/"
    And I import following file name:
#      | Portioned_BP_With_Sales_Exclusion.xml |
      | PortionedBPWithSalesExclusion3.xml |

  Examples:s
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: I verify the preconditions test data of Portion BP applying Omit Sales Group scenario
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to dashboard page
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "Recurring Expenses" tab
    Then I verify page title "Contract Expense Setup List" after navigation
    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
      | name             | value           |
      | Expense Group    | Lease Expense   |
      | Expense Type     | Percentage Rent |
      | Expense Category | Rent            |
      | Begin Date       |                 |
      | End Date         |                 |
      | Frequency        | None            |
      | Period Amount    |                 |
      | Annual Amount    |                 |
#    And I click on the "<Third Level Tab>" tab
##    Then I verify page title "Contract Percentage Rent List" after navigation
#    And I verify a row from grid "thisDiv" having unique value "Sales" under column header "Sales Group"
#      | name                | value           |
#      | Begin Date          | 01/01/2010      |
#      | End Date            | 12/31/2015      |
#      | Sales Group         | Sales           |
#      | Description         |                 |
#      | Calculation Method  | Annual Gross-up |
#      | Payment Frequency   | Annually        |
#      | Reporting Frequency |                 |
#    And I verify a row from grid "thisDiv" having unique value "Sales Lease" under column header "Sales Group"
#      | name                | value           |
#      | Begin Date          | 01/01/2010      |
#      | End Date            | 12/31/2015      |
#      | Sales Group         | Sales Lease     |
#      | Description         |                 |
#      | Calculation Method  | Annual Gross-up |
#      | Payment Frequency   | Annually        |
#      | Reporting Frequency |                 |
    And I click on the "Sales" tab
    Then I verify page title "Contract Sales History List" after navigation
    And I verify a row from grid "thisDiv" having unique value "Retail Sales" under column header "Sales Type"
      | name               | value        |
      | Sales Group        | Sales        |
      | Sales Type         | Retail Sales |
      | Sales Category     | Actual       |
      | Sales Period       | 12           |
      | Sales Year         | 2014         |
      | Gross Sales Amount | $250,000.00  |
      | Net Sales Amount   | $250,000.00  |
      | Currency           | USD          |
    And I verify a row from grid "thisDiv" having unique value "Add Sales" under column header "Sales Type"
      | name               | value       |
      | Sales Group        | Sales Lease |
      | Sales Type         | Add Sales   |
      | Sales Category     | Actual      |
      | Sales Period       | 12          |
      | Sales Year         | 2014        |
      | Gross Sales Amount | $250,000.00 |
      | Net Sales Amount   | $250,000.00 |
      | Currency           | USD         |


  Examples:
    | Item     | Second Level Tab | Third Level Tab | Entity Name                       |
    | Contract | Payment Info     | Percentage Rent | Portioned BP with Sales Exclusion |

  Scenario Outline: I added Credit Card Sales Sales type to entity
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Sales History List" after navigation
    And I Click the "..." next to the "Sales_CodeSalesTypeID" dropdown
    And I switch to default frame
    And I click on the "Add Sales Type..."
    And I set following fields value on editable page
      | name                   | value                       |
      | ShortName              | Credit Card Exclusion Sales |
      | ParentCodeSalesGroupID | Sales                       |
    And I click on the "Add" button

  Examples:
    | Item     | Second Level Tab | Third Level Tab | Entity Name                       |
    | Contract | Payment Info     | Sales           | Portioned BP with Sales Exclusion |


  Scenario Outline: I verify the Sales Exclusion line item should be successfully added
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Percentage Rent List" after navigation
    And I click on the " Add Sales Exclusion... "
    And I switch to default frame
    And I set list fields values on editable page
      | name                            | value                       |
      | SalesExclusion_CodeSalesGroupID | Sales                       |
      | SalesExclusion_CodeSalesTypeID  | Credit Card Exclusion Sales |
    And I set following fields value on editable page
      | name                              | value      |
      | SalesExclusion_BeginDate          | 01/01/2010 |
      | SalesExclusion_EndDate            | 12/31/2015 |
      | SalesExclusion_ExclusionRate      |            |
      | SalesExclusion_CodeCurrencyTypeID |            |
    And I click on the "Add" button
    And I verify a row from grid "BOGridSalesExclusion" having unique value "Credit Card Exclusion Sales" under column header "Sales Type"
      | name            | value                       |
      | Sales Group     | Sales                       |
      | Sales Type      | Credit Card Exclusion Sales |
      | Exclusion Group |                             |
      | Begin Date      | 01/01/2010                  |
      | End Date        | 12/31/2015                  |
      | Cap Percent     |                             |
      | Cap Amount      |                             |
      | Notes           |                             |
    And I switch to default frame

  Examples:
    | Item     | Second Level Tab | Third Level Tab | Entity Name                       |
    | Contract | Payment Info     | Percentage Rent | Portioned BP with Sales Exclusion |

  Scenario Outline: I verify the Sales Line item 3 should be added Successfully
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Sales History List" after navigation
#    And I switch to "Sales_CodeSalesGroupID"
    And I click on the "Add item" action panel button
    And I check for complete frame 'loading...'
    And I set following fields value on editable page
      | name                   | value       |
      | Sales_SalesYear        | 2014        |
      | Sales_SalesPeriod      | 11          |
      | Sales_GrossSalesAmount | $150,000.00 |
      | Sales_NetSalesAmount   | $150,000.00 |

    And I set list fields values on editable page
      | name                      | value                       |
      | Sales_CodeSalesGroupID    | Sales                       |
      | Sales_CodeSalesTypeID     | Credit Card Exclusion Sales |
      | Sales_CodeSalesCategoryID | Actual                      |
      | Sales_CodeCurrencyTypeID  | USD                         |
    And I click on the "Save Changes" action panel button
    And I verify a row from grid "thisDiv" having unique value "Credit Card Exclusion Sales" under column header "Sales Type"
      | name               | value                       |
      | Sales Group        | Sales                       |
      | Sales Type         | Credit Card Exclusion Sales |
      | Sales Category     | Actual                      |
      | Sales Period       | 11                          |
      | Sales Year         | 2014                        |
      | Gross Sales Amount | $150,000.00                 |
      | Net Sales Amount   | $150,000.00                 |
      | Currency           | USD                         |
    And I switch to default frame

  Examples:
    | Item     | Second Level Tab | Third Level Tab | Entity Name                       |
    | Contract | Payment Info     | Sales           | Portioned BP with Sales Exclusion |

  Scenario Outline: I verify the PR Single BP Schedule should reflect the correct amounts for both the Sales Group.
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "December" month and "2014" year from dropdown in schedule details to view the details
    And I verify line items in the single BP schedule grid "BOGridVirtualSalesPeriod"
      | salesGroup  | monthYear       | grossSales | excludedSales | leaseYTDSales | breakpoint | salesPastBreakpoint | rate   | totalPercentRent | amountPaid | percentOwed |
      | Sales       | January, 2014   |            |               |               |            |                     |        |                  |            |             |
      | Sales       | February, 2014  |            |               |               |            |                     |        |                  |            |             |
      | Sales       | March, 2014     |            |               |               |            |                     |        |                  |            |             |
      | Sales       | April, 2014     |            |               |               |            |                     |        |                  |            |             |
      | Sales       | May, 2014       |            |               |               |            |                     |        |                  |            |             |
      | Sales       | June, 2014      |            |               |               |            |                     |        |                  |            |             |
      | Sales       | July, 2014      |            |               |               |            |                     |        |                  |            |             |
      | Sales       | August, 2014    |            |               |               |            |                     |        |                  |            |             |
      | Sales       | September, 2014 |            |               |               |            |                     |        |                  |            |             |
      | Sales       | October, 2014   |            |               |               |            |                     |        |                  |            |             |
      | Sales       | November, 2014  | $150,000   | $150,000      |               |            |                     |        |                  |            |             |
      | Sales       | December, 2014  | $250,000   | $0            | $250,000      | $50,000    | $200,000            | 5.00%  | $10,000.00       |            | $10,000.00  |
      | Sales Lease | January, 2014   |            |               |               |            |                     |        |                  |            |             |
      | Sales Lease | February, 2014  |            |               |               |            |                     |        |                  |            |             |
      | Sales Lease | March, 2014     |            |               |               |            |                     |        |                  |            |             |
      | Sales Lease | April, 2014     |            |               |               |            |                     |        |                  |            |             |
      | Sales Lease | May, 2014       |            |               |               |            |                     |        |                  |            |             |
      | Sales Lease | June, 2014      |            |               |               |            |                     |        |                  |            |             |
      | Sales Lease | July, 2014      |            |               |               |            |                     |        |                  |            |             |
      | Sales Lease | August, 2014    |            |               |               |            |                     |        |                  |            |             |
      | Sales Lease | September, 2014 |            |               |               |            |                     |        |                  |            |             |
      | Sales Lease | October, 2014   |            |               |               |            |                     |        |                  |            |             |
      | Sales Lease | November, 2014  |            |               |               |            |                     |        |                  |            |             |
      | Sales Lease | December, 2014  | $250,000   | $0            | $250,000      | $50,000    | $200,000            | 10.00% | $20,000.00       |            | $20,000.00  |
#      | salesGroup  | monthYear       | grossSales | excludedSales | leaseYTDSales | breakpoint | salesPastBreakpoint | rate   | totalPercentRent | amountPaid | percentOwed |
#      | Sales       | January, 2014   |            |               |               |            |                     |        |                  |            |             |
#      | Sales       | February, 2014  |            |               |               |            |                     |        |                  |            |             |
#      | Sales       | March, 2014     |            |               |               |            |                     |        |                  |            |             |
#      | Sales       | April, 2014     |            |               |               |            |                     |        |                  |            |             |
#      | Sales       | May, 2014       |            |               |               |            |                     |        |                  |            |             |
#      | Sales       | June, 2014      |            |               |               |            |                     |        |                  |            |             |
#      | Sales       | July, 2014      |            |               |               |            |                     |        |                  |            |             |
#      | Sales       | August, 2014    |            |               |               |            |                     |        |                  |            |             |
#      | Sales       | September, 2014 |            |               |               |            |                     |        |                  |            |             |
#      | Sales       | October, 2014   |            |               |               |            |                     |        |                  |            |             |
#      | Sales       | November, 2014  | $150,000   | $150,000      |               |            |                     |        |                  |            |             |
#      | Sales       | December, 2014  | $250,000   | $0            | $250,000.00   | $50,000.00 | $200,000            | 5.00%  | $10,000          |            | $10,000.00  |
#      | Sales Lease | January, 2014   |            |               |               |            |                     |        |                  |            |             |
#      | Sales Lease | February, 2014  |            |               |               |            |                     |        |                  |            |             |
#      | Sales Lease | March, 2014     |            |               |               |            |                     |        |                  |            |             |
#      | Sales Lease | April, 2014     |            |               |               |            |                     |        |                  |            |             |
#      | Sales Lease | May, 2014       |            |               |               |            |                     |        |                  |            |             |
#      | Sales Lease | June, 2014      |            |               |               |            |                     |        |                  |            |             |
#      | Sales Lease | July, 2014      |            |               |               |            |                     |        |                  |            |             |
#      | Sales Lease | August, 2014    |            |               |               |            |                     |        |                  |            |             |
#      | Sales Lease | September, 2014 |            |               |               |            |                     |        |                  |            |             |
#      | Sales Lease | October, 2014   |            |               |               |            |                     |        |                  |            |             |
#      | Sales Lease | November, 2014  |            |               |               |            |                     |        |                  |            |             |
#      | Sales Lease | December, 2014  | $250,000   | $0            | $250,000.00   | $50,000.00 | $200,000            | 10.00% | $20,000          |            | $20,000.00  |

    And I click on the "Process Payment" action panel button
    And I see the "Process Payment" modal window
    And I set following list fields values on editable page
      | name         | value    |
      | mnToGenerate | December |
    Then I set fields values on editable page
      | name          | value           |
      | yrToGenerate  | 2014            |
      | effectiveDate | 12/31/2014      |
      | paymntClass   | Single Contract |
      | postDate      | 03/30/2015      |
      | dueDate       | 03/30/2015      |
    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "12/31/2014" under column header "Effective Date"
      | name             | value             |
      | Effective Date   | 12/31/2014        |
      | Group            | Lease Expense     |
      | Type             | Percentage Rent   |
      | Category         | Rent              |
#      | Vendor           | Selenium Vendor |
      | Vendor           | Selenium-Employer |
#      | Vendor#          | 12345             |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | $30,000.0         |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |
    And I switch to default frame

  Examples:
    | Item     | Second Level Tab | Third Level Tab | Entity Name                       | Percentage Rent page                 |
    | Contract | Payment Info     | Percentage Rent | Portioned BP with Sales Exclusion | Percentage Rent (Single BP) Schedule |
