@all
Feature: (Jira Ref. : AUTOMATION-1395) Entity Report on Schedule Fields - Editable fields

  Scenario Outline: Import xmls as delete user
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/EditableReports/"
    And I import following files:
      | SuccessorProject-1395.xml              |
      | EditableReportToEditSuccessor-1395.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user Navigate to the project entity "SuccessorProject" and verify that a schedule is populated on the schedule tab
    When I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Schedule" tab
    And I expand gantt chart
    And I verify the following values in "<Grid ID>":
      | name      | value   |
      | Task Name | Group 1 |
    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value                         |
      | Report Name | EditableReportToEditSuccessor |
    And I switch to "Reports" child window
    And I verify the following values in non frame grid
      | Name             | Group 1- F/A Start Date | Group 1- F/A End Date | Predecessor 1- F/A Start/End | Successor 1- F/A Start/End |
      | SuccessorProject | 12/31/2020              | 01/08/2021            | 12/31/2020                   | 01/08/2021                 |
    And I click on "01/08/2021" present under colum number "5" for the "<Entity Name>"
    And I verify the following fields value on editable page
      | name            | value       |
      | TaskName        | Successor 1 |
      | ActualStartDate | 01/08/2021  |
      | ActualEndDate   | 01/08/2021  |
    Then I set following fields value on editable page
      | name            | value      |
      | ActualStartDate | 01/11/2021 |
      | ActualEndDate   | 01/11/2021 |
    And I click "Ok" button
    And I wait for the Loading text to disappear in grid
    And I click on "Rerun Report" link
    And I verify the following values in non frame grid
      | Name             | Group 1- F/A Start Date | Group 1- F/A End Date | Predecessor 1- F/A Start/End | Successor 1- F/A Start/End |
      | SuccessorProject | 12/31/2020              | 01/11/2021            | 12/31/2020                   | 01/11/2021                 |

    And I click on "<Entity Name>" link
    And I wait for the Loading text to disappear in grid
    And I close the "Reports" child window
    And I wait for browser windows count to be equal to "1"
    Then I switch to main window

    And I click on the "Schedule" tab
    And I expand gantt chart
    And I open new task information pop up of "Successor 1" task
    And I verify the following fields value on editable page
      | name            | value       |
      | TaskName        | Successor 1 |
      | ActualStartDate | 01/11/2021  |
      | ActualEndDate   | 01/11/2021  |


    Examples:
      | Entity Name      | Grid ID           |
      | SuccessorProject | ^Lx-ui-GanttPanel |