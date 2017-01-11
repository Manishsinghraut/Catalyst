Feature: Negative Testing- When Approved Revised Amount Due is 0 (Jira Ref : AUTOMATION-728)

  Scenario Outline: I import file for Recoveries Negative Testing entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following file name:
      | RecoveriesNegativeTesting.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I verify the Pop up message should be displayed stating "Cannot Reconcile-Approved Revised Amount Due is 0"
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I see the Dashboard
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "$0.00" under column header "Amount Due"
    And I click on the "Reconcile" action panel button
    And I verify the following message "Approved Revised Amount Due is 0"
    And I click on the "OK"


  Examples:
    | Entity Name                 | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
    | Recoveries Negative Testing | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |
