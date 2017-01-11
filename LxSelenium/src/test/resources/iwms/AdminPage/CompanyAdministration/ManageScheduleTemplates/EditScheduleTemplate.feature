@all
Feature: (Ref : Jira Ticket No : Automation-588) As an edit user I can able to edit schedule template.

  Scenario Outline: I import file for edit schedule template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | Edit_Schedule_Template.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I want to edit schedule template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    When I click "edit" link of "<Schedule Template>" in grid "<Grid ID>"
    Then I wait for modal window to open
    And I see the "Edit Schedule Template  ***Required fields in red" modal window
    When I set following fields value on editable page
      | name         | value                      |
      | TemplateName | <Edited Schedule Template> |
      | Description  | Updated this temp          |
      | Notes        | Updated                    |
    And I click on the "Update" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear in grid
     #IWMS-22139
#    Then I see "Successfully updated Schedule Template" in the grid header
    And I verify grid item "<Edited Schedule Template>" present is "true" in grid "<Grid ID>"
    When I click "edit" link of "<Edited Schedule Template>" in grid "<Grid ID>"
    Then I wait for modal window to open
    And I see the "Edit Schedule Template  ***Required fields in red" modal window
    And I verify the following fields value on editable page
      | name        | value             |
      | Description | Updated this temp |
      | Notes       | Updated           |

    Examples:
      | Schedule Template      | Edited Schedule Template | Login User | Login full username | Grid ID            |
      | Edit Schedule Template | Edited Schedule Template | EditAccess | Edit Access Access  | BOGridTaskTemplate |