@all
Feature: Changing Status of One Time Payments (Jira Ref.:AUTOMATION-843 )

  Scenario: I want Security Configuration for Import Data
    When I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    Then I click on the "Manage Company" link
    And I click on "Financial Settings" tab
    And I click on Disable Payment Approval
    And I click on "Update" Button
    And I verify the following message "Successfully updated Company"


  Scenario Outline: I import file for Approve Payment Contract B
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/"
    And I import following file name:
      | ApprovePaymentMember-843.xls    |
      | PortfoliSummaryPage.xml         |
      | ImportedLocation-843.xml        |
      | ApprovePaymentContractB-843.xml |

    And I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "Payment Info"
    And I click on the "Transactions" tab
    And I verify a row from grid "<Grid ID>" having unique value "$2,000.00" under column header "Total Amount"
      | name             | value      |
      | Effective Date   | 01/01/2010 |
      | Group            | Expense    |
      | Type             | Interior   |
      | Category         | Expense    |
      | Vendor           |            |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | $2,000.00  |
      | Primary Tax      | $0.00      |
      | Hold Flag        | No         |
    And I verify the following fields value on editable page
      | name                                     | value |
      | _checkbox_PaymentTransaction_OneTimeFlag | true  |
    And I switch to default frame
    And I logout

    Examples:
      | Login User   | Login full username  | Entity Name                    | Grid ID |
      | DeleteAccess | Delete Access Access | Approve Payment Contract B-843 | thisDiv |


  Scenario Outline: As a Entity 2 user I Ensure that Approve Payment Page should be displayed and testing - Changing Status to Approved
    Given I Login to IWMS using "<Login User>" access credentials expecting EULA page
    Then Accept Eula and move on
    And I navigate to entity type "Contract" named "<Entity Name>"
    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window
    And I select transactions radio button
    And I set following fields value on editable page
      | name      | value      |
#      | showAll   | true       |
      | BeginDate | 01/01/2010 |
      | EndDate   | 12/31/2030 |

    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category | Expense Group | Expense Type | Effective Date | Effective End Date | Amount    |
      | Review | <Portfolio> | <Entity Name> | Expense          | Expense       | Interior     | 01/01/2010     | 12/31/2030         | $2,000.00 |

    And I click on the "approve" action from non frame grid "<Grid ID>" having unique value "Interior" under column header "Expense Type"
      | name          | value         |
      | Contract Name | <Entity Name> |
      | Expense Group | Expense       |

    And I close the "Approve Payments" child window
    And I switch to main window
    Then I navigate to "Payment Info"
    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "$2,000.00" under column header "Total Amount"
      | name             | value      |
      | Effective Date   | 01/01/2010 |
      | Group            | Expense    |
      | Type             | Interior   |
      | Category         | Expense    |
      | Vendor           |            |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | $2,000.00  |
      | Primary Tax      | $0.00      |
      | Hold Flag        | No         |
    And I verify the following fields value on editable page
      | name                                    | value    |
      | PaymentTransaction_CodeApprovalStatusID | Approved |
#     Changing Status to Denied
    And I switch to default frame
    And I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to "Details"
    And I click on the "Summary" tab
    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window
    And I select transactions radio button
    And I set following fields value on editable page
      | name                 | value      |
#      | showAll              | true       |
      | BeginDate            | 01/01/2010 |
      | EndDate              | 12/31/2030 |
      | CodeApprovalStatusID | Approved   |
      | CodeApprovalStatusID | Review     |
      | CodeApprovalStatusID | Approved   |


    And I verify the following values in non frame grid "<Grid ID>"
      | Status   | Portfolio   | Contract Name | Expense Category | Expense Group | Expense Type | Effective Date | Effective End Date | Amount    |
      | Approved | <Portfolio> | <Entity Name> | Expense          | Expense       | Interior     | 01/01/2010     | 12/31/2030         | $2,000.00 |

    And I click on the pencil in the status column for the Recurring Expense line item
    And I set following fields value on editable page
      | name                          | value  |
      | updateOneCodeApprovalStatusID | Denied |
    And I click "Set Status" button
    And I wait for modal window to close
    And I close the "Approve Payments" child window
    And I switch to main window
    Then I navigate to "Payment Info"
    And I click on the "Transactions" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear in grid
    And I verify a row from grid "thisDiv" having unique value "$2,000.00" under column header "Total Amount"
      | name             | value      |
      | Effective Date   | 01/01/2010 |
      | Group            | Expense    |
      | Type             | Interior   |
      | Category         | Expense    |
      | Vendor           |            |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | $2,000.00  |
      | Primary Tax      | $0.00      |
      | Hold Flag        | No         |
    And I verify the following fields value on editable page
      | name                                    | value  |
      | PaymentTransaction_CodeApprovalStatusID | Denied |
#   Changing Status to Review
    And I switch to default frame
    And I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to "Details"
    And I click on the "Summary" tab
    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window
    And I select transactions radio button
    And I set following fields value on editable page
      | name                 | value      |
#      | showAll              | true       |
      | BeginDate            | 01/01/2010 |
      | EndDate              | 12/31/2030 |
      | CodeApprovalStatusID | Denied     |
      | CodeApprovalStatusID | Review     |
      | CodeApprovalStatusID | Denied     |

    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category | Expense Group | Expense Type | Effective Date | Effective End Date | Amount    |
      | Denied | <Portfolio> | <Entity Name> | Expense          | Expense       | Interior     | 01/01/2010     | 12/31/2030         | $2,000.00 |

    And I click on the pencil in the status column for the Recurring Expense line item
    And I set following fields value on editable page
      | name                          | value  |
      | updateOneCodeApprovalStatusID | Review |
    And I click "Set Status" button
    And I wait for modal window to close
    And I close the "Approve Payments" child window
    And I switch to main window
    Then I navigate to "Payment Info"
    And I click on the "Transactions" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear in grid
    And I verify a row from grid "thisDiv" having unique value "$2,000.00" under column header "Total Amount"
      | name             | value      |
      | Effective Date   | 01/01/2010 |
      | Group            | Expense    |
      | Type             | Interior   |
      | Category         | Expense    |
      | Vendor           |            |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | $2,000.00  |
      | Primary Tax      | $0.00      |
      | Hold Flag        | No         |
    And I verify the following fields value on editable page
      | name                                    | value  |
      | PaymentTransaction_CodeApprovalStatusID | Review |
    And I switch to default frame
    And I logout

    Examples:
      | Login User | Entity Name                    | Grid ID                   | Portfolio                      |
      | Entity 843 | Approve Payment Contract B-843 | ApproveExpenseScheduleDiv | Contract Testing Portfolio-843 |