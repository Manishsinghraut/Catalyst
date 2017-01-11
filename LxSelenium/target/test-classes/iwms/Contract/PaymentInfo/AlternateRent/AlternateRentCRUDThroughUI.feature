@all @smoke @smoke2
Feature: (Jira Ref : AUTOMATION-509)To ensure that users can add, edit, delete a alternate rent.

  Scenario Outline: I can add a alternate rent
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Alternate Rent Schedule List" after navigation
    And I click on the "Add item" action panel button
    And I check "Rent" expense setup
    And I set following fields value on editable page
      | name      | value      |
      | BeginDate | 05/16/2015 |
      | EndDate   | 12/31/2016 |
    Then I see the "Alternate Rent Wizard" modal window
    Then I click on the "Create Alternate Rent" button
    And I verify page title "Alternate Rent Schedule List" after navigation
    And I logout

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid ID | Begin Date |
      | Payment Info     | Alternate Rent  | Selenium-Contract | thisDiv | 05/16/2015 |

  Scenario Outline: I can edit a alternate rent
    Given I Login to IWMS using "EditAccess" access credentials
    When I see the Dashboard
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "<Begin Date>" under column header "Begin Date"
    And I set following fields value on editable page
      | name                                           | value                              |
      | AlternateRentSchedule_Description              | Added alternate rent               |
      | AlternateRentSchedule_ExpenseReductionAmount   | 4000                               |
      | _checkbox_AlternateRentSchedule_SetExpHoldFlag | true                               |
      | _checkbox_AlternateRentSchedule_SetPRHoldFlag  | true                               |
      | AlternateRentSchedule_Description              | Description                        |
      | AlternateRentSchedule_Notes                    | Alternate Rent Schedule List notes |
      | AlternateRentSchedule_CodeSalesGroupID         | Sales                              |
    And I click on the "Save Changes" action panel button
    And I click on the "<Third Level Tab>" tab
    #Then I verify "Successfully added Contract Term" message appear in top left corner of page
    And I verify a row from grid "<Grid ID>" having unique value "<Begin Date>" under column header "Begin Date"
      | name                      | value        |
      | Begin Date                | <Begin Date> |
      | End Date                  | 12/31/2016   |
      | Expense Group             | Rent         |
      | Expense Type              | Base Rent    |
      | Expense Reduction Amount  |              |
      | Expense Reduction Percent |              |
      | Hold Recurring?           | Yes          |
      | Sales Group               | Sales        |
      | Percent Rent Rate         |              |
      | Hold Percent Rent?        | Yes          |
    And I logout

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid ID | Begin Date |
      | Payment Info     | Alternate Rent  | Selenium-Contract | thisDiv | 05/16/2015 |

  Scenario Outline: I can delete a alternate rent
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I enter search text "<Entity Name>" in search field
    Then I hit enter key on search field after entering value "<Entity Name>"
    And I click on the "<Entity Name>" link
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    #Then I verify "Successfully updated Contract Term" message appear in top left corner of page
    And I click row from grid "<Grid ID>" having unique value "<Begin Date>" under column header "Begin Date"
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    And I click on the "<Third Level Tab>" tab
    #Then I verify "Successfully deleted Contract Term" message appear in top left corner of page
    Then I verify row from grid "<Grid ID>" having unique value "<Begin Date>" not present
    And I logout

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name       | Grid ID | Begin Date |
      | Payment Info     | Alternate Rent  | Selenium-Contract | thisDiv | 05/16/2015 |