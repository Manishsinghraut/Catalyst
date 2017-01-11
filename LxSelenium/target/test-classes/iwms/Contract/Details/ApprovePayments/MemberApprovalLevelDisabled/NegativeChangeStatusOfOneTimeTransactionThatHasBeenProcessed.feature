@all
Feature: Negative - Change Status of One Time Transaction that has been processed (Jira Ref.:AUTOMATION-844 )

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
      | ApprovePaymentMember-844.xls    |
      | ImportedLocation-844.xml        |
      | ApprovePaymentContractB-844.xml |

#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Payment Info"
    And I click on the "Transactions" tab
    And I verify a row from grid "<Grid ID>" having unique value "Lease Recurring Expense" under column header "Group"
      | name             | value                   |
      | Effective Date   | 06/01/2015              |
      | Group            | Lease Recurring Expense |
      | Type             | Interior Maintainance   |
      | Category         | Expense                 |
      | Vendor           |                         |
      | Vendor#          |                         |
      | One-Time Expense | Yes                     |
      | Total Amount     | $100.00                 |
      | Primary Tax      | $0.00                   |
      | Hold Flag        | No                      |
    And I verify the following fields value on editable page
      | name                                     | value |
      | _checkbox_PaymentTransaction_OneTimeFlag | true  |
    And I switch to default frame
    And I logout

    Examples:
      | Login User   | Login full username  | Entity Name                    | Grid ID |
      | DeleteAccess | Delete Access Access | Approve Payment Contract B-844 | thisDiv |


  Scenario Outline: As a Entity 2 user I Ensure that Message should appear stating "Error updating status, Unable to change Payment value(s) as the Payment has already been processed"
    Given I Login to IWMS using "<Login User>" access credentials expecting EULA page
    Then Accept Eula and move on
#    And I navigate to entity type "Contract" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Approve Payments" action panel button
    And I switch to "Approve Payments" child window
    And I select transactions radio button
    And I set following fields value on editable page
      | name      | value      |
      | BeginDate | 01/01/2010 |
      | EndDate   | 12/31/2030 |
    And I verify the following values in non frame grid "<Grid ID>"
      | Status | Portfolio   | Contract Name | Expense Category | Expense Group           | Expense Type          | Effective Date | Effective End Date | Amount  |
      | Review | <Portfolio> | <Entity Name> | Expense          | Lease Recurring Expense | Interior Maintainance | 06/01/2015     | 12/31/2030         | $100.00 |

    And I click on the "approve" action from non frame grid "<Grid ID>" having unique value "Interior Maintainance" under column header "Expense Type"
      | name          | value                   |
      | Contract Name | <Entity Name>           |
      | Expense Group | Lease Recurring Expense |
      | Portfolio     | <Portfolio>             |

    And I message should appear stating "Error updating status, Unable to change Payment value(s) as the Payment has already been processed"
    And I close the "Approve Payments" child window
    And I switch to main window
    And I switch to default frame
    And I logout

    Examples:
      | Login User | Entity Name                    | Grid ID                   | Portfolio                      |
      | Entity 844 | Approve Payment Contract B-844 | ApproveExpenseScheduleDiv | Contract Testing Portfolio-844 |