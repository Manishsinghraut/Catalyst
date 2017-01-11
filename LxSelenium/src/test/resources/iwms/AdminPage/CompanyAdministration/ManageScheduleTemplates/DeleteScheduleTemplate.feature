@all
Feature: (Ref : Jira Ticket No : Automation-589) As a Delete user I can able to delete schedule template.

  Scenario Outline: I import file for delete schedule template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | Delete_Schedule_Template.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I want to delete schedule template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    When I click "delete" link of "<Schedule Template>" in grid "<Grid ID>"
    Then I see the "Delete Schedule Template" modal window
    And I click on the "Yes" button
    Then I wait for modal window to close
     #IWMS-22139
#    Then I see "Successfully deleted Schedule Template" in the grid header
    And I verify grid item "<Schedule Template>" present is "false" in grid "<Grid ID>"

    Examples:
      | Schedule Template    | Login User   | Login full username  | Grid ID            |
      | Delete Schedule Temp | DeleteAccess | Delete Access Access | BOGridTaskTemplate |