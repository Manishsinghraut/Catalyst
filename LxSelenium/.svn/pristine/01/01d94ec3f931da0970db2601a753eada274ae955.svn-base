@all
Feature: (Jira Ref:AUTOMATION-842) Changing status of Recurring Expense Schedule

  Scenario Outline: I want Security Configuration for Import Data
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    Then I click on the "Manage Company" link
    And I click on "Financial Settings" tab
    And I click on Disable Payment Approval
    And I click on "Update" Button
    And I verify the following message "Successfully updated Company"

    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/"
    And I import following file name:
      | ApprovePaymentMember-842.xls    |
      | PortfoliSummaryPage.xml         |
      | ImportedLocation-842.xml        |
      | ApprovePaymentContractB-842.xml |
#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab

    And I verify a row from grid "thisDiv" having unique value "$1,000.00" under column header "Period Amount"
      | name             | value      |
      | Expense Group    | Utilities  |
      | Expense Type     | Water      |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $1,000.00  |
      | Annual Amount    | $12,000.00 |

    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Group    | CAM        |
      | Expense Type     | CAM        |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $2,000.00  |
      | Annual Amount    | $24,000.00 |

    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
      | name             | value                |
      | Expense Group    | Lease Expense        |
      | Expense Type     | Building Maintenance |
      | Expense Category | Expense              |
      | Begin Date       | 01/01/2010           |
      | End Date         | 12/31/2020           |
      | Frequency        | Monthly              |
      | Period Amount    | $500.00              |
      | Annual Amount    | $6,000.00            |

    And I verify a row from grid "thisDiv" having unique value "Base Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Group    | Base Rent  |
      | Expense Type     | Base Rent  |
      | Expense Category | Rent       |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2030 |
      | Frequency        | Monthly    |
      | Period Amount    | $2,800.00  |
      | Annual Amount    | $33,600.00 |

    And I switch to default frame
    And I logout

    Examples:
      | Login User   | Login full username  | Entity Name                    |
      | DeleteAccess | Delete Access Access | Approve Payment Contract B-842 |


  Scenario Outline: As a Entity 2 user I Ensure that Approve Payment Page should be displayed and testing - Changing Status to Approved
    Given I Login to IWMS using "<Login User>" access credentials expecting EULA page
    Then Accept Eula and move on
#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window
    And I select expense schedules radio button
    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
      | Review | <Portfolio> | <Entity Name> | Expense          | Utilities     | Water        | 01/01/2010 | 12/31/2020 | $1,000.00 |

    And I click on the "approve" action from non frame grid "<Grid ID>" having unique value "Water" under column header "Expense Type"
      | name          | value         |
      | Contract Name | <Entity Name> |
      | Expense Group | Utilities     |
      | Begin Date    | 01/01/2010    |
      | End Date      | 12/31/2020    |

    And I close the "Approve Payments" child window
    And I switch to main window
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "$12,000.00" under column header "Annual Amount"
      | name             | value      |
      | Expense Group    | Utilities  |
      | Expense Type     | Water      |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $1,000.00  |
      | Annual Amount    | $12,000.00 |

    And I verify a row from grid "BOGridExpenseSchedule" having unique value "01/01/2010" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2020 |
      | Approval Status | Approved   |
      | Payment Amount  | $1,000.00  |
      | Annual Amount   | $12,000.00 |
      | Rate            | $0.02      |
      | First Payment   | $1,000.00  |
      | Last Payment    | $1,000.00  |
      | Notes           |            |

    And I switch to default frame
    And I navigate to dashboard page
#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<First Level Tab>"
    And I click on the "<Second Level Tab>" tab
    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window
    And I select expense schedules radio button
    And I set following fields value on editable page
      | name                 | value    |
      | CodeApprovalStatusID | Approved |
      | CodeApprovalStatusID | Review   |
      | CodeApprovalStatusID | Approved |
    And I verify the following values in non frame grid "<Grid ID>"
      | Status   | Portfolio   | Contract Name | Expense Category | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
      | Approved | <Portfolio> | <Entity Name> | Expense          | Utilities     | Water        | 01/01/2010 | 12/31/2020 | $1,000.00 |

    And I click on the pencil in the status column for the Recurring Expense line item
    And I set following fields value on editable page
      | name                          | value  |
      | updateOneCodeApprovalStatusID | Denied |
    And I click "Set Status" button
    And I wait for modal window to close
    And I close the "Approve Payments" child window
    And I switch to main window
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "$12,000.00" under column header "Annual Amount"
      | name             | value      |
      | Expense Group    | Utilities  |
      | Expense Type     | Water      |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $1,000.00  |
      | Annual Amount    | $12,000.00 |
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "01/01/2010" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2020 |
      | Approval Status | Denied     |
      | Payment Amount  | $1,000.00  |
      | Annual Amount   | $12,000.00 |
      | Rate            | $0.02      |
      | First Payment   | $1,000.00  |
      | Last Payment    | $1,000.00  |
      | Notes           |            |

    And I switch to default frame
    And I navigate to dashboard page
#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<First Level Tab>"
    And I click on the "<Second Level Tab>" tab
    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window
    And I select expense schedules radio button
    And I set following fields value on editable page
      | name                 | value    |
      | CodeApprovalStatusID | Denied   |
      | CodeApprovalStatusID | Approved |
      | CodeApprovalStatusID | Denied   |

    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category | Expense Group | Expense Type | Begin Date | End Date   | Amount    |
      | Denied | <Portfolio> | <Entity Name> | Expense          | Utilities     | Water        | 01/01/2010 | 12/31/2020 | $1,000.00 |

    And I click on the pencil in the status column for the Recurring Expense line item
    And I set following fields value on editable page
      | name                          | value  |
      | updateOneCodeApprovalStatusID | Review |
    And I click "Set Status" button
    And I wait for modal window to close
    And I close the "Approve Payments" child window
    And I switch to main window
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "$12,000.00" under column header "Annual Amount"
      | name             | value      |
      | Expense Group    | Utilities  |
      | Expense Type     | Water      |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $1,000.00  |
      | Annual Amount    | $12,000.00 |
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "01/01/2010" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2020 |
      | Approval Status | Review     |
      | Payment Amount  | $1,000.00  |
      | Annual Amount   | $12,000.00 |
      | Rate            | $0.02      |
      | First Payment   | $1,000.00  |
      | Last Payment    | $1,000.00  |
      | Notes           |            |
    And I switch to default frame
    And I logout

    Examples:
      | Login User | First Level Tab | Second Level Tab | Entity Name                    | Grid ID                   | Portfolio                      |
      | Entity 842 | Details         | Summary          | Approve Payment Contract B-842 | ApproveExpenseScheduleDiv | Contract Testing Portfolio-842 |
