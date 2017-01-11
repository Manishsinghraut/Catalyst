@all
Feature: As a Delete user I Holiday Calendar - Sort Order (Ref : Jira Ticket No : AUTOMATION-619)

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | SeleniumHolidayCalendar.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline:Adding One time holidays-These are specific to a particular year they are occurring in
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Holiday Calendar" link
    And I click on the row of "<Calender Name>" of column "0" from holiday calendar grid
    And I verify holiday calendar sort order
      | holiday name | year | month    | day |
      | AA-6r        |      | January  | 5   |
      | AA-7r        |      | June     | 9   |
      | AA-5r        |      | November | 8   |
      | AA-1         | 2020 | January  | 1   |
      | AA-2         | 2020 | February | 8   |
      | AA-3         | 2020 | July     | 8   |
      | AA-4         | 2020 | July     | 9   |

  Examples:
    | Login User   | Login full username  | Calender Name              |
    | DeleteAccess | Delete Access Access | Portfolio-Holiday Calendar |
