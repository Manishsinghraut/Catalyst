@all
Feature:  (Ref : Jira Ticket No : AUTOMATION-621) As a Delete user I Applying Crash Schedule to Entity - Work Weekend and Work Holiday Options

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | SeleniumHolidayCalendar.xml |
      | ScheduleTemplate.xml        |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline:I Applying Crash Schedule to Entity - Work Weekend and Work Holiday Unchecked
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" sub tab
    And I click on the "Crash Schedule" action panel button
    Then I set following fields value on editable page
      | name                   | value           |
      | HolidayScheduleID      | <Calender Name> |
      | _checkbox_WorkHolidays | <Work Holidays> |
      | _checkbox_WorkWeekends | <Work Weekends> |
    And I click on the "Update" button
    And I wait for modal window to close
    And I click on the "Apply Template" action panel button
    Then I set following fields value on editable page
      | name                   | value               |
      | taskTemplateIDToAssign | <Schedule Template> |
      | startStopWhenRadio     | start               |
      | startDate              | 07/06/2020          |
    And I click on the "Append Schedule Template" button
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    Then I verify the following values in frame grid "<Grid ID>"
      | # | Task Name | Assignees | Status    | % Done | F/A Start  | F/A End    | F/A Duration | Slack  | BL Start   | BL End     |
      | 1 | Group     |           | Not begun | 0      | 07/06/2020 | 07/20/2020 | 10 days      | 5 days | 07/06/2020 | 07/20/2020 |
      | 2 | Task A    |           | Not begun | 0      | 07/06/2020 | 07/13/2020 | 5 days       | 5 days | 07/06/2020 | 07/13/2020 |
      | 3 | Task B    |           | Not begun | 0      | 07/14/2020 | 07/16/2020 | 3 days       | 0 days | 07/14/2020 | 07/16/2020 |
      | 4 | Task C    |           | Not begun | 0      | 07/20/2020 | 07/20/2020 | 1 day        | 0 days | 07/20/2020 | 07/20/2020 |

#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task A     |
#      | F/A Start    | 07/06/2020 |
#      | F/A End      | 07/13/2020 |
#      | F/A Duration | 5 days     |
#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task B     |
#      | F/A Start    | 07/13/2020 |
#      | F/A End      | 07/15/2020 |
#      | F/A Duration | 3 days     |
#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task C     |
#      | F/A Start    | 07/17/2020 |
#      | F/A End      | 07/17/2020 |
#      | F/A Duration | 1 day      |
    And I verify the project schedule
      | name               | value |
      | Project start date | 07/06 |
    And 3 bars of Weekends and the Holiday dates on the Gantt should show in a darker shade of Grey
    And I click on the "Delete Schedule" action panel button
    Then I wait for "Confirm Delete" modal window to open in non frame page
    And I click on the "Yes" button
    And I wait for the Loading text to disappear
    Then I see "No schedule information found" message in the header

    Examples:
      | Login User   | Login full username  | Calender Name                  | Schedule Template | Work Holidays | Work Weekends | Entity Name      | Secondary Tab | Third Level Tab | Grid ID           |
      | DeleteAccess | Delete Access Access | Entity(Crash)-Holiday Calendar | Schedule Template | false         | false         | Lucernex-Project | Details       | Schedule        | ^Lx-ui-GanttPanel |


  Scenario Outline:I Applying Crash Schedule to Entity - Work Weekend Unchecked and Work Holiday checked
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" sub tab
    And I click on the "Crash Schedule" action panel button
    Then I set following fields value on editable page
      | name                   | value           |
      | HolidayScheduleID      | <Calender Name> |
      | _checkbox_WorkHolidays | <Work Holidays> |
      | _checkbox_WorkWeekends | <Work Weekends> |
    And I click on the "Update" button
    And I wait for modal window to close
    And I click on the "Apply Template" action panel button
    Then I set following fields value on editable page
      | name                   | value               |
      | taskTemplateIDToAssign | <Schedule Template> |
      | startStopWhenRadio     | start               |
      | startDate              | 07/06/2020          |
    And I click on the "Append Schedule Template" button
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    Then I verify the following values in frame grid "<Grid ID>"
      | # | Task Name | Assignees | Status    | % Done | F/A Start  | F/A End    | F/A Duration | Slack  | BL Start   | BL End     |
      | 1 | Group     |           | Not begun | 0      | 07/06/2020 | 07/17/2020 | 10 days      | 5 days | 07/06/2020 | 07/17/2020 |
      | 2 | Task A    |           | Not begun | 0      | 07/06/2020 | 07/10/2020 | 5 days       | 5 days | 07/06/2020 | 07/10/2020 |
      | 3 | Task B    |           | Not begun | 0      | 07/13/2020 | 07/15/2020 | 3 days       | 0 days | 07/13/2020 | 07/15/2020 |
      | 4 | Task C    |           | Not begun | 0      | 07/17/2020 | 07/17/2020 | 1 day        | 0 days | 07/17/2020 | 07/17/2020 |

