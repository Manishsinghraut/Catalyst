@all
Feature: (Ref : Jira Ticket No : AUTOMATION-851) Approval Level limits on Portfolio summary page

  Scenario Outline: As a delete user,
  1. I can able to update payment approvals level in Manage Company page
  2. I import the following files
  3. Set approval level in contract summary page
  4. Ensure that Approval limits are set for members

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I click on "Enabled" link
    And I set spin fields values on editable page
      | name                             | value |
#      | numberOfApproversFld | 2     |
      | Firm_NumberOfPTApprovalLevelsFld | 2     |
    And I click on "Update" Button
    And I verify the following message "Successfully updated Company"

    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelEnabled/"
    Then I import following file name:
      | ImportedLocation_MemberApprovalLevelEnabled.xml               |
      | ApproveLevelEnabledMember5_MemberApprovalLevelEnabled.xls     |
      | UpdatedApprovePaymentContractB_MemberApprovalLevelEnabled.xml |
      | PortfolioSummaryPage_MemberApprovalLevelEnabled.xml           |

    And I Search for the "<Portfolio Name>" that was created
    And Click on the name of the "<Portfolio Name>" in the results pop-up
    Then I see "<Portfolio Name>" name on the header
    And I click on the "Summary" tab
    And I click on the "Edit" action panel button
    And I switch to visible frame
    And I set following fields value on editable page
      | name                             | value |
      | Program_NumberOfPTApprovalLevels | 2     |
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear in grid

    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I click "edit" button of the member "<Contact Name 1>"
    And I verify the following fields value on editable page
      | name                 | value              |
      | CodeApprovalStatusID | Approved - Level 1 |
    And I click on the "Cancel" button
    And I click "edit" button of the member "<Contact Name 2>"
    And I verify the following fields value on editable page
      | name                 | value    |
      | CodeApprovalStatusID | Approved |
    And I click on the "Cancel" button
    And I logout

    Examples:
      | Login User   | Login full username  | Portfolio Name                        | Contact Name 1                 | Contact Name 2                 |
      | DeleteAccess | Delete Access Access | Portfolio Member Approve Level-Enable | Approve Level Enabled 1 Member | Approve Level Enabled 2 Member |


  Scenario Outline: As a Approve Level Member 1, I ensure that
  1. There should not be any line items in there that are less than $500.00
  2. There should not be any line items in there that are more than $1500.00
  3. Change line item status and then verify in Contract->Payment Info->Recurring Expenses page

    And I Login to IWMS using "<Login User>" access credentials expecting EULA page
    And Accept Eula and move on

    And I Search for the "<Contract>" that was created
    And Click on the name of the "<Contract>" in the results pop-up
    Then I see "<Contract>" name on the header

    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window
    And I select following radio by label names
      | Transactions |
    And I set following fields value on editable page
      | name      | value      |
      | BeginDate | 01/01/2010 |
      | EndDate   | 12/31/2015 |

    And I verify a unique row in grid "ApproveExpenseScheduleDiv" having unique value "Utilities" under column header "Expense Group"
      | name          | value      |
      | Amount        | $500.00    |
      | Contract Name | <Contract> |
    And I select following radio by label names
      | Expense Schedules |
    And I set following fields value on editable page
      | name      | value      |
      | BeginDate | 02/01/2015 |
      | EndDate   | 12/31/2015 |

    And I verify a unique row in grid "ApproveExpenseScheduleDiv" having unique value "Utilities" under column header "Expense Group"
      | name          | value      |
      | Amount        | $1,000.00  |
      | Contract Name | <Contract> |
    And I click on the "approve" action from non frame grid "ApproveExpenseScheduleDiv" having unique value "Utilities" under column header "Expense Group"
      | name          | value      |
      | Contract Name | <Contract> |
    And I wait for the Loading text to disappear in grid
    And I close the "Approve Payments" child window
    And I switch to main window
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "Utilities" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Water      |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $1,000.00  |
      | Annual Amount    | $12,000.00 |

    And I verify grid row "BOGridExpenseSchedule" having unique value "12/31/2020" under column header "End Date"
      | name            | value              |
      | Begin Date      | 01/01/2010         |
      | Approval Status | Approved - Level 1 |
    And I logout

    Examples:
      | Login User              | Contract                             |
      | Approve Level Enabled 1 | Approve Payment Contract B - Enabled |


  Scenario Outline: As a Approve Level Member 2, I ensure that Changed line item status and
  then verify in Contract->Payment Info->Recurring Expenses page

    Given I Login to IWMS using "<Login User>" access credentials expecting EULA page
    And Accept Eula and move on
    And I Search for the "<Contract>" that was created
    And Click on the name of the "<Contract>" in the results pop-up
    Then I see "<Contract>" name on the header
    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window
    And I select following radio by label names
      | Expense Schedules |
    And I set following fields value on editable page
      | name                 | value              |
      | BeginDate            | 02/01/2015         |
      | EndDate              | 12/31/2015         |
      | CodeApprovalStatusID | Approved - Level 1 |
    And I verify a unique row in grid "ApproveExpenseScheduleDiv" having unique value "Utilities" under column header "Expense Group"
      | name          | value      |
      | Amount        | $1,000.00  |
      | Contract Name | <Contract> |
    And I change status to "Approve for grid rows displayed" for all rows in grid "ApproveExpenseScheduleDiv"

    And I wait for the Loading text to disappear in grid
    And I close the "Approve Payments" child window
    And I switch to main window
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "Utilities" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Water      |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $1,000.00  |
      | Annual Amount    | $12,000.00 |
    And I verify grid row "BOGridExpenseSchedule" having unique value "12/31/2020" under column header "End Date"
      | name            | value      |
      | Begin Date      | 01/01/2010 |
      | Approval Status | Approved   |
    And I logout

    Examples:
      | Login User              | Contract                             |
      | Approve Level Enabled 2 | Approve Payment Contract B - Enabled |