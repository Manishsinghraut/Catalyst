@all
Feature: (Ref : Jira Ticket No :AUTOMATION-1196, AUTOMATION-747) Adding(-)Deductions and(-)Recoveries

  Scenario Outline: As a delete user I Import the attached xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following file name:
      | RecoveriesDeductions-1196.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I verify the report of deduction and deductions
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
#    And I click on "Payment Info" tab
#    And I click on "Recoveries" tab
    And I refresh page
    And I click on the "Payment Info" tab
    And I click on the "Recoveries" tab
#    And I navigate to second level tab "Payment Info" and third level "Recoveries" tab of entity "Contract"
    And I click on row from grid "thisDiv" having unique value "Select first line item" under column header "Comments"
      | name            | value      |
      | Recovery Group  | CAM        |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2014 |
      | End Date        | 12/31/2014 |
      | Recovery Period |            |
      | Reported Amount | $74,580.00 |
      | Percent Change  | 0.0000%    |
      | Approved Amount | $77,385.00 |
      | Pre-Paid Amount | $0.00      |
      | Amount Due      | $77,385.00 |

    And I verify the following recoveries subtotal 1 values
      | name              | value       |
      | Reported Subtotal | $226,000.00 |
      | Approved Subtotal | $234,500.00 |
      | Budgeted Subtotal | $235,500.00 |

    And I click on Deductions Reported link in Contract Expense Recovery page
    And I switch to default frame
    And I see the "Expense Recovery Item List : Deductions" modal window
    And I click on "Add Expense Recovery Item..." button in grid
    And I see the "Add Expense Recovery Item  ***Required fields in red" modal window
    And I set list fields values on editable page
      | name                                        | value     |
      | ExpenseRecoveryItem_CodeRecoveryItemGroupID | Exterior  |
      | ExpenseRecoveryItem_CodeRecoveryItemTypeID  | Landscape |
      | ExpenseRecoveryItem_CodeApprovalStatusID    | Review    |

    And I set fields values on editable page
      | name                               | value |
      | ExpenseRecoveryItem_ReportedAmount | 1000  |
      | ExpenseRecoveryItem_BudgetedAmount | 1000  |
      | ExpenseRecoveryItem_ApprovedAmount | 1000  |
    And I click on the "Add" button

#    And I wait for "Cap Amount Warning" modal window to open in non frame page
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I wait for "Cap Amount Warning" modal window to close

    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Group" and cell value "Exterior"
      | name               | value     |
      | Recovery Item Type | Landscape |
      | Status             | Review    |
    And I verify the following variance amount
      | $1,000.00 |
      | $1,000.00 |
      | $1,000.00 |
    And I verify the computed total amount "$1,000.00"
    And I click on the "Close" button

    And I double click a row from grid "BOGridExpenseRecoveryItem" having unique value "Exterior" under column header "Recovery Item Group"
      | name               | value     |
      | Recovery Item Type | Landscape |
      | Status             | Review    |
    And I verify following editable row from grid "BOGridExpenseRecoveryItem"
      | name                | value     |
      | Recovery Item Group | Exterior  |
      | Recovery Item Type  | Landscape |
      | Status              | Review    |
      | Approved Amount     | 1000      |

#    And I click on 'Update' button while editing line items
#    And I wait for "Cap Amount Warning" modal window to open in non frame page
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I wait for "Cap Amount Warning" modal window to close

    And I click on the Finish button
    And I wait for the Loading text to disappear
    And I verify the following deductions reported and approved values
      | name               | value     |
      | Reported Deduction | $1,000.00 |
      | Approved Deduction | $1,000.00 |
      | Budgeted Deduction | $1,000.00 |
    And I verify the following recoveries subtotal 1 values
      | name              | value       |
      | Reported Subtotal | $225,000.00 |
      | Approved Subtotal | $233,500.00 |
      | Budgeted Subtotal | $234,500.00 |
    And I verify the following recoveries subtotal 2 values
      | name              | value       |
      | Reported Subtotal | $225,000.00 |
      | Approved Subtotal | $233,500.00 |
      | Budgeted Subtotal | $234,500.00 |

    And I switch to default frame
#    And I logout

  Examples:
    | Login User   | Login full username  | Entity Name                        |
    | DeleteAccess | Delete Access Access | RecoveriesDeductions-Testing-11137 |

