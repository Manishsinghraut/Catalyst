@all
Feature: I verify the Exclusion Rate calculations for Percentage Rent (Jira Ref : AUTOMATION-642)

  Scenario Outline: I import file for Exclusion Rate calculations for Percentage Rent entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
      | ExclusionRateCalculationsForPercentageRent.xml |


    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: I Exclusion Rate calculations for Percentage Rent
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "Recurring Expenses" tab
    Then I verify page title "Contract Expense Setup List" after navigation
    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
      | name             | value           |
      | Expense Type     | Percentage Rent |
      | Expense Category | Rent            |
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
      | End Date        | 12/31/2030        |
    And I click on the "Percentage Rent" tab
    Then I verify page title "Contract Percentage Rent List" after navigation
    And I verify a row from grid "thisDiv" having unique value "12/31/2030" under column header "End Date"
      | name                | value           |
      | Begin Date          | 01/01/2000      |
      | Sales Group         | Sales           |
      | Description         |                 |
      | Calculation Method  | Period Gross-up |
      | Payment Frequency   | Monthly         |
      | Reporting Frequency | Monthly         |
#    And I select "<Percentage Rent page>" from Page dropdown
    And I click row from grid "thisDiv" having unique value "12/31/2030" under column header "End Date"
    And I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "$1,000,000.00" under column header "Breakpoint Amount #1"
      | name                  | value         |
      | Begin Date            | 01/01/2000    |
      | End Date              | 12/31/2030    |
      | Sales Group           | Sales         |
      | Portioned Sales Group |               |
      | Natural Rate          |               |
      | Breakpoint Amount #1  | $1,000,000.00 |
      | Breakpoint Rate #1    | 10.00000%     |
      | Breakpoint Amount #2  |               |
      | Breakpoint Rate #2    |               |
      | Breakpoint Amount #3  |               |
      | Breakpoint Rate #3    |               |
      | Notes                 |               |
    And I verify a row from grid "BOGridSalesExclusion" having unique value "Credit Card Sales" under column header "Sales Type"
      | name            | value             |
      | Sales Group     | Sales             |
      | Sales Type      | Credit Card Sales |
      | Exclusion Group |                   |
      | Begin Date      | 01/01/2000        |
      | End Date        | 12/31/2030        |
      | Cap Percent     |                   |
      | Cap Amount      |                   |
      | Notes           |                   |
    When I click "edit" link of "Credit Card Sales" in grid "BOGridSalesExclusion"
    And I switch to default frame
    And I verify the following fields value on editable page
      | name                            | value             |
      | SalesExclusion_CodeSalesGroupID | Sales             |
      | SalesExclusion_CodeSalesTypeID  | Credit Card Sales |
      | SalesExclusion_BeginDate        | 01/01/2000        |
      | SalesExclusion_EndDate          | 12/31/2030        |
      | SalesExclusion_ExclusionRate    | 40.00000%         |
    And I click on the "Cancel" button
    And I switch to default frame
    And I click on the "Sales" tab
    Then I verify page title "Contract Sales History List" after navigation
    And I verify the following values in frame grid "thisDiv"
      | Sales Group | Sales Type   | Sales Category | Sales Period | Sales Year | Gross Sales Amount | Net Sales Amount | Currency |
      | Sales       | Retail Sales | Actual         | 12           | 2014       | $100,000.00        | $100,000.00      | USD      |
      | Sales       | Retail Sales | Actual         | 10           | 2014       | $100,000.00        | $100,000.00      | USD      |
      | Sales       | Retail Sales | Actual         | 9            | 2014       | $160,000.00        | $160,000.00      | USD      |
      | Sales       | Retail Sales | Actual         | 8            | 2014       | $100,000.00        | $100,000.00      | USD      |
      | Sales       | Retail Sales | Actual         | 7            | 2014       | $99,987.00         | $99,987.00       | USD      |
      | Sales       | Retail Sales | Actual         | 6            | 2014       | $117,000.00        | $117,000.00      | USD      |
      | Sales       | Retail Sales | Actual         | 5            | 2014       | $98,000.00         | $98,000.00       | USD      |
      | Sales       | Retail Sales | Actual         | 4            | 2014       | $128,980.00        | $128,980.00      | USD      |
      | Sales       | Retail Sales | Actual         | 3            | 2014       | $132,000.00        | $132,000.00      | USD      |
      | Sales       | Retail Sales | Actual         | 2            | 2014       | $127,000.00        | $127,000.00      | USD      |
      | Sales       | Retail Sales | Actual         | 1            | 2014       | $110,000.00        | $110,000.00      | USD      |
    And I switch to default frame
    And I click on the "<Third Level Tab>" tab
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "<Month>" month and "<Year>" year from dropdown in schedule details to view the details
#    And I verify the following values in frame grid "BOGridVirtualSalesPeriod"
#      | Sales Group | Month/Year     | Gross Sales | Excluded Sales | Lease YTD Sales | Breakpoint | Sales Past Breakpoint | Rate   | Total %Rent | Amount Previously Paid | %Rent Owed |
#      | Sales       | November, 2014 | $110,000    | $4,000         | $106,000.00     | $83,333.33 | $22,667               | 10.00% | $36,230     |                        | $2,266.67  |

    And I verify the following values in frame grid "BOGridVirtualSalesPeriod"
      | Sales Group | Month/Year     | Gross Sales | Excluded Sales | Lease YTD Sales | Breakpoint | Sales Past Breakpoint | Rate   | Total %Rent | Amount Previously Paid | %Rent Owed |
      | Sales       | November, 2014 | $110,000    | $4,000         | $106,000        | $83,333    | $22,667               | 10.00% | $36,230.07  |                        | $2,266.67  |

    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name                                     | Percentage Rent page                 | Month    | Year |
      | Contract | Payment Info     | Percentage Rent | Exclusion Rate calculations for Percentage Rent | Percentage Rent (Single BP) Schedule | December | 2014 |

















