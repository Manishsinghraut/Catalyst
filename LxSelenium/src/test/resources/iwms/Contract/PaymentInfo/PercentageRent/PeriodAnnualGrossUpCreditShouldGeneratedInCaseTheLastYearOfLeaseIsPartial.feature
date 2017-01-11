@all
Feature: (Ref : Jira Ticket No : Automation-643) Period/Annual Gross Up- Credit should generated in case the last year of lease is partial

  Scenario Outline: I import file for Period/Annual Gross Up- Credit
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
      | Partial_PR_Schedule_With_Credit.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Add percent rent line items for period/annual gross up
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "Percentage Rent" tab
    And I wait for the Loading text to disappear in grid
    And I click on the "Add item" action panel button
    And I wait for the Loading text to disappear
    #Add Percentage rent
    And I select following radio by label
      | name                  |
      | Artificial Breakpoint |

    And I set list fields values on editable page
      | name                                    | value                |
      | PercentageRent_CodePercentageRentTypeID | <Calculation Method> |
      | PercentageRent_CodeSalesGroupID_        | Sales                |
      | PercentageRent_CodeBillingFrequencyID_  | Annually             |
      | PercentageRent_CodeExpenseGroupID_      | Lease Expense        |
      | PercentageRent_CodeExpenseTypeID_       | Percentage Rent      |
      | PercentageRent_CodeCurrencyTypeID       | USD                  |

    And I set following fields value on editable page
      | name                       | value                         |
      | PercentageRent_BeginDate   | <Begin Date>                  |
      | PercentageRent_EndDate     | <End Date>                    |
      | PercentageRent_Description | Added <Calculation Method> PR |

    And I click on the "Save Changes" action panel button

    And I verify a row from grid "thisDiv" having unique value "<Begin Date>" under column header "Begin Date"
      | name               | value                         |
      | Begin Date         | <Begin Date>                  |
      | End Date           | <End Date>                    |
      | Sales Group        | Sales                         |
      | Description        | Added <Calculation Method> PR |
      | Calculation Method | <Calculation Method>          |
      | Payment Frequency  | Annually                      |

#    #Add Break point
    And I click on the " Add Percentage Rent Breakpoint... "
    And I switch to default frame
    And I wait for modal window to open
   # And I wait for "Add Percentage Rent Breakpoint  ***Required fields in red" modal window to open in non frame page
    And I see the "Add Percentage Rent Breakpoint  ***Required fields in red" modal window

    And I set following fields value on editable page
      | name                                       | value        |
      | PercentageRentBreakpoint_BeginDate         | <Begin Date> |
      | PercentageRentBreakpoint_EndDate           | <End Date>   |
      | PercentageRentBreakpoint_BreakpointAmount1 | 2000         |
      | PercentageRentBreakpoint_BreakpointRate1   | 10           |

    And I set list fields values on editable page
      | name                                      | value |
      | PercentageRentBreakpoint_CodeSalesGroupID | Sales |

    And I click on the "Add" button
    And I wait for the Loading text to disappear

    #Add Transaction
    And I click on the "Transactions" tab
    And I wait for the Loading text to disappear
    And I click on the "Add item" action panel button
    And I wait for the Loading text to disappear
    And I set list fields values on editable page
      | name                                     | value                      |
      | PaymentTransaction_CodeExpenseGroupID    | Lease Expense              |
      | PaymentTransaction_CodeExpenseTypeID     | Percentage Rent            |
      | PaymentTransaction_CodeExpenseCategoryID | Rent                       |
      | PaymentTransaction_VendorID              | 107th & Indian School, LLC |

    And I set following fields value on editable page
      | name                             | value         |
      | PaymentTransaction_EffectiveDate | <End Date>    |
      | PaymentTransaction_PostingDate   | <End Date>    |
      | PaymentTransaction_DueDate       | <End Date>    |
      | PaymentTransaction_InvoiceAmount | <Base Amount> |

    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear
    And I click "Yes" button
    And I verify a row from grid "thisDiv" having unique value "<End Date>" under column header "Effective Date"
      | name             | value                      |
      | Effective Date   | <End Date>                 |
      | Group            | Lease Expense              |
      | Type             | Percentage Rent            |
      | Category         | Rent                       |
      | Vendor           | 107th & Indian School, LLC |
      | One-Time Expense | Yes                        |
      | Total Amount     | <Transaction Amount>       |

    #Payment process
    And I click on the "Percentage Rent" tab
    And I select an option "Percentage Rent (Single BP) Schedule"
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name                      | value |
      | CurrentSelectorDate_month | May   |
      | CurrentSelectorDate_year  | 2011  |
    And I click on "Refresh" Button
    And I verify a row from grid "BOGridVirtualSalesPeriod" having unique value "May, 2011" under column header "Month/Year"
      | name                   | value          |
      | Sales Group            | Sales          |
      | Month/Year             | May, 2011      |
      | Amount Previously Paid | <Total Amount> |
    And I verify pair of values on non editable summary page
      | name                | value         |
      | Amount Already Paid | <Amount Paid> |

    Examples:
      | Transaction Amount | Amount Paid | Calculation Method | Total Amount | Base Amount | End Date   | Begin Date | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                     |
      | -$3,982.74         | $4,017.26   | Period Gross-up    | -$3,982.74   | -3982.74    | 05/31/2011 | 01/01/2011 | DeleteAccess | Delete Access Access | Contract | Payment Info     | Partial PR Schedule with Credit |
      | -$1,000.00         | $3,017.26   | Annual Gross-up    | -$4,982.74   | -1000       | 05/31/2011 | 01/01/2011 | DeleteAccess | Delete Access Access | Contract | Payment Info     | Partial PR Schedule with Credit |


  Scenario Outline: Period/Annual Gross Up- Credit should generated in case the last year of lease is partial
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on "Percentage Rent" tab
    And I select an option "Percentage Rent (Single BP) Schedule"
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name                      | value |
      | CurrentSelectorDate_month | May   |
      | CurrentSelectorDate_year  | 2011  |
    And I click on "Refresh" Button
    And I click on the "Process Payment" action panel button
    And I see the "Process Payment" modal window
    And I set following list fields values on editable page
      | name         | value |
      | mnToGenerate | May   |
    Then I set fields values on editable page
      | name         | value |
      | yrToGenerate | 2011  |
    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "2 Payment Transaction records were generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear


    Examples:
      | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                     |
      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Partial PR Schedule with Credit |


  Scenario Outline: As a delete user I Verify Transactions
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "<Effective Date>" under column header "Effective Date"
      | name             | value                      |
      | Effective Date   | <Effective Date>           |
      | Group            | Lease Expense              |
      | Type             | Percentage Rent            |
      | Category         | Rent                       |
      | Vendor           | 107th & Indian School, LLC |
      | One-Time Expense | Yes                        |
      | Total Amount     | <Transaction Amount>       |

    Examples:
      | Transaction Amount | Effective Date | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                     |
      | $2,092.60          | 05/31/2011     | DeleteAccess | Delete Access Access | Contract | Payment Info     | Partial PR Schedule with Credit |
      | -$3,982.74         | 05/31/2011     | DeleteAccess | Delete Access Access | Contract | Payment Info     | Partial PR Schedule with Credit |
#      | -$924.66           | 05/31/2011     | DeleteAccess | Delete Access Access | Contract | Payment Info     | Partial PR Schedule with Credit |

