@all @smoke @smoke3
Feature: I create,update and delete contract Security Deposit and verify them in Contract> Abstract Info> Security Deposit page

  Scenario Outline: I create contract Security Deposit through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Add item" action panel button
    Then I verify page title "<Grid title>" after navigation
    And I set following fields value on editable page
      | name                                        | value              |
      | SecurityDeposit_CodeSecurityDepositGroupID  | Security Deposit   |
      | SecurityDeposit_CodeSecurityDepositTypeID   | Initial            |
      | SecurityDeposit_CodeSecurityDepositStatusID | Paid               |
      | SecurityDeposit_BeginDate                   | 05/15/2015         |
      | SecurityDeposit_EndDate                     | 05/31/2016         |
      | SecurityDeposit_CodeGuaranteeTypeID         | Full Return        |
      | SecurityDeposit_DepositAmount               | 10000              |
      | SecurityDeposit_CodeCurrencyTypeID          | USD                |
      | SecurityDeposit_AccountNumber               | 12345              |
      | SecurityDeposit_InterestRate                | 5                  |
      | SecurityDeposit_PartyID                     | Selenium-Employer  |
      | SecurityDeposit_CodePayBackCurrencyTypeID   | USD                |
      | SecurityDeposit_Notes                       | Selenium Test Note |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    #And I click on the "<Third Level Tab>" tab
    And I verify row from grid "<Grid ID>" having unique value "<Field>"
      | name             | value            |
      | Group            | Security Deposit |
      | Type             | Initial          |
      | Begin Date       | 05/15/2015       |
      | End Date         | 05/31/2016       |
      #This column will be validated once number format of the field is fixed
      | Deposit Amount   |                  |
      | Deposit Currency | USD              |
      | Required?        |                  |
      | Guarantee Type   | Full Return      |
    And I logout

  Examples:
    | Field      | Second Level Tab | Third Level Tab  | Entity Name       | Grid title                     | Grid ID |
    | 05/15/2015 | Payment Info     | Security Deposit | Selenium-Contract | Contract Security Deposit List | thisDiv |

  Scenario Outline: I update contract Security Deposit through UI
    Given I Login to IWMS using "EditAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "2" from grid "id" "<Grid ID>"
    And I set following fields value on editable page
      | name                          | value                     |
      | SecurityDeposit_DepositAmount | 20000                     |
      | SecurityDeposit_Notes         | Update Selenium Test Note |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I logout

  Examples:
    | Field      | Second Level Tab | Third Level Tab  | Entity Name       | Grid title                     | Grid ID |
    | 05/15/2015 | Payment Info     | Security Deposit | Selenium-Contract | Contract Security Deposit List | thisDiv |

  Scenario Outline: I Delete contract Security Deposit through UI
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click on the row of "<Field>" of column "2" from grid "id" "<Grid ID>"
    And I switch to default frame
    #And I click on the "Delete item" action panel button
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    Then I verify row from grid "<Grid ID>" having unique value "<Field>" not present
    And I logout

  Examples:
    | Field      | Second Level Tab | Third Level Tab  | Entity Name       | Grid title                     | Grid ID |
    | 05/15/2015 | Payment Info     | Security Deposit | Selenium-Contract | Contract Security Deposit List | thisDiv |
