@all
Feature: (Jira Ref : AUTOMATION-733)Contract Expense recovery (Net)-Entering Grouped Expenses line items, Additional Expenses line items and Adding line item for Admin Fee

  Scenario Outline: As a delete user I Import the attached XML for Recoveries Net -Entering line items Contract
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/Net/"
    And I import following file name:
      | RecoveriesNetEnteringLineItems4.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user
  1. Make sure to select Contract Expense Recovery (Net) page from the page drop down
  2. Ensure that there is a line item for Payment Info-> Recoveries

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
      | Reported Amount | $0.00      |
      | Variance %      | 0.00%      |
      | Approved Amount | $0.00      |
      | Pre-Paid Amount | $0.00      |
      | Net Amount Due  | $0.00      |
    And I verify the following fields value on editable page
      | name                                          | value        |
      | wdd_ExpenseRecovery_CodeRecoveryGroupID       | CAM          |
      | ExpenseRecovery_CodeExpenseGroupID            | Lease        |
      | wdd_ExpenseRecovery_CodeRecoveryTypeID        | Interior     |
      | ExpenseRecovery_CodeExpenseTypeID             | CAM          |
      | ExpenseRecovery_CodeCalculationMethodID       | Passthrough  |
      | ExpenseRecovery_CodeEscalationPaymentMethodID | Check        |
      | ExpenseRecovery_BeginDate                     | 01/01/2014   |
      | ExpenseRecovery_EndDate                       | 12/31/2014   |
      | ExpenseRecovery_CodeExpRecBasedOnID           | Actual       |
      | ExpenseRecovery_RecoveryPeriodDaysNoZeroDef   | 365          |
      | ExpenseRecovery_CodeApprovalStatusID          | Review       |
      | ExpenseRecovery_CodeProRataShareMethodID      | Based on GLA |

  Examples:
    | Entity Name                         | Login User   | Login full username  |
    | Recoveries Net -Entering line items | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I add three line items for Controllable expense
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to "Payment Info"
    And I click on "Recoveries" tab
    And I select "Contract Expense Recovery (Net)" from Page dropdown
    And I verify page title "Contract Expense Recovery (Net) List" after navigation
    And I click on row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
      | name          | value      |
      | Recovery Type | Interior   |
      | Begin Date    | 01/01/2014 |
      | End Date      | 12/31/2014 |

    And I click on Grouped Expenses Reported link in Contract Expense Recovery (Net) List page
    And I switch to default frame
    And  I see the "Expense Recovery Item List : Controllable Expenses" modal window
    #1
    And I click on "Add Expense Recovery Item..." button in grid
    And I see the "Add Expense Recovery Item  ***Required fields in red" modal window
    And I set list fields values on editable page
      | name                                        | value      |
      | ExpenseRecoveryItem_CodeRecoveryItemGroupID | Interior   |
      | ExpenseRecoveryItem_CodeRecoveryItemTypeID  | Janitorial |
      | ExpenseRecoveryItem_CodeApprovalStatusID    | Review     |

    And I set fields values on editable page
      | name                                         | value |
      | ExpenseRecoveryItem_ReportedAmount           | 30000 |
      | ExpenseRecoveryItem_BudgetedAmount           | 30000 |
      | ExpenseRecoveryItem_ApprovedAmount           | 30000 |
      | ExpenseRecoveryItem_ReportedProRataShareRate | 30    |
      | ExpenseRecoveryItem_ApprovedProRataShareRate | 30    |
      | ExpenseRecoveryItem_BudgetedProRataShareRate | 30    |
    And I click on the "Add" button

