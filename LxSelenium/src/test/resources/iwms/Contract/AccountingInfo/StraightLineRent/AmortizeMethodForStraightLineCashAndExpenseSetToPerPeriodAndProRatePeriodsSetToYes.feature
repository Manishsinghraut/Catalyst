@all
Feature: Amortize Method for Straight Line Cash and Expense set to Per Period and Pro-rate Periods set to Yes [Jira Ref: AUTOMATION-1386]

  Scenario Outline: As a delete user I Navigate to  Admin Dashboard > Manage Company > Financial Settings > and select JPY as the 'Home Currency' and click 'Update'
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
#    And I verify these field values on editable page
    Then I verify the following fields value on editable page
      | name                            | value     |
      | json_SL_Cash_Amortize_Method    | PERPERIOD |
      | json_SL_Expense_Amortize_Method | PERPERIOD |
      | json_SL_Prorate_35_As_28        | true      |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, Import the following file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/StraightLineRent/"
    And I import following file name:
      | FiscalCalendarPortfolio_1386.xml                    |
      | FiscalCalendarfor4years_1386.xml                    |
      | StraightLineAmortizePro-ratePeriodContract_1386.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I verify th Base Rent line item and Base Rent SL Straight Line Schedule Type exist
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame

    And I verify a row from grid "thisDiv" having unique value "Base Rent" under column header "Expense Group"
      | name             | value       |
      | Expense Type     | Rent        |
      | Expense Category |             |
      | Begin Date       | 01/01/2014  |
      | End Date         | 12/31/2017  |
      | Frequency        | Annually    |
      | Period Amount    | $8,333.33   |
      | Annual Amount    | $100,000.00 |

    And I verify grid row "BOGridExpenseSchedule" having unique value "12/31/2017" under column header "End Date"
      | name            | value       |
      | Begin Date      | 01/01/2014  |
      | End Date        | 12/31/2017  |
      | Approval Status | Review      |
      | Payment Amount  | $100,000.00 |
      | Annual Amount   | $100,000.00 |
      | Rate            |             |
      | First Payment   | $100,000.00 |
      | Last Payment    | $100,000.00 |

    And I Click the "..." next to the "ExpenseSetup_CodeExpenseTypeID" dropdown
    And I switch to default frame
    And I verify a row from non frame grid "^editBOGrid" having unique value "Rent" under column header "Name"
      | name                        | value        |
      | Name                        | Rent         |
      | Description                 |              |
      | Group                       | Base Rent    |
      | Straight Line Schedule Type | Base Rent SL |
    And I click "Close" button
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name                                         | Second Level Tab | Third Level Tab    |
      | DeleteAccess | Delete Access Access | Straight Line Amortize Pro-rate Per Period Contract | Payment Info     | Recurring Expenses |


  Scenario Outline: As a delete user I verify th Straight schedule should be successfully created
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click on the "Calculate Schedule" action panel button
    And I set following fields value on editable page
      | name             | value        |
      | BeginDate        | 01/01/2014   |
      | EndDate          | 12/14/2017   |
      | CodeSLScheduleID | Base Rent SL |

    And I click "Create Schedule" button

    And I switch to visible frame

    And I click on row from grid "thisDiv" having unique value "Base Rent SL" under column header "Name"
      | name                | value       |
      | Begin Date          | 01/01/2014  |
      | End Date            | 12/14/2017  |
      | Term Length         | 47.45       |
      | Balance Forward     | $0.00       |
      | Total Commitment    | $395,430.11 |
      | Last Balance Posted |             |
      | Last Posted Date    |             |
      | Inactive Date       |             |
      | Notes               |             |

    And I click on row from grid "BOGridSLPeriod" having unique value "2014" under column header "Year"
      | name               | value      |
      | Year               | 2014       |
      | Period             |            |
      | Period Length      | 365        |
      | Cash Rent          | $99,999.96 |
      | Rent Expense       | $99,999.96 |
      | Deferred Rent      | $0.00      |
      | Cumulative Balance | $0.00      |
      | Begin Date         | 01/01/2014 |
      | End Date           | 12/31/2014 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "2015" under column header "Year"
      | name               | value      |
      | Year               | 2015       |
      | Period             |            |
      | Period Length      | 365        |
      | Cash Rent          | $99,999.96 |
      | Rent Expense       | $99,999.96 |
      | Deferred Rent      | $0.00      |
      | Cumulative Balance | $0.00      |
      | Begin Date         | 01/01/2015 |
      | End Date           | 12/31/2015 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "2016" under column header "Year"
      | name               | value      |
      | Year               | 2016       |
      | Period             |            |
      | Period Length      | 366        |
      | Cash Rent          | $99,999.96 |
      | Rent Expense       | $99,999.96 |
      | Deferred Rent      | $0.00      |
      | Cumulative Balance | $0.00      |
      | Begin Date         | 01/01/2016 |
      | End Date           | 12/31/2016 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "2017" under column header "Year"
      | name               | value      |
      | Year               | 2017       |
      | Period             |            |
      | Period Length      | 348        |
      | Cash Rent          | $95,430.23 |
      | Rent Expense       | $95,430.23 |
      | Deferred Rent      | $0.00      |
      | Cumulative Balance | $0.00      |
      | Begin Date         | 01/01/2017 |
      | End Date           | 12/14/2017 |
      | Status             | Not Posted |

    And I select Fiscal Details radio button

    And I click on row from grid "BOGridSLPeriod" having unique value "1" under column header "Period"
      | name               | value      |
      | Year               | 2014       |
      | Period             | 1          |
      | Period Length      | 31         |
      | Cash Rent          | $8,333.33  |
      | Rent Expense       | $8,333.33  |
      | Deferred Rent      | $0.00      |
      | Cumulative Balance | $0.00      |
      | Begin Date         | 01/01/2014 |
      | End Date           | 01/31/2014 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "2" under column header "Period"
      | name               | value      |
      | Year               | 2014       |
      | Period             | 2          |
      | Period Length      | 28         |
      | Cash Rent          | $8,333.33  |
      | Rent Expense       | $8,333.33  |
      | Deferred Rent      | $0.00      |
      | Cumulative Balance | $0.00      |
      | Begin Date         | 02/01/2014 |
      | End Date           | 02/28/2014 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "12" under column header "Period"
      | name               | value      |
      | Year               | 2017       |
      | Period             | 12         |
      | Period Length      | 14         |
      | Cash Rent          | $3,763.60  |
      | Rent Expense       | $3,763.60  |
      | Deferred Rent      | $0.00      |
      | Cumulative Balance | $0.00      |
      | Begin Date         | 12/01/2017 |
      | End Date           | 12/14/2017 |
      | Status             | Not Posted |

    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name                                         | Second Level Tab | Third Level Tab    |
      | DeleteAccess | Delete Access Access | Straight Line Amortize Pro-rate Per Period Contract | Accounting Info  | Straight-Line Rent |

