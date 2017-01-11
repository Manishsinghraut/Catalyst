@all
Feature: (Ref : Jira Ticket No : Automation-659) Portioned Breakpoint Calculations

  Scenario Outline: I import file for Portioned Breakpoint Calculations
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/"
    And I import following file name:
      #| Portioned_BP_With_Exclusions.xml      |
      | PortionedBPWithExclusions.xml         |
      | Portioned_BP_With_Sales_Exclusion.xml |

  Examples:s
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I ensure that there is a line item for Recurring Expense having Expense Type set to Percent Rent and Frequency set to None
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
      | name             | value           |
      | Expense Type     | Percentage Rent |
      | Expense Category | Rent            |
      | Begin Date       |                 |
      | End Date         |                 |
      | Frequency        | None            |
      | Period Amount    |                 |
      | Annual Amount    |                 |

  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab    | Entity Name                  |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | Recurring Expenses | Portioned BP with Exclusions |

  Scenario Outline: As a delete user I add items for Percent Rent
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click on the "Add item" action panel button
    And I switch to visible frame
    And I set following fields value on editable page
      | name                       | value                     |
      | PercentageRent_Description | Portioned BP Calculations |
      | PercentageRent_BeginDate   | <Begin Date>              |
      | PercentageRent_EndDate     | <End Date>                |

    And I set list fields values on editable page
      | name                                    | value           |
      | PercentageRent_CodeSalesGroupID         | <Sales Group>   |
      | PercentageRent_CodeBillingFrequencyID   | Annually        |
      | PercentageRent_CodePercentageRentTypeID | Annual Gross-up |
    And I select following radio by label
      | name                  |
      | Artificial Breakpoint |
    And I click on the "Save Changes" action panel button
    And I verify a row from grid "thisDiv" having unique value "<Sales Group>" under column header "Sales Group"
      | name               | value                     |
      | Begin Date         | <Begin Date>              |
      | End Date           | <End Date>                |
      | Payment Frequency  | Annually                  |
      | Calculation Method | Annual Gross-up           |
      | Description        | Portioned BP Calculations |

  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                  | Sales Group | Begin Date | End Date   |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Portioned BP with Exclusions | Sales       | 01/01/2010 | 12/31/2015 |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Portioned BP with Exclusions | Sales Lease | 01/01/2010 | 12/31/2015 |


  Scenario Outline: As a delete user I add PR Breakpoint
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I set following fields value on editable page
      | name                                    | value  |
      | PercentageRent_NaturalBreakpointFlag    | false   |
    And I click on row from grid "thisDiv" having unique value "Sales Lease" under column header "Sales Group"
      | name               | value           |
      | Begin Date         | <Begin Date>    |
      | End Date           | <End Date>      |
      | Payment Frequency  | Annually        |
      | Calculation Method | Annual Gross-up |

    #Add master Breakpoint
    And I click on the " Add Percentage Rent Breakpoint... "
    And I switch to default frame
    And I wait for modal window to open
    And I see the "Add Percentage Rent Breakpoint  ***Required fields in red" modal window

    And I set following fields value on editable page
      | name                                       | value        |
      | PercentageRentBreakpoint_BeginDate         | <Begin Date> |
      | PercentageRentBreakpoint_EndDate           | <End Date>   |
      | PercentageRentBreakpoint_BreakpointAmount1 | 100000       |

    And I set list fields values on editable page
      | name                                      | value  |
      | PercentageRentBreakpoint_CodeSalesGroupID | Master |

    And I click on the "Add" button
    And I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "Master" under column header "Sales Group"
      | name                  | value        |
      | Begin Date            | <Begin Date> |
      | End Date              | <End Date>   |
      | Sales Group           | Master       |
      | Portioned Sales Group |              |
      | Breakpoint Amount #1  | $100,000.00  |
      | Breakpoint Rate #1    |              |

    #Add Sales BP
    And I click on row from grid "thisDiv" having unique value "Sales Lease" under column header "Sales Group"
      | name               | value           |
      | Begin Date         | <Begin Date>    |
      | End Date           | <End Date>      |
      | Payment Frequency  | Annually        |
      | Calculation Method | Annual Gross-up |
    And I click on the " Add Percentage Rent Breakpoint... "
    And I switch to default frame
    And I wait for modal window to open
    And I see the "Add Percentage Rent Breakpoint  ***Required fields in red" modal window

    And I set following fields value on editable page
      | name                                     | value        |
      | PercentageRentBreakpoint_BeginDate       | <Begin Date> |
      | PercentageRentBreakpoint_EndDate         | <End Date>   |
      | PercentageRentBreakpoint_BreakpointRate1 | 5            |

    And I set list fields values on editable page
      | name                                               | value  |
      | PercentageRentBreakpoint_CodeSalesGroupID          | Sales  |
      | PercentageRentBreakpoint_CodePortionedSalesGroupID | Master |

    And I click on the "Add" button
    And I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "Sales" under column header "Sales Group"
      | name                  | value        |
      | Begin Date            | <Begin Date> |
      | End Date              | <End Date>   |
      | Sales Group           | Sales        |
      | Portioned Sales Group | Master       |
      | Breakpoint Amount #1  |              |
      | Breakpoint Rate #1    | 5.00000%     |

      #Add Sales Lease
    And I click on row from grid "thisDiv" having unique value "Sales Lease" under column header "Sales Group"
      | name               | value           |
      | Begin Date         | <Begin Date>    |
      | End Date           | <End Date>      |
      | Payment Frequency  | Annually        |
      | Calculation Method | Annual Gross-up |
    And I click on the " Add Percentage Rent Breakpoint... "
    And I switch to default frame
    And I wait for modal window to open
    And I see the "Add Percentage Rent Breakpoint  ***Required fields in red" modal window

    And I set following fields value on editable page
      | name                                     | value        |
      | PercentageRentBreakpoint_BeginDate       | <Begin Date> |
      | PercentageRentBreakpoint_EndDate         | <End Date>   |
      | PercentageRentBreakpoint_BreakpointRate1 | 10           |

    And I set list fields values on editable page
      | name                                               | value       |
      | PercentageRentBreakpoint_CodeSalesGroupID          | Sales Lease |
      | PercentageRentBreakpoint_CodePortionedSalesGroupID | Master      |

    And I click on the "Add" button
    And I verify a row from grid "BOGridPercentageRentBreakpoint" having unique value "Sales Lease" under column header "Sales Group"
      | name                  | value        |
      | Begin Date            | <Begin Date> |
      | End Date              | <End Date>   |
      | Sales Group           | Sales Lease  |
      | Portioned Sales Group | Master       |
      | Breakpoint Amount #1  |              |
      | Breakpoint Rate #1    | 10.00000%    |

  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                  | Begin Date | End Date   |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Portioned BP with Exclusions | 01/01/2010 | 12/31/2015 |


  Scenario Outline: As a delete user I add items for Sales
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click on the "Add item" action panel button
    And I switch to visible frame
    And I set list fields values on editable page
      | name                      | value         |
      | Sales_CodeSalesGroupID    | <Sales Group> |
      | Sales_CodeSalesTypeID     | <Sales Type>  |
      | Sales_CodeSalesCategoryID | Actual        |
      | Sales_CodeCurrencyTypeID  | USD           |
    And I set fields values on editable page
      | name                   | value  |
      | Sales_SalesPeriod      | 12     |
      | Sales_GrossSalesAmount | 250000 |
      | Sales_NetSalesAmount   | 250000 |
      | Sales_SalesYear        | 2014   |
    And I click on the "Save Changes" action panel button
    And I verify a row from grid "thisDiv" having unique value "<Sales Group>" under column header "Sales Group"
      | name               | value         |
      | Sales Group        | <Sales Group> |
      | Sales Type         | <Sales Type>  |
      | Sales Category     | Actual        |
      | Sales Period       | 12            |
      | Sales Year         | 2014          |
      | Gross Sales Amount | $250,000.00   |
      | Net Sales Amount   | $250,000.00   |
      | Currency           | USD           |

  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                  | Sales Group | Sales Type   |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | Sales           | Portioned BP with Exclusions | Sales       | Retail Sales |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | Sales           | Portioned BP with Exclusions | Sales Lease | Add Sales    |


  Scenario Outline: As a delete user I verify the Portion BP amount for both the Sales Group
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I select an option "Percentage Rent (Single BP) Schedule"
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name                      | value   |
      | CurrentSelectorDate_month | January |
      | CurrentSelectorDate_year  | 2014    |
    And I click on "Refresh" Button
    And I wait for the Loading text to disappear
