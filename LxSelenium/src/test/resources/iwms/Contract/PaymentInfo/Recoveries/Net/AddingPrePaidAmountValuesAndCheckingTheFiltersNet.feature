Feature: Adding Pre-Paid Amount Values and Checking the filters(Jira Ref : AUTOMATION-736)

  Scenario Outline: I import file for Recoveries Contract entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/Net/"
    And I import following file name:
      | RecoveriesNetPrepaid.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I verify the pop up window for Set Pre-Paid Amount is displayed
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "Transactions" tab
    And I verify grid row "thisDiv" having unique value "03/01/2014" under column header "Effective Date"
      | name             | value             |
      | Effective Date   | 03/01/2014        |
      | Group            | Lease             |
      | Type             | CAM               |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | No                |
      | Total Amount     | $2,000.00         |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |
    And I verify grid row "thisDiv" having unique value "02/01/2014" under column header "Effective Date"
      | name             | value             |
      | Effective Date   | 02/01/2014        |
      | Group            | Lease             |
      | Type             | CAM               |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | No                |
      | Total Amount     | $2,000.00         |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |
    And I verify grid row "thisDiv" having unique value "01/01/2014" under column header "Effective Date"
      | name             | value             |
      | Effective Date   | 01/01/2014        |
      | Group            | Lease             |
      | Type             | CAM               |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | No                |
      | Total Amount     | $2,000.00         |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |
    And I click on the "<Third Level Tab>" tab
    And I select an option "Contract Expense Recovery (Net)"
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    Then I Scroll down to the Pre-paid Amount and click on the magnifying glass under approved
    And I switch to default frame
    And I set following fields value on editable page
      | name      | value      |
      | BeginDate | 01/01/2014 |
    And I verify Pop-up window grid row "ExpenseRecoveryPrepaidAmountDiv" having unique value "01/01/2014" under column header "Effective Date"
      | name           | value             |
      | Effective Date | 01/01/2014        |
      | Group          | Lease             |
      | Type           | CAM               |
      | Vendor         | Selenium-Employer |
      | Total Amount   | $2,000.00         |
      | Primary Tax    | $0.00             |
      | Secondary Tax  | $0.00             |
      | Tertiary Tax   | $0.00             |
    And I verify Pop-up window grid row "ExpenseRecoveryPrepaidAmountDiv" having unique value "02/01/2014" under column header "Effective Date"
      | name           | value             |
      | Effective Date | 02/01/2014        |
      | Group          | Lease             |
      | Type           | CAM               |
      | Vendor         | Selenium-Employer |
      | Total Amount   | $2,000.00         |
      | Primary Tax    | $0.00             |
      | Secondary Tax  | $0.00             |
      | Tertiary Tax   | $0.00             |
    And I verify Pop-up window grid row "ExpenseRecoveryPrepaidAmountDiv" having unique value "03/01/2014" under column header "Effective Date"
      | name           | value             |
      | Effective Date | 03/01/2014        |
      | Group          | Lease             |
      | Type           | CAM               |
      | Vendor         | Selenium-Employer |
      | Total Amount   | $2,000.00         |
      | Primary Tax    | $0.00             |
      | Secondary Tax  | $0.00             |
      | Tertiary Tax   | $0.00             |
    And I click on the "Close" button
#    And I click on the "Save Changes" action panel button
#    And I verify the following fields value on editable page
#      | name                                       | value         |
#      | ExpenseRecovery_ReportedCapAmountNoZeroDef | $1,000,000.00 |
#      | ExpenseRecovery_ApprovedCapAmountNoZeroDef | $1,000,000.00 |
#      | ExpenseRecovery_BudgetedCapAmountNoZeroDef | $1,000,000.00 |
#    And I click on the "Finish" button "on Controllable Expenses pop-up"
    And I switch to default frame

  Examples:
    | Entity Name            | Second Level Tab | Third Level Tab | Grid title                           | Grid ID |
    | Recoveries_Net Prepaid | Payment Info     | Recoveries      | Contract Expense Recovery (Net) List | thisDiv |


  Scenario Outline: Filters-Column Sorting and Display
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select an option "Contract Expense Recovery (Net)"
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    Then I Scroll down to the Pre-paid Amount and click on the magnifying glass under approved
    And I switch to default frame
    And I set following fields value on editable page
      | name      | value      |
      | BeginDate | 01/01/2014 |
#    And I Sort Effective dates by "Sort Ascending" order
    And I verify Pop-up window grid row "ExpenseRecoveryPrepaidAmountDiv" having unique value "01/01/2014" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 01/01/2014 |
    And I verify Pop-up window grid row "ExpenseRecoveryPrepaidAmountDiv" having unique value "02/01/2014" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 02/01/2014 |
    And I verify Pop-up window grid row "ExpenseRecoveryPrepaidAmountDiv" having unique value "03/01/2014" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 03/01/2014 |
    And I set following fields value on editable page
      | name      | value      |
      | BeginDate | 01/01/2014 |
