@all
Feature: (Ref : Jira Ticket No : Automation-896) Edit schedule task from Report and Dashboard

  Scenario Outline: Import the following xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Schedule/"
    And I import following file name:
      | s016-896.xml   |
      | TaskReport.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete I Editing schedule task from report
    When I navigate to the reports dashboard
    And I click on "run" row action in the grid "^editBOGrid" having the following header "Report Name" and cell value "Task report"
      | name           | value  |
      | Description    |        |
      | Report Type    | Entity |
      | Saved for?     | All    |
      | Scheduled Jobs |        |
#      | Created By     | <Login full username> |
    And I switch to "report" child window
    And I verify that "s016-Automation-896" entity exists under the name column with "Task 1 FA Start Date" "12/31/2020" , "Task FA End Date" "12/31/2020", "Task 1 FA Duration" "1", "Task2 FA Start Date" "12/31/2020", "Task2 FA End Date" "12/31/2020", "Task2 FA Duration" "1" for the fields
    And I click the date "12/31/2020" for "Task 1- F/A Start Date" field to open task information pop-up
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button
    And I close report window
    And I switch to main window
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I open new task information pop up of "Task 1" task
    And I verify the following fields value on editable page
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I verify F/A start date "[CURRENTDATE]"
    And I verify F/A end date "[CURRENTDATE]"
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name         |
      | DeleteAccess | Delete Access Access | s016-Automation-896 |


  Scenario Outline: As a delete I Editing schedule task from dashboard
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I open new task information pop up of "Task 2" task
    And I click on "Assignees" tab of editing task pop-up window
    And I enter assignee name "Delete Access Access"
    And I click "Ok" button

    And I open new task information pop up of "Task 2" task
    And I change the Forecast/Actual "Start date" to 3 working days from todays date
    And I change the Forecast/Actual "End date" to 3 working days from todays date
    And I click "Ok" button

    And I switch to default frame
    And I navigate to dashboard page
    And I expand portfolio navigation tab
    And I Drag and Drop module "My Activities"
#    And I click "Task 2" link "My activities window"
    And I click on "Task 2" link
    And I wait for "Editing Task for s016-Automation-896" modal window to open in non frame page
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button
    And I close My activities window from dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    And I verify the following values in "<Grid ID>":
      | name         | value          |
      | Task Name    | Task 2         |
      | F/A Start    | [CURRENT DATE] |
      | F/A End      | [CURRENT DATE] |
      | F/A Duration | 1 day          |
      | Status       | In-process     |
      | % Done       | 0              |

    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name         | Grid ID           |
      | DeleteAccess | Delete Access Access | s016-Automation-896 | ^Lx-ui-GanttPanel |