@all
Feature: (Ref : Jira Ticket No : Automation-743) Adding(-)Deductions and(-)Recoveries

  Scenario Outline: As a delete user I Import the attached Recoveries_Deductions and Recoveries xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/Net/"
    And I import following file name:
#      | RecoveriesNETDeductionsAndRecoveries.xml |
      | RecoveriesNETDeductionsAndRecoveries-743.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I add recoveries and deductions
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "Payment Info"
    And I click on the "Recoveries" tab
#    And I navigate to second level "Payment Info" and third level "Recoveries" tabs
    And I select "Contract Expense Recovery (Net)" from Page dropdown
    Then I verify page title "Contract Expense Recovery (Net) List" after navigation
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
      | name            | value       |
      | Recovery Type   | Interior    |
      | Begin Date      | 01/01/2014  |
      | End Date        | 12/31/2014  |
      | Recovery Period |             |
      | Reported Amount | $226,000.00 |
      | Variance %      | 0.00%       |
      | Approved Amount | $234,500.00 |
      | Pre-Paid Amount | $0.00       |
      | Net Amount Due  | $234,500.00 |
    And I click on Deductions Reported link in Contract Expense Recovery Net page
    And I switch to default frame
    And I see the "Expense Recovery Item List : Deductions" modal window
    And I click on "Add Expense Recovery Item..." button in grid
    And I see the "Add Expense Recovery Item  ***Required fields in red" modal window
    And I set fields values on editable page
      | name                                         | value |
      | ExpenseRecoveryItem_ReportedAmount           | 1000  |
      | ExpenseRecoveryItem_BudgetedAmount           | 1000  |
      | ExpenseRecoveryItem_ApprovedAmount           | 1000  |
      | ExpenseRecoveryItem_ReportedProRataShareRate | 10    |
      | ExpenseRecoveryItem_ApprovedProRataShareRate | 20    |
      | ExpenseRecoveryItem_BudgetedProRataShareRate | 10    |
    And I click on the "Add" button

#    And I wait for "Cap Amount Warning" modal window to open in non frame page
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I wait for "Cap Amount Warning" modal window to close

    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Status" and cell value "Review"
      | name   | value  |
      | Status | Review |
    And I verify the following variance amount
      | $1,000.00 |
      | $1,000.00 |
      | $1,000.00 |
    And I verify the following label and value pair
      | name                                 | value     |
      | Reported Amount Gross                | $1,000.00 |
      | Computed Total Approved Amount Gross | $1,000.00 |
      | Budgeted Amount Gross                | $1,000.00 |
      | Reported Amount Net                  | $100.00   |
      | Computed Total Approved Amount Net   | $200.00   |
      | Budgeted Amount Net                  | $100.00   |
    And I verify the following fields value on editable page
      | name                                         | value     |
      | ExpenseRecoveryItem_ReportedAmount           | $1,000.00 |
      | ExpenseRecoveryItem_BudgetedAmount           | $1,000.00 |
      | ExpenseRecoveryItem_ApprovedAmount           | $1,000.00 |
      | ExpenseRecoveryItem_ReportedProRataShareRate | 10.00000% |
      | ExpenseRecoveryItem_ApprovedProRataShareRate | 20.00000% |
      | ExpenseRecoveryItem_BudgetedProRataShareRate | 10.00000% |
    And I click on the "Close" button

    And I double click a row from grid "BOGridExpenseRecoveryItem" having unique value "Review" under column header "Status"
      | name   | value  |
      | Status | Review |
    And I verify following editable row from grid "BOGridExpenseRecoveryItem"
      | name                         | value  |
      | Status                       | Review |
      | Approved Amount              | 1000   |
      | Reported Amount              | 1000   |
      | Approved Pro Rata Share Rate | 20     |
#    And I click "Update" button
#    And I click on Update button
#
#    And I wait for "Cap Amount Warning" modal window to open in non frame page
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I wait for "Cap Amount Warning" modal window to close

    And I click on the Finish button
