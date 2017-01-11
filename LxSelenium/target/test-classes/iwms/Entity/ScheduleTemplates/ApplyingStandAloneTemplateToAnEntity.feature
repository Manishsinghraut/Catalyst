@all
Feature: Applying a Stand alone Template to an Entity (Ref : Jira Ticket No : AUTOMATION-895)

  Scenario Outline: I import file for apply schedule template

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | s014.xml               |
      | StandAloneTemplate.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user i create a schedule template for a entity

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 12/31/2020 |
    And I click on the "Append Schedule Template" button
    Then I wait for modal window to close
    And I expand gantt chart
    And I verify the following values in "<Grid ID>":
      | name      | value     |
      | Task Name | Group 1   |
      | Status    | Not begun |
    And I verify the following values in "<Grid ID>":
      | name      | value     |
      | Task Name | Task 1    |
      | Status    | Not begun |
    And I verify the following values in "<Grid ID>":
      | name      | value     |
      | Task Name | Task 2    |
      | Status    | Not begun |

    Examples:
      | Login User   | Login full username  | Entity Name | Template             | Grid ID           |
      | DeleteAccess | Delete Access Access | s014        | Stand-alone template | ^Lx-ui-GanttPanel |

  Scenario Outline: As a delete user i verify the details of the tasks and verify that there is no task under Predecessors & Successors tab

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I double click on "Task 1" task
    And I verify the following fields value on editable page
      | name              | value      |
      | TaskName          | Task 1     |
      | PercentComplete   | 0%         |
      | ActualDuration    | 1 day      |
      | OriginalStartDate | 12/31/2020 |
      | OriginalEndDate   | 12/31/2020 |
      | ActualStartDate   | 12/31/2020 |
      | ActualEndDate     | 12/31/2020 |
    And I click on "Predecessors" tab
    Then I verify there is no tasks under "Predecessors" tab
    And I click on "Successors" tab
    Then I verify there is no tasks under "Successors" tab
    And I click "Cancel" button
    And I double click on "Task 2" task
    And I verify the following fields value on editable page
      | name              | value      |
      | TaskName          | Task 2     |
      | PercentComplete   | 0%         |
      | ActualDuration    | 1 day      |
      | OriginalStartDate | 12/31/2020 |
      | OriginalEndDate   | 12/31/2020 |
      | ActualStartDate   | 12/31/2020 |
      | ActualEndDate     | 12/31/2020 |
    And I click on "Predecessors" tab
    Then I verify there is no tasks under "Predecessors" tab
    And I click on "Successors" tab
    Then I verify there is no tasks under "Successors" tab
    And I click "Cancel" button

    Examples:
      | Login User   | Login full username  | Entity Name |
      | DeleteAccess | Delete Access Access | s014        |