#  Scenario Outline: As a delete user I verify the report of deduction and deductions
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#
#    When I Search for the "<Entity Name>" that was created
#    Then Click on the name of the "<Entity Name>" in the results pop-up
#    And I see "<Entity Name>" name on the header
##    And I click on "Recoveries" tab
#    And I refresh page
#    And I click on the "Recoveries" tab
#    And I switch to visible frame
#
##    And I click on row from grid "thisDiv" having unique value "Select first line item" under column header "Comments"
##    And I click on row from grid "thisDiv" having unique value "$74,250.00" under column header "Reported Amount"
#
#    And I verify grid row "thisDiv" having unique value "$74,250.00" under column header "Reported Amount"
#      | name            | value      |
#      | Recovery Group  | CAM        |
#      | Recovery Type   | Interior   |
#      | Begin Date      | 01/01/2014 |
#      | End Date        | 12/31/2014 |
#      | Recovery Period |            |
#      | Reported Amount | $74,250.00 |
#      | Percent Change  | 0.0000%    |
#      | Approved Amount | $77,055.00 |
#      | Pre-Paid Amount | $0.00      |
#      | Amount Due      | $77,055.00 |
#    And I wait for the Loading text to disappear
#
#    And I click on Recoveries Reported link in Contract Expense Recovery page
##    And I click on Recoveries Reported link in Contract Expense Recovery page
#    And I switch to default frame
#    And I see the "Expense Recovery Item List : Recoveries" modal window
#    And I click on "Add Expense Recovery Item..." button in grid
#    And I see the "Add Expense Recovery Item  ***Required fields in red" modal window
#    And I set fields values on editable page
#      | name                               | value |
#      | ExpenseRecoveryItem_ReportedAmount | 1000  |
#      | ExpenseRecoveryItem_BudgetedAmount | 1000  |
#      | ExpenseRecoveryItem_ApprovedAmount | 1000  |
#    And I click on the "Add" button
#
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
#    And I verify the computed total amount "$1,000.00"
#    And I click on the "Close" button
#
#    And I double click a row from grid "BOGridExpenseRecoveryItem" having unique value "$1,000.00" under column header "Reported Amount"
#      | name   | value  |
#      | Status | Review |
#    And I verify following editable row from grid "BOGridExpenseRecoveryItem"
#      | name            | value  |
#      | Status          | Review |
#      | Approved Amount | 1000   |
#
##    And I click on the "Update" button
##    And I wait for "Cap Amount Warning" modal window to open in non frame page
##    And I click "Yes" button in modal window "Cap Amount Warning"
##    And I wait for "Cap Amount Warning" modal window to close
#
#    And I click on the Finish button
#    And I wait for the Loading text to disappear
#    And I verify the following recoveries reported and approved values
#      | name                | value     |
#      | Reported Recoveries | $1,000.00 |
#      | Approved Recoveries | $1,000.00 |
#      | Budgeted Recoveries | $1,000.00 |
#
#    And I verify the following recoveries subtotal 1 values
#      | name              | value       |
#      | Reported Subtotal | $225,000.00 |
#      | Approved Subtotal | $233,500.00 |
#      | Budgeted Subtotal | $234,500.00 |
#
#    And I verify the following recoveries subtotal 2 values
#      | name              | value       |
#      | Reported Subtotal | $224,000.00 |
#      | Approved Subtotal | $232,500.00 |
#      | Budgeted Subtotal | $233,500.00 |
#
#    And I switch to default frame
#
#  Examples:
#    | Login User   | Login full username  | Entity Name                        |
#    | DeleteAccess | Delete Access Access | RecoveriesDeductions-Testing-11137 |


