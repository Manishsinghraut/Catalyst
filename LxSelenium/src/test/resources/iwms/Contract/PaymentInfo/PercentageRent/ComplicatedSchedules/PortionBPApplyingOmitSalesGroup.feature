@all
Feature: I Testing Portion BP applying Omit Sales Group (Jira Ref : AUTOMATION-665)

  Scenario Outline: I import file for Exclusion Rate calculations for Percentage Rent entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/"
    And I import following file name:
      #| PortionedBPWithOmitSalesGroup.xml |
      | PortionedBPWithOmitSalesGroup-665.xml |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: I verify the preconditions test data of Portion BP applying Omit Sales Group scenario
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "Recurring Expenses" tab
    Then I verify page title "Contract Expense Setup List" after navigation
    And I click row from grid "thisDiv" having unique value "Expense" under column header "Expense Group"
    And I verify row from grid "thisDiv" having unique value "Lease Expense"
      | name             | value           |
      | Expense Group    | Lease Expense   |
      | Expense Type     | Percentage Rent |
      | Expense Category | Rent            |
      | Begin Date       |                 |
      | End Date         |                 |
      | Frequency        | None            |
      | Period Amount    |                 |
      | Annual Amount    |                 |
    And I switch to default frame
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Percentage Rent List" after navigation
    And I verify row from grid "thisDiv" having unique value "Sales" under column header "Sales Group"
      | name                | value           |
      | Begin Date          | 01/01/2010      |
      | End Date            | 12/31/2015      |
      | Sales Group         | Sales           |
      | Description         |                 |
      | Calculation Method  | Annual Gross-up |
      | Payment Frequency   | Annually        |
      | Reporting Frequency |                 |
    And I verify row from grid "thisDiv" having unique value "Sales Lease" under column header "Sales Group"
      | name                | value           |
      | Begin Date          | 01/01/2010      |
      | End Date            | 12/31/2015      |
      | Sales Group         | Sales Lease     |
      | Description         |                 |
      | Calculation Method  | Annual Gross-up |
      | Payment Frequency   | Annually        |
      | Reporting Frequency |                 |
    And I switch to default frame
    And I click on the "Sales" tab
    Then I verify page title "Contract Sales History List" after navigation
    And I verify row from grid "thisDiv" having unique value "Retail Sales" under column header "Sales Type"
      | name               | value        |
      | Sales Group        | Sales        |
      | Sales Type         | Retail Sales |
      | Sales Category     | Actual       |
      | Sales Period       | 12           |
      | Sales Year         | 2014         |
      | Gross Sales Amount | $250,000.00  |
      | Net Sales Amount   | $250,000.00  |
      | Currency           | USD          |
    And I verify row from grid "thisDiv" having unique value "Add Sales" under column header "Sales Type"
      | name               | value       |
      | Sales Group        | Sales Lease |
      | Sales Type         | Add Sales   |
      | Sales Category     | Actual      |
      | Sales Period       | 12          |
      | Sales Year         | 2014        |
      | Gross Sales Amount | $250,000.00 |
      | Net Sales Amount   | $250,000.00 |
      | Currency           | USD         |
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name                        |
      | Contract | Payment Info     | Percentage Rent | Portioned BP with Omit Sales Group |

