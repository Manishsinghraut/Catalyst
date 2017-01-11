@all
Feature: (Ref : Jira Ticket No : Automation-698) Calculating Percent Rent when using alias sales group

  Scenario Outline: I import file for Calculating Percent Rent when using alias sales group
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ExclusionsAndSalesGroupAlias/"
    And I import following file name:
      | CalculatePRWhenUsingAliasSalesGroup.xml |

  Examples:s
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I
  1. Ensure Omit from Sales Group Total -checkbox Default should be unchecked
  2. Add new Sales type and check "Omit from Sales Group Total" checkbox

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "Payment Info"
    And I click on the "Sales" tab
    And I check for complete frame 'loading...'
    And I click on the '...' of the type field "Sales_CodeSalesTypeID"
    And I see modal window
    And I click on "Add Sales Type..." button in grid
    And I see the "Add Sales Type  ***Required fields in red" modal window
    And I verify the following fields value on editable page
      | name                              | value |
      | _checkbox_OmitFromSalesGroupTotal | false |

    And I set following fields value on editable page
      | name                              | value             |
      | ShortName                         | <Sales Type>      |
      | ActualLongName                    | Create Sales Type |
      | ParentCodeSalesGroupID            | Sales             |
      | _checkbox_OmitFromSalesGroupTotal | true              |

    And I click on the "Add" button
    And I check for complete frame 'loading...'
    And I verify the following fields value on editable page
      | name                  | value        |
      | Sales_CodeSalesTypeID | <Sales Type> |

    And I click on the "Add item" action panel button
    And I check for complete frame 'loading...'
    And I see the "Save Changes?" modal window
    And I click on the "No" button

  Examples:
    | Login User   | Login full username  | Item     | Entity Name                               | Sales Type           |
    | DeleteAccess | Delete Access Access | Contract | Calculate PR When Using Alias Sales Group | AutoExcludeSalesTest |


  Scenario Outline: As a delete user I
  1. Add 2 Sales items
  2. View Sales in Percent Rent Schedule

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "Payment Info"
    And I click on the "Sales" tab
    And I click on the "Add item" action panel button
    And I check for complete frame 'loading...'
    And I set list fields values on editable page
      | name                      | value        |
      | Sales_CodeSalesGroupID    | Sales        |
      | Sales_CodeSalesCategoryID | Actual       |
      | Sales_CodeCurrencyTypeID  | USD          |
      | Sales_CodeSalesTypeID     | Retail Sales |

    And I set following fields value on editable page
      | name                   | value |
      | Sales_SalesPeriod      | 12    |
      | Sales_SalesYear        | 2015  |
      | Sales_GrossSalesAmount | 9000  |
      | Sales_NetSalesAmount   | 9000  |

    And I click on the "Save Changes" action panel button

    And I click on the "Add item" action panel button
    And I check for complete frame 'loading...'
    And I set list fields values on editable page
      | name                      | value        |
      | Sales_CodeSalesGroupID    | Sales        |
      | Sales_CodeSalesCategoryID | Actual       |
      | Sales_CodeCurrencyTypeID  | USD          |
      | Sales_CodeSalesTypeID     | <Sales Type> |

    And I set following fields value on editable page
      | name                   | value |
      | Sales_SalesPeriod      | 12    |
      | Sales_SalesYear        | 2015  |
      | Sales_GrossSalesAmount | 5000  |
      | Sales_NetSalesAmount   | 5000  |

    And I click on the "Save Changes" action panel button
    And I click sort in header "Sales Type" from grid "thisDiv" in "Sort Ascending"
    And I verify line items in the grid "thisDiv"
      | salesGroup | salesType    | salesCategory | salesPeriod | salesYear | grossSalesAmount | netSalesAmount | currency |
      | Sales      | <Sales Type> | Actual        | 12          | 2015      | $5,000.00        | $5,000.00      | USD      |
      | Sales      | Retail Sales | Actual        | 12          | 2015      | $9,000.00        | $9,000.00      | USD      |

    And I click on the "Percentage Rent" tab
    And I select an option "Percentage Rent (Single BP) Schedule"
    And I select "January" month and "2015" year from dropdown in schedule details
    And I click on "Refresh" Button
    And I verify line items in the single BP schedule grid "BOGridVirtualSalesPeriod"
      | salesGroup | monthYear       | grossSales | excludedSales | leaseYTDSales | breakpoint | salesPastBreakpoint | rate   | totalPercentRent | amountPaid | percentOwed |
      | Sales      | January, 2015   |            |               |               |            |                     |        |                  |            |             |
      | Sales      | February, 2015  |            |               |               |            |                     |        |                  |            |             |
      | Sales      | March, 2015     |            |               |               |            |                     |        |                  |            |             |
      | Sales      | April, 2015     |            |               |               |            |                     |        |                  |            |             |
      | Sales      | May, 2015       |            |               |               |            |                     |        |                  |            |             |
      | Sales      | June, 2015      |            |               |               |            |                     |        |                  |            |             |
      | Sales      | July, 2015      |            |               |               |            |                     |        |                  |            |             |
      | Sales      | August, 2015    |            |               |               |            |                     |        |                  |            |             |
      | Sales      | September, 2015 |            |               |               |            |                     |        |                  |            |             |
      | Sales      | October, 2015   |            |               |               |            |                     |        |                  |            |             |
      | Sales      | November, 2015  |            |               |               |            |                     |        |                  |            |             |
      | Sales      | December, 2015  | $9,000     | $0            | $9,000        | $9,000     | $0                  | 10.00% | $0.00            |            | $0.00       |


  Examples:
    | Login User   | Login full username  | Item     | Entity Name                               | Sales Type           |
    | DeleteAccess | Delete Access Access | Contract | Calculate PR When Using Alias Sales Group | AutoExcludeSalesTest |