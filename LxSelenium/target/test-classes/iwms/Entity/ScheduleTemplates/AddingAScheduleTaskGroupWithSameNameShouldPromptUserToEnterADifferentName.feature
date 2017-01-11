@all
Feature: (Ref : Jira Ticket No : Automation-1465),Negative Testing-Adding task /group with the same name

  Scenario Outline: I import file for Negative Testing-Adding task /group with the same name
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following files:
      | Portfolio_00020AndLocation_00020-1465.xml |
      | Project-1465.xml                          |
      | ScheduleTemplate-1465.xml                 |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I ADD group with the same name
    Given I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    And I set following fields value on editable page
      | name                   | value                   |
      | taskTemplateIDToAssign | Schedule Template 11091 |
      | startDate              | 01/15/2020              |
    And I click on the "Append Schedule Template" button
    And I expand gantt chart
    Then I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | Task Name | Assignees | Status    |
      | Group 1   |           | Not begun |
      | Task 1    |           | Not begun |
      | Task 2    |           | Not begun |
      | Group 2   |           | Not begun |
      | Task 3    |           | Not begun |
      | Task 4    |           | Not begun |

    And I open new task information pop up of "Group 2" task
    And I set following fields value on editable page
      | name     | value   |
      | TaskName | Group 1 |
    And I click "Ok" button
    And I see "Failed: The name (Group 1) already exists in this schedule. Please enter a different name." message in the header
    And I click "OK" button
    Then I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | Task Name | Assignees | Status    |
      | Group 1   |           | Not begun |
      | Task 1    |           | Not begun |
      | Task 2    |           | Not begun |
      | Group 1   |           | Not begun |
      | Task 3    |           | Not begun |
      | Task 4    |           | Not begun |
    And I open new task information pop up of "Group 1"
    And I set following fields value on editable page
      | name     | value   |
      | TaskName | Group 2 |
    And I click "Ok" button
    Then I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | Task Name | Assignees | Status    |
      | Group 1   |           | Not begun |
      | Task 1    |           | Not begun |
      | Task 2    |           | Not begun |
      | Group 2   |           | Not begun |
      | Task 3    |           | Not begun |
      | Task 4    |           | Not begun |

    Examples:
      | Project Name  |
      | Project 11091 |

  Scenario Outline: As a delete user I ADD task with the same name
    Given I open new task information pop up of "Task 3" task
    And I set following fields value on editable page
      | name     | value  |
      | TaskName | Task 1 |
    And I click "Ok" button
    And I see "Failed: The name (Task 1) already exists in this schedule. Please enter a different name." message in the header
    And I click "OK" button
    Then I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | Task Name | Assignees | Status    |
      | Group 1   |           | Not begun |
      | Task 1    |           | Not begun |
      | Task 2    |           | Not begun |
      | Group 2   |           | Not begun |
      | Task 1    |           | Not begun |
      | Task 4    |           | Not begun |
    And I open new task information pop up of "Task 1"
    And I set following fields value on editable page
      | name     | value  |
      | TaskName | Task 3 |
    And I click "Ok" button
    Then I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | Task Name | Assignees | Status    |
      | Group 1   |           | Not begun |
      | Task 1    |           | Not begun |
      | Task 2    |           | Not begun |
      | Group 2   |           | Not begun |
      | Task 3    |           | Not begun |
      | Task 4    |           | Not begun |

    Examples:
      | Project Name  |
      | Project 11091 |