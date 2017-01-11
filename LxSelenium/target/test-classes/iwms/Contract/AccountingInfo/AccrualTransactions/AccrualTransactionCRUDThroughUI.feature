@all @smoke @smoke2
Feature: To ensure that users can add, edit, and delete accrual transactions (Jir. ref. AUTOMATION-517)

  Scenario Outline: To ensure that users can add accrual transactions
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Accrual Transactions List" after navigation
    And I switch to default frame
    And I click on the "Add item" action panel button
    Then I verify page title "Accrual Transactions List" after navigation
    And I set fields values on editable page
      | name                                  | value                        |
      | AccrualTransaction_PeriodBeginDate    | <Begin Date>                 |
      | AccrualTransaction_PeriodEndDate      | 12/31/2035                   |
      | _checkbox_AccrualTransaction_HoldFlag | true                         |
      | AccrualTransaction_PeriodNumber       | 4                            |
      | AccrualTransaction_PeriodAmount       | 1000                         |
      | AccrualTransaction_Notes              | Created Accrual transactions |
      | AccrualTransaction_PeriodYear         | 2016                         |
      | AccrualTransaction_TaxAmount1         | 10                           |
      | AccrualTransaction_PostingDate        | <Begin Date>                 |
      | AccrualTransaction_AccrualMessage     | Create accrual transactions  |
      | AccrualTransaction_Description        | Description                  |

    And I set list fields values on editable page
      | name                                     | value                 |
      | AccrualTransaction_CodeExpenseGroupID    | CAM                   |
      | AccrualTransaction_CodeExpenseTypeID     | Interior              |
      | AccrualTransaction_CodeExpenseCategoryID | Expense               |
      | AccrualTransaction_OrganizationID        | Selenium-Organization |

    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear
    And I switch to default frame
    And I click on the "<Third Level Tab>" tab
    Then I verify row from grid "<Grid ID>" having unique value "<Begin Date>" under column header "Period Begin Date"
      | name              | value        |
      | Period Begin Date | <Begin Date> |
      | Period End Date   | 12/31/2035   |
      | Group             | CAM          |
      | Type              | Interior     |
      | Total Amount      |              |
      | Primary Tax       |              |
      | Period Year       | 2016         |
      | Period Number     | 4            |
      | Posting Date      | <Begin Date> |

    Examples:
      | Second Level Tab | Third Level Tab      | Entity Name       | Grid ID | Begin Date | Login User   | Login full username  |
      | Accounting Info  | Accrual Transactions | Selenium-Contract | thisDiv | 01/01/2020 | DeleteAccess | Delete Access Access |

  Scenario Outline: To ensure that users can edit accrual transactions
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "<Begin Date>" under column header "Period Begin Date"
    And I set fields values on editable page
      | name                     | value                        |
      | AccrualTransaction_Notes | Updated Accrual transactions |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear
    And I switch to default frame
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "<Begin Date>" under column header "Period Begin Date"
    Then I verify the following fields value on editable page
      | name                     | value                        |
      | AccrualTransaction_Notes | Updated Accrual transactions |

    Examples:
      | Second Level Tab | Third Level Tab      | Entity Name       | Grid ID | Begin Date | Login User | Login full username |
      | Accounting Info  | Accrual Transactions | Selenium-Contract | thisDiv | 01/01/2020 | EditAccess | Edit Access Access  |

  Scenario Outline: To ensure that users can delete accrual transactions
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "<Begin Date>" under column header "Period Begin Date"
    And I switch to default frame
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
  #Then I verify "Successfully deleted Responsibilities" message appear in top left corner of page
    Then I verify row from grid "<Grid ID>" having unique value "<Begin Date>" not present

    Examples:
      | Second Level Tab | Third Level Tab      | Entity Name       | Grid ID | Begin Date | Login User   | Login full username  |
      | Accounting Info  | Accrual Transactions | Selenium-Contract | thisDiv | 01/01/2020 | DeleteAccess | Delete Access Access |