@all @smoke @smoke2
Feature: (Jira Ref : AUTOMATION-512) To ensure that users can add, edit, delete a allowances.

  Scenario Outline: I can add a allowances
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Allowance List" after navigation
    And I click on the "Add item" action panel button
    Then I verify page title "Contract Allowance List" after navigation
    And I set following fields value on editable page
      | name                             | value                         |
      | Allowance_TotalAmount            | 4000                          |
      | Allowance_BeginDate              | 01/01/2014                    |
      | Allowance_EndDate                | 12/31/2016                    |
      | Allowance_RentableArea           | 2000                          |
      | Allowance_Notes                  | Allowances Created through UI |
      | Allowance_CodeAllowanceGroupID   | Allowance Group               |
      | Allowance_CodeAllowanceTypeID    | LL Contribution               |
      | Allowance_CodeBuildingAreaUnitID | Square Feet                   |
      | Allowance_CodeCurrencyTypeID     | USD                           |
    And I switch to default frame
    And I click on the "Add item" action panel button
    And I click on the "Yes" button in message box
    Then I verify page title "Contract Allowance List" after navigation
    And I verify success message "Successfully added Contract Term"
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "<Grid ID>" having unique value "12/31/2016" under column header "End Date"
      | name          | value           |
      | Group         | Allowance       |
      | Type          | LL Contribution |
      | Begin Date    | 01/01/2014      |
      | End Date      | 12/31/2016      |
      | Total Amount  | $4,000.00       |
      | Currency Type | USD             |
      | Amendment     |                 |
    And I logout

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid ID |
      | Payment Info     | Allowances      | Selenium-Contract | thisDiv |

  Scenario Outline: I can edit a allowances
    Given I Login to IWMS using "EditAccess" access credentials
    When I see the Dashboard
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "12/31/2016" under column header "End Date"
    And I set following fields value on editable page
      | name            | value                         |
      | Allowance_Notes | Allowances updated through UI |
    And I click on the "Save Changes" action panel button
    And I verify success message "Successfully updated Contract Term"
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "12/31/2016" under column header "End Date"
    Then I verify the following fields value on editable page
      | name            | value                         |
      | Allowance_Notes | Allowances updated through UI |
    And I logout

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid ID |
      | Payment Info     | Allowances      | Selenium-Contract | thisDiv |

  Scenario Outline: I can delete a allowances
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "12/31/2016" under column header "End Date"
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    And I verify success message "Successfully deleted Contract Term"
    And I click on the "<Third Level Tab>" tab
    Then I verify row from grid "<Grid ID>" having unique value "12/31/2016" not present
    And I logout

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid ID |
      | Payment Info     | Allowances      | Selenium-Contract | thisDiv |