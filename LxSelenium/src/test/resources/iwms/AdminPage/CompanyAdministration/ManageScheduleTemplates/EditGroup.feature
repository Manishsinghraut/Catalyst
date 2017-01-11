@all

Feature: (Ref : Jira Ticket No : Automation-592) As an edit user I can able to edit schedule template group

  Scenario Outline: I import file for edit schedule template group
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | Edit_Template_Group.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I want to edit schedule template group
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "<Schedule Template>" from the list
    And I click on "<Root Group>" link
    Then I wait for modal window to open
    And I see the "Activity Group" modal window
    And I set following fields value on editable page
      | name                       | value               |
      | TaskName                   | <Edited Root Group> |
      | Description                | Edited              |
      | AssigneeTypeList_available | Delete Access       |
    And I click on ">>" Button
    And I click on the "Update" button
    Then I wait for modal window to close
    And I wait for the Loading text to disappear in grid
    Then I see "Successfully updated Task/Group" message in the grid
    When I click on "<Edited Root Group>" link
    And  I wait for modal window to open
    Then I see the "Activity Group" modal window
    And I verify the following fields value on editable page
      | name        | value               |
      | TaskName    | <Edited Root Group> |
      | Description | Edited              |

    And I verify multiple selected values on editable page
      | name             | value         |
      | AssigneeTypeList | Delete Access |

    Examples:
      | Schedule Template   | Login User | Login full username | Root Group           | Edited Root Group      |
      | Edit Template Group | EditAccess | Edit Access Access  | Edit this root group | Edited this root group |