#    And I wait for "Cap Amount Warning" modal window to open in non frame page
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I wait for "Cap Amount Warning" modal window to close

    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Group" and cell value "Interior"
      | name               | value      |
      | Recovery Item Type | Janitorial |
      | Status             | Review     |
    And I verify the following fields value on editable page
      | name                                         | value      |
      | ExpenseRecoveryItem_CodeRecoveryItemGroupID  | Interior   |
      | ExpenseRecoveryItem_CodeRecoveryItemTypeID   | Janitorial |
      | ExpenseRecoveryItem_CodeApprovalStatusID     | Review     |
      | ExpenseRecoveryItem_ReportedAmount           | $30,000.00 |
      | ExpenseRecoveryItem_BudgetedAmount           | $30,000.00 |
      | ExpenseRecoveryItem_ApprovedAmount           | $30,000.00 |
      | ExpenseRecoveryItem_ReportedProRataShareRate | 30.00000%  |
      | ExpenseRecoveryItem_ApprovedProRataShareRate | 30.00000%  |
      | ExpenseRecoveryItem_BudgetedProRataShareRate | 30.00000%  |
    And I verify the following variance amount
      | $30,000.00 |
      | $30,000.00 |
      | $30,000.00 |
    And I verify the following label and value pair
      | name                                 | value      |
      | Reported Amount Gross                | $30,000.00 |
      | Computed Total Approved Amount Gross | $30,000.00 |
      | Budgeted Amount Gross                | $30,000.00 |
      | Reported Amount Net                  | $9,000.00  |
      | Computed Total Approved Amount Net   | $9,000.00  |
      | Budgeted Amount Net                  | $9,000.00  |
    And I click on the "Close" button

    #2
    And I click on "Add Expense Recovery Item..." button in grid
    And I see the "Add Expense Recovery Item  ***Required fields in red" modal window
    And I set list fields values on editable page
      | name                                        | value     |
      | ExpenseRecoveryItem_CodeRecoveryItemGroupID | Exterior  |
      | ExpenseRecoveryItem_CodeRecoveryItemTypeID  | Landscape |
      | ExpenseRecoveryItem_CodeApprovalStatusID    | Review    |

    And I set fields values on editable page
      | name                                               | value |
      | ExpenseRecoveryItem_ApprovedAdminFeePrcntNoZeroDef | 10    |
      | ExpenseRecoveryItem_ReportedAmount                 | 55000 |
      | ExpenseRecoveryItem_BudgetedAmount                 | 55000 |
      | ExpenseRecoveryItem_ApprovedAmount                 | 55000 |
      | ExpenseRecoveryItem_ReportedProRataShareRate       | 20    |
      | ExpenseRecoveryItem_ApprovedProRataShareRate       | 20    |
      | ExpenseRecoveryItem_BudgetedProRataShareRate       | 20    |
    And I click on the "Add" button

#    And I wait for "Cap Amount Warning" modal window to open in non frame page
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I wait for "Cap Amount Warning" modal window to close

    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Group" and cell value "Exterior"
      | name               | value     |
      | Recovery Item Type | Landscape |
      | Status             | Review    |
    And I verify the following fields value on editable page
      | name                                               | value      |
      | ExpenseRecoveryItem_CodeRecoveryItemGroupID        | Exterior   |
      | ExpenseRecoveryItem_CodeRecoveryItemTypeID         | Landscape  |
      | ExpenseRecoveryItem_CodeApprovalStatusID           | Review     |
      | ExpenseRecoveryItem_ReportedAmount                 | $55,000.00 |
      | ExpenseRecoveryItem_BudgetedAmount                 | $55,000.00 |
      | ExpenseRecoveryItem_ApprovedAmount                 | $55,000.00 |
      | ExpenseRecoveryItem_ReportedProRataShareRate       | 20.00000%  |
      | ExpenseRecoveryItem_ApprovedProRataShareRate       | 20.00000%  |
      | ExpenseRecoveryItem_BudgetedProRataShareRate       | 20.00000%  |
      | ExpenseRecoveryItem_ApprovedAdminFeePrcntNoZeroDef | 10.00000%  |
    And I verify the following variance amount
      | $55,000.00 |
      | $55,000.00 |
      | $55,000.00 |
    And I verify the following label and value pair
      | name                                 | value      |
      | Reported Amount Gross                | $55,000.00 |
      | Computed Total Approved Amount Gross | $60,500.00 |
      | Budgeted Amount Gross                | $55,000.00 |
      | Reported Amount Net                  | $11,000.00 |
      | Computed Total Approved Amount Net   | $12,100.00 |
      | Budgeted Amount Net                  | $11,000.00 |
    And I click on the "Close" button

    #3
    And I click on "Add Expense Recovery Item..." button in grid
    And I see the "Add Expense Recovery Item  ***Required fields in red" modal window
    And I set list fields values on editable page
      | name                                        | value                   |
      | ExpenseRecoveryItem_CodeRecoveryItemGroupID | Exterior                |
      | ExpenseRecoveryItem_CodeRecoveryItemTypeID  | Parking Lot Maintenance |
      | ExpenseRecoveryItem_CodeApprovalStatusID    | Review                  |

    And I set fields values on editable page
      | name                                         | value |
      | ExpenseRecoveryItem_ReportedAmount           | 36000 |
      | ExpenseRecoveryItem_BudgetedAmount           | 36000 |
      | ExpenseRecoveryItem_ApprovedAmount           | 36000 |
      | ExpenseRecoveryItem_ReportedProRataShareRate | 20    |
      | ExpenseRecoveryItem_ApprovedProRataShareRate | 20    |
      | ExpenseRecoveryItem_BudgetedProRataShareRate | 20    |
    And I click on the "Add" button

