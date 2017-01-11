@all
Feature: (Jira Ref.:AUTOMATION-861 ) LX Admin with Approval level can Set Approval Status.

  Scenario Outline: I perform the following things
  a. I set approve level to 2 for Approve Payment Portfolio & in Financial settings
  b. I create "Approve Payment Portfolio" Portfolio by importing xml file and verify entires

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    Then I click on the "Manage Company" link
    And I click on "Financial Settings" tab
    And I click on "Enabled" link
    And I set following fields value on editable page
      | name                             | value |
#      | numberOfApproversFld-inputEl | 2     |
      | Firm_NumberOfPTApprovalLevelsFld | 2     |
    And I click on "Update" Button
    And I wait for the Loading text to disappear in grid
    And I verify the following message "Successfully updated Company"

    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelEnabled/"
    And I import following file name:
      | ApproveLevelEnabledMember5.xls |
      | ApprovePaymnetPortfolio.xml    |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "Details"
    And I click on the "Summary" tab
    And I click on the "Edit" action panel button
    And I switch to visible frame
    And I set following fields value on editable page
      | name                             | value |
      | Program_NumberOfPTApprovalLevels | 2     |
    Then I click on the "Save Changes" action panel button

    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelEnabled/LxAdminWithApprovalLevel/"
    And I import following file name:
      | LXAdminwithApprovalLevel.xml |

    And I Search for the "<Contract Name>" that was created
    And Click on the name of the "<Contract Name>" in the results pop-up
    Then I see "<Contract Name>" name on the header
    And I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Base Rent  |
      | Expense Category | Rent       |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2030 |
      | Frequency        | Annually   |
      | Period Amount    | $1,250.00  |
      | Annual Amount    | $15,000.00 |
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "01/01/2010" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2030 |
      | Approval Status | Review     |
      | Payment Amount  | $15,000.00 |
      | Annual Amount   | $15,000.00 |
      | Rate            |            |
      | First Payment   | $15,000.00 |
      | Last Payment    | $15,000.00 |
      | Notes           |            |

    Then I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "12/01/2010" under column header "Effective Date"
      | name             | value             |
      | Group            | Expense           |
      | Type             | Interior          |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | $5,000.00         |
      | Primary Tax      |                   |
      | Hold Flag        | No                |

    And I verify the following fields value on editable page
      | name                                       | value  |
      | PaymentTransaction_CodeApprovalStatusID    | Review |
      | _checkbox_PaymentTransaction_ProcessedFlag | false  |
    And I logout


    Examples:
      | Login User | Login full username | Contract Name            | Entity Name               |
#      | DeleteAccess | Delete Access Access | LXAdminwithApprovalLevel | Approve Payment Portfolio |
      | LxSelenium | Selenium Tester     | LXAdminwithApprovalLevel | Approve Payment Portfolio |


  Scenario Outline: I update the Contract by importing xml file & verify the approval status level
    Given I Login to IWMS using "<Login User>" access credentials expecting EULA page
    And Accept Eula and move on
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelEnabled/LxAdminWithApprovalLevel/"
    And I import following file name:
      | UpdateLXAdminwithApprovalLevel.xml |

    And I Search for the "<Contract Name>" that was created
    And Click on the name of the "<Contract Name>" in the results pop-up
    Then I see "<Contract Name>" name on the header
    And I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Base Rent  |
      | Expense Category | Rent       |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2030 |
      | Frequency        | Annually   |
      | Period Amount    | $1,250.00  |
      | Annual Amount    | $15,000.00 |
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "01/01/2010" under column header "Begin Date"
      | name            | value              |
      | End Date        | 12/31/2030         |
      | Approval Status | Approved - Level 1 |
      | Payment Amount  | $15,000.00         |
      | Annual Amount   | $15,000.00         |
      | Rate            |                    |
      | First Payment   | $15,000.00         |
      | Last Payment    | $15,000.00         |
      | Notes           |                    |

    Then I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "12/01/2010" under column header "Effective Date"
      | name             | value             |
      | Group            | Expense           |
      | Type             | Interior          |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | $5,000.00         |
      | Primary Tax      |                   |
      | Hold Flag        | No                |

    And I verify the following fields value on editable page
      | name                                       | value              |
      | PaymentTransaction_CodeApprovalStatusID    | Approved - Level 1 |
      | _checkbox_PaymentTransaction_ProcessedFlag | true               |

    And I logout


    Examples:
      | Login User | Login full username | Contract Name            |
      | LxAdmin    | LxAdmin Approver    | LXAdminwithApprovalLevel |
