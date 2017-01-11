@all
Feature: (Ref : Jira Ticket No : Automation-631), As a delete user I can able to Generate a Pass- through payment from a contract which is not a master contract

  Scenario Outline: I import file to Generate a Pass- through payment from a contract which is not a master contract
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/"
    And I import following file name:
      | Sub_Lease_A.xml |
      | Sub_Lease_A.xml |


    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can able to Generate a Pass- through payment from a contract which is not a master contract
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on row from grid "thisDiv" having unique value "04/01/2015" under column header "Effective Date"
      | name  | value     |
      | Group | Utilities |
      | Type  | Water     |
    And I switch to default frame
    And I click on the "Pass-through Payments" action panel button
    Then I wait for modal window to open
    And I see the "Create Pass-through Payments" modal window
    And I verify the following text in a page
      | No items to display |

    Examples:
      | Login User   | Login full username  | Item     | Entity Name | Second Level Tab | Third Level Tab |
      | DeleteAccess | Delete Access Access | Contract | Sub Lease A | Payment Info     | Transactions    |
