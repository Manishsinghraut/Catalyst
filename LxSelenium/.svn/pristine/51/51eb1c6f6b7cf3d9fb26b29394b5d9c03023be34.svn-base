@all
Feature: (Ref : Jira Ticket No : Automation-1173), Schedule Spreadsheet

  Scenario Outline: I import file for apply schedule template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following files:
      | ScheduleTaskRecIDReport-1173.xml |
      | Site_Schedule_SS-1173.xml        |
      | SiteSchedulTemplate-1173.xml     |
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "Site Schedule Template" from the list
    And I assert the row position of budget line items in the grid "main"
      | Name  <Collapse All> |                         | Days After Start                       | Duration | Initial Status |
      | SS Group 1           | <Add Group>\n<Add Task> | 0                                      | 3        | Not begun      |
      | SS Group 1.1         |                         | 0                                      | 2        | Not begun      |
      | SS Group 1.2         |                         | 1                                      | 2        | Not begun      |

      | SS Group 2           | <Add Group>\n<Add Task> | 0                                      | 6        | Not begun      |
      | SS Group 2.1         |                         | -1 day(s) after 'SS Task 1.2' starts   | 2        | Not begun      |
      | SS Group 2.2         |                         | 2 day(s) after 'SS Task 1.1' completes | 2        | Not begun      |

    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following files:
      | ApplyScheduleSS-1173.xlsx |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    And I click on the "Schedule" tab
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    And I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | # | Task Name   | Assignees | Status    | % Done | F/A Start  | F/A End    | F/A Duration | Slack  | Comments | BL Start   | BL End     | Proj. Start | Proj. End  |
      | 1 | SS Group 1  |           | Not begun | 0      | 01/01/2020 | 01/03/2020 | 3 days       | 0 days |          | 01/01/2020 | 01/03/2020 | 01/01/2020  | 01/03/2020 |
      | 2 | SS Task 1.1 |           | Not begun | 0      | 01/01/2020 | 01/02/2020 | 2 days       | 0 days |          | 01/01/2020 | 01/02/2020 | 01/01/2020  | 01/02/2020 |
      | 3 | SS Task 1.2 |           | Not begun | 0      | 01/02/2020 | 01/03/2020 | 2 days       | 4 days |          | 01/02/2020 | 01/03/2020 | 01/02/2020  | 01/03/2020 |

      | 4 | SS Group 2  |           | Not begun | 0      | 01/01/2020 | 01/08/2020 | 6 days       | 4 days |          | 01/01/2020 | 01/08/2020 | 01/01/2020  | 01/08/2020 |
      | 5 | SS Task 2.2 |           | Not begun | 0      | 01/01/2020 | 01/02/2020 | 2 days       | 4 days |          | 01/01/2020 | 01/02/2020 | 01/01/2020  | 01/02/2020 |
      | 6 | SS task 2.1 |           | Not begun | 0      | 01/07/2020 | 01/08/2020 | 2 days       | 0 days |          | 01/07/2020 | 01/08/2020 | 01/07/2020  | 01/08/2020 |

    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following files:
      | CreateScheduleTask-1173.xlsx |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    And I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | Task Name   | Assignees            | Status    | % Done | F/A Start  | F/A End    | F/A Duration | Slack  | Comments | BL Start   | BL End     | Proj. Start | Proj. End  |
      | SS Task 1.3 | Delete Access Access | Not begun | 0      | 01/09/2020 | 01/10/2020 | 2 days       | 0 days |          | 01/09/2020 | 01/10/2020 | 01/09/2020  | 01/10/2020 |

    And I open new task information pop up of "SS Task 1.3" task
    And I wait for "Editing Task for <Entity Name>" modal window to open in frame page
    And I verify the following fields value on editable page
      | name               | value       |
      | TaskName           | SS Task 1.3 |
      | CodeTaskStatusID   | Not begun   |
      | ActualDuration     | 2 days      |
      | OriginalStartDate  | 01/09/2020  |
      | ProjectedStartDate | 01/09/2020  |
      | ActualStartDate    | 01/09/2020  |
      | OriginalEndDate    | 01/10/2020  |
      | ProjectedEndDate   | 01/10/2020  |
      | ActualEndDate      | 01/10/2020  |
    And I click on the "Cancel" button
    And I wait for modal window to close
    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Reports Grid ID>" having the following header and cell values
      | name        | value                      |
      | Report Name | Schedule Task RecID report |
    And I switch to "Report" child window

    And I fetch entity ID from report under header "SS Task 1.1 Rec ID" for entity "<Entity Name>"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/UpdateScheduleTask-1173.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"

    And I fetch entity ID from report under header "SS Task 1.2 Rec ID" for entity "<Entity Name>"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/UpdateScheduleTask-1173.xlsx"
    And I set cell value in spread sheet row "7" under header "LxRecID" of column index "3"

    And I fetch entity ID from report under header "SS task 2.1 Rec ID" for entity "<Entity Name>"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/UpdateScheduleTask-1173.xlsx"
    And I set cell value in spread sheet row "8" under header "LxRecID" of column index "3"

    And I fetch entity ID from report under header "SS Task 2.2 Rec ID" for entity "<Entity Name>"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/UpdateScheduleTask-1173.xlsx"
    And I set cell value in spread sheet row "9" under header "LxRecID" of column index "3"

    And I fetch current date
    And I set cell value in spread sheet row "7" under header "ActualStartDate" of column index "16"

    And I close the "Report" child window
    And I wait for browser windows count to be equal to "1"
    And I switch to main window
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following files:
      | UpdateScheduleTask-1173.xlsx |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Schedule" tab
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    And I verify the following values in frame grid "^Lx-ui-GanttPanel"
      | # | Task Name   | Assignees            | Status     | % Done | F/A Start      |
      | 1 | SS Group 1  |                      | In-process | 42     | 01/01/2016     |
      | 2 | SS Task 1.1 | Delete Access Access | Completed  | 100    | 01/01/2016     |
      | 3 | SS Task 1.2 |                      | In-process | 25     | [Today's Date] |
      | 4 | SS Task 1.3 | Delete Access Access | Not begun  | 0      | 01/09/2020     |

      | 5 | SS Group 2  |                      | Completed  | 100    | 02/01/2016     |
      | 6 | SS Task 2.1 |                      | Completed  | 100    | 02/01/2016     |
      | 7 | SS Task 2.2 |                      | Canceled   | 0      | [Duration 3]   |
    And I open new task information pop up of "SS Task 1.1" task
    And I wait for "Editing Task for <Entity Name>" modal window to open in frame page
    And I verify the following fields value on editable page
      | name             | value       |
      | TaskName         | SS Task 1.1 |
      | CodeTaskStatusID | Completed   |
      | ActualStartDate  | 01/01/2016  |
      | PercentComplete  | 100%        |

    And I click on the "Cancel" button
    And I wait for modal window to close

    And I open new task information pop up of "SS Task 1.2" task
    And I wait for "Editing Task for <Entity Name>" modal window to open in frame page
    And I verify the following fields value on editable page
      | name             | value       |
      | TaskName         | SS Task 1.2 |
      | CodeTaskStatusID | In-process  |
      | PercentComplete  | 25%         |
    And I verify F/A start date "[CURRENTDATE]"

    And I click on the "Cancel" button
    And I wait for modal window to close

    Examples:
      | Login User   | Login full username  | Entity Name      | Reports Grid ID |
      | DeleteAccess | Delete Access Access | Site Schedule SS | ^editBOGrid     |