#    And I verify row count "12" in the grid "BOGridVirtualSalesPeriod" having value "Sales" under header "Sales Group"
#    And I verify row count "12" in the grid "BOGridVirtualSalesPeriod" having value "Sales Lease" under header "Sales Group"
#    And I verify a row from grid "BOGridVirtualSalesPeriod" having unique value "$250,000" under column header "Gross Sales"
#      | name                   | value          |
#      | Sales Group            | Sales          |
#      | Month/Year             | December, 2014 |
#      | Excluded Sales         | $0             |
#      | Lease YTD Sales        | $250,000.00    |
#      | Breakpoint             | $50,000.00     |
#      | Sales Past Breakpoint  | $200,000.00    |
#      | Rate                   | 5.00%          |
#      | Total %Rent            | $10,000.00     |
#      | Amount Previously Paid |                |
#      | %Rent Owed             | $10,000.00     |
#
#    And I verify a row from grid "BOGridVirtualSalesPeriod" having unique value "$250,000" under column header "Gross Sales"
#      | name                   | value          |
#      | Sales Group            | Sales Lease    |
#      | Month/Year             | December, 2014 |
#      | Excluded Sales         | $0             |
#      | Lease YTD Sales        | $250,000.00    |
#      | Breakpoint             | $50,000.00     |
#      | Sales Past Breakpoint  | $200,000.00    |
#      | Rate                   | 10.00%         |
#      | Total %Rent            | $20,000.00     |
#      | Amount Previously Paid |                |
#      | %Rent Owed             | $20,000.00     |

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
      | Sales       | November, 2014  |            |               |               |            |                     |        |                  |            |             |
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



  Examples:
    | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name                  |
    | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Portioned BP with Exclusions |



