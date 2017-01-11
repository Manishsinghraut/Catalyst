@all
Feature: (Ref : Jira Ticket No : Automation-871),Edit a Task

  Scenario Outline: I import file for apply schedule template script
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | NovemberScheduleTemplate.xml |
#      | s007-871.xml                 |
      | Spreadsheet-s007-871.xml     |
      | Bars-s007-871.xml            |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As an Edit user I can able to edit task in gantt view
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Locations" named "<Entity Name>" through search option
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 11/01/2030 |
    And I click on the "Append Schedule Template" button
    And I wait for modal window to close
    And I expand gantt chart
    And I open new task information pop up of "Submit required forms" task
    And I set following spin button fields values on editable page
      | name           | value |
      | ActualDuration | 1     |
    And I check for complete frame 'loading...'
    And I verify the following fields value on editable page
      | name          | value      |
      | ActualEndDate | 11/04/2030 |
    And I click "Ok" button
    And I click on the "Save Changes" action panel button
    And I verify the following values in "^Lx-ui-GanttPanel":
      | name         | value                 |
      | Task Name    | Submit required forms |
      | F/A Duration | 2 days                |
    And I verify the extended yellow and blue bar

    Examples:
      | Login User | Login full username | Entity Name | Template          |
      | EditAccess | Edit Access Access  | s007-871    | November Schedule |


  Scenario Outline: As an Edit user I can able to edit task in spreadsheet view
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Locations" named "<Entity Name>" through search option
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 11/01/2030 |
    And I click on the "Append Schedule Template" button
    And I wait for modal window to close
    And I click on the "Spread Sheet" action panel button
    And I expand gantt chart
    And I open new task information pop up of "Submit required forms" task
    And I set following spin button fields values on editable page
      | name           | value |
      | ActualDuration | 1     |
    And I check for complete frame 'loading...'
    And I verify the following fields value on editable page
      | name          | value      |
      | ActualEndDate | 11/04/2030 |
    And I click "Ok" button
    And I click on the "Save Changes" action panel button
    And I verify the following values in "^Lx-ui-GanttPanel":
      | name         | value                 |
      | Task Name    | Submit required forms |
      | F/A Duration | 2 days                |

    Examples:
      | Login User | Login full username | Entity Name          |  Template          |
      | EditAccess | Edit Access Access  | Spreadsheet-s007-871 |  November Schedule |


  Scenario Outline: As an Edit user I can able to edit task in taskbar/timeline view
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Locations" named "<Entity Name>" through search option
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 11/01/2030 |
    And I click on the "Append Schedule Template" button
    And I wait for modal window to close
    And I expand gantt chart
    And I Right click on the 1 "st" blue bar "Submit required forms" task on the bar graph/timeline and click "Task information..." to edit the task
    And I set following spin button fields values on editable page
      | name           | value |
      | ActualDuration | 1     |
    And I check for complete frame 'loading...'
    And I verify the following fields value on editable page
      | name          | value      |
      | ActualEndDate | 11/04/2030 |
    And I click "Ok" button
    And I click on the "Save Changes" action panel button
    And I verify the following values in "^Lx-ui-GanttPanel":
      | name         | value                 |
      | Task Name    | Submit required forms |
      | F/A Duration | 2 days                |

    Examples:
      | Login User | Login full username | Entity Name   | Template          |
      | EditAccess | Edit Access Access  | Bars-s007-871 | November Schedule |