#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task A     |
#      | F/A Start    | 07/06/2020 |
#      | F/A End      | 07/10/2020 |
#      | F/A Duration | 5 days     |
#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task B     |
#      | F/A Start    | 07/13/2020 |
#      | F/A End      | 07/15/2020 |
#      | F/A Duration | 3 days     |
#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task C     |
#      | F/A Start    | 07/17/2020 |
#      | F/A End      | 07/17/2020 |
#      | F/A Duration | 1 day      |
    And I verify the project schedule
      | name               | value |
      | Project start date | 07/06 |
    And 3 bars of Weekends and the Holiday dates on the Gantt should show in a darker shade of Grey
    And I click on the "Delete Schedule" action panel button
    Then I wait for "Confirm Delete" modal window to open in non frame page
    And I click on the "Yes" button
    And I wait for the Loading text to disappear
    Then I see "No schedule information found" message in the header

    Examples:
      | Login User   | Login full username  | Calender Name                  | Schedule Template | Work Holidays | Work Weekends | Entity Name      | Secondary Tab | Third Level Tab | Grid ID           |
      | DeleteAccess | Delete Access Access | Entity(Crash)-Holiday Calendar | Schedule Template | true          | false         | Lucernex-Project | Details       | Schedule        | ^Lx-ui-GanttPanel |

  Scenario Outline:I Applying Crash Schedule to Entity - Work Weekend is checked and Work Holiday is unchecked
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" sub tab
    And I click on the "Crash Schedule" action panel button
    Then I set following fields value on editable page
      | name                   | value           |
      | HolidayScheduleID      | <Calender Name> |
      | _checkbox_WorkHolidays | <Work Holidays> |
      | _checkbox_WorkWeekends | <Work Weekends> |
    And I click on the "Update" button
    And I wait for modal window to close
    And I click on the "Apply Template" action panel button
    Then I set following fields value on editable page
      | name                   | value               |
      | taskTemplateIDToAssign | <Schedule Template> |
      | startStopWhenRadio     | start               |
      | startDate              | 07/06/2020          |
    And I click on the "Append Schedule Template" button
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    Then I verify the following values in frame grid "<Grid ID>"
      | # | Task Name | Assignees | Status    | % Done | F/A Start  | F/A End    | F/A Duration | Slack  | BL Start   | BL End     |
      | 1 | Group     |           | Not begun | 0      | 07/06/2020 | 07/16/2020 | 10 days      | 5 days | 07/06/2020 | 07/16/2020 |
      | 2 | Task A    |           | Not begun | 0      | 07/06/2020 | 07/11/2020 | 5 days       | 5 days | 07/06/2020 | 07/11/2020 |
      | 3 | Task B    |           | Not begun | 0      | 07/12/2020 | 07/14/2020 | 3 days       | 0 days | 07/12/2020 | 07/14/2020 |
      | 4 | Task C    |           | Not begun | 0      | 07/16/2020 | 07/16/2020 | 1 day        | 0 days | 07/16/2020 | 07/16/2020 |

