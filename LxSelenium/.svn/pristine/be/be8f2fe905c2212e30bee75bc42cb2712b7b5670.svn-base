@all
Feature: (Jira Ref.:AUTOMATION-928 )CLONE - Checking status for expense schedules that have been modified(Updated)

  Scenario Outline: I set Security Configuration and Import Data
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
      | ApprovePaymentMember-928.xls    |
      | PortfoliSummaryPage.xml         |
      | ImportedLocation-928.xml        |
      | ApprovePaymentContractA-928.xml |
    And I logout

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a Entity user I Ensure that Approve Payments Pop up
    Given I Login to IWMS using "<Login User>" access credentials expecting EULA page
    Then Accept Eula and move on
#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window
    And I select expense schedules radio button
    And I set following fields value on editable page
      | name                 | value      |
      | BeginDate            | 01/01/2010 |
      | EndDate              | 12/31/2030 |
      | CodeExpenseTypeID    | CAM        |
      | CodeApprovalStatusID | Review     |
    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category   | Expense Group | Expense Type | Begin Date | End Date   | Amount    |

      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2010 | 12/31/2013 | $2,000.00 |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2014 | 12/31/2018 | $1,500.00 |
      | Review | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2019 | 12/31/2025 | $1,700.00 |

    And I change status to "Approve for grid rows displayed" for all rows in grid "<Grid ID>"
    And I verify the following values in non frame grid "<Grid ID>"
      | Status   | Portfolio   | Contract Name | Expense Category   | Expense Group | Expense Type | Begin Date | End Date   | Amount    |

      | Approved | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2010 | 12/31/2013 | $2,000.00 |
      | Approved | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2014 | 12/31/2018 | $1,500.00 |
      | Approved | <Portfolio> | <Entity Name> | Recurring Expenses | CAM           | CAM          | 01/01/2019 | 12/31/2025 | $1,700.00 |

    And I close the "Approve Payments" child window
    And I switch to main window
#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value              |
      | Expense Type     | CAM                |
      | Expense Category | Recurring Expenses |
      | Begin Date       | 01/01/2010         |
      | End Date         | 12/31/2025         |
    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status |
      | 01/01/2010 | 12/31/2013 | Approved        |
      | 01/01/2014 | 12/31/2018 | Approved        |
      | 01/01/2019 | 12/31/2025 | Approved        |


    Examples:
      | Login User | Entity Name                    | Grid ID                   | Portfolio                      |
      | Entity 928 | Approve Payment Contract A-928 | ApproveExpenseScheduleDiv | Contract Testing Portfolio-928 |