#    And I click "Yes" button
#    And I click on the "Finish" button
#    And I wait for modal window to close
#    And I check for complete frame 'loading...'
    And I switch to visible frame
    And I verify the following deductions reported and approved values in recoveries net page
      | name               | value   |
      | Reported Deduction | $100.00 |
      | Approved Deduction | $200.00 |
      | Budgeted Deduction | $100.00 |

    And I verify the following subtotal reported and approved values in recoveries net page
      | name              | value       |
      | Reported Subtotal | $225,900.00 |
      | Approved Subtotal | $234,300.00 |
      | Variance Subtotal | $234,400.00 |
    And I switch to default frame
    And I logout

#    And I click on Recoveries Reported link in Contract Expense Recovery Net page
#    And I switch to default frame
#    And I see the "Expense Recovery Item List : Recoveries" modal window
#    And I click on "Add Expense Recovery Item..." button in grid
#    And I see the "Add Expense Recovery Item  ***Required fields in red" modal window
#
#    And I set fields values on editable page
#      | name                                         | value |
#      | ExpenseRecoveryItem_ReportedAmount           | 1000  |
#      | ExpenseRecoveryItem_BudgetedAmount           | 1000  |
#      | ExpenseRecoveryItem_ApprovedAmount           | 1000  |
#      | ExpenseRecoveryItem_ReportedProRataShareRate | 10    |
#      | ExpenseRecoveryItem_ApprovedProRataShareRate | 20    |
#      | ExpenseRecoveryItem_BudgetedProRataShareRate | 10    |
#    And I click on the "Add" button
#
#    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Reported Amount" and cell value "$1,000.00"
#      | name   | value  |
#      | Status | Review |
#    And I verify the following variance amount
#      | $1,000.00 |
#      | $1,000.00 |
#      | $1,000.00 |
#    And I verify the following label and value pair
#      | name                                 | value     |
#      | Reported Amount Gross                | $1,000.00 |
#      | Computed Total Approved Amount Gross | $1,000.00 |
#      | Budgeted Amount Gross                | $1,000.00 |
#      | Reported Amount Net                  | $100.00   |
#      | Computed Total Approved Amount Net   | $200.00   |
#      | Budgeted Amount Net                  | $100.00   |
#    And I verify the following fields value on editable page
#      | name                                         | value     |
#      | ExpenseRecoveryItem_ReportedAmount           | $1,000.00 |
#      | ExpenseRecoveryItem_BudgetedAmount           | $1,000.00 |
#      | ExpenseRecoveryItem_ApprovedAmount           | $1,000.00 |
#      | ExpenseRecoveryItem_ReportedProRataShareRate | 10.00000% |
#      | ExpenseRecoveryItem_ApprovedProRataShareRate | 20.00000% |
#      | ExpenseRecoveryItem_BudgetedProRataShareRate | 10.00000% |
#    And I click on the "Close" button
#
#    And I double click a row from grid "BOGridExpenseRecoveryItem" having unique value "$1,000.00" under column header "Reported Amount"
#      | name   | value  |
#      | Status | Review |
#    And I verify following editable row from grid "BOGridExpenseRecoveryItem"
#      | name            | value  |
#      | Status          | Review |
#      | Approved Amount | 1000   |
##    And I click on the "Finish" button
#    And I click on the Finish button
##    And I wait for modal window to close
##    And I check for complete frame 'loading...'
#    And I switch to visible frame
#    And I verify the following recoveries reported and approved values in recoveries net page
#      | name                | value   |
#      | Reported Recoveries | $100.00 |
#      | Approved Recoveries | $200.00 |
#      | Budgeted Recoveries | $100.00 |
#
#    And I verify the following subtotal reported and approved values in recoveries net page
#      | name              | value       |
#      | Reported Subtotal | $225,800.00 |
#      | Approved Subtotal | $234,100.00 |
#      | Variance Subtotal | $234,300.00 |
#    And I switch to default frame
#
  Examples:
    | Login User   | Login full username  | Entity Name |
    | DeleteAccess | Delete Access Access | RDO         |

