@all
Feature: Creating Straight Line schedule when contract is in Alternate Rent Scenario (Ref : Jira Ticket No : AUTOMATION-963)

  Scenario Outline: I import file for Fiscal Calendar , SL Alternate Rent Scenario
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/StraightLineRent/"
    And I import following file name:
      | PeriodFiscalCalendarSL.xml |
    And I import following files:
      | SLAlternateRentScenario.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I verify Fiscal Calendar SL, SL Alternate Rent Scenario>Payment Info>Recurring Expense
    Given I navigate to the admin dashboard
    And I click on the "Manage Fiscal Calendar" link
    And I verify the following values in non frame grid "YearSummaryGrid"
      | Year | Begin Date | End Date   | Number of Periods | Type  | Actions |
      | 2017 | 01/01/2017 | 12/30/2017 | 12                | 4-4-5 | delete  |

    And I navigate to entity type "Contracts" named "<Entity Name>" through search option
    And I navigate to second level tab "Payment Info" and third level "Recurring Expenses" tab of entity "Contract"
    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Base Rent  |
      | Expense Category | Rent       |
      | Begin Date       | 01/01/2017 |
      | End Date         | 12/31/2017 |
      | Frequency        | Monthly    |
      | Period Amount    |            |
      | Annual Amount    |            |
    And I verify the following values in frame grid "BOGridExpenseVendorAllocation"
      | Vendor            | Vendor# | Payment Percent | Address           | City  | State | Begin Date | End Date   | Notes | Actions        |
      | Selenium-Employer | 1234    | 100.00000%      | 5601 Democracy Dr | Plano | TX    | 01/01/2017 | 12/31/2017 |       | edit \| delete |

    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount | Annual Amount | Rate | First Payment | Last Payment | Notes | Actions        |
      | 01/01/2017 | 06/30/2017 | Review          | $1,000.00      | $12,000.00    |      | $1,000.00     | $1,000.00    |       | edit \| delete |
      | 07/01/2017 | 12/31/2017 | Review          | $1,500.00      | $18,000.00    |      | $1,500.00     | $1,500.00    |       | edit \| delete |

    And I click on the '...' of the type field "ExpenseSetup_CodeExpenseTypeID"
    And I verify the following values in non frame grid "^editBOGrid"
      | Name      | Description | Group         | Straight Line Schedule Type | Topic 842 Type? | Actions        |
      | Base Rent |             | Lease Expense | Base Rent SL                | unchecked       | edit \| delete |
    And I click on the "Close" button
    And I select "Contract Expense Forecast" page layout from dropdown
    And I wait for the Loading text to disappear
    And I verify "Expense Forecast should be displayed for all expense type in the grid"
      | 2017       |
      | $1,000.00  |
      | $1,000.00  |
      | $1,000.00  |
      | $1,000.00  |
      | $1,000.00  |
      | $1,000.00  |
      | $1,500.00  |
      | $1,500.00  |
      | $1,500.00  |
      | $1,500.00  |
      | $1,500.00  |
      | $1,500.00  |
      | $15,000.00 |
    And I switch to default frame
    And I navigate to second level tab "Accounting Info" and third level "Straight-Line Rent" tab of entity "Contract"
    And I click on row from grid "thisDiv" having unique value "Base Rent SL" under column header "Name"
      | name             | value      |
      | Begin Date       | 01/01/2017 |
      | End Date         | 12/31/2017 |
      | Term Length      | 12.00      |
      | Balance Forward  | $0.00      |
      | Total Commitment | $15,000.00 |
    And I select Fiscal Details radio button
    And I click on row from grid "BOGridSLPeriod" having unique value "1" under column header "Period"
      | name               | value     |
      | Year               | 2017      |
      | Period             | 1         |
      | Period Length      | 28        |
      | Cash Rent          | $1,000.00 |
      | Rent Expense       | $1,250.00 |
      | Deferred Rent      | -$250.00  |
      | Cumulative Balance | -$250.00  |

    And I click on row from grid "BOGridSLPeriod" having unique value "2" under column header "Period"
      | name               | value     |
      | Year               | 2017      |
      | Period             | 2         |
      | Period Length      | 28        |
      | Cash Rent          | $1,000.00 |
      | Rent Expense       | $1,250.00 |
      | Deferred Rent      | -$250.00  |
      | Cumulative Balance | -$500.00  |

    And I click on row from grid "BOGridSLPeriod" having unique value "3" under column header "Period"
      | name               | value     |
      | Year               | 2017      |
      | Period             | 3         |
      | Period Length      | 35        |
      | Cash Rent          | $1,000.00 |
      | Rent Expense       | $1,250.00 |
      | Deferred Rent      | -$250.00  |
      | Cumulative Balance | -$750.00  |

    And I click on row from grid "BOGridSLPeriod" having unique value "4" under column header "Period"
      | name               | value      |
      | Year               | 2017       |
      | Period             | 4          |
      | Period Length      | 28         |
      | Cash Rent          | $1,000.00  |
      | Rent Expense       | $1,250.00  |
      | Deferred Rent      | -$250.00   |
      | Cumulative Balance | -$1,000.00 |

    Examples:
      | Entity Name                |
      | SL Alternate Rent Scenario |

  Scenario Outline: As a delete user I Alternate rent line item shall be added successfully
    When I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "Payment Info"
    And I click on the "Alternate Rent" tab
    And I click on the "Alternate Rent Wizard" action panel button
    And I set following fields value on editable page
      | name                    | value       |
      | BeginDate               | 07/01/2017  |
      | recurringExpenseChanges | stopPayment |
    And I select checkbox from grid "expenseSetupDiv" having unique value "Lease Expense"
    And I click on "Create Alternate Rent" button from "Alternate Rent Wizard"
    And I wait for modal window to close
    And I wait for the Loading text to disappear
    And I verify a row from grid "thisDiv" having unique value "07/01/2017" under column header "Begin Date"
      | name                      | value         |
      | Begin Date                | 07/01/2017    |
      | End Date                  |               |
      | Expense Group             | Lease Expense |
      | Expense Type              | Base Rent     |
      | Expense Reduction Amount  |               |
      | Expense Reduction Percent | 100.00000%    |
      | Hold Recurring?           | Yes           |
      | Sales Group               |               |
      | Percent Rent Rate         |               |
      | Hold Percent Rent?        | No            |


    Examples:
      | Entity Name                |
      | SL Alternate Rent Scenario |


  Scenario Outline: As a delete user I verify the alternate rent from 07/01/2017-12/31/2017 along stopping payment and reflecting changes on recurring expense
    Given I navigate to entity type "Contract" named "<Entity Name>" through search option
    And I navigate to second level tab "Payment Info" and third level "Recurring Expenses" tab of entity "Contract"
    And I Select Contract Expense Forecast from Page dropdown
    And I switch to visible frame
    And I verify "Expense Forecast should be displayed for all expense type in the grid"
      | 2017      |
      | $1,000.00 |
      | $1,000.00 |
      | $1,000.00 |
      | $1,000.00 |
      | $1,000.00 |
      | $1,000.00 |
      | $0.00     |
      | $0.00     |
      | $0.00     |
      | $0.00     |
      | $0.00     |
      | $0.00     |
      | $6,000.00 |
    And I switch to default frame
    Then I navigate to "Accounting Info"
    And I click on the "Straight-Line Rent" tab
    And I click on the "Calculate Schedule" action panel button
    And I set following fields value on editable page
      | name             | value        |
      | BeginDate        | 01/01/2017   |
      | EndDate          | 12/31/2017   |
      | CodeSLScheduleID | Base Rent SL |
    And I click on "Create Schedule" button from "Create New Straight-line Schedule pop-up window"
    And I wait for modal window to close
    And I wait for the Loading text to disappear
    And I click on the "Straight-Line Rent" tab
    And I click on row from grid "thisDiv" having unique value "$6,000.00" under column header "Total Commitment"
      | name             | value      |
      | Begin Date       | 01/01/2017 |
      | End Date         | 12/31/2017 |
      | Term Length      | 12.00      |
      | Balance Forward  | $0.00      |
      | Total Commitment | $6,000.00  |
    And I select Fiscal Details radio button
    And I click on row from grid "BOGridSLPeriod" having unique value "1" under column header "Period"
      | name               | value     |
      | Year               | 2017      |
      | Period             | 1         |
      | Period Length      | 28        |
      | Cash Rent          | $1,000.00 |
      | Rent Expense       | $500.00   |
      | Deferred Rent      | $500.00   |
      | Cumulative Balance | $500.00   |

    And I click on row from grid "BOGridSLPeriod" having unique value "2" under column header "Period"
      | name               | value     |
      | Year               | 2017      |
      | Period             | 2         |
      | Period Length      | 28        |
      | Cash Rent          | $1,000.00 |
      | Rent Expense       | $500.00   |
      | Deferred Rent      | $500.00   |
      | Cumulative Balance | $1,000.00 |

    And I click on row from grid "BOGridSLPeriod" having unique value "3" under column header "Period"
      | name               | value     |
      | Year               | 2017      |
      | Period             | 3         |
      | Period Length      | 35        |
      | Cash Rent          | $1,000.00 |
      | Rent Expense       | $500.00   |
      | Deferred Rent      | $500.00   |
      | Cumulative Balance | $1,500.00 |

    And I click on row from grid "BOGridSLPeriod" having unique value "4" under column header "Period"
      | name               | value     |
      | Year               | 2017      |
      | Period             | 4         |
      | Period Length      | 28        |
      | Cash Rent          | $1,000.00 |
      | Rent Expense       | $500.00   |
      | Deferred Rent      | $500.00   |
      | Cumulative Balance | $2,000.00 |

    And I click on row from grid "BOGridSLPeriod" having unique value "5" under column header "Period"
      | name               | value     |
      | Year               | 2017      |
      | Period             | 5         |
      | Period Length      | 28        |
      | Cash Rent          | $1,000.00 |
      | Rent Expense       | $500.00   |
      | Deferred Rent      | $500.00   |
      | Cumulative Balance | $2,500.00 |

    And I click on row from grid "BOGridSLPeriod" having unique value "6" under column header "Period"
      | name               | value     |
      | Year               | 2017      |
      | Period             | 6         |
      | Period Length      | 35        |
      | Cash Rent          | $1,000.00 |
      | Rent Expense       | $500.00   |
      | Deferred Rent      | $500.00   |
      | Cumulative Balance | $3,000.00 |

    And I click on row from grid "BOGridSLPeriod" having unique value "7" under column header "Period"
      | name               | value     |
      | Year               | 2017      |
      | Period             | 7         |
      | Period Length      | 28        |
      | Cash Rent          | $0.00     |
      | Rent Expense       | $500.00   |
      | Deferred Rent      | -$500.00  |
      | Cumulative Balance | $2,500.00 |

    And I click on row from grid "BOGridSLPeriod" having unique value "8" under column header "Period"
      | name               | value     |
      | Year               | 2017      |
      | Period             | 8         |
      | Period Length      | 28        |
      | Cash Rent          | $0.00     |
      | Rent Expense       | $500.00   |
      | Deferred Rent      | -$500.00  |
      | Cumulative Balance | $2,000.00 |

    And I click on row from grid "BOGridSLPeriod" having unique value "9" under column header "Period"
      | name               | value     |
      | Year               | 2017      |
      | Period             | 9         |
      | Period Length      | 35        |
      | Cash Rent          | $0.00     |
      | Rent Expense       | $500.00   |
      | Deferred Rent      | -$500.00  |
      | Cumulative Balance | $1,500.00 |

    And I click on row from grid "BOGridSLPeriod" having unique value "10" under column header "Period"
      | name               | value     |
      | Year               | 2017      |
      | Period             | 10        |
      | Period Length      | 28        |
      | Cash Rent          | $0.00     |
      | Rent Expense       | $500.00   |
      | Deferred Rent      | -$500.00  |
      | Cumulative Balance | $1,000.00 |

    And I click on row from grid "BOGridSLPeriod" having unique value "11" under column header "Period"
      | name               | value    |
      | Year               | 2017     |
      | Period             | 11       |
      | Period Length      | 28       |
      | Cash Rent          | $0.00    |
      | Rent Expense       | $500.00  |
      | Deferred Rent      | -$500.00 |
      | Cumulative Balance | $500.00  |

    And I click on row from grid "BOGridSLPeriod" having unique value "12" under column header "Period"
      | name               | value    |
      | Year               | 2017     |
      | Period             | 12       |
      | Period Length      | 35       |
      | Cash Rent          | $0.00    |
      | Rent Expense       | $500.00  |
      | Deferred Rent      | -$500.00 |
      | Cumulative Balance | $0.00    |


    Examples:
      | Entity Name                |
      | SL Alternate Rent Scenario |

