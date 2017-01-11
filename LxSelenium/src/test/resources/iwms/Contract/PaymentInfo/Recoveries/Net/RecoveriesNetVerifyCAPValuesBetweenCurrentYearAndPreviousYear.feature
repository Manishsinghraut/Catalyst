@all
Feature: (Ref : Jira Ticket No : Automation-744) Verify CAP Values between Current year and Previous Year

  Scenario Outline: As a delete user I Import the attached Recoveries_CAP Values XML
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/Net/"
    And I import following file name:
      #| RecoveriesNetCAPValues.xml |
      | RecoveriesNetCAPValues-744.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I verify
  1. Recovery Setup pop-up should be displayed
  2. Success messages should be displayed.
  3. Setup of new Recovery record should be Completed

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "Payment Info"
    Then I navigate to "Payment Info"
    And I click on the "Recoveries" tab
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
    And I click on the "Recovery Setup" action panel button
    And I see the "Recovery Setup" modal window
    Then I verify the following fields value on editable page
      | name                 | value      |
      | endDate              | 12/31/2015 |
      | beginDate            | 01/01/2015 |
      | CodeApprovalStatusID | Review     |
    And I verify the following checkboxes by label
      | name             | value |
      | Reported Amounts | true  |
      | Approved Amounts | true  |
      | Budget Amounts   | true  |

    And I click "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    Then I verify "Setup of new Recovery record is complete." message appear after generating rent
    And I click "OK" button
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
      | name            | value      |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2015 |
      | End Date        | 12/31/2015 |
      | Recovery Period |            |
      | Reported Amount | $0.00      |
      | Variance %      | 0.00%      |
      | Approved Amount | $0.00      |
      | Pre-Paid Amount |            |
      | Net Amount Due  | $0.00      |

    And I click on row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
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

    And I click on Grouped Expenses Approved link in Contract Expense Recovery (Net) List page
    And I switch to default frame
    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Type" and cell value "Landscape"
      | name                | value    |
      | Recovery Item Group | Exterior |
      | Status              | Review   |
    And I verify the following fields value on editable page
      | name                                            | value    |
      | ExpenseRecoveryItem_ApprovedCapPercentNoZeroDef | 2.00000% |
    And I verify the Computed cap "$56,100.00" on Controllable Expenses pop up
    And I click "Close" button

    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Type" and cell value "Parking Lot Maintenance"
      | name                | value    |
      | Recovery Item Group | Exterior |
      | Status              | Review   |
    And I verify the following fields value on editable page
      | name                                           | value     |
      | ExpenseRecoveryItem_ApprovedCapAmountNoZeroDef | $5,000.00 |
    And I verify the Computed cap "$5,000.00" on Controllable Expenses pop up
    And I click "Close" button
    And I click "Finish" button

    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
      | name            | value      |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2015 |
      | End Date        | 12/31/2015 |
      | Recovery Period |            |
      | Reported Amount | $0.00      |
      | Variance %      | 0.00%      |
      | Approved Amount | $0.00      |
      | Pre-Paid Amount |            |
      | Net Amount Due  | $0.00      |

    And I click on row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
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


    And I click on Additional Expenses Approved link in Contract Expense Recovery (Net) List page
    And I switch to default frame
    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Group" and cell value "Interior"
      | name               | value    |
      | Recovery Item Type | Security |
      | Status             | Review   |
    And I verify the following fields value on editable page
      | name                                           | value   |
      | ExpenseRecoveryItem_ApprovedCapAmountNoZeroDef | $100.00 |
    And I verify the Computed cap "$100.00" on Controllable Expenses pop up
    And I click "Close" button

    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Group" and cell value "Exterior"
      | name               | value        |
      | Recovery Item Type | Snow Removal |
      | Status             | Review       |
    And I verify the following fields value on editable page
      | name                                            | value    |
      | ExpenseRecoveryItem_ApprovedCapPercentNoZeroDef | 5.00000% |
    And I verify the Computed cap "$47,250.00" on Controllable Expenses pop up
    And I click "Close" button
    And I click "Finish" button


  Examples:
    | Login User   | Login full username  | Item     | Entity Name           |
    | DeleteAccess | Delete Access Access | Contract | Recoveries_CAP Values |
