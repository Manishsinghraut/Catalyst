@all
Feature: (Ref : Jira Ticket No : Automation-630), As a delete user I can able to Copy Transaction without Vendor allocation

  Scenario Outline: I import file to Copy Transaction without Vendor allocation
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/"
    And I import following file name:
      | Master_Transaction_Contract.xml |
      | Master_Transaction_Contract.xml |


    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can able to Copy Transaction without Vendor allocation
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
    And I click on the "Copy Transaction" action panel button
    Then I wait for modal window to open
    And I see the "Payment Transaction Copy" modal window
    And I set following fields value on editable page
      | name          | value      |
      | effectiveDate | 05/05/2015 |
      | postDate      | 05/05/2015 |
      | dueDate       | 05/05/2015 |
    And I deselect following checkboxes by label
      | name              |
      | Vendor Allocation |

    And I click on the "OK" button
    Then I verify "1 Contract was copyTransaction." message after copying transaction
    And I verify "Copy of Payment Transaction record is complete." message after copying transaction
    And I click "OK" button
    And I verify a row from grid "thisDiv" having unique value "05/05/2015" under column header "Effective Date"
      | name    | value     |
      | Group   | Utilities |
      | Type    | Water     |
      | Vendor  |           |
      | Vendor# |           |

    Examples:
      | Login User   | Login full username  | Item     | Entity Name                 | Second Level Tab | Third Level Tab |
      | DeleteAccess | Delete Access Access | Contract | Master Transaction Contract | Payment Info     | Transactions    |
