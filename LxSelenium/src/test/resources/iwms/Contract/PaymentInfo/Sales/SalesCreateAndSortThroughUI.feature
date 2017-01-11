@all @smoke @smoke3
Feature: (Jira Ref: AUTOMATION-515) To ensure that users can add, edit, and delete(CRUD) a Contract Sales

  Scenario Outline: I can add a Contract Sales
    Given I Login to IWMS using "<Login User>" access credentials
    When I see the Dashboard
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Sales History List" after navigation
    And I click on the "Add item" action panel button
    Then I verify page title "Contract Sales History List" after navigation
    And I set following fields value on editable page
      | name                      | value          |
      | Sales_SalesPeriod         | <Sales Period> |
      | Sales_SalesYear           | <Sales Year>   |
      | Sales_CodeSalesGroupID    | Internal Sales |
      | Sales_CodeSalesCategoryID | Actual         |
      | Sales_CodeCurrencyTypeID  | USD            |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I verify success message "Successfully added Contract Term"
    And I click on the "<Third Level Tab>" tab
    #And I click on the "Yes" button in message box
    And I verify a row from grid "<Grid ID>" having unique value "<Sales Year>" under column header "Sales Year"
      | name               | value          |
      | Sales Group        | Internal Sales |
      | Sales Type         |                |
      | Sales Category     | Actual         |
      | Sales Period       | <Sales Period> |
      | Sales Year         | <Sales Year>   |
      | Gross Sales Amount |                |
      | Net Sales Amount   |                |
      | Currency           | USD            |

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid ID | Sales Year | Sales Period | Login User   | Login full username  |
      | Payment Info     | Sales           | Selenium-Contract | thisDiv | 2020       | 2            | DeleteAccess | Delete Access Access |
      | Payment Info     | Sales           | Selenium-Contract | thisDiv | 2021       | 3            | DeleteAccess | Delete Access Access |

  Scenario Outline: I sort Contract Sales
    Given I Login to IWMS using "<Login User>" access credentials
    When I see the Dashboard
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Sales History List" after navigation
    And I click sort in header "Sales Period" from grid "<Grid ID>" in "Sort Ascending"
    And I verify the following sorted rows in grid "<Grid ID>"
      | name | value |
      | 2    | 3     |
      | 2020 | 2021  |

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid ID | Login User   | Login full username  |
      | Payment Info     | Sales           | Selenium-Contract | thisDiv | DeleteAccess | Delete Access Access |

  Scenario Outline: I can edit Contract Sales
    Given I Login to IWMS using "<Login User>" access credentials
    When I see the Dashboard
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Sales History List" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Sales Year>" under column header "Sales Year"
    And I set following fields value on editable page
      | name                   | value |
      | Sales_CodeSalesGroupID | Sales |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I click on the "<Third Level Tab>" tab
   #And I click on the "Yes" button in message box
   #Then I verify "Successfully added Contract Term" message appear in top left corner of page
    And I verify a row from grid "<Grid ID>" having unique value "<Sales Year>" under column header "Sales Year"
      | name        | value |
      | Sales Group | Sales |

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid ID | Sales Year | Login User | Login full username |
      | Payment Info     | Sales           | Selenium-Contract | thisDiv | 2020       | EditAccess | Edit Access Access  |

  Scenario Outline: I can delete Contract Sales
    Given I Login to IWMS using "<Login User>" access credentials
    When I see the Dashboard
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "<Sales Year>" under column header "Sales Year"
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    Then I verify row from grid "<Grid ID>" having unique value "<Sales Year>" not present

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid ID | Sales Year | Login User   | Login full username  |
      | Payment Info     | Sales           | Selenium-Contract | thisDiv | 2020       | DeleteAccess | Delete Access Access |