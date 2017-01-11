@all
Feature: I verify the Credit Transaction Generated (Jira Ref : AUTOMATION-661)

  Scenario Outline: I import file for PR Credit
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/"
    And I import following file name:
      | PRCredit.xml |


  Examples:s
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: I verify the Credit Transaction Generated
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "Percentage Rent" tab
    And I click on the "Add item" action panel button
    Then I verify page title "Contract Percentage Rent List" after navigation
    And I set list fields values on editable page
      | name                                     | value           |
      | PercentageRent_CodeSalesGroupID_         | Sales           |
      | PercentageRent_CodeBillingFrequencyID_   | Quarterly       |
      | PercentageRent_CodeReportingFrequencyID_ | Monthly         |
      | PercentageRent_CodeExpenseGroupID_       | Lease Expense   |
      | PercentageRent_CodeExpenseTypeID_        | Percentage Rent |
      | PercentageRent_CodePercentageRentTypeID  | Period Gross-up |
      | PercentageRent_CodeCurrencyTypeID        | USD             |
    And I set following fields value on editable page
      | name                                 | value      |
      | PercentageRent_RentYearStartMonth    | January    |
      | PercentageRent_BeginDate             | 01/01/2010 |
      | PercentageRent_EndDate               | 12/31/2015 |
      | PercentageRent_NaturalBreakpointFlag | false      |
    And I click on the "Save Changes" action panel button
    And I verify a row from grid "thisDiv" having unique value "01/01/2010" under column header "Begin Date"
      | name                | value           |
      | Begin Date          | 01/01/2010      |
      | End Date            | 12/31/2015      |
      | Sales Group         | Sales           |
      | Description         |                 |
      | Calculation Method  | Period Gross-up |
      | Payment Frequency   | Quarterly       |
      | Reporting Frequency | Monthly         |
    And I click on the " Add Percentage Rent Breakpoint... "
    And I switch to default frame
    And I wait for modal window to open
    And I see the "Add Percentage Rent Breakpoint  ***Required fields in red" modal window
    And I set following fields value on editable page
      | name                                       | value      |
      | PercentageRentBreakpoint_CodeSalesGroupID  | Sales      |
      | PercentageRentBreakpoint_BeginDate         | 01/01/2010 |
      | PercentageRentBreakpoint_EndDate           | 12/31/2015 |
      | PercentageRentBreakpoint_BreakpointAmount1 | 50000      |
      | PercentageRentBreakpoint_BreakpointRate1   | 10         |
    And I click on the "Add" button
    And I verify row from grid "BOGridPercentageRentBreakpoint" having unique value "01/01/2010" under column header "Begin Date"
      | name                  | value      |
      | Begin Date            | 01/01/2010 |
      | End Date              | 12/31/2015 |
      | Sales Group           | Sales      |
      | Portioned Sales Group |            |
      | Natural Rate          |            |
      | Breakpoint Amount #1  | $50,000.00 |
      | Breakpoint Rate #1    | 10.00000%  |
      | Breakpoint Amount #2  |            |
      | Breakpoint Rate #2    |            |
      | Breakpoint Amount #3  |            |
      | Breakpoint Rate #3    |            |
      | Notes                 |            |
    And I click on the "Save Changes" action panel button
    And I switch to default frame
#    And I click on the "<Third Level Tab>" tab
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "<Month>" month and "<Year>" year from dropdown in schedule details to view the details
    And I verify row from grid "<Grid ID>" having unique value "May, 2014" under column header "Month/Year"
      | name                   | value      |
      | Sales Group            | Sales      |
      | Month/Year             | May, 2014  |
      | Gross Sales            |            |
      | Excluded Sales         |            |
      | Lease YTD Sales        |            |
      | Breakpoint             |            |
      | Sales Past Breakpoint  |            |
      | Rate                   |            |
      | Total %Rent            |            |
      | Amount Previously Paid | $10,000.00 |
      | %Rent Owed             |            |
#    And I switch to default frame
    And I verify row from grid "<Grid ID>" having unique value "December, 2014" under column header "Month/Year"
      | name                   | value          |
      | Sales Group            | Sales          |
      | Month/Year             | December, 2014 |
      | Gross Sales            |                |
      | Excluded Sales         |                |
      | Lease YTD Sales        | $0             |
      | Breakpoint             | $50,000        |
      | Sales Past Breakpoint  | $0             |
      | Rate                   | 10.00%         |
      | Total %Rent            | $0.00          |
      | Amount Previously Paid |                |
      | %Rent Owed             | $-10,000.00    |

#      | name                   | value          |
#      | Sales Group            | Sales          |
#      | Month/Year             | December, 2014 |
#      | Gross Sales            |                |
#      | Excluded Sales         |                |
#      | Lease YTD Sales        | $0.00          |
#      | Breakpoint             | $50,000.00     |
#      | Sales Past Breakpoint  | $0             |
#      | Rate                   | 10.00%         |
#      | Total %Rent            | $0             |
#      | Amount Previously Paid |                |
#      | %Rent Owed             | $-10,000.00    |

    And I verify the "<Percentage Rent page>" values at the bottom of the page
      | name                  | value       |
      | Total Percentage Rent | $0.00       |
      | Amount Already Paid   | $10,000.00  |
      | Percentage Rent Owed  | $-10,000.00 |
      | Offset Amount         | $0.00       |
      | Net Amount Due        | $-10,000.00 |
    And I switch to default frame
    And I wait for the Loading text to disappear
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
      | postDate      | 01/08/2015      |
      | dueDate       | 01/08/2015      |
    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I switch to default frame
  Examples:
    | Item     | Second Level Tab | Third Level Tab | Entity Name | Percentage Rent page                 | Grid ID                  | Month    | Year |
    | Contract | Payment Info     | Percentage Rent | PR Credit   | Percentage Rent (Single BP) Schedule | BOGridVirtualSalesPeriod | December | 2014 |
