Feature: Recovery Setup - Verify Controllable and Non-Controllable Expenses Values (Jira Ref : AUTOMATION-745)

  Scenario Outline: I import the file for Recoveries_NetSetup_Controllable entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/Net/"
    And I import following file name:
      | RecoveriesNetSetupControllable.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I Verify Controllable Expenses Values
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I see the Dashboard
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
#    And I navigate to "<Second Level Tab>"
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I select an option "Contract Expense Recovery (Net)"
    Then I verify page title "<Grid title>" after navigation
    And I verify a row from grid "gridPanel" having unique value "$0.00" under column header "Reported Amount"
      | name            | value      |
      | Recovery Group  | CAM        |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2015 |
      | End Date        | 12/31/2015 |
      | Recovery Period |            |
      | Reported Amount | $0.00      |
      | Variance %      | 0.00%      |
      | Approved Amount | $0.00      |
      | Pre-Paid Amount |            |
      | Net Amount Due  | $0.00      |
    And I click on Grouped Expenses Approved Amount link in Contract Expense Recovery Net List page
    And I switch to default frame
    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Type" and cell value "Landscape"
      | name               | value     |
      | Recovery Item Type | Landscape |
      | Status             | Review    |
    And I verify the following fields value on editable page
      | name                               | value |
      | ExpenseRecoveryItem_ReportedAmount | $0.00 |
      | ExpenseRecoveryItem_BudgetedAmount | $0.00 |
      | ExpenseRecoveryItem_ApprovedAmount | $0.00 |
    And I verify the Reported Amount Gross should be "$0.00" under Current Period Net
    And I verify the Computed Total Approved Amount Gross should be "$0.00" under Current Period Net
    And I verify the Budgeted Amount Gross should be "$0.00" under Current Period Net
    And I verify the computed total amount "$0.00"
    And I click "Close" button
    And I click "Finish" button
    Then I verify page title "<Grid title>" after navigation
    And I click on Additional Expenses Approved link in Contract Expense Recovery (Net) List page
    And I switch to default frame
    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Type" and cell value "Snow Removal"
      | name               | value        |
      | Recovery Item Type | Snow Removal |
      | Status             | Review       |
    And I verify the following fields value on editable page
      | name                               | value |
      | ExpenseRecoveryItem_ReportedAmount |       |
      | ExpenseRecoveryItem_BudgetedAmount |       |
      | ExpenseRecoveryItem_ApprovedAmount |       |
    And I verify the Reported Amount Gross should be "$0.00" under Current Period Net
    And I verify the Computed Total Approved Amount Gross should be "$0.00" under Current Period Net
    And I verify the Budgeted Amount Gross should be "$0.00" under Current Period Net
    And I verify the computed total amount "$0.00"

  Examples:
    | Entity Name                      | Second Level Tab | Third Level Tab | Grid title                           | Grid ID |
    | Recoveries_NetSetup_Controllable | Payment Info     | Recoveries      | Contract Expense Recovery (Net) List | thisDiv |

  Scenario Outline: I Verify Controllable Expenses Values1
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I see the Dashboard
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
#    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I select an option "Contract Expense Recovery (Net)"
    And I switch to default frame
    And I switch to visible frame
    And I verify a row from non frame grid "<Grid ID>" having unique value "12/31/2015" under column header "End Date" and "$43,600.00" under column header "Approved Amount"
      | name            | value      |
      | Recovery Group  | CAM        |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2015 |
      | End Date        | 12/31/2015 |
      | Recovery Period |            |
      | Reported Amount | $48,530.00 |
      | Variance %      | 0.00%      |
      | Approved Amount | $43,600.00 |
      | Pre-Paid Amount | $0.00      |
      | Net Amount Due  | $43,600.00 |

#    And I verify the following values in frame grid "<Grid ID>"
#      | Recovery Group | Recovery Type | Begin Date | End Date   | Recovery Period | Reported Amount | Variance % | Approved Amount | Pre-Paid Amount | Net Amount Due |
#      | CAM            | Interior      | 01/01/2015 | 12/31/2015 |                 | $48,530.00      | 0.00%      | $43,600.00      | $0.00           | $43,600.00     |

    And I click on Grouped Expenses Reported link in Contract Expense Recovery (Net) List page
    And I switch to default frame
    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Type" and cell value "Parking Lot Maintenance"
      | name               | value                   |
      | Recovery Item Type | Parking Lot Maintenance |
      | Status             | Review                  |
    And I verify the following fields value on editable page
      | name                               | value      |
      | ExpenseRecoveryItem_ReportedAmount | $36,000.00 |
      | ExpenseRecoveryItem_BudgetedAmount | $36,000.00 |
      | ExpenseRecoveryItem_ApprovedAmount | $36,000.00 |
    And I verify the Reported Amount Gross should be "$36,000.00" under Current Period Net
    And I verify the Computed Total Approved Amount Gross should be "$36,000.00" under Current Period Net
    And I verify the Budgeted Amount Gross should be "$36,000.00" under Current Period Net
    And I verify the computed total amount "$36,000.00"
    And I click "Close" button
    And I click "Finish" button
    Then I verify page title "<Grid title>" after navigation
    And I click on Additional Expenses Approved link in Contract Expense Recovery (Net) List page
    And I switch to default frame
    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Type" and cell value "Security"
      | name               | value    |
      | Recovery Item Type | Security |
      | Status             | Review   |
    And I verify the following fields value on editable page
      | name                               | value      |
      | ExpenseRecoveryItem_ReportedAmount | $60,000.00 |
      | ExpenseRecoveryItem_BudgetedAmount | $60,000.00 |
      | ExpenseRecoveryItem_ApprovedAmount | $60,000.00 |
    And I verify the Reported Amount Gross should be "$60,000.00" under Current Period Net
    And I verify the Computed Total Approved Amount Gross should be "$63,000.00" under Current Period Net
    And I verify the Budgeted Amount Gross should be "$60,000.00" under Current Period Net
    And I verify the computed total amount "$63,000.00"

  Examples:
    | Entity Name                      | Second Level Tab | Third Level Tab | Grid title                           | Grid ID |
    | Recoveries_NetSetup_Controllable | Payment Info     | Recoveries      | Contract Expense Recovery (Net) List | thisDiv |