#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task A     |
#      | F/A Start    | 07/06/2020 |
#      | F/A End      | 07/11/2020 |
#      | F/A Duration | 5 days     |
#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task B     |
#      | F/A Start    | 07/13/2020 |
#      | F/A End      | 07/15/2020 |
#      | F/A Duration | 3 days     |
#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task C     |
#      | F/A Start    | 07/17/2020 |
#      | F/A End      | 07/17/2020 |
#      | F/A Duration | 1 day      |
    And I verify the project schedule
      | name               | value |
      | Project start date | 07/06 |
    And 3 bars of Weekends and the Holiday dates on the Gantt should show in a darker shade of Grey
    And I click on the "Delete Schedule" action panel button
    Then I wait for "Confirm Delete" modal window to open in non frame page
    And I click on the "Yes" button
    And I wait for the Loading text to disappear
    Then I see "No schedule information found" message in the header

    Examples:
      | Login User   | Login full username  | Calender Name                  | Schedule Template | Work Holidays | Work Weekends | Entity Name      | Secondary Tab | Third Level Tab | Grid ID           |
      | DeleteAccess | Delete Access Access | Entity(Crash)-Holiday Calendar | Schedule Template | false         | true          | Lucernex-Project | Details       | Schedule        | ^Lx-ui-GanttPanel |


  Scenario Outline:I Applying Crash Schedule to Entity - Work Weekend and Work Holiday are both checked
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" sub tab
    And I click on the "Crash Schedule" action panel button
    Then I set following fields value on editable page
      | name                   | value           |
      | HolidayScheduleID      | <Calender Name> |
      | _checkbox_WorkHolidays | <Work Holidays> |
      | _checkbox_WorkWeekends | <Work Weekends> |
    And I click on the "Update" button
    And I wait for modal window to close
    And I click on the "Apply Template" action panel button
    Then I set following fields value on editable page
      | name                   | value               |
      | taskTemplateIDToAssign | <Schedule Template> |
      | startStopWhenRadio     | start               |
      | startDate              | 07/06/2020          |
    And I click on the "Append Schedule Template" button
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    Then I verify the following values in frame grid "<Grid ID>"
      | # | Task Name | Assignees | Status    | % Done | F/A Start  | F/A End    | F/A Duration | Slack  | BL Start   | BL End     |
      | 1 | Group     |           | Not begun | 0      | 07/06/2020 | 07/15/2020 | 10 days      | 5 days | 07/06/2020 | 07/15/2020 |
      | 2 | Task A    |           | Not begun | 0      | 07/06/2020 | 07/10/2020 | 5 days       | 5 days | 07/06/2020 | 07/10/2020 |
      | 3 | Task B    |           | Not begun | 0      | 07/11/2020 | 07/13/2020 | 3 days       | 0 days | 07/11/2020 | 07/13/2020 |
      | 4 | Task C    |           | Not begun | 0      | 07/15/2020 | 07/15/2020 | 1 day        | 0 days | 07/15/2020 | 07/15/2020 |

#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task A     |
#      | F/A Start    | 07/06/2020 |
#      | F/A End      | 07/10/2020 |
#      | F/A Duration | 5 days     |
#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task B     |
#      | F/A Start    | 07/13/2020 |
#      | F/A End      | 07/15/2020 |
#      | F/A Duration | 3 days     |
#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task C     |
#      | F/A Start    | 07/17/2020 |
#      | F/A End      | 07/17/2020 |
#      | F/A Duration | 1 day      |
    And I verify the project schedule
      | name               | value |
      | Project start date | 07/06 |
    And 3 bars of Weekends and the Holiday dates on the Gantt should show in a darker shade of Grey
    And I click on the "Delete Schedule" action panel button
    Then I wait for "Confirm Delete" modal window to open in non frame page
    And I click on the "Yes" button
    And I wait for the Loading text to disappear
    Then I see "No schedule information found" message in the header

    Examples:
      | Login User   | Login full username  | Calender Name                  | Schedule Template | Work Holidays | Work Weekends | Entity Name      | Secondary Tab | Third Level Tab | Grid ID           |
      | DeleteAccess | Delete Access Access | Entity(Crash)-Holiday Calendar | Schedule Template | true          | true          | Lucernex-Project | Details       | Schedule        | ^Lx-ui-GanttPanel |