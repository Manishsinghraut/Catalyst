@all
Feature: Recoveries - Validate Prepaid amount Pop up when Expense Group/Type are empty (Ref : Jira Ticket No : AUTOMATION-953)

  Scenario Outline: As a delete user I Import the S001- Contract,S001- Location entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following file name:
      | S001Location.xml |
      | S001Contract.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Check all the checkboxes and generate Recovery line item
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "Payment Info"
    Then I navigate to "Payment Info"
    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "03/01/2015" under column header "Effective Date"
      | name             | value      |
      | Effective Date   | 03/01/2015 |
      | Group            |            |
      | Type             |            |
      | Category         |            |
      | Vendor           |            |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | $1,000.00  |
      | Primary Tax      |            |
      | Hold Flag        | No         |
    Then I verify the following fields value on editable page
      | name                                  | value    |
      | PaymentTransaction_CodeExpenseGroupID | [SELECT] |
      | PaymentTransaction_CodeExpenseTypeID  | [SELECT] |
    And I switch to default frame
    And I click on the "Recoveries" tab
    And I switch to visible frame
    Then I verify the following fields value on editable page
      | name                               | value    |
      | ExpenseRecovery_CodeExpenseGroupID | [SELECT] |
      | ExpenseRecovery_CodeExpenseTypeID  | [SELECT] |
    And I Scroll down to the "Amount Due (Current Period)" section and click on the Prepaid Amount magnifying glass
    And I switch to default frame
    And I set following fields value on editable page
      | name               | value      |
      | CodeExpenseGroupID | All Groups |
      | CodeExpenseTypeID  | All Types  |
    And I verify Pop-up window grid row "ExpenseRecoveryPrepaidAmountDiv" having unique value "03/01/2015" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 03/01/2015 |
      | Group          |            |
      | Type           |            |
      | Vendor         |            |
      | Total Amount   | $1,000.00  |

    And I click on the "Close" button

  Examples:
    | Login User   | Login full username  | Item     | Entity Name    |
    | DeleteAccess | Delete Access Access | Contract | S001- Contract |