#    And I Sort Effective dates by "Sort Descending" order
    And I verify Pop-up window grid row "ExpenseRecoveryPrepaidAmountDiv" having unique value "03/01/2014" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 03/01/2014 |
    And I verify Pop-up window grid row "ExpenseRecoveryPrepaidAmountDiv" having unique value "02/01/2014" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 02/01/2014 |
    And I verify Pop-up window grid row "ExpenseRecoveryPrepaidAmountDiv" having unique value "01/01/2014" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 01/01/2014 |
    And I click on the "Close" button

  Examples:
    | Entity Name            | Second Level Tab | Third Level Tab | Grid title                           | Grid ID |
    | Recoveries_Net Prepaid | Payment Info     | Recoveries      | Contract Expense Recovery (Net) List | thisDiv |

  Scenario Outline: No transaction shall be displayed for the selected the Group-Base Rent and Type-Rent
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select an option "Contract Expense Recovery (Net)"
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    Then I Scroll down to the Pre-paid Amount and click on the magnifying glass under approved
    And I switch to default frame
    And I set following fields value on editable page
      | name               | value      |
      | BeginDate          | 01/01/2014 |
      | CodeExpenseGroupID | Base Rent  |
      | CodeExpenseTypeID  | Base Rent  |
    And I verify pop-up window row from grid "ExpenseRecoveryPrepaidAmountDiv" having unique value "01/01/2014" not present
    And I click on the "Close" button

  Examples:
    | Entity Name            | Second Level Tab | Third Level Tab | Grid title                           | Grid ID |
    | Recoveries_Net Prepaid | Payment Info     | Recoveries      | Contract Expense Recovery (Net) List | thisDiv |

  Scenario Outline: To Set Pre-paid Amount
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select an option "Contract Expense Recovery (Net)"
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    Then I Scroll down to the Pre-paid Amount and click on the magnifying glass under approved
    And I switch to default frame
    And I set following fields value on editable page
      | name      | value      |
      | BeginDate | 01/01/2014 |
    And I select checkbox from grid "ExpenseRecoveryPrepaidAmountDiv" having unique value "03/01/2014"
    And I select checkbox from grid "ExpenseRecoveryPrepaidAmountDiv" having unique value "02/01/2014"
    And I select checkbox from grid "ExpenseRecoveryPrepaidAmountDiv" having unique value "01/01/2014"
#    And I click row from grid "ExpenseRecoveryPrepaidAmountDiv" having unique value "03/01/2014"
#    And I click row from grid "ExpenseRecoveryPrepaidAmountDiv" having unique value "02/01/2014"
#    And I click row from grid "ExpenseRecoveryPrepaidAmountDiv" having unique value "01/01/2014"
    And I click on the "Set Pre-paid Amount" button
    And I verify the following fields value on editable page
      | name                                  | value    |
      | ExpenseRecovery_ApprovedPrePaidAmount | 6,000.00 |
    And I click on the "Save Changes" action panel button
    And I click on the "<Third Level Tab>" tab
    And I select an option "Contract Expense Recovery (Net)"
    Then I verify page title "<Grid title>" after navigation
    And I verify grid row "gridPanel" having unique value "$17,800.00" under column header "Reported Amount"
      | name            | value      |
#      | Recovery Group                                    | CAM        |
#      | Recovery Type                                     | Interior   |
#      | Begin Date                                        | 01/01/2014 |
#      | End Date                                          | 12/31/2014 |
#      | Recovery Period                                   |            |
#      | Reported Net Pass-Through (ST2*PRR) Duplicate     | $17,800.00 |
#      | Variance %                                        | 0.00000%   |
#      | Approved Net Pass-Through (ST2*PRS*Occ) Duplicate | $30,100.00 |
#      | Pre-Paid Amount                                   | $6,000.00  |
#      | Approved Net Amount Due (NPT-PP)                  | $24,100.00 |
#  Commented above code as per jira ticket : http://jira.lucernex.com/browse/IWMS-21095
      | Recovery Group  | CAM        |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2014 |
      | End Date        | 12/31/2014 |
      | Recovery Period |            |
      | Reported Amount | $17,800.00 |
      | Variance %      | 0.00%      |
      | Approved Amount | $30,100.00 |
      | Pre-Paid Amount | $6,000.00  |
      | Net Amount Due  | $24,100.00 |

    And I set following fields value on editable page
      | name                                  | value |
      | ExpenseRecovery_ReportedPrePaidAmount | 8000  |
    And I click on the "Save Changes" action panel button
    And I verify the following fields value on editable page
      | name                                  | value     |
      | ExpenseRecovery_ApprovedPrePaidAmount | $6,000.00 |
      | ExpenseRecovery_ReportedPrePaidAmount | $8,000.00 |
      | ExpenseRecovery_BudgetedPrePaidAmount | $7,000.00 |
    And I verify Amount Due-Current Period Values of "$9,800.00" Pre-Paid Amount
    And I verify Amount Due-Current Period Values of "$24,100.00" Net Amount Due

    And I verify the Reported - Approved variance amount Net Pass-through variance should be "-$12,300.00"
    And I verify the Reported - Approved variance amount Pre-Paid Amount Variance should be "$2,000.00"
    And I verify the Reported - Approved variance amount Net Amount Due Variance should be "-$14,300.00"

    And I verify under Amount Due - Current period - Approved - Net Pass-through Amounts "$30,100.00"
    And I verify under Amount Due - Current period - Budgeted - Net Pass-through Amounts "$18,950"
    And I verify under Amount Due - Current period - Budgeted - Net Amount Due "$11,950"

    And I verify under Amount Due - Current period - Budgeted - variance - Net Pass-through Amounts "$11,150.00"
    And I verify under Amount Due - Current period - Budgeted - variance - Pre-Paid Amounts "-$1,000.00"
    And I verify under Amount Due - Current period - Budgeted - variance - Net Amount Due "$12,150.00"

  Examples:
    | Entity Name            | Second Level Tab | Third Level Tab | Grid title                           | Grid ID |
    | Recoveries_Net Prepaid | Payment Info     | Recoveries      | Contract Expense Recovery (Net) List | thisDiv |