Feature: Adding line item for Admin Fee(Jira Ref : AUTOMATION-720)

  Scenario Outline: I import file for Recoveries Contract entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following file name:
      | RecoveriesContractSetup.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I create contract Recoveries through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "CAM" under column header "Recovery Group"
    And I set following fields value on editable page
      | name                                       | value |
      | ExpenseRecovery_ReportedAdminFeePercentage |       |
      | ExpenseRecovery_ReportedAdminFeePercentage | 15    |
    And I click row from grid "<Grid ID>" having unique value "CAM" under column header "Recovery Group"
    And I verify the subtotal "$258,750.00" will be recalculate based on the "15%" of admin fee under reported
    And I switch to default frame
    And I click on the "Save Changes" action panel button

  Examples:
    | Entity Name         | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
    | Recoveries Contract | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |