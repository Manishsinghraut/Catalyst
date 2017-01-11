@all
Feature: Approve Payments - Entity Member (Jira Ref.:AUTOMATION-845 )

  Scenario: I want Security Configuration for Import Data
    When I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    Then I click on the "Manage Company" link
    And I click on "Financial Settings" tab
    And I click on Disable Payment Approval
    And I click on "Update" Button
    And I verify the following message "Successfully updated Company"


  Scenario Outline: I import file for Approve Payment Contract A
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/"
    And I import following file name:
      | ApprovePaymentMember.xlsx            |
      | ImportedLocationEntityMember.xml        |
      | ApprovePaymentContractEntityMemberA.xml |

    And I logout

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a Entity Member 3 user I Ensure that Approve Payments Pop up
    Given I Login to IWMS using "<Login User>" access credentials expecting EULA page
    Then Accept Eula and move on
    And I navigate to entity type "Contract" named "<Entity Name>"
    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window
    And I select expense schedules radio button
    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio         | Contract Name                            | Expense Category | Expense Group | Expense Type         | Begin Date | End Date   | Amount    |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member A | Expense          | Utilities     | Water                | 01/01/2010 | 12/31/2020 | $1,000.00 |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member A | Expense          | CAM           | CAM                  | 01/01/2010 | 12/31/2020 | $2,000.00 |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member A | Expense          | Lease Expense | Building Maintenance | 01/01/2010 | 12/31/2020 | $500.00   |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member A | Rent             | Base Rent     | Base Rent            | 01/01/2010 | 12/31/2030 | $300.00   |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member A | Rent             | Base Rent     | Base Rent            | 01/01/2010 | 12/31/2030 | $400.00   |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member A | Rent             | Base Rent     | Base Rent            | 01/01/2010 | 12/31/2030 | $2,100.00 |

    And I verify the following values in non frame grid not exist "<Grid ID>"
      | Status | Portfolio         | Contract Name                            | Expense Category | Expense Group | Expense Type         | Begin Date | End Date   | Amount    |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member B | Expense          | Utilities     | Water                | 01/01/2010 | 12/31/2020 | $1,000.00 |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member B | Expense          | CAM           | CAM                  | 01/01/2010 | 12/31/2020 | $2,000.00 |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member B | Expense          | Lease Expense | Building Maintenance | 01/01/2010 | 12/31/2020 | $500.00   |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member B | Rent             | Base Rent     | Base Rent            | 01/01/2010 | 12/31/2030 | $300.00   |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member B | Rent             | Base Rent     | Base Rent            | 01/01/2010 | 12/31/2030 | $400.00   |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member B | Rent             | Base Rent     | Base Rent            | 01/01/2010 | 12/31/2030 | $2,100.00 |


    And I click on the green check-mark for the line item for recurring expense to change it to approved on grid "<Grid ID>" having unique value "CAM" under column header "Expense Type"
    And I select transactions radio button
    And I set following fields value on editable page
      | name                 | value      |
      | BeginDate            | 01/01/2010 |
      | EndDate              | 12/31/2030 |
      | CodeApprovalStatusID | Review     |

    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio         | Contract Name                            | Expense Category | Expense Group | Expense Type | Effective Date | Effective End Date | Amount    |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member A | Expense          | CAM           | CAM          | 01/01/2010     | 12/31/2030         | $1,600.00 |

    And I close the "Approve Payments" child window
    And I switch to main window
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I switch to visible frame
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Type"
      | name             | value      |
      | Expense Group    | CAM        |
      | Expense Type     | CAM        |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $2,000.00  |
      | Annual Amount    | $24,000.00 |
    And I wait for the Loading text to disappear in grid
    And I verify a unique row in grid "BOGridExpenseSchedule" having unique value "01/01/2010" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2020 |
      | Approval Status | Approved   |
      | Payment Amount  | $2,000.00  |
      | Annual Amount   | $24,000.00 |
      | Rate            | $0.05      |
      | First Payment   | $2,000.00  |
      | Last Payment    | $2,000.00  |
      | Notes           |            |
    And I switch to default frame
    And I logout

    Examples:
      | Login User | Entity Name                              | Grid ID                   |
      | Entity 3   | Approve Payment Contract Entity Member A | ApproveExpenseScheduleDiv |

  Scenario Outline: I import file for Approve Payment Contract B
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/ApprovePayments/MemberApprovalLevelDisabled/"
    And I import following file name:
      | ApprovePaymentContractEntityMemberB.xml |
    And I logout

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a Entity Member 2 user I Ensure that Approve Payments Pop up
    Given I Login to IWMS using "<Login User>" access credentials expecting EULA page
    Then Accept Eula and move on
    And I navigate to entity type "Contract" named "<Entity Name>"
    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window
    And I select transactions radio button
    And I set following fields value on editable page
      | name                 | value      |
      | BeginDate            | 01/01/2010 |
      | EndDate              | 12/31/2030 |
      | CodeApprovalStatusID | Review     |

    And I verify the following values in non frame grid not exist "<Grid ID>"
      | Status | Portfolio         | Contract Name                            | Expense Category | Expense Group | Expense Type | Effective Date | Effective End Date | Amount    |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member A | Expense          | CAM           | CAM          | 01/01/2010     | 12/31/2030         | $1,600.00 |

    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio         | Contract Name                            | Expense Category | Expense Group | Expense Type | Effective Date | Effective End Date | Amount  |
      | Review | Lucernex-Selenium | Approve Payment Contract Entity Member B | Expense          | Utilities     | Water        | 01/01/2010     | 12/31/2030         | $500.00 |

    And I close the "Approve Payments" child window
    And I switch to main window
    And I switch to default frame
    And I logout

    Examples:
      | Login User | Entity Name                              | Grid ID                   |
      | Entity 2   | Approve Payment Contract Entity Member B | ApproveExpenseScheduleDiv |