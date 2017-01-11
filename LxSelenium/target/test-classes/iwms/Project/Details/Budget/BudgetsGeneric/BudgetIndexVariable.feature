@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1073), Budget Index Variables

  Scenario Outline: As a delete user I import the xml

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric"
    And I import following file name:
      | BudgetTemplate1073.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Add Budget Index Variable
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Index Variables" link
    And I click on "Add" Button
    And I switch to "Manage Budget Index Variables" child window
    And I set following fields value on editable page
      | name            | value                 |
      | BudgetIndexName | <Index Variable Name> |
      | Description     | <Description>         |
    And I click on "Add" Button
    And I switch to main window
    And I see "Successfully added Budget Index Variable" message in the grid
    And I verify the following grid "main" values in non frame
      | Budget Index Variable Name | Description   |                |
      | <Index Variable Name>      | <Description> | edit \| delete |
    And I click "edit" action of "<Index Variable Name>" sub row in the grid "main"
    And I switch to "Manage Budget Index Variables" child window
    And I click on the "<<Add Budget Line Item>>" link
    And I switch to "Manage Budget Index Variables Items" third child window
    And I set following fields value on editable page
      | name             | value             |
      | EntityTemplateID | <Budget Template> |
    And I select line item code "Doors"
    And I click on "Add" Button
    And I switch to "Manage Budget Index Variables" child window
#    And I verify a row from reports grid "^EL" having the following header and cell value pair
#      | name            | value                  |
#      | Budget Template | BUDGET_TEMPLATE_ID=    |
#      | Budget Template | [deleted/non-existent] |
#      | Budget Template | Doors                  |
    And I verify a row from reports grid "^EL" having the following header and cell value pair
      | name            | value             |
      | Budget Template | <Budget Template> |
      | Budget Template | Doors             |

    And I click on "Update" Button
    And I switch to main window
    And I see "Successfully updated Budget Index Variable" message in the grid


    Examples:
      | Budget Template | Index Variable Name | Description                              |
      | Selenium-Budget | Test Index Variable | This test case is to test Index Variable |