@all
Feature: (Ref : Jira Ticket No : Automation-623), As a delete user I can able to Set Crash Schedule after applying the Schedule Template

  Scenario Outline: I import file for set crash schedule template script
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | SeleniumHolidayCalendar-623.xml |
      | CrashPortfolio_10883-623.xml    |
      | CrashProject_10883-623.xml      |
      | ScheduleTemplate-623.xml        |

    Examples:s
      | Login User | Login full username |
      | LxSelenium | Selenium Tester     |

  Scenario Outline:I Navigate to portfolio for setting holiday calendar at portfolio level
    When I navigate to entity type "Portfolios" named "<Portfolio Name>" through search option
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "Summary Page For Portfolio Level Calender" page layout from dropdown
    And I click on the "Edit" action panel button
    And I select Default Holiday Schedule "Portfolio-Holiday Calendar"
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear

    Examples:
      | Portfolio Name       | Secondary Tab | Third Level Tab |
      | CrashPortfolio-10883 | Details       | Summary         |


  Scenario Outline: As a delete user I apply Schedule Template to entity
    When I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "<Third Level Tab>" tab
    And I click on the "Apply Template" action panel button
    And I wait for "Apply Schedule Template" modal window to open in non frame page
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startStopWhenRadio     | start      |
      | startDate              | 07/06/2020 |
    And I click on the "Append Schedule Template" button
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    Then I verify the following values in frame grid "<Grid ID>"
      | # | Task Name | Assignees | Status    | % Done | F/A Start  | F/A End    | F/A Duration | Slack  | BL Start   | BL End     |
      | 1 | Group     |           | Not begun | 0      | 07/06/2020 | 07/21/2020 | 10 days      | 5 days | 07/06/2020 | 07/21/2020 |
      | 2 | Task A    |           | Not begun | 0      | 07/06/2020 | 07/14/2020 | 5 days       | 5 days | 07/06/2020 | 07/14/2020 |
      | 3 | Task B    |           | Not begun | 0      | 07/15/2020 | 07/17/2020 | 3 days       | 0 days | 07/15/2020 | 07/17/2020 |
      | 4 | Task C    |           | Not begun | 0      | 07/21/2020 | 07/21/2020 | 1 day        | 0 days | 07/21/2020 | 07/21/2020 |


    Examples:
      | Project Name       | Third Level Tab | Template          | Grid ID           |
      | CrashProject-10883 | Schedule        | Schedule Template | ^Lx-ui-GanttPanel |


  Scenario Outline: As a delete user I can able to Set Crash Schedule after applying the Schedule Template
    When I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "<Third Level Tab>" sub tab
    And I click on the "Crash Schedule" action panel button
    And I wait for "Crash Schedule" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name              | value                      |
      | HolidayScheduleID | Portfolio-Holiday Calendar |

    When I set following fields value on editable page
      | name              | value                          |
      | HolidayScheduleID | Entity(Crash)-Holiday Calendar |
    And I click on the "Update" button
    And I wait for modal window to close
    And I click on the "Spreadsheet" action panel button
    And I expand gantt chart
    Then I verify the following values in frame grid "<Grid ID>"
      | # | Task Name | Assignees | Status    | % Done | F/A Start  | F/A End    | F/A Duration | Slack  | BL Start   | BL End     |
      | 1 | Group     |           | Not begun | 0      | 07/06/2020 | 07/21/2020 | 11 days      | 6 days | 07/06/2020 | 07/21/2020 |
      | 2 | Task A    |           | Not begun | 0      | 07/06/2020 | 07/13/2020 | 5 days       | 6 days | 07/06/2020 | 07/13/2020 |
      | 3 | Task B    |           | Not begun | 0      | 07/15/2020 | 07/17/2020 | 3 days       | 0 days | 07/15/2020 | 07/17/2020 |
      | 4 | Task C    |           | Not begun | 0      | 07/21/2020 | 07/21/2020 | 1 day        | 0 days | 07/21/2020 | 07/21/2020 |


    Examples:
      | Project Name       | Third Level Tab | Grid ID           |
      | CrashProject-10883 | Schedule        | ^Lx-ui-GanttPanel |






