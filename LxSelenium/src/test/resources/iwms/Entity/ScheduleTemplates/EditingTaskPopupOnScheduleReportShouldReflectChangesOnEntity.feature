@all
Feature: Editing Task Pop up on Schedule Report should reflect changes on entity (Ref : Jira Ticket No : Automation-904)

  Scenario Outline: I import file for apply schedule template script
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | ReportFieldsTesting.xml |
      | ReportSchedule.xml      |
      | ScheduleReport.xml      |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user i apply schedule template for the entity
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 12/14/2018 |
    And I click on the "Append Schedule Template" button
    Then I wait for modal window to close
    And I expand gantt chart
    And I verify the following values in "<Grid ID>":
      | name      | value        |
      | Task Name | Fields Group |
      | Status    | Not begun    |
    Examples:
      | Login User   | Login full username  | Entity Name           | Template        | Grid ID           |
      | DeleteAccess | Delete Access Access | Report Fields Testing | Report Schedule | ^Lx-ui-GanttPanel |

  Scenario Outline: As a delete user i verify the status of the tasks and group

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I verify the following values in "<Grid ID>":
      | name      | value        |
      | Task Name | Fields Group |
      | Status    | Not begun    |
    And I verify the following values in "<Grid ID>":
      | name      | value     |
      | Task Name | Task 111  |
      | Status    | Not begun |
    And I verify the following values in "<Grid ID>":
      | name      | value     |
      | Task Name | Task 222  |
      | Status    | Not begun |
    And I verify the following values in "<Grid ID>":
      | name      | value    |
      | Task Name | Task 444 |
      | Status    | Canceled |
    And I verify the following values in "<Grid ID>":
      | name      | value     |
      | Task Name | Task 333  |
      | Status    | Not begun |

    Examples:
      | Login User   | Login full username  | Entity Name           | Grid ID           |
      | DeleteAccess | Delete Access Access | Report Fields Testing | ^Lx-ui-GanttPanel |

  Scenario Outline: As a delete user i do the following
  1)I run the schedule report
  2)Make changes in the report and rerun the report
  3)I verify the changes in the report

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
#    And I navigate to "Reports"
    And I navigate to the reports dashboard
    And I click "Unspecified" button
#    And I click on the "run" row action of column "Schedule Report" of column "0" from grid "BOGridPageLayout"
#    And I click on the "run" row action of column "Schedule Report" of column "0" from grid "pageContent"
#    And I click "run" row action in the non frame grid "BOGridPageLayout" having the following header and cell values
#      | name        | value           |
#      | Report Name | Schedule Report |
    And I click on the "run" link to export the report "Schedule Report" of column "0" from grid "pageContent"

    And I switch to "report" child window
    And I verify a row from reports grid "<Grid ID>" having the following header and cell value pair
      | name                                 | value         |
      | Name                                 | <Entity Name> |
      | Task 222(Forecast/Actual End Date)   | 12/17/2018    |
      | Task 222(Forecast/Start Date)        | 12/14/2018    |
      | Task 222(Task Status)                | Not begun     |
      | Task 444 (Forecast Actual End Date)  | Canceled      |
      | Task 444(Forecast Actual/Start Date) | Canceled      |
      | Task 444(Task Status)                | Canceled      |
    And I click on "Canceled" present under colum number "5" for the "<Entity Name>"
    Then I wait for modal window to open
    And I see the "Editing Task for Report Fields Testing" on active modal window
#    And I set task Status on edit popup of a task
    And I set following fields value on editable page
      | name             | value     |
      | CodeTaskStatusID | Not begun |
#    And I click "Ok" button
#    And I click on the "Ok" button
    And I click "Ok" button

    And I click on "12/14/2018" present under colum number "3" for the "<Entity Name>"
    Then I wait for modal window to open
    And I see the "Editing Task for Report Fields Testing" on active modal window
#    And I set task Status on edit popup of a task
    And I set following fields value on editable page
      | name             | value      |
      | CodeTaskStatusID | In-process |
#    And I click "Ok" button
#    And I click on the "Ok" button
    And I click "Ok" button
    And I click on "Rerun Report" link
    And I verify a row from reports grid "<Grid ID>" having the following header and cell value pair
      | name                                 | value           |
      | Name                                 | <Entity Name>   |
      | Task 222(Forecast/Actual End Date)   | Tomorrow's Date |
      | Task 222(Forecast/Start Date)        | Today's Date    |
      | Task 222(Task Status)                | In-process      |
      | Task 444 (Forecast Actual End Date)  | 12/17/2018      |
      | Task 444(Forecast Actual/Start Date) | 12/17/2018      |
      | Task 444(Task Status)                | Not begun       |
    And I click on "<Entity Name>" link
    And I close the "report" child window
    And I switch to main window
    And I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I double click on "Task 444" task
    And I verify the following fields value on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | Not begun  |
      | ActualStartDate  | 12/17/2018 |
      | ActualEndDate    | 12/17/2018 |
    And I click "Cancel" button
    And I double click on "Task 222" task
    And I verify the following fields value on edit popup of a task
      | name             | value           |
      | CodeTaskStatusID | In-process      |
      | ActualStartDate  | Today's Date    |
      | ActualEndDate    | Tomorrow's Date |
    And I click "Cancel" button

    Examples:
      | Login User   | Login full username  | Entity Name           | Grid ID   |
      | DeleteAccess | Delete Access Access | Report Fields Testing | popupBody |

