@all
Feature: (Ref : Jira Ticket No : Automation-590), As a delete user I can able to append schedule template

  Scenario Outline: I import file for append schedule template script
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | Existing_Template_For_Append.xml |
      | Append_Schedule_Template.xml     |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I can able to add schedule template
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "<Template>" from the list
    And I click on "Append Existing Template..." Button
    Then I see the "Apply Schedule Template" modal window
    When I set following fields value on editable page
      | name                   | value               |
      | taskTemplateIDToAssign | <Existing Template> |
    And I click on the "Append Schedule Template" button
    Then I wait for modal window to close
    And I verify unique link text on non editable page "Existing Group 1"
    And I verify unique link text on non editable page "Existing Task 1"

    Examples:
      | Template                 | Existing Template            | Login User   | Login full username  |
      | Append Schedule Template | Existing Template For Append | DeleteAccess | Delete Access Access |