#@all
#Feature: (Ref : Jira Ticket No : Automation-623), As a delete user I can able to Set Crash Schedule after applying the Schedule Template
#
#  Scenario Outline: I import file for set crash schedule template script
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
#    And I import following file name:
#      | ScheduleTemplate.xml                     |
#      | SeleniumHolidayCalendar.xml              |
#      | SummaryPageForPortfolioLevelCalender.xml |
#      | AfterScheduleTemplateApply.xml           |
#
#    Examples:s
#      | Login User | Login full username |
#      | LxSelenium | Selenium Tester     |
#
#  Scenario Outline:I Navigate to portfolio for setting holiday calendar at portfolio level
#    When I navigate to entity type "Portfolios" named "<Entity Name>" through search option
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I select "Summary Page For Portfolio Level Calender" page layout from dropdown
#    And I click on the "Edit" action panel button
#    And I select Default Holiday Schedule "Portfolio-Holiday Calendar"
#    And I click on the "Save Changes" action panel button
#    And I wait for the Loading text to disappear
#
#    Examples:
#      | Entity Name            | Secondary Tab | Third Level Tab |
#      | Calender Portfolio-623 | Details       | Summary         |
#
#
#  Scenario Outline: As a delete user I apply Schedule Template to entity
#    When I navigate to entity type "Locations" named "<Entity Name>" through search option
#    And I click on the "<Third Level Tab>" sub tab
#    And I click on the "Apply Template" action panel button
#    And I wait for "Apply Schedule Template" modal window to open in non frame page
#    When I set following fields value on editable page
#      | name                   | value      |
#      | taskTemplateIDToAssign | <Template> |
#      | startStopWhenRadio     | start      |
#      | startDate              | 07/06/2020 |
#    And I click on the "Append Schedule Template" button
#    And I click on the "Spreadsheet" action panel button
#    And I expand gantt chart
#    Then I verify the following values in frame grid "<Grid ID>"
#      | # | Task Name | Assignees | Status    | % Done | F/A Start  | F/A End    | F/A Duration | Slack  | BL Start   | BL End     |
#      | 1 | Group     |           | Not begun | 0      | 07/06/2020 | 07/17/2020 | 10 days      | 5 days | 07/06/2020 | 07/17/2020 |
#      | 2 | Task A    |           | Not begun | 0      | 07/06/2020 | 07/10/2020 | 5 days       | 5 days | 07/06/2020 | 07/10/2020 |
#      | 3 | Task B    |           | Not begun | 0      | 07/13/2020 | 07/15/2020 | 3 days       | 0 days | 07/13/2020 | 07/15/2020 |
#      | 4 | Task C    |           | Not begun | 0      | 07/17/2020 | 07/17/2020 | 1 day        | 0 days | 07/17/2020 | 07/17/2020 |
#
#
#    Examples:
#      | Entity Name                | Third Level Tab | Template          | Grid ID           |
#      | AfterScheduleTemplateApply | Schedule        | Schedule Template | ^Lx-ui-GanttPanel |
#
#
#  Scenario Outline: As a delete user I can able to Set Crash Schedule after applying the Schedule Template
#    When I navigate to entity type "Locations" named "<Entity Name>" through search option
#    And I click on the "<Third Level Tab>" sub tab
#    And I click on the "Crash Schedule" action panel button
#    And I wait for "Crash Schedule" modal window to open in non frame page
#    And I verify the following fields value on editable page
#      | name              | value                      |
#      | HolidayScheduleID | Portfolio-Holiday Calendar |
#
#    When I set following fields value on editable page
#      | name              | value                          |
#      | HolidayScheduleID | Entity(Crash)-Holiday Calendar |
#    And I click on the "Update" button
#    And I wait for modal window to close
#    And I click on the "Spreadsheet" action panel button
#    And I expand gantt chart
#    Then I verify the following values in frame grid "<Grid ID>"
#      | # | Task Name | Assignees | Status    | % Done | F/A Start  | F/A End    | F/A Duration | Slack  | BL Start   | BL End     |
#      | 1 | Group     |           | Not begun | 0      | 07/06/2020 | 07/17/2020 | 9 days       | 4 days | 07/06/2020 | 07/17/2020 |
#      | 2 | Task A    |           | Not begun | 0      | 07/06/2020 | 07/13/2020 | 5 days       | 4 days | 07/06/2020 | 07/13/2020 |
#      | 3 | Task B    |           | Not begun | 0      | 07/13/2020 | 07/15/2020 | 3 days       | 0 days | 07/13/2020 | 07/15/2020 |
#      | 4 | Task C    |           | Not begun | 0      | 07/17/2020 | 07/17/2020 | 1 day        | 0 days | 07/17/2020 | 07/17/2020 |
#
#    Examples:
#      | Entity Name                | Third Level Tab | Grid ID           |
#      | AfterScheduleTemplateApply | Schedule        | ^Lx-ui-GanttPanel |