#
#  Scenario Outline: As a delete user I verify the Report of recoveries and deductions
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
# #    And I navigate to entity type "Contract" named "<Entity Name>"
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
##    And I navigate to "Payment Info"
##    And I navigate to "Payment Info"
##    And I click on the "Recoveries" tab
#    And I navigate to second level "Payment Info" and third level "Recoveries" tabs
#    And I navigate to second level "Payment Info" and third level "Recoveries" tabs
#    And I select "Contract Expense Recovery (Net)" from Page dropdown
#    Then I verify page title "Contract Expense Recovery (Net) List" after navigation
#    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
#      | name            | value       |
#      | Recovery Type   | Interior    |
#      | Begin Date      | 01/01/2014  |
#      | End Date        | 12/31/2014  |
#      | Recovery Period |             |
#      | Reported Amount | $225,900.00 |
#      | Variance %      | 0.00%       |
#      | Approved Amount | $234,300.00 |
#      | Pre-Paid Amount | $0.00       |
#      | Net Amount Due  | $234,300.00 |
#
#    And I click on Recoveries Reported link in Contract Expense Recovery Net page
#    And I switch to default frame
#    And I see the "Expense Recovery Item List : Recoveries" modal window
#    And I click on "Add Expense Recovery Item..." button in grid
#    And I see the "Add Expense Recovery Item  ***Required fields in red" modal window
#
#    And I set fields values on editable page
#      | name                                         | value |
#      | ExpenseRecoveryItem_ReportedAmount           | 1000  |
#      | ExpenseRecoveryItem_BudgetedAmount           | 1000  |
#      | ExpenseRecoveryItem_ApprovedAmount           | 1000  |
#      | ExpenseRecoveryItem_ReportedProRataShareRate | 10    |
#      | ExpenseRecoveryItem_ApprovedProRataShareRate | 20    |
#      | ExpenseRecoveryItem_BudgetedProRataShareRate | 10    |
#    And I click on the "Add" button
#
##    And I click "Yes" button
##    And I wait for "Cap Amount Warning" modal window to open in non frame page
##    And I click "Yes" button in modal window "Cap Amount Warning"
##    And I wait for "Cap Amount Warning" modal window to close
#
#    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Reported Amount" and cell value "$1,000.00"
#      | name   | value  |
#      | Status | Review |
#    And I verify the following variance amount
#      | $1,000.00 |
#      | $1,000.00 |
#      | $1,000.00 |
#    And I verify the following label and value pair
#      | name                                 | value     |
#      | Reported Amount Gross                | $1,000.00 |
#      | Computed Total Approved Amount Gross | $1,000.00 |
#      | Budgeted Amount Gross                | $1,000.00 |
#      | Reported Amount Net                  | $100.00   |
#      | Computed Total Approved Amount Net   | $200.00   |
#      | Budgeted Amount Net                  | $100.00   |
#    And I verify the following fields value on editable page
#      | name                                         | value     |
#      | ExpenseRecoveryItem_ReportedAmount           | $1,000.00 |
#      | ExpenseRecoveryItem_BudgetedAmount           | $1,000.00 |
#      | ExpenseRecoveryItem_ApprovedAmount           | $1,000.00 |
#      | ExpenseRecoveryItem_ReportedProRataShareRate | 10.00000% |
#      | ExpenseRecoveryItem_ApprovedProRataShareRate | 20.00000% |
#      | ExpenseRecoveryItem_BudgetedProRataShareRate | 10.00000% |
#    And I click on the "Close" button
#
#    And I double click a row from grid "BOGridExpenseRecoveryItem" having unique value "$1,000.00" under column header "Reported Amount"
#      | name   | value  |
#      | Status | Review |
#    And I verify following editable row from grid "BOGridExpenseRecoveryItem"
#      | name            | value  |
#      | Status          | Review |
#      | Approved Amount | 1000   |
##    And I click on the "Finish" button
#    And I click on the Finish button
##    And I wait for modal window to close
##    And I check for complete frame 'loading...'
#    And I switch to visible frame
#    And I verify the following recoveries reported and approved values in recoveries net page
#      | name                | value   |
#      | Reported Recoveries | $100.00 |
#      | Approved Recoveries | $200.00 |
#      | Budgeted Recoveries | $100.00 |
#
#    And I verify the following subtotal reported and approved values in recoveries net page
#      | name              | value       |
#      | Reported Subtotal | $225,800.00 |
#      | Approved Subtotal | $234,100.00 |
#      | Variance Subtotal | $234,300.00 |
#    And I switch to default frame
#
#  Examples:
#    | Login User   | Login full username  | Entity Name |
#    | DeleteAccess | Delete Access Access | RDO         |