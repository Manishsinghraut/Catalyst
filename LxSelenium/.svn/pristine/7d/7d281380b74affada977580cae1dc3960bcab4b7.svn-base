@all
Feature: (Ref : Jira Ticket No : Automation-689) Recalculating Straight Line Schedule

  Scenario Outline: I import file for Recalculating Straight Line Schedule
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/StraightLineRent/"
    And I import following file name:
      | ReCalculateStraightLine.xml |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Change status of  Straight Line Schedule  to posted for single contract
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "Accounting Info"
    And I click on the "Straight-Line Rent" tab
    And I click on row from grid "thisDiv" having unique value "Re Calculate SL" under column header "Name"
      | name             | value      |
      | Begin Date       | 01/01/2020 |
      | End Date         | 12/31/2030 |
      | Term Length      | 132.00     |
      | Balance Forward  | $0.00      |
      | Total Commitment | $12,000.00 |
    And I click on the "Change Status" action panel button
    And I see the "Change Status" modal window
    And I set following fields value on editable page
      | name             | value                      |
      | desiredStatus    | Posted                     |
      | minDate          | 01/01/2020                 |
      | maxDate          | 05/05/2021                 |
      | CodeSLScheduleID | Re Calculate SL            |
      | desiredEntity    | Re Calculate Straight Line |
    And I click on the "Update" button
    And I click on the "Close" button
    And I wait for the Loading text to disappear
    And I click on the "Calculate Schedule" action panel button
    And I see the "Create New Straight-line Schedule" modal window
    And I set following fields value on editable page
      | name             | value                      |
      | BeginDate        | 01/01/2020                 |
      | EndDate          | 12/31/2030                 |
      | CodeSLScheduleID | Re Calculate SL            |
      | Notes            | Re Calculate Straight Line |

    And I click on the "Create Schedule" button
    And I click on the "Straight-Line Rent" tab
    And I verify all rows count "2" in the grid "thisDiv"
    And I verify a row from grid "thisDiv" having unique value "Re Calculate SL" under column header "Name"
      | name                | value                      |
      | Begin Date          | 01/01/2020                 |
      | End Date            | 12/31/2030                 |
      | Term Length         | 132.00                     |
      | Balance Forward     | $0.00                      |
      | Total Commitment    | $12,000.00                 |
      | Last Balance Posted | $10,545.44                 |
      | Notes               | Re Calculate Straight Line |

    And I verify a row from grid "thisDiv" having unique value "Re Calculate SL" under column header "Name"
      | name                | value          |
      | Begin Date          | 01/01/2020     |
      | End Date            | 12/31/2030     |
      | Term Length         | 132.00         |
      | Balance Forward     | $0.00          |
      | Total Commitment    | $12,000.00     |
      | Last Balance Posted | $10,545.44     |
      | Inactive Date       | [CURRENT DATE] |

    And I verify the following values in frame grid "BOGridSLPeriod"
      | Year | Period | Period Length | Cash Rent  | Rent Expense | Deferred Rent | Cumulative Balance | Begin Date | End Date   | Status     |
      | 2020 |        | 366           | $12,000.00 | $1,090.92    | $10,909.08    | $10,909.08         | 01/01/2020 | 12/31/2020 | Posted     |
      | 2021 |        | 365           | $0.00      | $1,090.92    | -$1,090.92    | $9,818.16          | 01/01/2021 | 12/31/2021 | Mixed      |
      | 2022 |        | 365           | $0.00      | $1,090.92    | -$1,090.92    | $8,727.24          | 01/01/2022 | 12/31/2022 | Not Posted |
      | 2023 |        | 365           | $0.00      | $1,090.92    | -$1,090.92    | $7,636.32          | 01/01/2023 | 12/31/2023 | Not Posted |
      | 2024 |        | 366           | $0.00      | $1,090.92    | -$1,090.92    | $6,545.40          | 01/01/2024 | 12/31/2024 | Not Posted |
      | 2025 |        | 365           | $0.00      | $1,090.92    | -$1,090.92    | $5,454.48          | 01/01/2025 | 12/31/2025 | Not Posted |
      | 2026 |        | 365           | $0.00      | $1,090.92    | -$1,090.92    | $4,363.56          | 01/01/2026 | 12/31/2026 | Not Posted |
      | 2027 |        | 365           | $0.00      | $1,090.92    | -$1,090.92    | $3,272.64          | 01/01/2027 | 12/31/2027 | Not Posted |
      | 2028 |        | 366           | $0.00      | $1,090.92    | -$1,090.92    | $2,181.72          | 01/01/2028 | 12/31/2028 | Not Posted |
      | 2029 |        | 365           | $0.00      | $1,090.92    | -$1,090.92    | $1,090.80          | 01/01/2029 | 12/31/2029 | Not Posted |
      | 2030 |        | 365           | $0.00      | $1,090.80    | -$1,090.80    | $0.00              | 01/01/2030 | 12/31/2030 | Not Posted |

# And I verify line items in the straight line schedule grid "BOGridSLPeriod"
#      | year | period | periodLength | cashRent   | rentExpense | deferredRent | cumulativeBalance | status     | beginDate  | endDate    | blank |
#      | 2020 |        | 366          | $12,000.00 | $1,090.92   | $10,909.08   | $10,909.08        | Posted     | 01/01/2020 | 12/31/2020 |       |
#      | 2021 |        | 365          | $0.00      | $1,090.92   | -$1,090.92   | $9,818.16         | Mixed      | 01/01/2021 | 12/31/2021 |       |
#      | 2022 |        | 365          | $0.00      | $1,090.92   | -$1,090.92   | $8,727.24         | Not Posted | 01/01/2022 | 12/31/2022 |       |
#      | 2023 |        | 365          | $0.00      | $1,090.92   | -$1,090.92   | $7,636.32         | Not Posted | 01/01/2023 | 12/31/2023 |       |
#      | 2024 |        | 366          | $0.00      | $1,090.92   | -$1,090.92   | $6,545.40         | Not Posted | 01/01/2024 | 12/31/2024 |       |
#      | 2025 |        | 365          | $0.00      | $1,090.92   | -$1,090.92   | $5,454.48         | Not Posted | 01/01/2025 | 12/31/2025 |       |
#      | 2026 |        | 365          | $0.00      | $1,090.92   | -$1,090.92   | $4,363.56         | Not Posted | 01/01/2026 | 12/31/2026 |       |
#      | 2027 |        | 365          | $0.00      | $1,090.92   | -$1,090.92   | $3,272.64         | Not Posted | 01/01/2027 | 12/31/2027 |       |
#      | 2028 |        | 366          | $0.00      | $1,090.92   | -$1,090.92   | $2,181.72         | Not Posted | 01/01/2028 | 12/31/2028 |       |
#      | 2029 |        | 365          | $0.00      | $1,090.92   | -$1,090.92   | $1,090.80         | Not Posted | 01/01/2029 | 12/31/2029 |       |
#      | 2030 |        | 365          | $0.00      | $1,090.80   | -$1,090.80   | $0.00             | Not Posted | 01/01/2030 | 12/31/2030 |       |

    Examples:
      | Login User   | Login full username  | Entity Name                |
      | DeleteAccess | Delete Access Access | Re Calculate Straight Line |