#  Scenario Outline: I added Credit Card Sales Sales type to entity
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    Then I verify page title "Contract Sales History List" after navigation
#    And I Click the "..." next to the "Sales_CodeSalesTypeID" dropdown
#    And I switch to default frame
#    And I click on the "Add Sales Type..."
#    And I set following fields value on editable page
#      | name                              | value             |
#      | ShortName                         | Credit Card Sales |
#      | ParentCodeSalesGroupID            | Sales             |
#      | _checkbox_OmitFromSalesGroupTotal | true              |
#    And I click on the "Add" button
#
#  Examples:
#    | Item     | Second Level Tab | Third Level Tab | Entity Name                        |
#    | Contract | Payment Info     | Sales           | Portioned BP with Omit Sales Group |

  Scenario Outline: I verify the Sales Exclusion line item should be successfully added
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Percentage Rent List" after navigation
    And I click on the " Add Sales Exclusion... "
    And I switch to default frame
    And I set list fields values on editable page
      | name                            | value             |
      | SalesExclusion_CodeSalesGroupID | Sales             |
      | SalesExclusion_CodeSalesTypeID  | Credit Card Sales |
    And I set following fields value on editable page
      | name                              | value      |
      | SalesExclusion_BeginDate          | 01/01/2010 |
      | SalesExclusion_EndDate            | 12/31/2015 |
      | SalesExclusion_ExclusionRate      |            |
      | SalesExclusion_CodeCurrencyTypeID | USD        |
    And I click on the "Add" button
    And I switch to default frame
    And I verify row from grid "BOGridSalesExclusion" having unique value "Credit Card Sales" under column header "Sales Type"
      | name            | value             |
      | Sales Group     | Sales             |
      | Sales Type      | Credit Card Sales |
      | Exclusion Group |                   |
      | Begin Date      | 01/01/2010        |
      | End Date        | 12/31/2015        |
      | Cap Percent     |                   |
      | Cap Amount      |                   |
      | Notes           |                   |
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name                        |
      | Contract | Payment Info     | Percentage Rent | Portioned BP with Omit Sales Group |


  Scenario Outline: I verify the Sales Line item 3 should be added Successfully
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Add item" action panel button
    And I verify page title "Contract Sales History List" after navigation
    And I set following fields value on editable page
      | name                   | value       |
      | Sales_SalesPeriod      | 11          |
      | Sales_GrossSalesAmount | $150,000.00 |
      | Sales_NetSalesAmount   | $150,000.00 |
      | Sales_SalesYear        | 2014        |
    And I set list fields values on editable page
      | name                      | value             |
      | Sales_CodeSalesGroupID    | Sales             |
      | Sales_CodeSalesTypeID     | Credit Card Sales |
      | Sales_CodeSalesCategoryID | Actual            |
      | Sales_CodeCurrencyTypeID  | USD               |
    And I click on the "Save Changes" action panel button
    And I verify row from grid "thisDiv" having unique value "Credit Card Sales" under column header "Sales Type"
      | name               | value             |
      | Sales Group        | Sales             |
      | Sales Type         | Credit Card Sales |
      | Sales Category     | Actual            |
      | Sales Period       | 11                |
      | Sales Year         | 2014              |
      | Gross Sales Amount | $150,000.00       |
      | Net Sales Amount   | $150,000.00       |
      | Currency           | USD               |
    And I switch to default frame
    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name                        |
      | Contract | Payment Info     | Sales           | Portioned BP with Omit Sales Group |


  Scenario Outline: I verify the PR Single BP Schedule should reflect the correct amounts for both the Sales Group.
  Omit sale amount is not omitted from gross sales
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "January" month and "2014" year from dropdown in schedule details to view the details
    And I verify row from grid "BOGridVirtualSalesPeriod" having unique value "$150,000" under column header "Excluded Sales"
      | name                   | value          |
      | Sales Group            | Sales          |
      | Month/Year             | November, 2014 |
      | Gross Sales            | $0             |
      | Excluded Sales         | $150,000       |
      | Lease YTD Sales        |                |
      | Breakpoint             |                |
      | Sales Past Breakpoint  |                |
      | Rate                   |                |
      | Total %Rent            |                |
      | Amount Previously Paid |                |
      | %Rent Owed             |                |
    And I verify row from grid "BOGridVirtualSalesPeriod" having unique value "5.00%" under column header "Rate"
      | name                   | value          |
      | Sales Group            | Sales          |
      | Month/Year             | December, 2014 |
      | Gross Sales            | $250,000       |
      | Excluded Sales         | $0             |
      | Lease YTD Sales        | $100,000       |
      | Breakpoint             | $28,571        |
  #      | Sales Past Breakpoint  | $71,428.57     | Ticket : http://jira.lucernex.com/browse/IWMS-21087
      | Sales Past Breakpoint  | $71,429        |
      | Rate                   | 5.00%          |
  #      | Total %Rent            | $3,571.43      |
      | Total %Rent            | $3,571.43      |
      | Amount Previously Paid |                |
      | %Rent Owed             | $3,571.43      |
#      | name                   | value          |
#      | Sales Group            | Sales          |
#      | Month/Year             | December, 2014 |
#      | Gross Sales            | $250,000       |
#      | Excluded Sales         | $0             |
#      | Lease YTD Sales        | $100,000.00    |
#      | Breakpoint             | $28,571.43     |
##      | Sales Past Breakpoint  | $71,428.57     | Ticket : http://jira.lucernex.com/browse/IWMS-21087
#      | Sales Past Breakpoint  | $71,429        |
#      | Rate                   | 5.00%          |
##      | Total %Rent            | $3,571.43      |
#      | Total %Rent            | $3,571         |
#      | Amount Previously Paid |                |
#      | %Rent Owed             | $3,571.43      |
    And I verify row from grid "BOGridVirtualSalesPeriod" having unique value "10.00%" under column header "Rate"
      | name                   | value          |
      | Sales Group            | Sales Lease    |
      | Month/Year             | December, 2014 |
      | Gross Sales            | $250,000       |
      | Excluded Sales         | $0             |
      | Lease YTD Sales        | $250,000       |
      | Breakpoint             | $71,429        |
  #      | Sales Past Breakpoint  | $178,571.43    |
      | Sales Past Breakpoint  | $178,571       |
      | Rate                   | 10.00%         |
  #      | Total %Rent            | $17,857.14     |
      | Total %Rent            | $17,857.14     |
      | Amount Previously Paid |                |
      | %Rent Owed             | $17,857.14     |
#      | name                   | value          |
#      | Sales Group            | Sales Lease    |
#      | Month/Year             | December, 2014 |
#      | Gross Sales            | $250,000       |
#      | Excluded Sales         | $0             |
#      | Lease YTD Sales        | $250,000.00    |
#      | Breakpoint             | $71,428.57     |
##      | Sales Past Breakpoint  | $178,571.43    |
#      | Sales Past Breakpoint  | $178,571       |
#      | Rate                   | 10.00%         |
##      | Total %Rent            | $17,857.14     |
#      | Total %Rent            | $17,857        |
#      | Amount Previously Paid |                |
#      | %Rent Owed             | $17,857.14     |
    And I switch to default frame
    And I wait for the Loading text to disappear
    And I click on the "Process Payment" action panel button
    And I see the "Process Payment" modal window
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
    And I click on the "Transactions" tab
    And I verify row from grid "thisDiv" having unique value "12/31/2014" under column header "Effective Date"
      | name             | value             |
      | Effective Date   | 12/31/2014        |
      | Group            | Lease Expense     |
      | Type             | Percentage Rent   |
      | Category         | Rent              |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | $21,428.57        |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name                        | Percentage Rent page                 |
      | Contract | Payment Info     | Percentage Rent | Portioned BP with Omit Sales Group | Percentage Rent (Single BP) Schedule |