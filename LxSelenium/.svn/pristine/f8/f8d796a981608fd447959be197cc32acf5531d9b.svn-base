@all
Feature: Adding Pro Rata Share info (Jira Ref : AUTOMATION-735)

  Scenario Outline: As a delete user I import the attached XML Recoveries Pro Rata Net Page Contract
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/Net/"
    And I import following file name:
      | RecoveriesAddingProRataShare.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user
  1. Make sure to select Contract Expense Recovery (Net) page from the page drop down
  2. Ensure that there is a line item for Payment Info-> Recoveries
  3. Ensure all the added  Pro-Rata Share shall be saved successfully

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to "Payment Info"
    And I click on "Recoveries" tab
    And I select "Contract Expense Recovery (Net)" from Page dropdown
    Then I verify page title "Contract Expense Recovery (Net) List" after navigation
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
      | name            | value      |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2014 |
      | End Date        | 12/31/2014 |
      | Recovery Period |            |
      | Reported Amount | $48,530.00 |
      | Variance %      | 0.00%      |
      | Approved Amount | $43,600.00 |
      | Pre-Paid Amount | $0.00      |
      | Net Amount Due  | $43,600.00 |
    And I set following fields value on editable page
      | name                                     | value |
      | ExpenseRecovery_ReportedGLA              | 15000 |
      | ExpenseRecovery_ReportedRentableArea     | 5000  |
      | ExpenseRecovery_ReportedProRataShareRate | 33    |
      | ExpenseRecovery_ApprovedGLA              | 15000 |
      | ExpenseRecovery_ApprovedRentableArea     | 5000  |
      | ExpenseRecovery_ApprovedProRataShareRate | 33    |
      | ExpenseRecovery_BudgetedGLA              | 15000 |
      | ExpenseRecovery_BudgetedRentableArea     | 5000  |
      | ExpenseRecovery_BudgetedProRataShareRate | 33    |
    And I click on the "Save Changes" action panel button
    And I check for complete frame 'loading...'
    And I verify the following fields value on editable page
      | name                                     | value     |
      | ExpenseRecovery_ReportedGLA              | 15,000    |
      | ExpenseRecovery_ReportedRentableArea     | 5,000     |
      | ExpenseRecovery_ReportedProRataShareRate | 33.00000% |
      | ExpenseRecovery_ApprovedGLA              | 15,000    |
      | ExpenseRecovery_ApprovedRentableArea     | 5,000     |
      | ExpenseRecovery_ApprovedProRataShareRate | 33.00000% |
      | ExpenseRecovery_BudgetedGLA              | 15,000    |
      | ExpenseRecovery_BudgetedRentableArea     | 5,000     |
      | ExpenseRecovery_BudgetedProRataShareRate | 33.00000% |


  Examples:
    | Entity Name                | Login User   | Login full username  |
    | Recoveries ProRata NetPage | DeleteAccess | Delete Access Access |