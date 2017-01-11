@all
Feature: (Ref : Jira Ticket No : Automation-628), As a delete user I can able to Manually Processing Payment Transaction

  Scenario Outline: I import file for Manually Processing Payment Transaction
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/"
    And I import following file name:
      | Master_Transaction_Contract.xml |
      | Master_Transaction_Contract.xml |


    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I select option processed flag
    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I navigate to second level tab "<Second Level Tab>" and third level "<Third Level Tab>" tab of entity "Contract"
    And I click on row from grid "thisDiv" having unique value "04/01/2015" under column header "Effective Date" by parsing many pages
      | name  | value    |
      | Group | CAM      |
      | Type  | Interior |
    And I set following fields value on editable page
      | name                                       | value |
      | _checkbox_PaymentTransaction_ProcessedFlag | true  |
    And I click on the "OK" button in message box "Approval Status is in Review for this transaction!"
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear
    And I click on the "Yes"
    And I wait for the Loading text to disappear

    Examples:
      | Item     | Entity Name                 | Second Level Tab | Third Level Tab |
      | Contract | Master Transaction Contract | Payment Info     | Transactions    |


  Scenario: Edit Processed Payment - Successful
    And I set following fields value on editable page
      | name                           | value                                   |
      | PaymentTransaction_Notes       | Updated CAM transaction                 |
      | PaymentTransaction_Description | This is a test for updating transaction |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear
    And I click on the "Yes"
    And I wait for the Loading text to disappear


  Scenario: Edit Processed Payment - Negative
    And I set following fields value on editable page
      | name                             | value |
      | PaymentTransaction_InvoiceAmount | 4000  |
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear
    And I click on the "Yes"
    And I wait for the Loading text to disappear
    And I verify "Unable to change Payment value(s) as the Payment has already been processed" error message appear in top left corner of page