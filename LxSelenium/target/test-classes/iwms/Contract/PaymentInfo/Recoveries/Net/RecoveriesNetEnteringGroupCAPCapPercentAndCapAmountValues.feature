@all
Feature:(Jira Ref : AUTOMATION-734) Entering Group CAP, Cap Percent and Cap Amount values

  Scenario Outline: I import file for Recoveries Contract entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/Net/"
    And I import following file name:
      | RecoveriesNetPageCAP.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Group CAP Amount should be displayed in Reported, Approved and Budgeted fields
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "Contract Expense Recovery (Net)" from Page dropdown
    Then I verify page title "Contract Expense Recovery (Net) List" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    And I set following fields value on editable page
      | name                                       | value   |
      | ExpenseRecovery_ReportedCapAmountNoZeroDef | 1000000 |
      | ExpenseRecovery_ApprovedCapAmountNoZeroDef | 1000000 |
      | ExpenseRecovery_BudgetedCapAmountNoZeroDef | 1000000 |
    And I click on the "Save Changes" action panel button
    And I check for complete frame 'loading...'
    And I verify the following fields value on editable page
      | name                                       | value         |
      | ExpenseRecovery_ReportedCapAmountNoZeroDef | $1,000,000.00 |
      | ExpenseRecovery_ApprovedCapAmountNoZeroDef | $1,000,000.00 |
      | ExpenseRecovery_BudgetedCapAmountNoZeroDef | $1,000,000.00 |

    Examples:
      | Entity Name            | Second Level Tab | Third Level Tab | Grid ID | Login User   | Login full username  |
      | Recoveries NetPage_CAP | Payment Info     | Recoveries      | thisDiv | DeleteAccess | Delete Access Access |

  Scenario Outline: Scroll down and click on the Grouped Expenses-Approved  Amount link
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "Contract Expense Recovery (Net)" from Page dropdown
    Then I verify page title "Contract Expense Recovery (Net) List" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    And I click on Grouped Expenses Approved link in Contract Expense Recovery (Net) List page
    And I switch to default frame
    And I see the "Expense Recovery Item List : Controllable Expenses" modal window
    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Type" and cell value "Landscape"
      | name                | value    |
      | Recovery Item Group | Exterior |
      | Status              | Review   |
    And I set following fields value on editable page
      | name                                            | value |
      | ExpenseRecoveryItem_ApprovedCapPercentNoZeroDef | 2     |
    And I click on the "Update" button

#    And I wait for "Cap Amount Warning" modal window to open in non frame page
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I wait for "Cap Amount Warning" modal window to close

    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Type" and cell value "Landscape"
      | name                | value    |
      | Recovery Item Group | Exterior |
      | Status              | Review   |
    And I verify the following fields value on editable page
      | name                                            | value    |
      | ExpenseRecoveryItem_ApprovedCapPercentNoZeroDef | 2.00000% |
    And I click on the "Close" button
    And I click on the "Finish" button

    Examples:
      | Entity Name            | Second Level Tab | Third Level Tab | Grid ID | Login User   | Login full username  |
      | Recoveries NetPage_CAP | Payment Info     | Recoveries      | thisDiv | DeleteAccess | Delete Access Access |

  Scenario Outline: User should be able to enter the Cap Amount successfully
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "Contract Expense Recovery (Net)" from Page dropdown
    Then I verify page title "Contract Expense Recovery (Net) List" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    And I click on Grouped Expenses Approved link in Contract Expense Recovery (Net) List page
    And I switch to default frame
    And I see the "Expense Recovery Item List : Controllable Expenses" modal window
    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Type" and cell value "Parking Lot Maintenance"
      | name                | value    |
      | Recovery Item Group | Exterior |
      | Status              | Review   |
    And I set following fields value on editable page
      | name                                           | value |
      | ExpenseRecoveryItem_ApprovedCapAmountNoZeroDef | 5000  |
    And I click on the "Update" button
