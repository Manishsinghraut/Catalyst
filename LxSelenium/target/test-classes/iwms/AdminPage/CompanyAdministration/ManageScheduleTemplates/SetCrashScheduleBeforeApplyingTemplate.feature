@all
Feature: (Ref : Jira Ticket No : Automation-622), As a delete user I can able to Set Crash Schedule before applying the Schedule Template

  Scenario Outline: I import file for set crash schedule template script
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | BeforeScheduleTemplateApply.xml |
      | ScheduleTemplate.xml            |
      | SeleniumHolidayCalendar.xml     |


    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Set Crash Schedule before applying the Schedule Template
    When I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "<Third Level Tab>" tab
    And I click on the "Crash Schedule" action panel button
    Then I wait for modal window to open
    And I see the "Crash Schedule" modal window
    When I set following fields value on editable page
      | name              | value                          |
      | HolidayScheduleID | Entity(Crash)-Holiday Calendar |
    And I click on the "Update" button
    And I wait for modal window to close

    Examples:
      | Entity Name                 | Third Level Tab |
      | BeforeScheduleTemplateApply | Schedule        |

  Scenario Outline: As a delete user I apply Schedule Template to entity
    When I click on the "Apply Template" action panel button
    And I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startStopWhenRadio     | start      |
      | startDate              | 07/06/2020 |
    And I click on the "Append Schedule Template" button
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    Then I verify the following values in frame grid "<Grid ID>"
      | # | Task Name | Assignees | Status    | % Done | F/A Start  | F/A End    | F/A Duration | Slack  | BL Start   | BL End     |
      | 1 | Group     |           | Not begun | 0      | 07/06/2020 | 07/20/2020 | 10 days      | 5 days | 07/06/2020 | 07/20/2020 |
      | 2 | Task A    |           | Not begun | 0      | 07/06/2020 | 07/13/2020 | 5 days       | 5 days | 07/06/2020 | 07/13/2020 |
      | 3 | Task B    |           | Not begun | 0      | 07/14/2020 | 07/16/2020 | 3 days       | 0 days | 07/14/2020 | 07/16/2020 |
      | 4 | Task C    |           | Not begun | 0      | 07/20/2020 | 07/20/2020 | 1 day        | 0 days | 07/20/2020 | 07/20/2020 |


    Examples:
      | Template          | Grid ID           |
      | Schedule Template | ^Lx-ui-GanttPanel |





#@all
#Feature: (Ref : Jira Ticket No : Automation-622), As a delete user I can able to Set Crash Schedule before applying the Schedule Template
#
#  Scenario Outline: I import file for set crash schedule template script
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
#    And I import following file name:
#      | BeforeScheduleTemplateApply.xml |
#      | ScheduleTemplate.xml            |
#      | SeleniumHolidayCalendar.xml     |
#
#
#  Examples:s
#    | Login User   | Login full username  |
#    | DeleteAccess | Delete Access Access |
#
#  Scenario Outline: As a delete user I can able to Set Crash Schedule after applying the Schedule Template
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
##    When I navigate to "<Item>" entity
##    And I navigate to entity "<Entity Name>"
##    And I navigate to entity type "<Item>" named "<Entity Name>"
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    And I click on the "<Third Level Tab>" tab
#    And I click on the "Crash Schedule" action panel button
#    Then I wait for modal window to open
#    And I see the "Crash Schedule" modal window
#    When I set following fields value on editable page
#      | name              | value                          |
#      | HolidayScheduleID | Entity(Crash)-Holiday Calendar |
#    And I click on the "Update" button
#    And I wait for modal window to close
#
#  Examples:
#    | Login User   | Login full username  | Item    | Entity Name                 | Third Level Tab | Grid ID           |
#    | DeleteAccess | Delete Access Access | Project | BeforeScheduleTemplateApply | Schedule        | ^Lx-ui-GanttPanel |
#
#  Scenario Outline: As a delete user I can able to apply Schedule Template to entity
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
##    When I navigate to "<Item>" entity
##    And I navigate to entity "<Entity Name>"
##    And I navigate to entity type "<Item>" named "<Entity Name>"
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    And I click on the "<Third Level Tab>" tab
#    And I click on the "Apply Template" action panel button
#    When I set following fields value on editable page
#      | name                   | value      |
#      | taskTemplateIDToAssign | <Template> |
#      | startStopWhenRadio     | start      |
#      | startDate              | 07/06/2020 |
#    And I click on the "Append Schedule Template" button
#    And I click on the "Spreadsheet" action panel button
#    And I expand Group on task name
#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task A     |
#      | F/A Start    | 07/06/2020 |
#      | F/A End      | 07/13/2020 |
#      | F/A Duration | 5 days     |
#
#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task B     |
#      | F/A Start    | 07/13/2020 |
#      | F/A End      | 07/15/2020 |
#      | F/A Duration | 3 days     |
#
#    And I verify the following values in "<Grid ID>":
#      | name         | value      |
#      | Task Name    | Task C     |
#      | F/A Start    | 07/17/2020 |
#      | F/A End      | 07/17/2020 |
#      | F/A Duration | 1 day      |
#
#
#  Examples:
#    | Login User   | Login full username  | Item    | Entity Name                 | Third Level Tab | Template          | Grid ID           |
#    | DeleteAccess | Delete Access Access | Project | BeforeScheduleTemplateApply | Schedule        | Schedule Template | ^Lx-ui-GanttPanel |
#
#
#
