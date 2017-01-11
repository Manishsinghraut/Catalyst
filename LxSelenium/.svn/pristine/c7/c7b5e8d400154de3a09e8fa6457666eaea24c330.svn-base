@all
Feature: Entering Group CAP, Cap Percent and Cap Amount values(Jira Ref : AUTOMATION-721)

  Scenario Outline: I import file for Recoveries Contract entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following file name:
#      | RecoveriesContractCAP.xml |
      | RecoveriesContractCAP-721.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Group CAP Amount should be displayed in Reported, Approved and Budgeted fields
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    And I set following fields value on editable page
      | name                                       | value   |
      | ExpenseRecovery_ReportedCapAmountNoZeroDef | 1000000 |
      | ExpenseRecovery_ApprovedCapAmountNoZeroDef | 1000000 |
      | ExpenseRecovery_BudgetedCapAmountNoZeroDef | 1000000 |
    And I click on the "Save Changes" action panel button
    And I verify the following fields value on editable page
      | name                                       | value         |
      | ExpenseRecovery_ReportedCapAmountNoZeroDef | $1,000,000.00 |
      | ExpenseRecovery_ApprovedCapAmountNoZeroDef | $1,000,000.00 |
      | ExpenseRecovery_BudgetedCapAmountNoZeroDef | $1,000,000.00 |
    And I click on the "Finish" button "on Controllable Expenses pop-up"
    And I switch to default frame

    Examples:
      | Entity Name             | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
      | Recoveries Contract-721 | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |

  Scenario Outline: Scroll down and click on the Grouped Expenses-Reported Amount link
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    And I Scroll down and click on the Grouped Expenses	-Reported
    And I switch to default frame
    And I click on the "edit" row action of column "Landscape" of column "1" from grid "BOGridExpenseRecoveryItem"
    And I set following fields value on editable page
      | name                                            | value |
      | ExpenseRecoveryItem_ApprovedCapPercentNoZeroDef | 5     |
    And I click on the "Update" button

#    And I wait for "Cap Amount Warning" modal window to open in non frame page
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I wait for "Cap Amount Warning" modal window to close

    And I click on the "edit" row action of column "Landscape" of column "1" from grid "BOGridExpenseRecoveryItem"
    And I verify the following fields value on editable page
      | name                                            | value    |
      | ExpenseRecoveryItem_ApprovedCapPercentNoZeroDef | 5.00000% |
    And I click on the "Close" button
    And I click on the "Finish" button "on Controllable Expenses pop-up"

    Examples:
      | Entity Name             | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
      | Recoveries Contract-721 | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |

  Scenario Outline: User should be able to enter the Cap Amount successfully
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    And I Scroll down and click on the Grouped Expenses	-Reported
    And I switch to default frame
    And I click on the "edit" row action of column "Parking Lot Maintenance" of column "1" from grid "BOGridExpenseRecoveryItem"
    And I set following fields value on editable page
      | name                                           | value |
      | ExpenseRecoveryItem_ApprovedCapAmountNoZeroDef | 500   |
    And I click on the "Update" button
#    And I click on the "Yes" button in "Cap Amount Warning" message box

    And I wait for "Cap Amount Warning" modal window to open in non frame page
    And I click "Yes" button in modal window "Cap Amount Warning"
    And I wait for "Cap Amount Warning" modal window to close

    And I click on the "edit" row action of column "Parking Lot Maintenance" of column "1" from grid "BOGridExpenseRecoveryItem"
    And I verify the following fields value on editable page
      | name                                           | value   |
      | ExpenseRecoveryItem_ApprovedCapAmountNoZeroDef | $500.00 |
    And I verify the Computed cap "$500.00" on Controllable Expenses pop up
    And I click on the "Close" button
    And I click on the "Finish" button "on Controllable Expenses pop-up"

    Examples:
      | Entity Name             | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
      | Recoveries Contract-721 | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |

  Scenario Outline: User should be able to enter the Cap Percent successfully
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    And I Scroll down and click on the Additional Expenses- Reported
    And I switch to default frame
    And I click on the "edit" row action of column "Snow Removal" of column "1" from grid "BOGridExpenseRecoveryItem"
    And I set following fields value on editable page
      | name                                            | value |
      | ExpenseRecoveryItem_ApprovedCapPercentNoZeroDef | 4     |
    And I click on the "Update" button

#    And I wait for "Cap Amount Warning" modal window to open in non frame page
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I wait for "Cap Amount Warning" modal window to close

    And I click on the "edit" row action of column "Snow Removal" of column "1" from grid "BOGridExpenseRecoveryItem"
    And I verify the following fields value on editable page
      | name                                            | value    |
      | ExpenseRecoveryItem_ApprovedCapPercentNoZeroDef | 4.00000% |
    And I click on the "Close" button
    And I click on the "Finish" button "on Controllable Expenses pop-up"

    Examples:
      | Entity Name             | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
      | Recoveries Contract-721 | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |

  Scenario Outline: User should be able to enter the Cap Amount successfully
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    And I Scroll down and click on the Additional Expenses- Reported
    And I switch to default frame
    And I click on the "edit" row action of column "Security" of column "1" from grid "BOGridExpenseRecoveryItem"
    And I set following fields value on editable page
      | name                                           | value |
      | ExpenseRecoveryItem_ApprovedCapAmountNoZeroDef | 100   |
    And I click on the "Update" button
#    And I click on the "Yes" button in "Cap Amount Warning" message box

    And I wait for "Cap Amount Warning" modal window to open in non frame page
    And I click "Yes" button in modal window "Cap Amount Warning"
    And I wait for "Cap Amount Warning" modal window to close

    And I click on the "edit" row action of column "Security" of column "1" from grid "BOGridExpenseRecoveryItem"
    And I verify the following fields value on editable page
      | name                                           | value   |
      | ExpenseRecoveryItem_ApprovedCapAmountNoZeroDef | $100.00 |
    And I click on the "Close" button
    And I click on the "Finish" button "on Controllable Expenses pop-up"

    Examples:
      | Entity Name             | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
      | Recoveries Contract-721 | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |