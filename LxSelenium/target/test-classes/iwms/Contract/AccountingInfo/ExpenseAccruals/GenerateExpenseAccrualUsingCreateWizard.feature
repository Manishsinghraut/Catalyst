@all
Feature: (Jira - Automation-943) Generate Expense Accruals using create wizard functionality

  Scenario Outline: As a delete user I Generate Expense Accruals using create wizard functionality

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/ExpenseAccruals/"
    And I import following file name:
      | ExpenseAccrualSetupWizardContract.xml |

    And I navigate to entity type "<Item>" named "<Contract Name>"
    Then I navigate to "Accounting Info"
    And I click on the "Expense Accruals" tab
    And I click on the "Create Wizard" action panel button
    And I see the "Create Expense Accruals" modal window
    And I check "Rent" expense setup
    And I click on the "Create Accrual Setup Records" button
    And I verify a row from grid "thisDiv" having unique value "Rent" under column header "Group"
      | name                   | value       |
      | Type                   | Base Rent   |
      | Category               | Rent        |
      | Begin Period           | 1/2000      |
      | End Period             | 12/2030     |
      | Current Period Expense | $9,000.00   |
      | Current Annual Expense | $108,000.00 |
    And I verify the following fields value on editable page
      | name                                      | value     |
      | ExpenseAccrualSetup_CodeExpenseGroupID    | Rent      |
      | ExpenseAccrualSetup_CodeExpenseTypeID     | Base Rent |
      | ExpenseAccrualSetup_CodeExpenseCategoryID | Rent      |
      | ExpenseAccrualSetup_CodeCurrencyTypeID    | USD       |
      | ExpenseAccrualSetup_RentableArea          | 890,000   |
      | ExpenseAccrualSetup_Description           | base Rent |

    And I verify a row from grid "BOGridExpenseAccrualSchedule" having unique value "1/2000" under column header "Begin Period"
      | name                | value       |
      | End Period          | 12/2030     |
      | Period Amount       | $9,000.00   |
      | Annual Amount       | $108,000.00 |
      | Accrual Rate        |             |
      | First Period Amount | $9,000.00   |
      | Last Period Amount  | $9,000.00   |
      | Notes               |             |


    Examples:
      | Login User   | Login full username  | Contract Name                 | Item     |
      | DeleteAccess | Delete Access Access | Expense Accrual Set up Wizard | Contract |