#  Scenario Outline: As a delete user I verify the report of deduction and deductions
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I Search for the "<Entity Name>" that was created
#    Then Click on the name of the "<Entity Name>" in the results pop-up
#    And I see "<Entity Name>" name on the header
##    And I click on "Payment Info" tab
##    And I click on "Recoveries" tab
#    And I navigate to second level tab "Payment Info" and third level "Recoveries" tab of entity "Contract"
#
#    And I click on row from grid "thisDiv" having unique value "Select first line item" under column header "Comments"
#      | name            | value      |
#      | Recovery Group  | CAM        |
#      | Recovery Type   | Interior   |
#      | Begin Date      | 01/01/2014 |
#      | End Date        | 12/31/2014 |
#      | Recovery Period |            |
#      | Reported Amount | $74,250.00 |
#      | Percent Change  | 0.0000%    |
#      | Approved Amount | $77,055.00 |
#      | Pre-Paid Amount | $0.00      |
#      | Amount Due      | $77,055.00 |
#    And I wait for the Loading text to disappear
#
#    And I click on Recoveries Reported link in Contract Expense Recovery page
#    And I switch to default frame
#    And I see the "Expense Recovery Item List : Recoveries" modal window
#    And I click on "Add Expense Recovery Item..." button in grid
#    And I see the "Add Expense Recovery Item  ***Required fields in red" modal window
#    And I set fields values on editable page
#      | name                               | value |
#      | ExpenseRecoveryItem_ReportedAmount | 1000  |
#      | ExpenseRecoveryItem_BudgetedAmount | 1000  |
#      | ExpenseRecoveryItem_ApprovedAmount | 1000  |
#    And I click on the "Add" button
#
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
#    And I verify the computed total amount "$1,000.00"
#    And I click on the "Close" button
#
#    And I double click a row from grid "BOGridExpenseRecoveryItem" having unique value "$1,000.00" under column header "Reported Amount"
#      | name   | value  |
#      | Status | Review |
#    And I verify following editable row from grid "BOGridExpenseRecoveryItem"
#      | name            | value  |
#      | Status          | Review |
#      | Approved Amount | 1000   |
#
##    And I click on the "Update" button
##    And I wait for "Cap Amount Warning" modal window to open in non frame page
##    And I click "Yes" button in modal window "Cap Amount Warning"
##    And I wait for "Cap Amount Warning" modal window to close
#
#    And I click on the Finish button
#    And I wait for the Loading text to disappear
#    And I verify the following recoveries reported and approved values
#      | name                | value     |
#      | Reported Recoveries | $1,000.00 |
#      | Approved Recoveries | $1,000.00 |
#      | Budgeted Recoveries | $1,000.00 |
#
#    And I verify the following recoveries subtotal 1 values
#      | name              | value       |
#      | Reported Subtotal | $225,000.00 |
#      | Approved Subtotal | $233,500.00 |
#      | Budgeted Subtotal | $234,500.00 |
#
#    And I verify the following recoveries subtotal 2 values
#      | name              | value       |
#      | Reported Subtotal | $224,000.00 |
#      | Approved Subtotal | $232,500.00 |
#      | Budgeted Subtotal | $233,500.00 |
#
#  Examples:
#    | Login User   | Login full username  | Entity Name                        |
#    | DeleteAccess | Delete Access Access | RecoveriesDeductions-Testing-11137 |


#old script
#  @all
#  Feature: (Ref : Jira Ticket No : Automation-747) Adding(-)Deductions and(-)Recoveries
#
#  Scenario Outline: As a delete user I Import the attached Recoveries_Deductions and Recoveries xml
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
#    And I import following file name:
#      | RecoveriesDeductionsAndRecoveries.xml |
#    And I logout
#
#    Examples:
#      | Login User   | Login full username  |
#      | DeleteAccess | Delete Access Access |
#
#
#  Scenario Outline: As a delete user I add recoveries and deductions
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I Search for the "<Entity Name>" that was created
#    Then Click on the name of the "<Entity Name>" in the results pop-up
#    And I see "<Entity Name>" name on the header
#    And I navigate to second level "Payment Info" and third level "Recoveries" tabs
##    And I navigate to "Payment Info"
##    And I navigate to "Payment Info"
##    And I click on the "Recoveries" tab
##    Then I verify page title "Contract Expense Recovery List" after navigation
#    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
#      | name            | value      |
#      | Recovery Type   | Interior   |
#      | Begin Date      | 01/01/2014 |
#      | End Date        | 12/31/2014 |
#      | Recovery Period |            |
#      | Reported Amount | $74,580.00 |
#      | Percent Change  | 0.0000%    |
#      | Approved Amount | $77,385.00 |
#      | Pre-Paid Amount | $0.00      |
#      | Amount Due      | $77,385.00 |
#    And I click on Deductions Reported link in Contract Expense Recovery page
#    And I switch to default frame
#    And I see the "Expense Recovery Item List : Deductions" modal window
#    And I click on "Add Expense Recovery Item..." button in grid
#    And I see the "Add Expense Recovery Item  ***Required fields in red" modal window
#    And I set list fields values on editable page
#      | name                                        | value     |
#      | ExpenseRecoveryItem_CodeRecoveryItemGroupID | Exterior  |
#      | ExpenseRecoveryItem_CodeRecoveryItemTypeID  | Landscape |
#      | ExpenseRecoveryItem_CodeApprovalStatusID    | Review    |
#
#    And I set fields values on editable page
#      | name                               | value |
#      | ExpenseRecoveryItem_ReportedAmount | 1000  |
#      | ExpenseRecoveryItem_BudgetedAmount | 1000  |
#      | ExpenseRecoveryItem_ApprovedAmount | 1000  |
#    And I click on the "Add" button
#
#    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Group" and cell value "Exterior"
#      | name               | value     |
#      | Recovery Item Type | Landscape |
#      | Status             | Review    |
#    And I verify the following variance amount
#      | $1,000.00 |
#      | $1,000.00 |
#      | $1,000.00 |
#    And I verify the computed total amount "$1,000.00"
#    And I click on the "Close" button
#
#    And I double click a row from grid "BOGridExpenseRecoveryItem" having unique value "Exterior" under column header "Recovery Item Group"
#      | name               | value     |
#      | Recovery Item Type | Landscape |
#      | Status             | Review    |
#    And I verify following editable row from grid "BOGridExpenseRecoveryItem"
#      | name                | value     |
#      | Recovery Item Group | Exterior  |
#      | Recovery Item Type  | Landscape |
#      | Status              | Review    |
#      | Approved Amount     | 1000      |
##    And I click on the "Finish" button
##    And I click "Finish" button
#    And I click on the Finish button
##    And I wait for modal window to close
##
##    And I check for complete frame 'loading...'
#
#    And I switch to visible frame
#    And I verify the following deductions reported and approved values
#      | name               | value     |
#      | Reported Deduction | $1,000.00 |
#      | Approved Deduction | $1,000.00 |
#    And I verify the following subtotal reported and approved values
#      | name              | value       |
#      | Reported Subtotal | $225,000.00 |
#      | Approved Subtotal | $233,500.00 |
#    And I switch to default frame
##    And I logout
#
#    Examples:
#      | Login User   | Login full username  | Entity Name                      |
#      | DeleteAccess | Delete Access Access | Recoveries deductions and others |


