@all
Feature: (Ref : Jira Ticket No : Automation-638) Percent Rent - None Option

  Scenario Outline: I import file forPercent Rent - None Option
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
      | PercentRentWithNoneOption.xml |


    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify that I have the option to select none as the reporting and payment frequencies
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I delete all rows from grid "thisDiv"
    And I click on the "Add item" action panel button
    And I wait for the Loading text to disappear
    And I select following radio by label
      | name                  |
      | Artificial Breakpoint |
    And I set list fields values on editable page
      | name                                     | value           |
      | PercentageRent_CodeSalesGroupID_         | Sales           |
      | PercentageRent_CodeBillingFrequencyID_   | None            |
      | PercentageRent_CodeReportingFrequencyID_ | None            |
      | PercentageRent_CodePercentageRentTypeID_ | Annual          |
      | PercentageRent_CodeExpenseGroupID_       | Lease Expense   |
      | PercentageRent_CodeExpenseTypeID_        | Percentage Rent |

    And I set following fields value on editable page
      | name                       | value      |
      | PercentageRent_BeginDate   | 01/01/2014 |
      | PercentageRent_EndDate     | 12/31/2016 |
      | PercentageRent_Description | PR None    |

    And I click on the "Save Changes" action panel button
    And I verify a row from grid "thisDiv" having unique value "01/01/2014" under column header "Begin Date"
      | name                | value      |
      | Begin Date          | 01/01/2014 |
      | End Date            | 12/31/2016 |
      | Sales Group         | Sales      |
      | Description         | PR None    |
      | Calculation Method  | Annual     |
      | Payment Frequency   | None       |
      | Reporting Frequency | None       |

    And I click on the " Add Percentage Rent Breakpoint... "
    And I switch to default frame
    And I wait for modal window to open
    And I see the "Add Percentage Rent Breakpoint  ***Required fields in red" modal window

    And I set following fields value on editable page
      | name                                       | value      |
      | PercentageRentBreakpoint_CodeSalesGroupID  | Sales      |
      | PercentageRentBreakpoint_BeginDate         | 01/01/2014 |
      | PercentageRentBreakpoint_EndDate           | 12/31/2016 |
      | PercentageRentBreakpoint_BreakpointAmount1 | 10000      |
      | PercentageRentBreakpoint_BreakpointAmount2 | 15000      |
      | PercentageRentBreakpoint_BreakpointAmount3 | 20000      |
      | PercentageRentBreakpoint_BreakpointRate1   | 10         |
      | PercentageRentBreakpoint_BreakpointRate2   | 5          |
      | PercentageRentBreakpoint_BreakpointRate3   | 3          |

    And I click on the "Add" button
   # And I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "01/01/2014" under column header "Begin Date"
    And I verify a important row from grid "BOGridPercentageRentBreakpoint" having unique value "01/01/2014" under column header "Begin Date"
      | name                 | value      |
      | Begin Date           | 01/01/2014 |
      | End Date             | 12/31/2016 |
      | Sales Group          | Sales      |
      | Breakpoint Amount #1 | $10,000.00 |
      | Breakpoint Rate #1   | 10.00000%  |
      | Breakpoint Amount #2 | $15,000.00 |
      | Breakpoint Rate #2   | 5.00000%   |
      | Breakpoint Amount #3 | $20,000.00 |
      | Breakpoint Rate #3   | 3.00000%   |


    Examples:
      | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                   |
      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Percent Rent With None Option |

  Scenario Outline: As a delete user I verify the Percentage Rent Schedule
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear in grid
    And I select an option "Percentage Rent (Multi BP) Schedule"
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name                      | value   |
      | CurrentSelectorDate_month | January |
      | CurrentSelectorDate_year  | 2015    |
    And I click on "Refresh" Button
    And I verify a important row from grid "BOGridVirtualSalesPeriod" having unique value "12/2015" under column header "Period /Year"
      | name            | value   |
      | Sales Group     | Sales   |
      | Period /Year    | 12/2015 |
      | Lease YTD Sales |         |
      | Brkpt 1         |         |
      | Rate 1          |         |
      | Brkpt 2         |         |
      | Rate 2          |         |
      | Brkpt 3         |         |
      | Rate 3          |         |
      | Amt Due 3       |         |
      | Total %Rent     |         |

    Examples:
      | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                   |
      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Percent Rent With None Option |