#@all
#Feature: I verify the Exclusion Rate calculations for Percentage Rent (Jira Ref : AUTOMATION-642)
#
#  Scenario Outline: I import file for Exclusion Rate calculations for Percentage Rent entity
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
#    And I import following file name:
#      | ExclusionRateCalculationsForPercentageRent.xml |
#
#
#    Examples:
#      | Login User   | Login full username  |
#      | DeleteAccess | Delete Access Access |
#
#
#  Scenario Outline: I Exclusion Rate calculations for Percentage Rent
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "Recurring Expenses" tab
#    Then I verify page title "Contract Expense Setup List" after navigation
#    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
#      | name             | value           |
#      | Expense Type     | Percentage Rent |
#      | Expense Category | Rent            |
#      | Begin Date       |                 |
#      | End Date         |                 |
#      | Frequency        | None            |
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
#      | End Date        | 12/31/2030        |
#    And I click on the "Percentage Rent" tab
#    Then I verify page title "Contract Percentage Rent List" after navigation
#    And I verify a row from grid "thisDiv" having unique value "12/31/2030" under column header "End Date"
#      | name                | value           |
#      | Begin Date          | 01/01/2000      |
#      | Sales Group         | Sales           |
#      | Description         |                 |
#      | Calculation Method  | Period Gross-up |
#      | Payment Frequency   | Monthly         |
#      | Reporting Frequency | Monthly         |
##    And I select "<Percentage Rent page>" from Page dropdown
#    And I click row from grid "thisDiv" having unique value "12/31/2030" under column header "End Date"
#    And I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "$1,000,000.00" under column header "Breakpoint Amount #1"
#      | name                  | value         |
#      | Begin Date            | 01/01/2000    |
#      | End Date              | 12/31/2030    |
#      | Sales Group           | Sales         |
#      | Portioned Sales Group |               |
#      | Natural Rate          |               |
#      | Breakpoint Amount #1  | $1,000,000.00 |
#      | Breakpoint Rate #1    | 10.00000%     |
#      | Breakpoint Amount #2  |               |
#      | Breakpoint Rate #2    |               |
#      | Breakpoint Amount #3  |               |
#      | Breakpoint Rate #3    |               |
#      | Notes                 |               |
#    And I verify a row from grid "BOGridSalesExclusion" having unique value "Credit Card Sales" under column header "Sales Type"
#      | name            | value             |
#      | Sales Group     | Sales             |
#      | Sales Type      | Credit Card Sales |
#      | Exclusion Group |                   |
#      | Begin Date      | 01/01/2000        |
#      | End Date        | 12/31/2030        |
#      | Cap Percent     |                   |
#      | Cap Amount      |                   |
#      | Notes           |                   |
#    When I click "edit" link of "Credit Card Sales" in grid "BOGridSalesExclusion"
#    And I switch to default frame
#    And I verify the following fields value on editable page
#      | name                            | value             |
#      | SalesExclusion_CodeSalesGroupID | Sales             |
#      | SalesExclusion_CodeSalesTypeID  | Credit Card Sales |
#      | SalesExclusion_BeginDate        | 01/01/2000        |
#      | SalesExclusion_EndDate          | 12/31/2030        |
#      | SalesExclusion_ExclusionRate    | 40.00000%         |
#    And I click on the "Cancel" button
#    And I switch to default frame
#    And I click on the "Sales" tab
#    Then I verify page title "Contract Sales History List" after navigation
#    And I verify the following values in frame grid "thisDiv"
#      | Sales Group | Sales Type   | Sales Category | Sales Period | Sales Year | Gross Sales Amount | Net Sales Amount | Currency |
#      | Sales       | Retail Sales | Actual         | 12           | 2014       | $100,000.00        | $100,000.00      | USD      |
#      | Sales       | Retail Sales | Actual         | 10           | 2014       | $100,000.00        | $100,000.00      | USD      |
#      | Sales       | Retail Sales | Actual         | 9            | 2014       | $160,000.00        | $160,000.00      | USD      |
#      | Sales       | Retail Sales | Actual         | 8            | 2014       | $100,000.00        | $100,000.00      | USD      |
#      | Sales       | Retail Sales | Actual         | 7            | 2014       | $99,987.00         | $99,987.00       | USD      |
#      | Sales       | Retail Sales | Actual         | 6            | 2014       | $117,000.00        | $117,000.00      | USD      |
#      | Sales       | Retail Sales | Actual         | 5            | 2014       | $98,000.00         | $98,000.00       | USD      |
#      | Sales       | Retail Sales | Actual         | 4            | 2014       | $128,980.00        | $128,980.00      | USD      |
#      | Sales       | Retail Sales | Actual         | 3            | 2014       | $132,000.00        | $132,000.00      | USD      |
#      | Sales       | Retail Sales | Actual         | 2            | 2014       | $127,000.00        | $127,000.00      | USD      |
#      | Sales       | Retail Sales | Actual         | 1            | 2014       | $110,000.00        | $110,000.00      | USD      |
#    And I switch to default frame
#    And I click on the "<Third Level Tab>" tab
#    And I select "<Percentage Rent page>" from Page dropdown
#    And I select "<Month>" month and "<Year>" year from dropdown in schedule details to view the details
#    And I verify the following values in frame grid "BOGridVirtualSalesPeriod"
#      | Sales Group | Month/Year     | Gross Sales | Excluded Sales | Lease YTD Sales | Breakpoint | Sales Past Breakpoint | Rate   | Total %Rent | Amount Previously Paid | %Rent Owed |
#      | Sales       | November, 2014 | $110,000    | $4,000         | $106,000.00     | $83,333.33 | $22,666.67            | 10.00% | $36,230.07  |                        | $2,266.67  |
#    And I switch to default frame
#
#    Examples:
#      | Item     | Second Level Tab | Third Level Tab | Entity Name                                     | Percentage Rent page                 | Month    | Year |
#      | Contract | Payment Info     | Percentage Rent | Exclusion Rate calculations for Percentage Rent | Percentage Rent (Single BP) Schedule | December | 2014 |