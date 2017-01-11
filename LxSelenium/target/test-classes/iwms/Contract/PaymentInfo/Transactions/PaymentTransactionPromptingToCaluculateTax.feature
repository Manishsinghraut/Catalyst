@all
Feature: (Ref : Jira Ticket No : Automation-629), Payment Transaction prompting to calculate taxes

  Scenario Outline: I import file for Payment Transaction prompting to calculate taxes
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/"
    And I import following file name:
      | Master_Transaction_Contract.xml |
      | Master_Transaction_Contract.xml |


    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can able to add transactions with tax recalculation
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear in grid
    And I click on the "Add item" action panel button
    And I switch to visible frame
    And I set list fields values on editable page
      | name                                     | value      |
      | PaymentTransaction_CodeExpenseGroupID    | Utilities  |
      | PaymentTransaction_CodeExpenseTypeID     | Water      |
      | PaymentTransaction_CodeExpenseCategoryID | Expense    |
    And I set following fields value on editable page
      | name                                     | value      |
      | PaymentTransaction_EffectiveDate         | 07/23/2015 |
      | PaymentTransaction_EffectiveEndDate      | 12/31/2030 |
      | PaymentTransaction_PostingDate           | 07/23/2015 |
      | PaymentTransaction_DueDate               |07/23/2015|
      | PaymentTransaction_InvoiceAmount         | 3784.22    |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I wait for modal window to open
    And I see the "Allocate Transaction?" modal window
    And I select following checkboxes
      | name   |
      | vendor |
      | tax1   |
      | tax2   |
    And I click "Yes" button
    And I verify a row from grid "thisDiv" having unique value "07/23/2015" under column header "Effective Date"
      | name        | value     |
      | Group       | Utilities |
      | Type        | Water     |
      | Primary Tax | $378.42   |
    And I verify the following fields value on editable page
      | name                          | value   |
      | PaymentTransaction_TaxAmount1 | $378.42 |
      | PaymentTransaction_TaxAmount2 | $189.21 |

    And I set following fields value on editable page
      | name                          | value |
      | PaymentTransaction_TaxAmount1 | 200   |
      | PaymentTransaction_TaxAmount2 | 100   |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I wait for modal window to open
    And I see the "Recalculate Taxes?" modal window
    And I click on the "Yes" button
    And I verify a row from grid "thisDiv" having unique value "07/23/2015" under column header "Effective Date"
      | name        | value     |
      | Group       | Utilities |
      | Type        | Water     |
      | Category    | Expense   |
      | Primary Tax | $200.00   |

    Examples:
      | Login User   | Login full username  | Item     | Entity Name                 | Second Level Tab | Third Level Tab |
      | DeleteAccess | Delete Access Access | Contract | Master Transaction Contract | Payment Info     | Transactions    |
