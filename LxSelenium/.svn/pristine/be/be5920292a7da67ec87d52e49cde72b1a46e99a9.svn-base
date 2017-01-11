@all
Feature: As a Delete user I Setting Holiday Calendar -  Updated on 11-Dec-2015(Ref : Jira Ticket No : AUTOMATION-617)

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | SeleniumHolidayCalendar.xml |
      | CrashSchedulePortfolio.xml  |
      | CalendarEntity.xml          |
      | HolidayCity(1).xml          |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline:Adding One time holidays-These are specific to a particular year they are occurring in
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    Then I set following fields value on editable page
      | name                     | value           |
      | DefaultHolidayScheduleID | <Calender Name> |
    And I click on manage company update button
    And I verify the following message "Successfully updated Company"

  Examples:
    | Login User   | Login full username  | Calender Name         |
    | DeleteAccess | Delete Access Access | Firm-Holiday Calendar |


  Scenario Outline:I Navigate to Entity that does not have a crash schedule at the entity level and no default holiday calendar at the portfolio level
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" sub tab
    And I click on the "Crash Schedule" action panel button
    And I set following fields value on editable page
      | name              | value                 |
      | HolidayScheduleID | Firm-Holiday Calendar |
#    And I verify Firm level Holiday calendar "<Calender Name>" should be reflected at Entity level crash schedule
    And I click on the "Close" button

  Examples:
    | Login User   | Login full username  | Calender Name         | Entity Name     | Secondary Tab | Third Level Tab |
#      | DeleteAccess | Delete Access Access | Firm-Holiday Calendar | Lucernex-Parcel | Details       | Schedule        |
    | DeleteAccess | Delete Access Access | Firm-Holiday Calendar | Calendar Entity | Details       | Schedule        |

  Scenario Outline:I Setting a Different default Holiday Calendar at Firm Level and at Portfolio Level should reflect The Portfolio Level default Calendar setting at Entity (Crash Schedule) Level
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "Edit" action panel button
    And I switch to visible frame
    Then I set following fields value on editable page
      | name                             | value           |
      | Program_DefaultHolidayScheduleID | <Calender Name> |
    And I click on the "Save Changes" action panel button
    And I Search for the "Calendar Entity" that was created
    And Click on the name of the "Calendar Entity" in the results pop-up
    Then I see "Calendar Entity" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" sub tab
    And I click on the "Crash Schedule" action panel button
    Then I set following fields value on editable page
      | name              | value           |
      | HolidayScheduleID | <Calender Name> |
    And I click on the "Update" button


  Examples:
    | Login User   | Login full username  | Calender Name              | Entity Name              | Secondary Tab | Third Level Tab |
#      | DeleteAccess | Delete Access Access | Portfolio-Holiday Calendar | Lucernex-Selenium | Details       | Schedule        |
    | DeleteAccess | Delete Access Access | Portfolio-Holiday Calendar | Crash Schedule Portfolio | Details       | Schedule        |