@all
Feature: (Ref : Jira Ticket No : Automation-591) Create Template Details-Add Root GroupStandalone Task

  Scenario Outline: As a delete user I can able to add schedule template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on " Add Schedule Template... " button in grid
    And I see the "Add Schedule Template  ***Required fields in red" modal window
    When I set following fields value on editable page
      | name         | value               |
      | TemplateName | <Schedule Template> |
      | Description  | Created template    |
      | Notes        | Created             |
      | Portfolio    | true                |
    And I click on the "Add" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear in grid
    #IWMS-22139
#    Then I see "Successfully added Schedule Template" in the grid header
    And I verify grid item "<Schedule Template>" present is "true" in grid "<Grid ID>"

    Examples:
      | Schedule Template        | Login User   | Login full username  | Grid ID            |
      | Adding Schedule Template | DeleteAccess | Delete Access Access | BOGridTaskTemplate |

  Scenario Outline: As a delete user I can able to add root group
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "<Schedule Template>" from the list
    And I click on "<Add Root Group>" link
    And I wait for modal window to open
    Then I see the "Activity Group" modal window
    When I set following fields value on editable page
      | name                       | value         |
      | TaskName                   | <Group>       |
      | Description                | Created       |
      | AssigneeTypeList_available | Delete Access |
    And I click on ">>" Button
    And I click on the "Update" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear in grid
    Then I see "Successfully added Task/Group" message in the grid
    And I verify unique link text on non editable page "<Group>"

    Examples:
      | Schedule Template        | Login User   | Login full username  | Group             |
      | Adding Schedule Template | DeleteAccess | Delete Access Access | Adding Root Group |

  Scenario Outline: As a delete user I can able to add group
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "<Schedule Template>" from the list
    And I click "<Add Group>" link corresponding to "<Root Group>" group
    And I wait for modal window to open
    Then I see the "Activity Group" modal window
    When I set following fields value on editable page
      | name                       | value         |
      | TaskName                   | <Group>       |
      | Description                | Created       |
      | AssigneeTypeList_available | Delete Access |
    And I click on ">>" Button
    And I click on the "Update" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear in grid
    Then I see "Successfully added Task/Group" message in the grid
    And I verify unique link text on non editable page "<Group>"

    Examples:
      | Schedule Template        | Login User   | Login full username  | Root Group        | Group        |
      | Adding Schedule Template | DeleteAccess | Delete Access Access | Adding Root Group | Adding Group |

  Scenario Outline: As a delete user I can able to add tasks
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "<Schedule Template>" from the list
    And I click "<Add Task>" link corresponding to "<Root Group>" group
    And I wait for modal window to open
    Then I see the "Task Detail" modal window
    And I set following fields value on editable page
      | name                       | value         |
      | TaskName                   | <Task>        |
      | Description                | Created       |
      | OriginalDuration           | 8             |
      | CodeTaskStatusID           | Canceled      |
      | AssigneeTypeList_available | Delete Access |
    And I click on ">>" Button
    And I click on the "Update" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear in grid
    Then I see "Successfully added Task Item" message in the grid
    And I verify unique link text on non editable page "<Task>"

    Examples:
      | Schedule Template        | Login User   | Login full username  | Root Group        | Task         |
      | Adding Schedule Template | DeleteAccess | Delete Access Access | Adding Root Group | Adding Task1 |
      | Adding Schedule Template | DeleteAccess | Delete Access Access | Adding Root Group | Adding Task2 |