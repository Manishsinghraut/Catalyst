@all
Feature: (Ref : Jira Ticket No : Automation-635) Simple Percent Rent Schedule with Natural Breakpoint

  Scenario Outline: I import file for Simple Percent Rent Schedule with Natural Breakpoint
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
#      | Simple_Natural_BreakPoints.xml |
      | Cleaned_Simple_Natural_BreakPoints.xml |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline:As a delete user I add Simple Percent Rent with Natural Breakpoint
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear in grid
    And I click on the "Add item" action panel button
    And I wait for the Loading text to disappear
    And I select following radio by label
      | name               |
      | Natural Breakpoint |

    And I set list fields values on editable page
      | name                                     | value           |
      | PercentageRent_CodePercentageRentTypeID  | Annual Gross-up |
      | PercentageRent_CodeSalesGroupID_         | Sales           |
      | PercentageRent_CodeBillingFrequencyID_   | Monthly         |
      | PercentageRent_CodeReportingFrequencyID_ | Monthly         |
      | PercentageRent_CodeExpenseGroupID_       | Base Rent       |
      | PercentageRent_CodeExpenseTypeID_        | Rent            |
      | PercentageRent_CodeCurrencyTypeID        | USD             |

    And I set following fields value on editable page
      | name                       | value               |
      | PercentageRent_BeginDate   | 01/01/2010          |
      | PercentageRent_EndDate     | 12/31/2016          |
      | PercentageRent_Description | Added Natural BP PR |

    And I click on the "Save Changes" action panel button

    And I verify a row from grid "thisDiv" having unique value "01/01/2010" under column header "Begin Date"
      | name                | value               |
      | Begin Date          | 01/01/2010          |
      | End Date            | 12/31/2016          |
      | Sales Group         | Sales               |
      | Description         | Added Natural BP PR |
      | Calculation Method  | Annual Gross-up     |
      | Payment Frequency   | Monthly             |
      | Reporting Frequency | Monthly             |

    And I click on the " Add Percentage Rent Breakpoint... "
    And I switch to default frame
    And I wait for modal window to open
    And I see the "Add Percentage Rent Breakpoint  ***Required fields in red" modal window

    And I set following fields value on editable page
      | name                                           | value      |
      | PercentageRentBreakpoint_CodeSalesGroupID      | Sales      |
      | PercentageRentBreakpoint_BeginDate             | 01/01/2010 |
      | PercentageRentBreakpoint_EndDate               | 12/31/2016 |
      | PercentageRentBreakpoint_BreakpointRate1       | 10         |
      | PercentageRentBreakpoint_NaturalBreakpointRate | 5          |

    And I click on the "Add" button

    And I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "01/01/2010" under column header "Begin Date"
      | name               | value      |
      | Begin Date         | 01/01/2010 |
      | End Date           | 12/31/2016 |
      | Breakpoint Rate #1 | 10.00000%  |
      | Natural Rate       | 5.00000%   |


    Examples:
      | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                |
      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Simple Natural BreakPoints |


  Scenario Outline: As a delete user I process payment
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
      | name         | value   |
      | mnToGenerate | January |
    Then I set fields values on editable page
      | name         | value |
      | yrToGenerate | 2015  |
    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name                      | value |
      | CurrentSelectorDate_month | March |
      | CurrentSelectorDate_year  | 2015  |
    And I click on "Refresh" Button
    And I switch to default frame
    And I verify pair of values on non editable summary page
      | name                | value    |
      | Amount Already Paid | <Amount> |


    Examples:
      | Amount     | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                |
      | $80,000.00 | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Simple Natural BreakPoints |


  Scenario Outline: As a delete user I check payment transaction generated after processing the payment
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "thisDiv" having unique value "01/31/2015" under column header "Effective Date"
      | name             | value             |
      | Group            | Base Rent         |
      | Type             | Rent              |
      | Category         | Rent              |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | <Amount>          |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |

    Examples:
      | Amount     | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                |
      | $80,000.00 | DeleteAccess | Delete Access Access | Contract | Payment Info     | Transactions    | Simple Natural BreakPoints |

