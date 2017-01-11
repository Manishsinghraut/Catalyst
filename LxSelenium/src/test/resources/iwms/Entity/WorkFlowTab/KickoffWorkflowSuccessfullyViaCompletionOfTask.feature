@all
Feature: (Jira Ref: Automation-1433) Kickoff Workflow successfully via Completion of Task

  Scenario Outline: As a delete user I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
       When I used data files from "Data/ImportDataFiles/iwms/Entity/WorkFlowTab/"
    And I import following files:
      | Portfolio_00020AndLocation_00020-1433.xml |
      | Project_23-1433.xml                       |
      | 23ScheduleTemplate-1433.xml               |
      | 23WFTemplate-1433.xml                     |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I verify work flows
    Given I navigate to the admin dashboard
    And I click on "Manage Work Flows" link
    And I click "edit" row action in the non frame grid "<WF Grid>" having the following header and cell values
      | name           | value            |
      | Work Flow name | <Work Flow name> |
    And I wait for "Edit Work Flow  ***Required fields in red" modal window to open in non frame page
    And I verify the following radio under section "completionradio"
      | name                 | value |
      | Completion of a task | true  |
    And I verify the following fields value on editable page
      | name     | value   |
      | TaskName | Task23A |
    And I click on the "Cancel" button
    And I wait for modal window to close

    When I click "edit" action of "Step 1" sub row in the grid "<WF Grid>"
    And I wait for "Edit Step  ***Required fields in red" modal window to open in non frame page
    Then I verify the following fields value on editable page
      | name     | value   |
      | TaskName | Task23B |
    And I click on the "Cancel" button
    And I wait for modal window to close


    Examples:
      | WF Grid                | Work Flow name |
      | BOGridWorkFlowTemplate | WF23           |


  Scenario Outline: I verify schedule template
    Given I navigate to the admin dashboard
    And I click on "Manage Schedule Templates" link
    And I click on "Template Details" link
    And I select template "<Template name>" from the list
    And I wait for the Loading text to disappear in grid
    And I click on "Task23B (WF)" link
    Then I wait for "Task Detail" modal window to open in non frame page
    And I set following fields value on editable page
      | name                       | value         |
      | AssigneeTypeList_available | Delete Access |
    And I click on ">>" Button
    And I click on the "Update" button
    Then I wait for modal window to close

    And I click on "Task23A" link
    Then I wait for "Task Detail" modal window to open in non frame page
    And I set following fields value on editable page
      | name                       | value         |
      | AssigneeTypeList_available | Delete Access |
    And I click on ">>" Button
    And I click on the "Update" button
    Then I wait for modal window to close
    And I verify the following values in non frame grid
      | Name   <Collapse All> | Notifications |
      | Task23A               | Delete Access |
      | Task23B (WF)          | Delete Access |


    Examples:
      | Template name |
      | 23Template    |

  Scenario Outline: When workflow step "Step 1" is completed successfully all the task and group on the schedule tab shall display a status of completed.
    And I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Members/Contacts" tab
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name                 | Title         | Phone        | Email              | Employer | Job Function         | User Class    |
      | Broker | Delete Access Access | Delete Access | 456.236.3698 | svcQA@lucernex.com | Lucernex | System Administrator | Delete Access |

    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    And I wait for "Apply Schedule Template" modal window to open in non frame page
    And I set following fields value on editable page
      | name                   | value           |
      | taskTemplateIDToAssign | <Template name> |
      | startDate              | 12/31/2020      |
    And I click on the "Append Schedule Template" button
    And I wait for modal window to close
    And I expand gantt chart
    And I open new task information pop up of "Task23A" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    Then I verify the following fields value on editable page
      | name            | value          |
      | ActualStartDate | [CURRENT DATE] |
      | ActualEndDate   | [CURRENT DATE] |
    And I click on the "Ok" button

    And I click on the "Work Flow" tab
    And I switch to visible frame
    And I click on button contains text "Expand All"
    And I click on "Step 1" link
    And I verify the following fields value on editable page
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    Then I verify the following fields value on editable page
      | name            | value          |
      | ActualStartDate | [CURRENT DATE] |
      | ActualEndDate   | [CURRENT DATE] |
    And I click on the "Ok" button

    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name       | value        |
      | statusType | Closed Items |
    Then I verify the following values in frame grid "<WorkFlow Grid ID>"
      | Name | Title | Status | Days Open | Begun          | Completed      | Active Step | Due Date | Current Assignee | Current Approver |
      | WF23 |       | CLOSED | 0         | [Today's Date] | [Today's Date] |             |          |                  |                  |
    And I click on the "Schedule" tab
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    Then I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | Task Name    | Assignees            | Status    | % Done | F/A Start      | F/A End        |
      | Group23      |                      | Completed | 100    | [Today's Date] | [Today's Date] |
      | Task23A      | Delete Access Access | Completed | 100    | [Today's Date] | [Today's Date] |
      | Task23B (WF) | Delete Access Access | Completed | 100    | [Today's Date] | [Today's Date] |


    Examples:
      | Project Name | Template name | WorkFlow Grid ID       |
      | Project 23   | 23Template    | BOGridLX_Grid_WorkFlow |
