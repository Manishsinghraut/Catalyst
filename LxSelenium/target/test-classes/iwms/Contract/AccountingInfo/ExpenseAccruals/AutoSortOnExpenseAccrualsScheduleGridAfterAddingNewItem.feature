@all
Feature: (JIRA - Automation-945) Auto Sort on Expense Accruals Schedule Grid when adding a new Expense Accrual schedule

  Scenario Outline: As a delete user I ensure Auto Sort on Expense Accruals Schedule Grid when adding a new Expense Accrual schedule

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/ExpenseAccruals/"
    And I import following file name:
      | SortingExpenseAccruals.xml |

    And I navigate to entity type "<Item>" named "<Contract Name>"
    Then I navigate to "Accounting Info"
    And I click on the "Expense Accruals" tab
    And I assert the following values in grid "thisDiv"
      | Group     | Type | Category | Begin Period | End Period | Current Period Expense | Current Annual Expense |
      | Base Rent | Rent | Rent     | 1/2017       | 3/2018     |                        |                        |

    And I assert the following values in grid "BOGridExpenseAccrualSchedule"
      | Begin Period | End Period | Period Amount | Annual Amount | Accrual Rate | First Period Amount | Last Period Amount | Notes     |
      | 1/2017       | 1/2017     | $833.33       | $10,000.00    | $0.14        | $833.33             | $833.33            | Testing 1 |
      | 3/2017       | 3/2017     | $750.00       | $9,000.00     | $0.13        | $750.00             | $750.00            | Testing 2 |
      | 1/2018       | 1/2018     | $7,491.67     | $89,900.00    | $1.28        | $7,491.67           | $7,491.67          | Testing 3 |
      | 3/2018       | 3/2018     | $5,741.67     | $68,900.00    | $0.98        | $5,741.67           | $5,741.67          | Testing 4 |

    And I click " Add Expense Accrual Schedule... " button
    And I switch to default frame
    And I see the "Add Expense Accrual Schedule  ***Required fields in red" modal window
    And I set following fields value on editable page
      | name                                | value     |
      | ExpenseAccrualSchedule_BeginPeriod  | 2         |
      | ExpenseAccrualSchedule_EndPeriod    | 2         |
      | ExpenseAccrualSchedule_BeginYear    | 2017      |
      | ExpenseAccrualSchedule_EndYear      | 2017      |
      | ExpenseAccrualSchedule_AnnualAmount | 20000     |
      | ExpenseAccrualSchedule_Notes        | Testing 5 |

    And I click on the "Add" button
    And I wait for modal window to close
    And I click on the "Save Changes" action panel button
    And I assert the following values in grid "BOGridExpenseAccrualSchedule"
      | Begin Period | End Period | Period Amount | Annual Amount | Accrual Rate | First Period Amount | Last Period Amount | Notes     |
      | 1/2017       | 1/2017     | $833.33       | $10,000.00    | $0.14        | $833.33             | $833.33            | Testing 1 |
      | 2/2017       | 2/2017     | $1,666.67     | $20,000.00    | $0.29        | $1,666.67           | $1,666.67          | Testing 5 |
      | 3/2017       | 3/2017     | $750.00       | $9,000.00     | $0.13        | $750.00             | $750.00            | Testing 2 |
      | 1/2018       | 1/2018     | $7,491.67     | $89,900.00    | $1.28        | $7,491.67           | $7,491.67          | Testing 3 |
      | 3/2018       | 3/2018     | $5,741.67     | $68,900.00    | $0.98        | $5,741.67           | $5,741.67          | Testing 4 |

    And I click " Add Expense Accrual Schedule... " button
    And I switch to default frame
    And I see the "Add Expense Accrual Schedule  ***Required fields in red" modal window
    And I set following fields value on editable page
      | name                                | value     |
      | ExpenseAccrualSchedule_BeginPeriod  | 2         |
      | ExpenseAccrualSchedule_EndPeriod    | 2         |
      | ExpenseAccrualSchedule_BeginYear    | 2018      |
      | ExpenseAccrualSchedule_EndYear      | 2018      |
      | ExpenseAccrualSchedule_AnnualAmount | 60000     |
      | ExpenseAccrualSchedule_Notes        | Testing 6 |

    And I click on the "Add" button
    And I wait for modal window to close
    And I click on the "Save Changes" action panel button
    And I assert the following values in grid "BOGridExpenseAccrualSchedule"
      | Begin Period | End Period | Period Amount | Annual Amount | Accrual Rate | First Period Amount | Last Period Amount | Notes     |
      | 1/2017       | 1/2017     | $833.33       | $10,000.00    | $0.14        | $833.33             | $833.33            | Testing 1 |
      | 2/2017       | 2/2017     | $1,666.67     | $20,000.00    | $0.29        | $1,666.67           | $1,666.67          | Testing 5 |
      | 3/2017       | 3/2017     | $750.00       | $9,000.00     | $0.13        | $750.00             | $750.00            | Testing 2 |
      | 1/2018       | 1/2018     | $7,491.67     | $89,900.00    | $1.28        | $7,491.67           | $7,491.67          | Testing 3 |
      | 2/2018       | 2/2018     | $5,000.00     | $60,000.00    | $0.86        | $5,000.00           | $5,000.00          | Testing 6 |
      | 3/2018       | 3/2018     | $5,741.67     | $68,900.00    | $0.98        | $5,741.67           | $5,741.67          | Testing 4 |


    Examples:
      | Login User   | Login full username  | Contract Name            | Item     |
      | DeleteAccess | Delete Access Access | Sorting Expense Accruals | Contract |