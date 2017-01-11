@all
Feature: Applying schedule template in the past with Crash Schedule (Today as a holiday) (Ref : Jira Ticket No : AUTOMATION-902)

  Scenario Outline: I import file for apply schedule template and Predecessor Task from the diffrent Template entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | CrashScheduleHolidayCalendar.xml |
      | Scheduleappliedinthepast.xml     |
      | ScheduleTemplatewithgroups.xml   |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user Applying a Template with a Predecessor Task from the Diffrent Template
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Then I navigate to the admin dashboard
    And I click on "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select "ScheduleTemplatewithGroups" from Schedule Template dropdown list
#    Then I set following fields value on editable page
#      | name            | value                      |
#      | projectEntityID | ScheduleTemplatewithGroups |
    And I click on "GroupTask 2.1" link
    Then I verify the following fields value on editable page
      | name     | value         |
      | TaskName | GroupTask 2.1 |
    And I click on the "Close" button
    And I navigate to the admin dashboard
    And I click on the "Manage Holiday Calendar" link
    And I click on the row of "Crash Schedule -Holiday Calendar" of column "0" from holiday calendar grid
    And I click on the "edit" row action of column "Crash Schedule -Holiday Calendar" of column "0" from grid "HolidayScheduleGrid"
    Then I verify the following fields value on editable page
      | name                | value                            |
      | HolidayScheduleName | Crash Schedule -Holiday Calendar |
    And I click "Cancel" button
    And I click on the "Add Holiday"
    Then I set following fields value on editable page
      | name            | value     |
      | HolidayDateName | Holiday 6 |
      | Year            | 2016      |
      | Month           | November  |
      | Day             | 25        |
    And I click on the "Add" button

    And I click on the row of "Crash Schedule -Holiday Calendar" of column "0" from holiday calendar grid
    And I verify holiday calendar sort order
      | holiday name | year | month     | day |
      | Holiday 1    |      | February  | 5   |
      | Holiday 2    |      | March     | 5   |
      | Holiday 3    |      | January   | 1   |
      | Holiday 4    | 2020 | July      | 9   |
      | Holiday 5    | 2020 | September | 10  |
      | Holiday 6    | 2016 | November  | 25  |
    And I verify grid item action message "Successfully added Holiday Date"

    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Crash Schedule" action panel button
    Then I wait for modal window to open
    And I see the "Crash Schedule" modal window
    When I set following fields value on editable page
      | name              | value                            |
      | HolidayScheduleID | Crash Schedule -Holiday Calendar |
    And I click on the "Update" button
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value                      |
      | taskTemplateIDToAssign | ScheduleTemplatewithGroups |
      | startDate              | 10/20/1997                 |
    And I click on the "Append Schedule Template" button
    And I switch to visible frame
    And I expand gantt chart
    And I double click on "GroupTask 1.1" task
    And I click on "Predecessors" tab
    When I verify the following fields value on editable page
      | name            | value      |
      | ActualStartDate | 11/28/2016 |
      | ActualEndDate   | 11/28/2016 |
    And I click "Cancel" button

    And I double click on "GroupTask 1.1" task
    And I click on "Predecessors" tab
    When I verify the following fields value on editable page
      | name            | value      |
      | ActualStartDate | 11/28/2016 |
      | ActualEndDate   | 11/28/2016 |
    And I click "Cancel" button

    And I double click on "GroupTask 1.2" task
    When I set following fields value on editable page
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I double click on "GroupTask 1.2" task
    When I verify the following fields value on editable page
      | name            | value      |
      | ActualStartDate | 11/25/2016 |
      | ActualEndDate   | 11/25/2016 |
    And I click "Cancel" button

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name              |
    | DeleteAccess | Delete Access Access | Scheduleappliedinthepast |