#@all
#Feature: (Ref : Jira Ticket No : Automation-623), As a delete user I can able to Set Crash Schedule after applying the Schedule Template
#
#  Scenario Outline: I import file for set crash schedule template script
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
#    And I import following file name:
#      | ScheduleTemplate.xml                     |
#      | SeleniumHolidayCalendar.xml              |
#      | SummaryPageForPortfolioLevelCalender.xml |
#      | AfterScheduleTemplateApply.xml           |
#
#    Examples:s
#      | Login User | Login full username |
#      | LxSelenium | Selenium Tester     |
#
#  Scenario Outline:I Navigate to protfolio for setting holiday calendar at portfolio level
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Third Level Tab>" sub tab
#    And I select an option "Summary Page For Portfolio Level Calender"
#    And I click on the "Edit" action panel button
#    And I select Default Holiday Schedule "Portfolio-Holiday Calendar"
#    And I click on the "Save Changes" action panel button
#    And I wait for the Loading text to disappear
#
#    Examples:
#      | Login User   | Login full username  | Entity Name            | Secondary Tab | Third Level Tab |
#      | DeleteAccess | Delete Access Access | Calender Portfolio-623 | Details       | Summary         |
#
#
##  Scenario Outline: As a delete user I make sure Do not set a Crash schedule on the Entity.It can default to the Holiday calendar set at Firm or Portfolio level.
##    Given I Login to IWMS using "<Login User>" access credentials
##    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
##    And I navigate to the admin dashboard
##    And I click on the "Manage Company" link
##    And I set following fields value on editable page
##      | name                     | value           |
##      | DefaultHolidayScheduleID | <Calender Name> |
##    And I verify the following fields value on editable page
##      | name                     | value           |
##      | DefaultHolidayScheduleID | <Calender Name> |
##
##    And I click on "Update" Button
##    And I see "Successfully updated Company" message in the header
##
##    Examples:
##      | Login User   | Login full username  | Calender Name              |
##      | DeleteAccess | Delete Access Access | Portfolio-Holiday Calendar |
#
#
#  Scenario Outline: As a delete user I can able to apply Schedule Template to entity
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
##    When I navigate to entity type "<Item>" named "<Entity Name>"
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    And I click on the "<Third Level Tab>" sub tab
#    And I click on the "Apply Template" action panel button
#    And I wait for "Apply Schedule Template" modal window to open in non frame page
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
#
#    Examples:
#      | Login User   | Login full username  | Item    | Entity Name                | Third Level Tab | Template          | Grid ID           |
#      | DeleteAccess | Delete Access Access | Project | AfterScheduleTemplateApply | Schedule        | Schedule Template | ^Lx-ui-GanttPanel |
#
#
#  Scenario Outline: As a delete user I can able to Set Crash Schedule after applying the Schedule Template
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
##    When I navigate to entity type "<Item>" named "<Entity Name>"
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    And I click on the "<Third Level Tab>" sub tab
#    And I click on the "Crash Schedule" action panel button
#    And I wait for "Crash Schedule" modal window to open in non frame page
#    When I set following fields value on editable page
#      | name              | value                          |
#      | HolidayScheduleID | Entity(Crash)-Holiday Calendar |
#    And I click on the "Update" button
#    And I wait for modal window to close
#    And I click on the "Spreadsheet" action panel button
#    And I expand Group on task name
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
#
#    Examples:
#      | Login User   | Login full username  | Item    | Entity Name                | Third Level Tab | Grid ID           |
#      | DeleteAccess | Delete Access Access | Project | AfterScheduleTemplateApply | Schedule        | ^Lx-ui-GanttPanel |
#
#  Scenario Outline: As a delete user I can able to check holiday list
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    And I navigate to the admin dashboard
#    And I click on the "Manage Holiday Calendar" link
#    And I wait for the Loading text to disappear in grid
#    And I click row in grid "<Grid ID>" having unique value "<Calendar>" under column header "Calendar Name"
#    And I wait for the Loading text to disappear in grid
#    And I verify a row in grid "dateGrid" having unique value "CC-1" under column header "Holiday Name"
#      | name  | value |
#      | Year  | 2020  |
#      | Month | July  |
#      | Day   | 9     |
#
#    Examples:
#      | Login User   | Login full username  | Calendar                       | Grid ID      |
#      | DeleteAccess | Delete Access Access | Entity(Crash)-Holiday Calendar | scheduleGrid |