#    And I wait for "Cap Amount Warning" modal window to open in non frame page
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I wait for "Cap Amount Warning" modal window to close

    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Group" and cell value "Exterior"
      | name               | value                   |
      | Recovery Item Type | Parking Lot Maintenance |
      | Status             | Review                  |
    And I verify the following fields value on editable page
      | name                                         | value                   |
      | ExpenseRecoveryItem_CodeRecoveryItemGroupID  | Exterior                |
      | ExpenseRecoveryItem_CodeRecoveryItemTypeID   | Parking Lot Maintenance |
      | ExpenseRecoveryItem_CodeApprovalStatusID     | Review                  |
      | ExpenseRecoveryItem_ReportedAmount           | $36,000.00              |
      | ExpenseRecoveryItem_BudgetedAmount           | $36,000.00              |
      | ExpenseRecoveryItem_ApprovedAmount           | $36,000.00              |
      | ExpenseRecoveryItem_ReportedProRataShareRate | 20.00000%               |
      | ExpenseRecoveryItem_ApprovedProRataShareRate | 20.00000%               |
      | ExpenseRecoveryItem_BudgetedProRataShareRate | 20.00000%               |
    And I verify the following variance amount
      | $36,000.00 |
      | $36,000.00 |
      | $36,000.00 |
    And I verify the following label and value pair
      | name                                 | value      |
      | Reported Amount Gross                | $36,000.00 |
      | Computed Total Approved Amount Gross | $36,000.00 |
      | Budgeted Amount Gross                | $36,000.00 |
      | Reported Amount Net                  | $7,200.00  |
      | Computed Total Approved Amount Net   | $7,200.00  |
      | Budgeted Amount Net                  | $7,200.00  |

    And I click on the "Close" button

  Examples:
    | Entity Name                         | Login User   | Login full username  |
    | Recoveries Net -Entering line items | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I add three line items for Non-Controllable expense
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to "Payment Info"
    And I click on "Recoveries" tab
    And I select "Contract Expense Recovery (Net)" from Page dropdown
    And I verify page title "Contract Expense Recovery (Net) List" after navigation
    And I click on row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
      | name          | value      |
      | Recovery Type | Interior   |
      | Begin Date    | 01/01/2014 |
      | End Date      | 12/31/2014 |

    And I click on Additional Expenses Reported link in Contract Expense Recovery (Net) List page
    And I switch to default frame
    And  I see the "Expense Recovery Item List : Non-controllable Expenses" modal window
  #1
    And I click on "Add Expense Recovery Item..." button in grid
    And I see the "Add Expense Recovery Item  ***Required fields in red" modal window
    And I set list fields values on editable page
      | name                                        | value    |
      | ExpenseRecoveryItem_CodeRecoveryItemGroupID | Interior |
      | ExpenseRecoveryItem_CodeRecoveryItemTypeID  | Security |
      | ExpenseRecoveryItem_CodeApprovalStatusID    | Review   |

    And I set fields values on editable page
      | name                                               | value |
      | ExpenseRecoveryItem_ApprovedAdminFeePrcntNoZeroDef | 5     |
      | ExpenseRecoveryItem_ReportedAmount                 | 60000 |
      | ExpenseRecoveryItem_BudgetedAmount                 | 60000 |
      | ExpenseRecoveryItem_ApprovedAmount                 | 60000 |
      | ExpenseRecoveryItem_ReportedProRataShareRate       | 10    |
      | ExpenseRecoveryItem_ApprovedProRataShareRate       | 10    |
      | ExpenseRecoveryItem_BudgetedProRataShareRate       | 10    |
    And I click on the "Add" button

