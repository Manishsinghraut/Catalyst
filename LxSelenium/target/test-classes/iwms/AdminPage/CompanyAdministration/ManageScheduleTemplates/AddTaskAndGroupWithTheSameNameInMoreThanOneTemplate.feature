@all
Feature: As a Delete user I Add task and Group with the same name in more than one template (Ref : Jira Ticket No : Automation-582)

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | AddTwoTemplate.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline:I Add task and Group with the same name in more than one template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I wait for the Loading text to disappear in grid
    And I select template "<Template>" from the list
    And I click on "<Add Root Group>" link
    And I wait for modal window to open
    Then I see the "Activity Group" modal window
    When I set following fields value on editable page
      | name                       | value              |
      | TaskName                   | <Root Group>       |
      | Description                | Created Root Group |
      | AssigneeTypeList_available | Delete Access      |
    And I click on ">>" Button
    And I click on the "Update" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear in grid
    Then I see "Successfully added Task/Group" message in the grid
    And I verify unique link text on non editable page "<Root Group>"
    And I click on "<Add Link>" link
    Then I wait for modal window to open
    And I see the "Activity Group" modal window
    And I set following fields value on editable page
      | name                       | value         |
      | TaskName                   | <Group>       |
      | Description                | Added Group   |
      | AssigneeTypeList_available | Delete Access |
    And I click on ">>" Button
    And I click on the "Update" button
    Then I wait for modal window to close
    And I wait for the Loading text to disappear in grid
    And I verify unique link text on non editable page "<Group>"
    And I click "<Add Task>" link corresponding to "<Group>" group
    Then I see the "Task Detail" modal window
    And I set following fields value on editable page
      | name             | value       |
      | TaskName         | <Task Name> |
      | OriginalDuration | 4           |
    And I click on the "Update" button
    And I verify unique link text on non editable page "<Task Name>"

    Examples:
      | Login User   | Login full username  | Task Name     | Template            | Group          | Root Group          | Add Link    |
      | DeleteAccess | Delete Access Access | Selenium Task | Selenium Schedule A | Selenium Group | Selenium Root Group | <Add Group> |
      | DeleteAccess | Delete Access Access | Selenium Task | Selenium Schedule B | Selenium Group | Selenium Root Group | <Add Group> |