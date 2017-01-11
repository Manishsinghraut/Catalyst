@all
Feature: Straight Line Rent - End Date on the Schedule should be same as fiscal year end date (Ref : Jira Ticket No : AUTOMATION-962)

  Scenario Outline: I import file for Fiscal Calendar , SLRentEndDate
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/StraightLineRent/"
    And I import following file name:
      | 12PeriodFiscalCalendar2021SL.xml |
      | SLRentEndDate.xml                |

  Examples:s
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I When "Match Lease to Fiscal Year Ends" = No then the Straight Line End Date will follow the SL setting rather than be equal to the Fiscal Year End Date.
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Then I navigate to the admin dashboard
    And I click on the "Manage Fiscal Calendar" link
    And I verify a unique row in grid "yearGrid" having unique value "2022" under column header "Year"
      | name              | value      |
      | Begin Date        | 12/30/2021 |
      | End Date          | 12/28/2022 |
      | Number of Periods | 12         |
      | Type              | 4-4-5      |
      | Actions           | delete     |
    And I verify a unique row in grid "yearGrid" having unique value "2023" under column header "Year"
      | name              | value      |
      | Begin Date        | 12/29/2022 |
      | End Date          | 12/27/2023 |
      | Number of Periods | 12         |
      | Type              | 4-4-5      |
      | Actions           | delete     |

    And I verify a unique row in grid "yearGrid" having unique value "2024" under column header "Year"
      | name              | value                              |
      | Begin Date        | 12/28/2023                         |
      | End Date          | 01/01/2025                         |
      | Number of Periods | 12                                 |
      | Type              | 4 or 5 week periods in fiscal year |
      | Actions           | delete                             |

    And I verify a unique row in grid "yearGrid" having unique value "2025" under column header "Year"
      | name              | value      |
      | Begin Date        | 01/02/2025 |
      | End Date          | 12/31/2025 |
      | Number of Periods | 12         |
      | Type              | 4-4-5      |
      | Actions           | delete     |

    And I verify a unique row in grid "yearGrid" having unique value "2026" under column header "Year"
      | name              | value      |
      | Begin Date        | 01/01/2026 |
      | End Date          | 12/30/2026 |
      | Number of Periods | 12         |
      | Type              | 4-4-5      |
      | Actions           | delete     |

    And I verify a unique row in grid "yearGrid" having unique value "2027" under column header "Year"
      | name              | value      |
      | Begin Date        | 12/31/2026 |
      | End Date          | 12/29/2027 |
      | Number of Periods | 12         |
      | Type              | 4-4-5      |
      | Actions           | delete     |

    And I verify a unique row in grid "yearGrid" having unique value "2028" under column header "Year"
      | name              | value      |
      | Begin Date        | 12/30/2027 |
      | End Date          | 12/27/2028 |
      | Number of Periods | 12         |
      | Type              | 4-4-5      |
      | Actions           | delete     |

    Then I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on "Financial Settings" tab
    And I select Match Lease and Fiscal Year Ends
    And I click on "Update" Button
    And I navigate to dashboard page
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "Accounting Info"
    And I click on the "Straight-Line Rent" tab
    And I click on the "Calculate Schedule" action panel button
    And I set following fields value on editable page
      | name             | value        |
      | BeginDate        | 02/26/2022   |
      | EndDate          | 12/31/2028   |
      | CodeSLScheduleID | Base Rent SL |
    And I click on "Create Schedule" button from "Create New Straight-line Schedule pop-up window"
    And I wait for modal window to close
    And I wait for the Loading text to disappear
    And I click on row from grid "thisDiv" having unique value "Base Rent SL" under column header "Name"
      | name             | value       |
      | Begin Date       | 02/26/2022  |
      | End Date         | 12/31/2028  |
      | Term Length      | 82.14       |
      | Balance Forward  | $0.00       |
      | Total Commitment | $318,875.00 |
    And I select Fiscal Details radio button
    And I move to last page of the "Fiscal Details" grid
    And I click on row from grid "BOGridSLPeriod" having unique value "1" under column header "Period"
      | name               | value      |
      | Year               | 2029       |
      | Period             | 1          |
      | Period Length      | 4          |
      | Cash Rent          | $0.00      |
      | Rent Expense       | $554.28    |
      | Deferred Rent      | -$554.28   |
      | Cumulative Balance | $0.00      |
      | Status             | Not Posted |
      | Begin Date         | 12/28/2028 |
      | End Date           | 12/31/2028 |

    And I click on row from grid "BOGridSLPeriod" having unique value "11" under column header "Period"
      | name               | value      |
      | Year               | 2028       |
      | Period             | 11         |
      | Period Length      | 28         |
      | Cash Rent          | $4,025.00  |
      | Rent Expense       | $3,881.96  |
      | Deferred Rent      | $143.04    |
      | Cumulative Balance | $411.24    |
      | Status             | Not Posted |
      | Begin Date         | 10/26/2028 |
      | End Date           | 11/22/2028 |

    And I click on row from grid "BOGridSLPeriod" having unique value "12" under column header "Period"
      | name               | value      |
      | Year               | 2028       |
      | Period             | 12         |
      | Period Length      | 35         |
      | Cash Rent          | $4,025.00  |
      | Rent Expense       | $3,881.96  |
      | Deferred Rent      | $143.04    |
      | Cumulative Balance | $554.28    |
      | Status             | Not Posted |
      | Begin Date         | 11/23/2028 |
      | End Date           | 12/27/2028 |

  Examples:
    | Login User   | Login full username  | Entity Name                     |
    | DeleteAccess | Delete Access Access | Straight Line End Date Contract |