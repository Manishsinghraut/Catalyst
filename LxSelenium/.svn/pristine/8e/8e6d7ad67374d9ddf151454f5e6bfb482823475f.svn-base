@all
Feature: (Ref : Jira Ticket No : Automation-1326),Canceling Successor should Set predecessor Lead lag to "0"

  Scenario Outline: I import file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplateComplex/"
    And I import following files:
      | CSProject-10950.xml             |
      | Multiple_Successor_Scenario.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Complete Successor tasks with negative lead/lag time if predecessor task has not been completed or cancelled
    When I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    And I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 08/07/2025 |
    And I click on the "Append Schedule Template" button
    Then I wait for modal window to close
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    And I open new task information pop up of "Successor A1" task
    And I click on "Predecessors" tab
    And I verify the following values in frame grid "^dependencygrid"
      | Task Name     | Type            | Lead/Lag Days |
      | Predecessor A | Finish-To-Start | 1 day         |
    And I click on "General" tab
    When I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button
    And I open new task information pop up of "Successor A1" task
    And I click on "Predecessors" tab
    Then I verify the following values in frame grid "^dependencygrid"
      | Task Name     | Type            | Lead/Lag Days |
      | Predecessor A | Finish-To-Start | 0 days        |


    Examples:
      | Entity Name     | Template                    |
      | CSProject-10950 | Multiple Successor Scenario |