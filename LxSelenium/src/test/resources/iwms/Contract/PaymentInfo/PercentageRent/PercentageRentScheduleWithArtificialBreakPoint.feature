@all
Feature: (Ref : Jira Ticket No : Automation-634) Simple Percent Rent Schedule with Artificial Breakpoint

  Scenario Outline: I import file for Simple Percent Rent Schedule with Artificial Breakpoint
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
    #Xml is cleaned on 28/03/2016
      | 1SimplePRWithArtificialBP.xml |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline:As a delete user I add Simple Percent Rent with Artificial Breakpoint
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear in grid
    And I click on the "Add item" action panel button
    And I wait for the Loading text to disappear
    And I select Artificial Breakpoint radio button
    And I set list fields values on editable page
      | name                                     | value           |
      | PercentageRent_CodeSalesGroupID_         | Sales           |
      | PercentageRent_CodeBillingFrequencyID_   | Monthly         |
      | PercentageRent_CodeReportingFrequencyID_ | Monthly         |
      | PercentageRent_CodeExpenseGroupID_       | Lease Expense   |
      | PercentageRent_CodeExpenseTypeID_        | Percentage Rent |
      | PercentageRent_CodePercentageRentTypeID  | Annual Gross-up |
      | PercentageRent_CodeCurrencyTypeID        | USD             |

    And I set following fields value on editable page
      | name                                | value                  |
      | PercentageRent_BeginDate            | 01/01/2010             |
      | PercentageRent_EndDate              | 12/31/2016             |
      | PercentageRent_Description          | Added Artificial BP PR |
      | PercentageRent_PeriodPaymentDueDays | 1                      |
      | PercentageRent_PeriodReportDueDays  | 1                      |
      | PercentageRent_AnnualPaymentDueDays | 1                      |
      | PercentageRent_AnnualReportDueDays  | 1                      |

    And I click on the "Save Changes" action panel button

    And I verify a row from grid "thisDiv" having unique value "01/01/2010" under column header "Begin Date"
      | name                | value                  |
      | Begin Date          | 01/01/2010             |
      | End Date            | 12/31/2016             |
      | Sales Group         | Sales                  |
      | Description         | Added Artificial BP PR |
      | Calculation Method  | Annual Gross-up        |
      | Payment Frequency   | Monthly                |
      | Reporting Frequency | Monthly                |

    And I click on the " Add Percentage Rent Breakpoint... "
    And I switch to default frame
    And I wait for modal window to open
    And I see the "Add Percentage Rent Breakpoint  ***Required fields in red" modal window

    And I set following fields value on editable page
      | name                                       | value      |
      | PercentageRentBreakpoint_CodeSalesGroupID  | Sales      |
      | PercentageRentBreakpoint_BeginDate         | 01/01/2010 |
      | PercentageRentBreakpoint_EndDate           | 12/31/2016 |
      | PercentageRentBreakpoint_BreakpointAmount1 | 100000     |
      | PercentageRentBreakpoint_BreakpointAmount2 | 150000     |
      | PercentageRentBreakpoint_BreakpointAmount3 | 200000     |
      | PercentageRentBreakpoint_BreakpointRate1   | 10         |
      | PercentageRentBreakpoint_BreakpointRate2   | 5          |
      | PercentageRentBreakpoint_BreakpointRate3   | 3          |

    And I click on the "Add" button
    And I wait for modal window to close

    And I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "01/01/2010" under column header "Begin Date"
      | name                 | value       |
      | Begin Date           | 01/01/2010  |
      | End Date             | 12/31/2016  |
      | Sales Group          | Sales       |
      | Breakpoint Amount #1 | $100,000.00 |
      | Breakpoint Rate #1   | 10.00000%   |
      | Breakpoint Amount #2 | $150,000.00 |
      | Breakpoint Rate #2   | 5.00000%    |
      | Breakpoint Amount #3 | $200,000.00 |
      | Breakpoint Rate #3   | 3.00000%    |


    Examples:
      | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                      |
      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Simple PR with Artificial BP-634 |


  Scenario Outline: As a delete user I process payment and verify transactions
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear in grid
    And I select an option "Percentage Rent (Multi BP) Schedule"
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
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name                      | value    |
      | CurrentSelectorDate_month | December |
      | CurrentSelectorDate_year  | 2014     |
    And I click on "Refresh" Button
    And I verify a important row from grid "BOGridVirtualSalesPeriod" having unique value "12/2014" under column header "Period /Year"
      | name              | value    |
      | Sales Group       | Sales    |
      | Period /Year      | 12/2014  |
      | Amount Prev. Paid | <Amount> |
    And I verify following pair of values on non editable page
      | name                  | value    |
      | Total Percentage Rent | <Amount> |
      | Amount Already Paid   | <Amount> |
    And I check for complete frame 'loading...'
    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "12/31/2014" under column header "Effective Date"
      | name             | value             |
      | Effective Date   | 12/31/2014        |
      | Group            | Lease Expense     |
      | Type             | Percentage Rent   |
      | Category         | Rent              |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | <Amount>          |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |

    Examples:
      | Amount     | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                      |
      | $42,689.01 | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Simple PR with Artificial BP-634 |