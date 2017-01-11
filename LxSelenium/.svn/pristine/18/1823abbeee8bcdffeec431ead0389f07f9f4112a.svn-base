@all
Feature: Adding Pre-Paid Amount Values and Checking the filters(Jira Ref : AUTOMATION-723)

  Scenario Outline: I import file for Recoveries Contract-723 entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following file name:
#      | RecoveriesContractPrePaidAmount.xml |
      | RecoveriesContractPrePaidAmount-723.xml |

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
      | Entity Name             | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
      | Recoveries Contract-723 | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |


  Scenario Outline: Filters-Column Sorting and Display
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
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
      | Entity Name             | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
      | Recoveries Contract-723 | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |

  Scenario Outline: No transaction shall be displayed for the selected the Group-Base Rent and Type-Rent
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
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
      | Entity Name             | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
      | Recoveries Contract-723 | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |