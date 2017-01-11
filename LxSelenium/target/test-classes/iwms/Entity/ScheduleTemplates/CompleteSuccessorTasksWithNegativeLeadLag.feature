@all
Feature: (Ref : Jira Ticket No : Automation-889),Complete Successor tasks with negative lead/lag time if predecessor task has not been completed or cancelled

  Scenario Outline: I import file for Complete Successor tasks with negative lead/lag time if predecessor task has not been completed or cancelled
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | s0889.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Complete Successor tasks with negative lead/lag time if predecessor task has not been completed or cancelled

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    And I click on the "Schedule" tab
    And I expand gantt chart
    And I open new task information pop up of "NS Task 1" task
    And I verify the following fields value on editable page
      | name             | value     |
      | CodeTaskStatusID | Not begun |
    And I click on "Successors" tab
    And I verify the following text in a page
      | NS Task 2 |
    And I click on the "Cancel" button
    And I open new task information pop up of "NS Task 2" task
    And I click on "Predecessors" tab
    And I verify the following text in a page
      | NS Task 1 |
    And I click on "General" tab
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button
    And I click on the "Spread Sheet" action panel button
    #In testb it is Spreadsheet
    #And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    And I verify the following values in "^Lx-ui-GanttPanel":
      | name      | value          |
      | Task Name | NS Task 2      |
      | Status    | Completed      |
#      | F/A Start | [CURRENT DATE] |
#      | F/A End   | [CURRENT DATE] |
#
#    And I verify the following values in "^Lx-ui-GanttPanel":
#      | name      | value      |
#      | Task Name | NS Task 1  |
#      | Status    | Not begun  |
#      | F/A Start | 12/31/2020 |
#      | F/A End   | 12/31/2020 |


    Examples:
      | Login User   | Login full username  | Entity Name |
      | DeleteAccess | Delete Access Access | s0889       |