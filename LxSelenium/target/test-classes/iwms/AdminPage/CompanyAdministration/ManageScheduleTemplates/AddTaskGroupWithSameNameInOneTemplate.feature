@all
Feature: (Ref : Jira Ticket No : Automation-581) As a Delete user I need not be able to Add task and group with same name in One Template

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | Add_Task_And_Group_With_Same_Name.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline:I will not be able to Add task with same name in One Template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "<Template>" from the list
    And I click "<Add Task>" link corresponding to "<Group>" group
    Then I see the "Task Detail" modal window
    And I set following fields value on editable page
      | name             | value       |
      | TaskName         | <Task Name> |
      | OriginalDuration | 4           |
    And I click on the "Update" button
#    Then I see "The name (<Task Name>) already exists in this schedule template. Please enter a different name." in the grid header
    Then I see "The name (<Task Name>) already exists in this schedule. Please enter a different name." in the grid header

    Examples:
      | Login User   | Login full username  | Task Name      | Template                          | Group  |
      | DeleteAccess | Delete Access Access | Duplicate task | Add Task And Group With Same Name | Group2 |


  Scenario Outline:I will not be able to Add group with same name in One Template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "<Template>" from the list
    And I click "<Add Group>" link corresponding to "<Group Name>" group
    Then I see the "Activity Group" modal window
    And I set following fields value on editable page
      | name     | value        |
      | TaskName | <Group Name> |

    And I click on the "Update" button
#    Then I see "The name (<Group Name>) already exists in this schedule template. Please enter a different name." in the grid header
    Then I see "The name (<Group Name>) already exists in this schedule. Please enter a different name." in the grid header

    Examples:
      | Login User   | Login full username  | Group Name                | Template                          |
      | DeleteAccess | Delete Access Access | Test duplicate root group | Add Task And Group With Same Name |