@all
Feature: As a Delete user I Setting Holiday Calendar at Portfolio Level (Ref : Jira Ticket No : AUTOMATION-620)


  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | SeleniumHolidayCalendar.xml              |
      | SummaryPageForPortfolioLevelCalender.xml |
      | CrashSchedulePortfolioA.xml              |
      | CalendarEntityA.xml                      |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline:I Navigate to protfolio for setting holiday calendar at portfolio level
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" sub tab
    And I select an option "Summary Page For Portfolio Level Calender"
    And I click on the "Edit" action panel button
    And I select Default Holiday Schedule "Portfolio-Holiday Calendar"
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear

    Examples:
      | Login User   | Login full username  | Entity Name               | Secondary Tab | Third Level Tab |
      | DeleteAccess | Delete Access Access | Crash Schedule PortfolioA | Details       | Summary         |

  Scenario Outline:I verify the setting of default Holiday Calendar at portfolio Level and at entity Level should reflect The Portfolio Level default Calendar setting
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" sub tab
    And I click on the "Crash Schedule" action panel button
    And I verify the following fields value on editable page
      | name              | value           |
      | HolidayScheduleID | <Calender Name> |
    And I click on the "Update" button


    Examples:
      | Login User   | Login full username  | Calender Name              | Entity Name      | Secondary Tab | Third Level Tab |
      | DeleteAccess | Delete Access Access | Portfolio-Holiday Calendar | Calendar EntityA | Details       | Schedule        |