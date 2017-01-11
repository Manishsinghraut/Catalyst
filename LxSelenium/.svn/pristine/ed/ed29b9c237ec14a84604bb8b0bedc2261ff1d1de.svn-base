@all @smoke @smoke2
Feature: To verify that when changing the rentable area value from the contract/details/summary page the user also has the option to apply the change to the expense setup records. (Jira Ref. AUTOMATION-519)

  Scenario Outline: To verify that when changing the rentable area value from the contract/details/summary page the user also has the option to apply the change to the expense setup records.
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Edit" action panel button
    Then I verify the following table headers after navigation
      | Contract Summary |
    And I clear rentable area value in the field
    And I switch to default frame
    And I click on the "Close" button
    And I enter rentable area value "<Rentable Area>" in field
    And I switch to default frame
    And I check "Rent" expense setup
    And I click on the "Update Selected Records" button
    And I click on the "Save Changes" action panel button
    Then I wait for the Loading text to disappear
    And I switch to default frame
    When I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I click row from grid "<Grid ID>" having unique value "Rent" under column header "Expense Group"
    Then I verify the following number fields value on editable page
      | name                      | value           |
      | ExpenseSetup_RentableArea | <Rentable Area> |

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid ID | Rentable Area | Login User | Login full username |
      | Details          | Summary         | Selenium-Contract | thisDiv | 8000          | EditAccess | Edit Access Access  |