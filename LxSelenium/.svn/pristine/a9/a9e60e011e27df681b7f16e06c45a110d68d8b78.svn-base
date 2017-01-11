@all
Feature: (Jira - Automation-942) Set up a new expense accrual - Manual Setup

  Scenario Outline: As a delete user I Ensure that user can manually set up a new expense accrual
     #issue exists 20755

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/ExpenseAccruals/"
    And I import following file name:
      | ManualSetupExpenseAccrual.xml  |
      | 12PeriodFiscalCalendar2015.xml |

    And I navigate to the admin dashboard
    And I click on the "Manage Fiscal Calendar" link
    And I verify a unique row in grid "YearSummaryGrid" having unique value "2015" under column header "Year"
      | name              | value      |
      | Begin Date        | 01/01/2015 |
      | End Date          | 12/31/2015 |
      | Number of Periods | 12         |
      | Type              | Monthly    |
    And I assert the following values in non frame grid "PeriodSummaryGrid"
      | Year | Quarter | Period | Begin Date | End Date   | Days | Weeks |
      | 2015 | 1       | 1      | 01/01/2015 | 01/31/2015 | 31   | 4.43  |
      | 2015 | 1       | 2      | 02/01/2015 | 02/28/2015 | 28   | 4.00  |
      | 2015 | 1       | 3      | 03/01/2015 | 03/31/2015 | 31   | 4.43  |
      | 2015 | 1       | 4      | 04/01/2015 | 04/30/2015 | 30   | 4.29  |
      | 2015 | 2       | 5      | 05/01/2015 | 05/31/2015 | 31   | 4.43  |
      | 2015 | 2       | 6      | 06/01/2015 | 06/30/2015 | 30   | 4.29  |
      | 2015 | 2       | 7      | 07/01/2015 | 07/31/2015 | 31   | 4.43  |
      | 2015 | 3       | 8      | 08/01/2015 | 08/31/2015 | 31   | 4.43  |
      | 2015 | 3       | 9      | 09/01/2015 | 09/30/2015 | 30   | 4.29  |
      | 2015 | 3       | 10     | 10/01/2015 | 10/31/2015 | 31   | 4.43  |
      | 2015 | 4       | 11     | 11/01/2015 | 11/30/2015 | 30   | 4.29  |
      | 2015 | 4       | 12     | 12/01/2015 | 12/31/2015 | 31   | 4.43  |

    And I navigate to entity type "<Item>" named "<Contract Name>"
    Then I navigate to "Accounting Info"
    And I click on the "Expense Accruals" tab
    And I click on the "Add item" action panel button
    And I switch to visible frame
    And I set following fields value on editable page
      | name                                       | value       |
      | ExpenseAccrualSetup_CodeExpenseGroupID     | Base Rent   |
      | ExpenseAccrualSetup_CodeExpenseTypeID      | Rent        |
      | ExpenseAccrualSetup_CodeExpenseCategoryID  | Rent        |
      | ExpenseAccrualSetup_CodeCurrencyTypeID     | USD         |
      | ExpenseAccrualSetup_CodeBuildingAreaUnitID | Square Feet |
      | ExpenseAccrualSetup_CodeAccrualTypeID      | Accrual     |
    And I click on the "Save Changes" action panel btn
    And I verify success message "Successfully added Expense Accrual Setup"
    And I click " Add Expense Accrual Schedule... " button
    And I switch to default frame
    And I see the "Add Expense Accrual Schedule  ***Required fields in red" modal window
    And I set following fields value on editable page
      | name                                | value                          |
      | ExpenseAccrualSchedule_BeginPeriod  | 1                              |
      | ExpenseAccrualSchedule_EndPeriod    | 12                             |
      | ExpenseAccrualSchedule_BeginYear    | 2015                           |
      | ExpenseAccrualSchedule_EndYear      | 2015                           |
      | ExpenseAccrualSchedule_AnnualAmount | 15,820.50                      |
#      | ExpenseAccrualSchedule_PeriodAmount       | 1318.38   |
#      | ExpenseAccrualSchedule_FirstPaymentAmount | 1318.38   |
#      | ExpenseAccrualSchedule_LastPaymentAmount  | 1318.38   |
      | ExpenseAccrualSchedule_Notes        | Manually set up accrual record |

    And I click on the "Add" button
    And I wait for modal window to close
    And I click on the "Save Changes" action panel button
    And I verify a row from grid "BOGridExpenseAccrualSchedule" having unique value "1/2015" under column header "Begin Period"
      | name                | value                          |
      | End Period          | 12/2015                        |
      | Period Amount       | $1,318.38                      |
      | Annual Amount       | $15,820.50                     |
      | Accrual Rate        |                                |
      | First Period Amount | $1,318.38                      |
      | Last Period Amount  | $1,318.38                      |
      | Notes               | Manually set up accrual record |

    And I verify a row from grid "thisDiv" having unique value "Base Rent" under column header "Group"
      | name         | value   |
      | Type         | Rent    |
      | Category     | Rent    |
      | Begin Period | 1/2015  |
      | End Period   | 12/2015 |
      | Record Type  | Accrual |
    #issue exists 20755
#      | Current Period Expense | $1,318.38  |
#      | Current Annual Expense | $15,820.50 |
    And I switch to default frame
    And I select "Contract Expense Accrual Forecast" from Page dropdown
    And I switch to visible frame
    And I set following fields value on editable page
      | name              | value     |
      | efExpenseGroup    | Base Rent |
      | efExpenseType     | Rent      |
      | efExpenseCategory | Rent      |

    And I assert the following values in grid "fisEFGrid"
      |      | 1         | 2         | 3         | 4         | 5         | 6         | 7         | 8         | 9         | 10        | 11        | 12        | Total      |
      | 2015 | $1,318.38 | $1,318.38 | $1,318.38 | $1,318.38 | $1,318.38 | $1,318.38 | $1,318.38 | $1,318.38 | $1,318.38 | $1,318.38 | $1,318.38 | $1,318.38 | $15,820.56 |


    Examples:
      | Login User   | Login full username  | Contract Name                | Item     |
      | DeleteAccess | Delete Access Access | Manual Setup Expense Accrual | Contract |