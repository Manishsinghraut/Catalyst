@all
Feature: (Ref : Jira Ticket No : Automation-888),Schedule -Testing ADD functionality(Task Below,Task Above ,Sub task , Predecessor and Successor)

  Scenario Outline: I import file for Schedule -Testing ADD functionality
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | WorldMarket.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I add task above below, predecessors, successors

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I expand gantt chart

#    And I verify the following 'options to ADD' for the task "Curing"
#      | Task above  |
#      | Task below  |
#      | Sub-task    |
#      | Successor   |
#      | Predecessor |

    And I switch to default frame
    And I click on the "Schedule" tab
    And I expand gantt chart
    #Add task
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I add new task above "Curing" task
    And I open new task information pop up of "New task" task
    And I set following fields value on editable page
      | name     | value                |
      | TaskName | New task Added Above |
    And I click "Ok" button
    And I open new task information pop up of "New task Added Above" task
    And I verify the following fields value on editable page
      | name            | value                |
      | TaskName        | New task Added Above |
      | ActualDuration  | 5 days               |
      | ActualStartDate | 01/09/2019           |
      | ActualEndDate   | 01/15/2019           |
    And I click "Ok" button

    #Add sub task
    And I add new sub task for task "Curing"
    And I open new task information pop up of "New task" task
    And I set following fields value on editable page
      | name     | value            |
      | TaskName | New task-Subtask |
    And I click "Ok" button
    And I open new task information pop up of "New task-Subtask" task
    And I verify the following fields value on editable page
      | name            | value            |
      | TaskName        | New task-Subtask |
      | ActualDuration  | 5 days           |
      | ActualStartDate | 01/09/2019       |
      | ActualEndDate   | 01/15/2019       |
    And I click "Ok" button
    And I verify the following tasks converted into a group
      | Curing |

    #Add predecessor
#    And I drag the vertical split bar to right
    And I add new predecessor for task "Laying Foundation"
    And I open new task information pop up of "New task" task
    And I set following fields value on editable page
      | name     | value                |
      | TaskName | Predecessor New task |
    And I click "Ok" button
    And I open new task information pop up of "Predecessor New task" task
    And I verify the following fields value on editable page
      | name            | value                |
      | TaskName        | Predecessor New task |
      | ActualDuration  | 1 day                |
      | ActualStartDate | 12/28/2018           |
      | ActualEndDate   | 12/28/2018           |
    And I click "Ok" button
    And I open new task information pop up of "Laying Foundation" task
    And I click on "Predecessors" tab
    And I verify the following text in a page
      | Predecessor New task |
    And I click "Ok" button


  Examples:
    | Login User   | Login full username  | Entity Name  |
    | DeleteAccess | Delete Access Access | World Market |


  Scenario Outline: As a delete user I add task above below, successors

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right

     #Add successor
    And I add new successor for task "Survey and Levelling"
    And I open new task information pop up of "New task" task
    And I set following fields value on editable page
      | name     | value              |
      | TaskName | Successor New task |
    And I click "Ok" button
    And I open new task information pop up of "Successor New task" task
    And I verify the following fields value on editable page
      | name            | value              |
      | TaskName        | Successor New task |
      | ActualDuration  | 1 day              |
      | ActualStartDate | 01/09/2019         |
      | ActualEndDate   | 01/09/2019         |
    And I click "Ok" button
    And I open new task information pop up of "Survey and Levelling" task
    And I click on "Successors" tab
    And I verify the following text in a page
      | Successor New task |
    And I click "Ok" button

  Examples:
    | Login User   | Login full username  | Entity Name  |
    | DeleteAccess | Delete Access Access | World Market |