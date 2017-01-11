@all
Feature: Amortize Method for Straight Line Cash and Expense set to Per Period and Pro-rate Periods set to No[Jira Ref: AUTOMATION-1387]

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

    And I set following fields value on editable page
      | name                     | value |
      | json_SL_Prorate_35_As_28 | true  |
      | json_SL_MatchYearEnds    | true  |

    And I click on "Update" Button

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, Import the following file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/StraightLineRent/"
    And I import following file name:
      | FinancialSettingsPortfolio_1387.xml |
      | pagelayout_1387.xml                 |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Amortize Method for Straight Line Cash and Expense set to Per Period and Pro-rate Periods set and Match Lease and Fiscal Year Ends to Yes
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
#    And I select "Financial Setting Portfolio Summary" from Page dropdown
    And I switch to visible frame
    And I verify the field "SL Cash Amortize Method" has "PERPERIOD"
    And I verify the field "SL Expense Amortize Method" has "PERPERIOD"
    And I verify the field "SL Match Year Ends?" has "Yes"
    And I verify the field "SL Prorate #35 As #28?" has "No"
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name                  | Second Level Tab | Third Level Tab |
    | DeleteAccess | Delete Access Access | Financial Settings Portfolio | Details          | Summary         |


  Scenario Outline: As a delete user, Import the following file1
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/StraightLineRent/"
    And I import following file name:
      | FinancialSettingsFiscalCalendar_1387.xml                      |
      | StraightLineAmortizeProratePerPeriodContractoptionNO_1387.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Amortize Method for Straight Line Cash and Expense set to Per Period and Pro-rate Periods set and Match Lease and Fiscal Year Ends to No
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
#    And I select "Financial Setting Portfolio Summary" from Page dropdown
    And I switch to visible frame
    And I verify the field "SL Cash Amortize Method" has "PERPERIOD"
    And I verify the field "SL Expense Amortize Method" has "PERPERIOD"
    And I verify the field "SL Match Year Ends?" has "No"
    And I verify the field "SL Prorate #35 As #28?" has "No"
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name                  | Second Level Tab | Third Level Tab |
    | DeleteAccess | Delete Access Access | Financial Settings Portfolio | Details          | Summary         |


  Scenario Outline:As Delete user, I Navigate to Fiscal calendar and ensure that calendar is set from 2034 for Portfolio -Financial settings Portfolio
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Fiscal Calendar" link
    And I set following fields value on editable page
      | name      | value                        |
      | ProgramID | Financial Settings Portfolio |

    And I verify a row from non frame grid "<Grid>" having unique value "2034" under column header "Year"
      | name              | value      |
      | Year              | 2034       |
      | Begin Date        | 01/01/2034 |
      | End Date          | 12/30/2034 |
      | Number of Periods | 12         |
      | Type              | 4-4-5      |


    And I verify a row from non frame grid "periodGrid" having unique value "01/01/2034" under column header "Begin Date"
      | name       | value      |
      | Year       | 2034       |
      | Quarter    | 1          |
      | Period     | 1          |
      | Begin Date | 01/01/2034 |
      | End Date   | 01/28/2034 |
      | Days       | 28         |
      | Weeks      | 4.00       |

    And I verify a row from non frame grid "periodGrid" having unique value "01/29/2034" under column header "Begin Date"
      | name       | value      |
      | Year       | 2034       |
      | Quarter    | 1          |
      | Period     | 2          |
      | Begin Date | 01/29/2034 |
      | End Date   | 02/25/2034 |
      | Days       | 28         |
      | Weeks      | 4.00       |

    And I verify a row from non frame grid "periodGrid" having unique value "02/26/2034" under column header "Begin Date"
      | name       | value      |
      | Year       | 2034       |
      | Quarter    | 1          |
      | Period     | 3          |
      | Begin Date | 02/26/2034 |
      | End Date   | 04/01/2034 |
      | Days       | 35         |
      | Weeks      | 5.00       |


    And I verify a row from non frame grid "periodGrid" having unique value "04/02/2034" under column header "Begin Date"
      | name       | value      |
      | Year       | 2034       |
      | Quarter    | 2          |
      | Period     | 4          |
      | Begin Date | 04/02/2034 |
      | End Date   | 04/29/2034 |
      | Days       | 28         |
      | Weeks      | 4.00       |


    And I verify a row from non frame grid "periodGrid" having unique value "04/30/2034" under column header "Begin Date"
      | name       | value      |
      | Year       | 2034       |
      | Quarter    | 2          |
      | Period     | 5          |
      | Begin Date | 04/30/2034 |
      | End Date   | 05/27/2034 |
      | Days       | 28         |
      | Weeks      | 4.00       |

    And I verify a row from non frame grid "periodGrid" having unique value "05/28/2034" under column header "Begin Date"
      | name       | value      |
      | Year       | 2034       |
      | Quarter    | 2          |
      | Period     | 6          |
      | Begin Date | 05/28/2034 |
      | End Date   | 07/01/2034 |
      | Days       | 35         |
      | Weeks      | 5.00       |

    And I verify a row from non frame grid "periodGrid" having unique value "07/02/2034" under column header "Begin Date"
      | name       | value      |
      | Year       | 2034       |
      | Quarter    | 3          |
      | Period     | 7          |
      | Begin Date | 07/02/2034 |
      | End Date   | 07/29/2034 |
      | Days       | 28         |
      | Weeks      | 4.00       |

    And I verify a row from non frame grid "periodGrid" having unique value "07/30/2034" under column header "Begin Date"
      | name       | value      |
      | Year       | 2034       |
      | Quarter    | 3          |
      | Period     | 8          |
      | Begin Date | 07/30/2034 |
      | End Date   | 08/26/2034 |
      | Days       | 28         |
      | Weeks      | 4.00       |


    And I verify a row from non frame grid "periodGrid" having unique value "08/27/2034" under column header "Begin Date"
      | name       | value      |
      | Year       | 2034       |
      | Quarter    | 3          |
      | Period     | 9          |
      | Begin Date | 08/27/2034 |
      | End Date   | 09/30/2034 |
      | Days       | 35         |
      | Weeks      | 5.00       |

    And I verify a row from non frame grid "periodGrid" having unique value "10/01/2034" under column header "Begin Date"
      | name       | value      |
      | Year       | 2034       |
      | Quarter    | 4          |
      | Period     | 10         |
      | Begin Date | 10/01/2034 |
      | End Date   | 10/28/2034 |
      | Days       | 28         |
      | Weeks      | 4.00       |

    And I verify a row from non frame grid "periodGrid" having unique value "10/29/2034" under column header "Begin Date"
      | name       | value      |
      | Year       | 2034       |
      | Quarter    | 4          |
      | Period     | 11         |
      | Begin Date | 10/29/2034 |
      | End Date   | 11/25/2034 |
      | Days       | 28         |
      | Weeks      | 4.00       |

    And I verify a row from non frame grid "periodGrid" having unique value "11/26/2034" under column header "Begin Date"
      | name       | value      |
      | Year       | 2034       |
      | Quarter    | 4          |
      | Period     | 12         |
      | Begin Date | 11/26/2034 |
      | End Date   | 12/30/2034 |
      | Days       | 35         |
      | Weeks      | 5.00       |

  Examples:
    | Login User   | Login full username  | Grid     |
    | DeleteAccess | Delete Access Access | yearGrid |


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
      | Begin Date       | 01/01/2010  |
      | End Date         | 12/31/2035  |
      | Frequency        | Annually    |
      | Period Amount    | $8,333.33   |
      | Annual Amount    | $100,000.00 |

    And I verify grid row "BOGridExpenseSchedule" having unique value "12/31/2035" under column header "End Date"
      | name            | value       |
      | Begin Date      | 01/01/2010  |
      | End Date        | 12/31/2035  |
      | Approval Status | Review      |
      | Payment Amount  | $100,000.00 |
      | Annual Amount   | $100,000.00 |
      | Rate            | $0.00       |
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
    | Login User   | Login full username  | Entity Name                                                   | Second Level Tab | Third Level Tab    |
    | DeleteAccess | Delete Access Access | Straight Line Amortize Pro-rate Per Period Contract option NO | Payment Info     | Recurring Expenses |


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
      | name             | value               |
      | BeginDate        | 01/01/2034          |
      | EndDate          | 12/30/2034          |
      | CodeSLScheduleID | Base Rent SL        |
      | Inactive         | Over Remaining Term |

    And I click "Create Schedule" button

    And I switch to visible frame

    And I click on row from grid "thisDiv" having unique value "Base Rent SL" under column header "Name"
      | name                | value      |
      | Begin Date          | 01/01/2034 |
      | End Date            | 12/30/2034 |
      | Term Length         | 12.00      |
      | Balance Forward     | $0.00      |
      | Total Commitment    | $99,731.18 |
      | Last Balance Posted |            |
      | Last Posted Date    |            |
      | Inactive Date       |            |
      | Notes               |            |

    And I click on row from grid "BOGridSLPeriod" having unique value "2034" under column header "Year"
      | name               | value      |
      | Year               | 2034       |
      | Period             |            |
      | Period Length      | 364        |
      | Cash Rent          | $99,731.18 |
      | Rent Expense       | $99,731.18 |
      | Deferred Rent      | $0.00      |
      | Cumulative Balance | $0.00      |
      | Begin Date         | 01/01/2034 |
      | End Date           | 12/30/2034 |
      | Status             | Not Posted |

    And I select Fiscal Details radio button

    And I click on row from grid "BOGridSLPeriod" having unique value "1" under column header "Period"
      | name               | value      |
      | Year               | 2034       |
      | Period             | 1          |
      | Period Length      | 28         |
      | Cash Rent          | $8,333.33  |
      | Rent Expense       | $8,310.93  |
      | Deferred Rent      | $22.40     |
      | Cumulative Balance | $22.40     |
      | Begin Date         | 01/01/2034 |
      | End Date           | 01/28/2034 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "2" under column header "Period"
      | name               | value      |
      | Year               | 2034       |
      | Period             | 2          |
      | Period Length      | 28         |
      | Cash Rent          | $8,333.33  |
      | Rent Expense       | $8,310.93  |
      | Deferred Rent      | $22.40     |
      | Cumulative Balance | $44.80     |
      | Begin Date         | 01/29/2034 |
      | End Date           | 02/25/2034 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "3" under column header "Period"
      | name               | value      |
      | Year               | 2034       |
      | Period             | 3          |
      | Period Length      | 35         |
      | Cash Rent          | $8,333.33  |
      | Rent Expense       | $8,310.93  |
      | Deferred Rent      | $22.40     |
      | Cumulative Balance | $67.20     |
      | Begin Date         | 02/26/2034 |
      | End Date           | 04/01/2034 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "4" under column header "Period"
      | name               | value      |
      | Year               | 2034       |
      | Period             | 4          |
      | Period Length      | 28         |
      | Cash Rent          | $8,333.33  |
      | Rent Expense       | $8,310.93  |
      | Deferred Rent      | $22.40     |
      | Cumulative Balance | $89.60     |
      | Begin Date         | 04/02/2034 |
      | End Date           | 04/29/2034 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "5" under column header "Period"
      | name               | value      |
      | Year               | 2034       |
      | Period             | 5          |
      | Period Length      | 28         |
      | Cash Rent          | $8,333.33  |
      | Rent Expense       | $8,310.93  |
      | Deferred Rent      | $22.40     |
      | Cumulative Balance | $112.00    |
      | Begin Date         | 04/30/2034 |
      | End Date           | 05/27/2034 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "6" under column header "Period"
      | name               | value      |
      | Year               | 2034       |
      | Period             | 6          |
      | Period Length      | 35         |
      | Cash Rent          | $8,333.33  |
      | Rent Expense       | $8,310.93  |
      | Deferred Rent      | $22.40     |
      | Cumulative Balance | $134.40    |
      | Begin Date         | 05/28/2034 |
      | End Date           | 07/01/2034 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "7" under column header "Period"
      | name               | value      |
      | Year               | 2034       |
      | Period             | 7          |
      | Period Length      | 28         |
      | Cash Rent          | $8,333.33  |
      | Rent Expense       | $8,310.93  |
      | Deferred Rent      | $22.40     |
      | Cumulative Balance | $156.80    |
      | Begin Date         | 07/02/2034 |
      | End Date           | 07/29/2034 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "8" under column header "Period"
      | name               | value      |
      | Year               | 2034       |
      | Period             | 8          |
      | Period Length      | 28         |
      | Cash Rent          | $8,333.33  |
      | Rent Expense       | $8,310.93  |
      | Deferred Rent      | $22.40     |
      | Cumulative Balance | $179.20    |
      | Begin Date         | 07/30/2034 |
      | End Date           | 08/26/2034 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "9" under column header "Period"
      | name               | value      |
      | Year               | 2034       |
      | Period             | 9          |
      | Period Length      | 35         |
      | Cash Rent          | $8,333.33  |
      | Rent Expense       | $8,310.93  |
      | Deferred Rent      | $22.40     |
      | Cumulative Balance | $201.60    |
      | Begin Date         | 08/27/2034 |
      | End Date           | 09/30/2034 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "10" under column header "Period"
      | name               | value      |
      | Year               | 2034       |
      | Period             | 10         |
      | Period Length      | 28         |
      | Cash Rent          | $8,333.33  |
      | Rent Expense       | $8,310.93  |
      | Deferred Rent      | $22.40     |
      | Cumulative Balance | $224.00    |
      | Begin Date         | 10/01/2034 |
      | End Date           | 10/28/2034 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "11" under column header "Period"
      | name               | value      |
      | Year               | 2034       |
      | Period             | 11         |
      | Period Length      | 28         |
      | Cash Rent          | $8,333.33  |
      | Rent Expense       | $8,310.93  |
      | Deferred Rent      | $22.40     |
      | Cumulative Balance | $246.40    |
      | Begin Date         | 10/29/2034 |
      | End Date           | 11/25/2034 |
      | Status             | Not Posted |

    And I click on row from grid "BOGridSLPeriod" having unique value "12" under column header "Period"
      | name               | value      |
      | Year               | 2034       |
      | Period             | 12         |
      | Period Length      | 35         |
      | Cash Rent          | $8,064.55  |
      | Rent Expense       | $8,310.95  |
      | Deferred Rent      | -$246.40   |
      | Cumulative Balance | $0.00      |
      | Begin Date         | 11/26/2034 |
      | End Date           | 12/30/2034 |
      | Status             | Not Posted |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name                                                   | Second Level Tab | Third Level Tab    |
    | DeleteAccess | Delete Access Access | Straight Line Amortize Pro-rate Per Period Contract option NO | Accounting Info  | Straight-Line Rent |


