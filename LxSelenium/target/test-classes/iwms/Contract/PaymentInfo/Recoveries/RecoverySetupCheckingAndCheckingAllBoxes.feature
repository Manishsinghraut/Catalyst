@all
Feature: (Ref : Jira Ticket No : Automation-729) Recovery Setup-Checking and UnChecking all boxes

  Scenario Outline: As a delete user I Import the attached Recoveries Contract_Setup XML
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following file name:
      | RecoveriesContractSeUp.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Check all the checkboxes and generate Recovery line item

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "Payment Info"
    Then I navigate to "Payment Info"
    And I click on the "Recoveries" tab
#    And I navigate to second level "Payment Info" and third level "Recoveries" tabs
    Then I verify page title "Contract Expense Recovery List" after navigation
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
      | name            | value      |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2014 |
      | End Date        | 12/31/2014 |
      | Recovery Period |            |
      | Reported Amount | $74,250.00 |
#      | Percent Change  | 0.00%      |
      | Percent Change  | 0.0000%    |
      | Approved Amount | $77,055.00 |
      | Pre-Paid Amount | $6,000.00  |
      | Amount Due      | $71,055.00 |
    And I click on the "Recovery Setup" action panel button
    And I see the "Recovery Setup" modal window
    Then I verify the following fields value on editable page
      | name                 | value      |
      | endDate              | 12/31/2015 |
      | beginDate            | 01/01/2015 |
      | CodeApprovalStatusID | Review     |
    And I verify the following checkboxes by label
      | name             | value |
      | Reported Amounts | true  |
      | Approved Amounts | true  |
      | Budget Amounts   | true  |
    And I click "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    Then I verify "Setup of new Recovery record is complete." message appear after generating rent
    And I click "OK" button
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
      | name            | value      |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2015 |
      | End Date        | 12/31/2015 |
      | Recovery Period |            |
      | Reported Amount | $0.00      |
#      | Percent Change  | 0.00%      |
      | Percent Change  | 0.0000%    |
      | Approved Amount | $0.00      |
      | Pre-Paid Amount |            |
      | Amount Due      | $0.00      |

    Examples:
      | Login User   | Login full username  | Item     | Entity Name               |
      | DeleteAccess | Delete Access Access | Contract | Recoveries_Setup Contract |

  Scenario Outline: As a delete user I UnCheck all the boxes and generate Recovery line item

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "Payment Info"
    Then I navigate to "Payment Info"
    And I click on the "Recoveries" tab
#    And I navigate to second level "Payment Info" and third level "Recoveries" tabs
    Then I verify page title "Contract Expense Recovery List" after navigation
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
      | name            | value      |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2014 |
      | End Date        | 12/31/2014 |
      | Recovery Period |            |
      | Reported Amount | $74,250.00 |
#      | Percent Change  | 0.00%      |
      | Percent Change  | 0.0000%    |
      | Approved Amount | $77,055.00 |
      | Pre-Paid Amount | $6,000.00  |
      | Amount Due      | $71,055.00 |
    And I click on the "Recovery Setup" action panel button
    And I select following checkboxes by label
      | name             |
      | Reported Amounts |
      | Approved Amounts |
      | Budget Amounts   |
    And I click on OK button in Reconcile pop up
    Then I verify "1 Contract was processed." message appear after generating rent
    Then I verify "Setup of new Recovery record is complete." message appear after generating rent
    And I click "OK" button
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
      | name            | value      |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2014 |
      | End Date        | 12/31/2014 |
      | Recovery Period |            |
      | Reported Amount | $74,250.00 |
#      | Percent Change  | 0.00%      |
      | Percent Change  | 0.0000%    |
      | Approved Amount | $77,055.00 |
      | Pre-Paid Amount | $6,000.00  |
      | Amount Due      | $71,055.00 |
    And I verify all rows count "3" in the grid "thisDiv"

    Examples:
      | Login User   | Login full username  | Item     | Entity Name               |
      | DeleteAccess | Delete Access Access | Contract | Recoveries_Setup Contract |