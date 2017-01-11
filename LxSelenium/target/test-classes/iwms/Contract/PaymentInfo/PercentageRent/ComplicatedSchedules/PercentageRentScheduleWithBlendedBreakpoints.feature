@all
Feature: I verify the Percentage Rent Schedule with Blended Breakpoints (Jira Ref : AUTOMATION-663)
  Business Scenario Breakpoint Rates change in the middle of the year
  Year January - December
  Breakpoints
  50,000 at 10% rate from 01/01/2000 to 04/30/2000
  60,000 at 11% rate from 05/01/2000 to 12/31/2000
  In the year 2000, weighted averages will be used to calculate the prorated breapoint amount and rate. Calculations are as follows
  Days at Breakpoint 1 = 04/30 - 01/01 = 120 Days
  Days at Breakpoint 2 = 12/31 - 05/01 = 244 Days
  Prorated Rate - [(120 x 10)+(244 x 11)]/(120+244) = 10.67 Percentage
  Prorated Breakpoint - [(120 x 50,000)+(244 x 60,000)]/(120+244) = 56,703.30

  Scenario Outline: I import file for Percentage Rent Schedule
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/"
    And I import following file name:
      #| PRWithProratedBreakpoints.xml |
      | PR_With_Prorated_Breakpoints.xml |


    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: I Breakpoint Rates change in the middle of the year - July 2007
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
      | Expense Category | Expense         |
      | Begin Date       |                 |
      | End Date         |                 |
      | Frequency        | None            |
      | Period Amount    |                 |
      | Annual Amount    |                 |
    And I switch to default frame
    And I verify row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium Vendor"
      | name            | value                |
      | Vendor          | Selenium Vendor      |
      | Vendor#         | 12345                |
      | Payment Percent | 100.00000%           |
      | Address         | 1901 Democracy Drive |
      | City            | Plano                |
      | State           | TX                   |
      | Begin Date      | 01/01/1990           |
      | End Date        | 12/31/2040           |
    And I switch to default frame
    And I click on the "Percentage Rent" tab
    Then I verify page title "Contract Percentage Rent List" after navigation
    And I verify row from grid "thisDiv" having unique value "02/19/2022" under column header "End Date"
      | name                | value           |
      | Begin Date          | 02/20/2007      |
      | End Date            | 02/19/2022      |
      | Sales Group         | Sales           |
      | Description         | Prorated BP     |
      | Calculation Method  | Period Gross-up |
      | Payment Frequency   | Monthly         |
      | Reporting Frequency | Monthly         |
    And I switch to default frame
    And I verify row from grid "BOGridPercentageRentBreakpoint" having unique value "02/20/2007" under column header "Begin Date"
      | name                  | value         |
      | Begin Date            | 02/20/2007    |
      | End Date              | 02/19/2012    |
      | Sales Group           | Sales         |
      | Portioned Sales Group |               |
      | Natural Rate          |               |
      | Breakpoint Amount #1  | $4,024,000.00 |
      | Breakpoint Rate #1    | 6.00000%      |
      | Breakpoint Amount #2  |               |
      | Breakpoint Rate #2    |               |
      | Breakpoint Amount #3  |               |
      | Breakpoint Rate #3    |               |
      | Notes                 |               |
    And I verify row from grid "BOGridPercentageRentBreakpoint" having unique value "02/20/2012" under column header "Begin Date"
      | name                  | value         |
      | Begin Date            | 02/20/2012    |
      | End Date              | 02/19/2017    |
      | Sales Group           | Sales         |
      | Portioned Sales Group |               |
      | Natural Rate          |               |
      | Breakpoint Amount #1  | $4,480,000.00 |
      | Breakpoint Rate #1    | 7.00000%      |
      | Breakpoint Amount #2  |               |
      | Breakpoint Rate #2    |               |
      | Breakpoint Amount #3  |               |
      | Breakpoint Rate #3    |               |
      | Notes                 |               |
    And I verify row from grid "BOGridPercentageRentBreakpoint" having unique value "02/20/2017" under column header "Begin Date"
      | name                  | value         |
      | Begin Date            | 02/20/2017    |
      | End Date              | 02/19/2022    |
      | Sales Group           | Sales         |
      | Portioned Sales Group |               |
      | Natural Rate          |               |
      | Breakpoint Amount #1  | $4,920,000.00 |
      | Breakpoint Rate #1    | 8.00000%      |
      | Breakpoint Amount #2  |               |
      | Breakpoint Rate #2    |               |
      | Breakpoint Amount #3  |               |
      | Breakpoint Rate #3    |               |
      | Notes                 |               |
    And I switch to default frame
    And I click on the "<Third Level Tab>" tab
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "July" month and "2007" year from dropdown in schedule details to view the details
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/PRWithProratedBreakpoints.xlsx"
    And I verify the grid "<Grid ID>" values with the corresponding values in the "<Spreadsheet Name>" excel <Spreadsheet No>
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name                  | Percentage Rent page                 | Grid ID                  | Spreadsheet Name | Spreadsheet No |
      | Contract | Payment Info     | Percentage Rent | PR with Prorated Breakpoints | Percentage Rent (Single BP) Schedule | BOGridVirtualSalesPeriod | July 2007        | 0              |

  Scenario Outline: I Breakpoint Rates change in the middle of the year1
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "<Month>" month and "<Year>" year from dropdown in schedule details to view the details
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/PRWithProratedBreakpoints.xlsx"
    And I verify the grid "<Grid ID>" values with the corresponding values in the "<Spreadsheet Name>" excel <Spreadsheet No>
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name                  | Percentage Rent page                 | Grid ID                  | Spreadsheet Name | Spreadsheet No | Month   | Year |
      | Contract | Payment Info     | Percentage Rent | PR with Prorated Breakpoints | Percentage Rent (Single BP) Schedule | BOGridVirtualSalesPeriod | January 2012     | 1              | January | 2012 |
      | Contract | Payment Info     | Percentage Rent | PR with Prorated Breakpoints | Percentage Rent (Single BP) Schedule | BOGridVirtualSalesPeriod | July 2016        | 2              | July    | 2016 |
      | Contract | Payment Info     | Percentage Rent | PR with Prorated Breakpoints | Percentage Rent (Single BP) Schedule | BOGridVirtualSalesPeriod | January 2017     | 3              | January | 2017 |

