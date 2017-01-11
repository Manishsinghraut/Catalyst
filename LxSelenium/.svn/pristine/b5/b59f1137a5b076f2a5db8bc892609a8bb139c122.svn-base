@all
Feature: (Ref : Jira Ticket No : Automation-1472), Create an Empty Schedule/Delete an Empty Schedule

  Scenario Outline: Create an Empty Schedule/Delete an Empty Schedule

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following files:
      | Portfolio_00020Location_00020-1472.xml |
      | Project_15830-1472.xml                 |
    And I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Schedule" tab
    And I wait for the Loading text to disappear
    Then I see "No schedule information found" message in the header
    And I click on the button contains text "Create Empty Schedule"
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    Then I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | # | Task Name | Assignees | Status    | % Done | F/A Start      | F/A End        | F/A Duration | Slack  | Comments | BL Start       | BL End         | Proj. Start    | Proj. End      |
      | 1 | Group 1   |           | Not begun | 0      | [Today's Date] | [Today's Date] | 1 day        | 0 days |          | [Today's Date] | [Today's Date] | [Today's Date] | [Today's Date] |
      | 2 | Task 1    |           | Not begun | 0      | [Today's Date] | [Today's Date] | 1 day        | 0 days |          | [Today's Date] | [Today's Date] | [Today's Date] | [Today's Date] |
    And I click on the "Delete Schedule" action panel button
    Then I wait for "Confirm Delete" modal window to open in non frame page
    And I click on the "Yes" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear
    Then I see "No schedule information found" message in the header
    And I verify the following text in a page
      | Create Empty Schedule |


    Examples:
      | Login User   | Login full username  | Entity Name   |
      | DeleteAccess | Delete Access Access | Project 15830 |