#  Scenario Outline: As a delete user I verify the report of recoveries and deductions
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
##    And I navigate to entity type "Contract" named "<Entity Name>"
#    When I Search for the "<Entity Name>" that was created
#    Then Click on the name of the "<Entity Name>" in the results pop-up
#    And I see "<Entity Name>" name on the header
#    And I click on the "Details" tab
#    And I navigate to "Payment Info"
#    And I navigate to "Payment Info"
#    And I click on the "Recoveries" tab
##    And I navigate to second level "Payment Info" and third level "Recoveries" tabs
#    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
#      | name            | value      |
#      | Recovery Type   | Interior   |
#      | Begin Date      | 01/01/2014 |
#      | End Date        | 12/31/2014 |
#      | Recovery Period |            |
#      | Reported Amount | $74,250.00 |
#      | Percent Change  | 0.0000%    |
#      | Approved Amount | $77,055.00 |
#      | Pre-Paid Amount | $0.00      |
#      | Amount Due      | $77,055.00 |
#    And I click on Recoveries Reported link in Contract Expense Recovery page
#    And I switch to default frame
#    And I see the "Expense Recovery Item List : Recoveries" modal window
#    And I click on "Add Expense Recovery Item..." button in grid
#    And I see the "Add Expense Recovery Item  ***Required fields in red" modal window
#    And I set fields values on editable page
#      | name                               | value |
#      | ExpenseRecoveryItem_ReportedAmount | 1000  |
#      | ExpenseRecoveryItem_BudgetedAmount | 1000  |
#      | ExpenseRecoveryItem_ApprovedAmount | 1000  |
#    And I click on the "Add" button
#
#    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Reported Amount" and cell value "$1,000.00"
#      | name   | value  |
#      | Status | Review |
#    And I verify the following variance amount
#      | $1,000.00 |
#      | $1,000.00 |
#      | $1,000.00 |
#    And I verify the computed total amount "$1,000.00"
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
##    And I click "Finish" button
##    And I wait for modal window to close
##    And I check for complete frame 'loading...'
#    And I switch to visible frame
#    And I verify the following recoveries reported and approved values
#      | name                | value     |
#      | Reported Recoveries | $1,000.00 |
#      | Approved Recoveries | $1,000.00 |
#
#    And I verify the following subtotal reported and approved values
#      | name              | value       |
#      | Reported Subtotal | $224,000.00 |
#      | Approved Subtotal | $232,500.00 |
#    And I switch to default frame
#    And I logout
#
#  Examples:
#    | Login User   | Login full username  | Entity Name                      |
#    | DeleteAccess | Delete Access Access | Recoveries deductions and others |