#    And I wait for "Cap Amount Warning" modal window to open in non frame page
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I wait for "Cap Amount Warning" modal window to close

    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Group" and cell value "Interior"
      | name               | value    |
      | Recovery Item Type | Security |
      | Status             | Review   |
    And I verify the following fields value on editable page
      | name                                               | value      |
      | ExpenseRecoveryItem_CodeRecoveryItemGroupID        | Interior   |
      | ExpenseRecoveryItem_CodeRecoveryItemTypeID         | Security   |
      | ExpenseRecoveryItem_CodeApprovalStatusID           | Review     |
      | ExpenseRecoveryItem_ReportedAmount                 | $60,000.00 |
      | ExpenseRecoveryItem_BudgetedAmount                 | $60,000.00 |
      | ExpenseRecoveryItem_ApprovedAmount                 | $60,000.00 |
      | ExpenseRecoveryItem_ReportedProRataShareRate       | 10.00000%  |
      | ExpenseRecoveryItem_ApprovedProRataShareRate       | 10.00000%  |
      | ExpenseRecoveryItem_BudgetedProRataShareRate       | 10.00000%  |
      | ExpenseRecoveryItem_ApprovedAdminFeePrcntNoZeroDef | 5.00000%   |
    And I verify the following variance amount
      | $60,000.00 |
      | $60,000.00 |
      | $60,000.00 |
    And I verify the following label and value pair
      | name                                 | value      |
      | Reported Amount Gross                | $60,000.00 |
      | Computed Total Approved Amount Gross | $63,000.00 |
      | Budgeted Amount Gross                | $60,000.00 |
      | Reported Amount Net                  | $6,000.00  |
      | Computed Total Approved Amount Net   | $6,300.00  |
      | Budgeted Amount Net                  | $6,000.00  |
    And I click on the "Close" button

     #2
    And I click on "Add Expense Recovery Item..." button in grid
    And I see the "Add Expense Recovery Item  ***Required fields in red" modal window
    And I set list fields values on editable page
      | name                                        | value        |
      | ExpenseRecoveryItem_CodeRecoveryItemGroupID | Exterior     |
      | ExpenseRecoveryItem_CodeRecoveryItemTypeID  | Snow Removal |
      | ExpenseRecoveryItem_CodeApprovalStatusID    | Review       |

    And I set fields values on editable page
      | name                                         | value |
      | ExpenseRecoveryItem_ReportedAmount           | 45000 |
      | ExpenseRecoveryItem_BudgetedAmount           | 45000 |
      | ExpenseRecoveryItem_ApprovedAmount           | 45000 |
      | ExpenseRecoveryItem_ReportedProRataShareRate | 20    |
      | ExpenseRecoveryItem_ApprovedProRataShareRate | 20    |
      | ExpenseRecoveryItem_BudgetedProRataShareRate | 20    |
    And I click on the "Add" button

#    And I wait for "Cap Amount Warning" modal window to open in non frame page
#    And I click "Yes" button in modal window "Cap Amount Warning"
#    And I wait for "Cap Amount Warning" modal window to close

    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Group" and cell value "Exterior"
      | name               | value        |
      | Recovery Item Type | Snow Removal |
      | Status             | Review       |
    And I verify the following fields value on editable page
      | name                                         | value        |
      | ExpenseRecoveryItem_CodeRecoveryItemGroupID  | Exterior     |
      | ExpenseRecoveryItem_CodeRecoveryItemTypeID   | Snow Removal |
      | ExpenseRecoveryItem_CodeApprovalStatusID     | Review       |
      | ExpenseRecoveryItem_ReportedAmount           | $45,000.00   |
      | ExpenseRecoveryItem_BudgetedAmount           | $45,000.00   |
      | ExpenseRecoveryItem_ApprovedAmount           | $45,000.00   |
      | ExpenseRecoveryItem_ReportedProRataShareRate | 20.00000%    |
      | ExpenseRecoveryItem_ApprovedProRataShareRate | 20.00000%    |
      | ExpenseRecoveryItem_BudgetedProRataShareRate | 20.00000%    |
    And I verify the following variance amount
      | $45,000.00 |
      | $45,000.00 |
      | $45,000.00 |
    And I verify the following label and value pair
      | name                                 | value      |
      | Reported Amount Gross                | $45,000.00 |
      | Computed Total Approved Amount Gross | $45,000.00 |
      | Budgeted Amount Gross                | $45,000.00 |
      | Reported Amount Net                  | $9,000.00  |
      | Computed Total Approved Amount Net   | $9,000.00  |
      | Budgeted Amount Net                  | $9,000.00  |
    And I click on the "Close" button

  Examples:
    | Entity Name                         | Login User   | Login full username  |
    | Recoveries Net -Entering line items | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I add Admin Fee
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to "Payment Info"
    And I click on "Recoveries" tab
    And I select "Contract Expense Recovery (Net)" from Page dropdown
    And I verify page title "Contract Expense Recovery (Net) List" after navigation
    And I click on row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
      | name          | value      |
      | Recovery Type | Interior   |
      | Begin Date    | 01/01/2014 |
      | End Date      | 12/31/2014 |

    And I set fields values on editable page
      | name                                       | value |
      | ExpenseRecovery_ReportedAdminFeePercentage | 15    |
    And I click on the "Save Changes" action panel button
    And I verify following pair of values on non editable page
      | name                | value      |
      | Grouped Expenses    | $27,200.00 |
      | Additional Expenses | $15,000.00 |
      | (=) Subtotal        | $42,200.00 |
      | Admin Fee % Amount  | $6,330.00  |
      | (=) Subtotal        | $48,530.00 |

  Examples:
    | Entity Name                         | Login User   | Login full username  |
    | Recoveries Net -Entering line items | DeleteAccess | Delete Access Access |