#    And I click on the "Yes" button in "Cap Amount Warning" message box

    And I wait for "Cap Amount Warning" modal window to open in non frame page
    And I click "Yes" button in modal window "Cap Amount Warning"
    And I wait for "Cap Amount Warning" modal window to close

    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Type" and cell value "Parking Lot Maintenance"
      | name                | value    |
      | Recovery Item Group | Exterior |
      | Status              | Review   |
    And I verify the following fields value on editable page
      | name                                           | value    |
      | ExpenseRecoveryItem_ApprovedCapAmountNoZeroDef | $5,000.00 |
    And I verify the Computed cap "$5,000.00" on Controllable Expenses pop up
    And I click on the "Close" button
    And I click on the "Finish" button

    Examples:
      | Entity Name            | Second Level Tab | Third Level Tab | Grid ID | Login User   | Login full username  |
      | Recoveries NetPage_CAP | Payment Info     | Recoveries      | thisDiv | DeleteAccess | Delete Access Access |

  Scenario Outline: User should be able to enter the Cap Percent successfully
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "Contract Expense Recovery (Net)" from Page dropdown
    Then I verify page title "Contract Expense Recovery (Net) List" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    And I click on Additional Expenses Reported link in Contract Expense Recovery (Net) List page
    And I switch to default frame
    And  I see the "Expense Recovery Item List : Non-controllable Expenses" modal window
    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Group" and cell value "Exterior"
      | name               | value        |
      | Recovery Item Type | Snow Removal |
      | Status             | Review       |
    And I set following fields value on editable page
      | name                                            | value |
      | ExpenseRecoveryItem_ApprovedCapPercentNoZeroDef | 5     |
    And I click on the "Update" button

#    And I wait for "Cap Amount Warning" modal window to open in non frame page
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I wait for "Cap Amount Warning" modal window to close

    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Group" and cell value "Exterior"
      | name               | value        |
      | Recovery Item Type | Snow Removal |
      | Status             | Review       |
    And I verify the following fields value on editable page
      | name                                            | value    |
      | ExpenseRecoveryItem_ApprovedCapPercentNoZeroDef | 5.00000% |
    And I click on the "Close" button
    And I click on the "Finish" button

    Examples:
      | Entity Name            | Second Level Tab | Third Level Tab | Grid ID | Login User   | Login full username  |
      | Recoveries NetPage_CAP | Payment Info     | Recoveries      | thisDiv | DeleteAccess | Delete Access Access |

  Scenario Outline: User should be able to enter the Cap Amount successfully
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "Contract Expense Recovery (Net)" from Page dropdown
    Then I verify page title "Contract Expense Recovery (Net) List" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    And I click on Additional Expenses Reported link in Contract Expense Recovery (Net) List page
    And I switch to default frame
    And  I see the "Expense Recovery Item List : Non-controllable Expenses" modal window
    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Group" and cell value "Interior"
      | name               | value    |
      | Recovery Item Type | Security |
      | Status             | Review   |
    And I set following fields value on editable page
      | name                                           | value |
      | ExpenseRecoveryItem_ApprovedCapAmountNoZeroDef | 100   |
    And I click on the "Update" button
#    And I click on the "Yes" button in "Cap Amount Warning" message box
    And I wait for "Cap Amount Warning" modal window to open in non frame page
    And I click "Yes" button in modal window "Cap Amount Warning"
    And I wait for "Cap Amount Warning" modal window to close
    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Group" and cell value "Interior"
      | name               | value    |
      | Recovery Item Type | Security |
      | Status             | Review   |
    And I verify the following fields value on editable page
      | name                                           | value   |
      | ExpenseRecoveryItem_ApprovedCapAmountNoZeroDef | $100.00 |
    And I verify the Computed cap "$100.00" on Controllable Expenses pop up
    And I click on the "Close" button
    And I click on the "Finish" button

    Examples:
      | Entity Name            | Second Level Tab | Third Level Tab | Grid ID | Login User   | Login full username  |
      | Recoveries NetPage_CAP | Payment Info     | Recoveries      | thisDiv | DeleteAccess | Delete Access Access |