@all
Feature: (Jira Ref.:AUTOMATION-860 ) Verifying Lx Admin with No Approval level can Set Approval Status with Approval Level on Summary page.

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

    #I import data
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelEnabled/"
    And I import following file name:
      | APE-PortfolioSummaryPage.xml |
      | ApprovePaymnetPortfolio.xml  |

    And I Search for the "<Portfolio Name>" that was created
    And Click on the name of the "<Portfolio Name>" in the results pop-up
    Then I see "<Portfolio Name>" name on the header
    And I navigate to "Details"
    And I click on the "Summary" tab
    And I click on the "Edit" action panel button
    And I switch to visible frame
    And I set following fields value on editable page
      | name                             | value |
      | Program_NumberOfPTApprovalLevels | 2     |
    Then I click on the "Save Changes" action panel button

    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I click on "edit" row action in the grid "BOGridBOListExtGridPerson" having the following header "Name" and cell value "Delete Access Access"
      | name    | value |
      | Member? | Yes   |

    Then I see the "Edit Person" modal window
#    And I verify these field values on editable page
#      | name                 | value            |
#      | CodeJobFunctionID    | Lx Administrator |
#      | CodeJobTitleID       | Lx Administrator |
#      | CodeApprovalStatusID |                  |
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/Member_SS.xlsx"
    And I verify these field values on editable page comparing with "<Spreadsheet Row>" th row of spreadsheet
      | name              | value                    |
      | CodeJobFunctionID | Member.CodeJobFunctionID |
      | CodeJobTitleID    | Member.CodeJobTitleID    |

    And I click on the "Cancel" button
    And I wait for modal window to close

    #As a delete user verify approval status
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelEnabled/LxAdminWithApprovalLevel/"
    And I import following file name:
      | ApprovalLevelInSummaryPage.xml |

#    And I Search for the "<Contract Name>" that was created
#    And Click on the name of the "<Contract Name>" in the results pop-up
#    Then I see "<Contract Name>" name on the header
    And I navigate to entity type "Contract" named "<Contract Name>"
    And I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab

    Then I verify page title "Contract Expense Setup List" after navigation
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Interior   |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2016 |
      | Frequency        | Monthly    |
#      | Period Amount    | $2,500.00  |
#      | Annual Amount    | $30,000.00 |

    And I verify a row from grid "BOGridExpenseSchedule" having unique value "01/01/2010" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2015 |
      | Approval Status | Review     |
      | Payment Amount  | $1,500.00  |
      | Annual Amount   | $18,000.00 |
      | Rate            |            |
      | First Payment   | $1,500.00  |
      | Last Payment    | $1,500.00  |
      | Notes           |            |

    And I verify a row from grid "BOGridExpenseSchedule" having unique value "01/01/2015" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2016 |
      | Approval Status | Review     |
      | Payment Amount  | $1,000.00  |
      | Annual Amount   | $12,000.00 |
      | Rate            |            |
      | First Payment   | $1,000.00  |
      | Last Payment    | $1,000.00  |
      | Notes           |            |

    Then I click on the "Transactions" tab
    Then I verify page title "Contract Payments List" after navigation
    And I verify a row from grid "thisDiv" having unique value "12/01/2013" under column header "Effective Date"
      | name             | value                |
      | Group            | Lease Expense        |
      | Type             | Building Maintenance |
      | Category         | Expense              |
      | Vendor           |                      |
      | Vendor#          |                      |
      | One-Time Expense | Yes                  |
      | Total Amount     | $2,500.00            |
      | Primary Tax      | $625.00              |
      | Hold Flag        | No                   |

    And I verify the following fields value on editable page
      | name                                       | value  |
      | PaymentTransaction_CodeApprovalStatusID    | Review |
      | _checkbox_PaymentTransaction_ProcessedFlag | false  |

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

    #I update the Contract status using UpdateStatus xml file and i verify the Approval status
    And I switch to default frame
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelEnabled/LxAdminWithApprovalLevel/"
    And I import following file name:
      | UpdatedStatusInSummarypage.xml |

#    And I Search for the "<Contract Name>" that was created
#    And Click on the name of the "<Contract Name>" in the results pop-up
#    Then I see "<Contract Name>" name on the header
    And I navigate to entity type "Contract" named "<Contract Name>"
    And I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "01/01/2010" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2015 |
      | Approval Status | Denied     |
      | Payment Amount  | $1,500.00  |
      | Annual Amount   | $18,000.00 |
      | Rate            |            |
      | First Payment   | $1,500.00  |
      | Last Payment    | $1,500.00  |
      | Notes           |            |

    And I verify a row from grid "BOGridExpenseSchedule" having unique value "01/01/2015" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2016 |
      | Approval Status | Approved   |
      | Payment Amount  | $1,000.00  |
      | Annual Amount   | $12,000.00 |
      | Rate            |            |
      | First Payment   | $1,000.00  |
      | Last Payment    | $1,000.00  |
      | Notes           |            |

    Then I click on the "Transactions" tab
    Then I verify page title "Contract Payments List" after navigation
    And I verify a row from grid "thisDiv" having unique value "12/01/2013" under column header "Effective Date"
      | name             | value                |
      | Group            | Lease Expense        |
      | Type             | Building Maintenance |
      | Category         | Expense              |
      | Vendor           |                      |
      | Vendor#          |                      |
      | One-Time Expense | Yes                  |
      | Total Amount     | $2,500.00            |
      | Primary Tax      | $625.00              |
      | Hold Flag        | No                   |

    And I verify the following fields value on editable page
      | name                                       | value  |
      | PaymentTransaction_CodeApprovalStatusID    | Denied |
      | _checkbox_PaymentTransaction_ProcessedFlag | true   |

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
      | name                                       | value    |
      | PaymentTransaction_CodeApprovalStatusID    | Approved |
      | _checkbox_PaymentTransaction_ProcessedFlag | true     |

    Examples:
      | Login User | Contract Name                  | Portfolio Name            | Spreadsheet Row | Login full username |
#      | DeleteAccess | Approval Level in Summary page | Approve Payment Portfolio | 6               | Delete Access Access |
      | LxSelenium | Approval Level in Summary page | Approve Payment Portfolio | 6               | Selenium Tester     |
