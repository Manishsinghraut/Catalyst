@all
Feature: (Ref : Jira Ticket No : AUTOMATION-856) Data conversions-set Approval Status to "Approved" for Expense Schedule and Transaction

  Scenario Outline: As a delete user, I
  1. Navigate to Manage Company-> Ensure that is Test Firm is set to true
  2. Import the attached Contract Status update.xml

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I verify the following fields value on editable page
      | name       | value |
      | IsTestFirm | true  |
    And I click on the "Financial Settings" link
    And I click on "Disabled" link
    And I click on "Update" Button
    And I wait for the Loading text to disappear in grid
    And I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/"
    Then I import following file name:
      | ContractStatusUpdate.xml |

  Examples:
    | Login User | Login full username |
    | LxSelenium | Selenium Tester     |

  Scenario Outline: As a delete user, I
  1. Navigate to Contract Status update-> Payment Info->Recurring Expenses and ensure that Expense Schedule line item exist with Review Status
  2. Navigate to Contract Status update-> Payment Info->Transactions and ensure that Transaction line item exist with Approval Status as Review

    Given I Login to IWMS using "<Login User>" access credentials
    And I Search for the "<Contract Name>" that was created
    And Click on the name of the "<Contract Name>" in the results pop-up
    Then I see "<Contract Name>" name on the header
    And I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "Base Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Rent       |
      | Expense Category | Rent       |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $1,500.00  |
      | Annual Amount    | $18,000.00 |

    And I verify a row from grid "BOGridExpenseSchedule" having unique value "12/31/2012" under column header "End Date"
      | name            | value      |
      | Begin Date      | 01/01/2010 |
      | Approval Status | Review     |
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "12/31/2020" under column header "End Date"
      | name            | value      |
      | Begin Date      | 01/01/2013 |
      | Approval Status | Review     |

    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Type"
      | name  | value |
      | Group | CAM   |
    And I verify the following fields value on editable page
      | name                                    | value  |
      | PaymentTransaction_CodeApprovalStatusID | Review |
    And I verify a row from grid "thisDiv" having unique value "Water" under column header "Type"
      | name  | value     |
      | Group | Utilities |
    And I verify the following fields value on editable page
      | name                                    | value  |
      | PaymentTransaction_CodeApprovalStatusID | Review |

  Examples:
    | Login User | Contract Name          |
    | LxSelenium | Contract Status Update |


  Scenario Outline: As a delete user, I
  1. Import the attached Approval Status updated.xml

    Given I Login to IWMS using "<Login User>" access credentials
    And I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/"
    Then I import following file name:
      | ApprovalStatusUpdated.xml |

    And I Search for the "<Contract Name>" that was created
    And Click on the name of the "<Contract Name>" in the results pop-up
    Then I see "<Contract Name>" name on the header
    And I navigate to "Payment Info"
    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Type"
      | name  | value |
      | Group | CAM   |
    And I verify the following fields value on editable page
      | name                                       | value    |
      | PaymentTransaction_CodeApprovalStatusID    | Approved |
      | _checkbox_PaymentTransaction_ProcessedFlag | true     |
    And I verify a row from grid "thisDiv" having unique value "Water" under column header "Type"
      | name  | value     |
      | Group | Utilities |
    And I verify the following fields value on editable page
      | name                                       | value    |
      | PaymentTransaction_CodeApprovalStatusID    | Approved |
      | _checkbox_PaymentTransaction_ProcessedFlag | true     |

  Examples:
    | Login User | Contract Name          |
    | LxSelenium | Contract Status Update |

