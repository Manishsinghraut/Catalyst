@all
Feature:Editing Task info from Task bars on Gantt view. (Jira ref: AUTOMATION-885)

  Scenario Outline: As a delete user I import file for apply schedule template script and I apply schedule template for that entity.
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | S009.xml                     |
      | NovemberScheduleTemplate.xml |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 11/20/2015 |
    Then I click on the "Append Schedule Template" button
    Then I wait for modal window to close
    And I switch to visible frame
    And I verify the following values in "<Grid ID>":
      | name      | value      |
      | Task Name | Get permit |

    Examples:
      | Login User   | Login full username  | Entity Name | Template          | Grid ID           |
      | DeleteAccess | Delete Access Access | S009        | November Schedule | ^Lx-ui-GanttPanel |

  Scenario Outline: As a delete user I am able to change status by clicking on the blue bar in the gantt and verify the status change
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I wait for the Loading text to disappear
    And I expand gantt chart
    And I Right click on the 1 "st" blue bar "<Task Name>" task on the bar graph/timeline and click "Task information..." to edit the task
    And I verify the following fields value on editable page
      | name     | value                 |
      | TaskName | Submit required forms |
    Then I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button
    And I wait for the Loading text to disappear
    And I verify the following values in "<Grid ID>":
      | name      | value                 |
      | Task Name | Submit required forms |
      | Status    | In-process            |

    Examples:
      | Login User   | Login full username  | Entity Name | Task Name             | Grid ID           |
      | DeleteAccess | Delete Access Access | S009        | Submit required forms | ^Lx-ui-GanttPanel |

  Scenario Outline: As a delete user I change % done by clicking on the blue bar in the gantt and verify the status change of the task.

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I wait for the Loading text to disappear
    And I expand gantt chart
    And I Right click on the 2 "nd" blue bar "<Task Name>" task on the bar graph/timeline and click "Task information..." to edit the task
    And I verify the following fields value on editable page
      | name     | value           |
      | TaskName | Find contractor |
    Then I set following fields value on editable page
      | name            | value |
      | PercentComplete | 50%   |
    And I verify the following fields value on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button
    And I wait for the Loading text to disappear
    And I verify the following values in "<Grid ID>":
      | name      | value              |
      | Task Name | Start construction |
      | Status    | In-process         |
    And I verify the following values in "<Grid ID>":
      | name      | value           |
      | Task Name | Find contractor |
      | Status    | In-process      |

    Examples:
      | Login User   | Login full username  | Entity Name | Task Name       | Grid ID           |
      | DeleteAccess | Delete Access Access | S009        | Find contractor | ^Lx-ui-GanttPanel |