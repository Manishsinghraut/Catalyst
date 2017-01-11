@all
Feature: As a Delete user I Append multiple schedule template on Entity (Ref : Jira Ticket No : Automation-583)

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageScheduleTemplates/"
    And I import following file name:
      | AppendMultipleScheduleTemplateOnEntity.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline:I Append multiple schedule template on Entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "Selenium Template A" from the list
    And I click on "Append Existing Template..." Button
    Then I see the "Apply Schedule Template" modal window
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
    And I click on the "Append Schedule Template" button
    And I verify unique link text on non editable page "<Root Group>"
    And I verify unique link text on non editable page "<Group>"
    And I verify unique link text on non editable page "<Task Name>"

  Examples:
    | Login User   | Login full username  | Task Name     | Template            | Group          | Root Group          |
    | DeleteAccess | Delete Access Access | Selenium Task | Selenium Schedule A | Selenium Group | Selenium Root Group |
    | DeleteAccess | Delete Access Access | Selenium Task | Selenium Schedule B | Selenium Group | Selenium Root Group |

  Scenario Outline:I Append multiple schedule template on Entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link
    And I click on "Template Details" tab
    And I select template "Selenium Template A" from the list
    And I click on "Append Existing Template..." Button
    Then I see the "Apply Schedule Template" modal window
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
    And I click on the "Append Schedule Template" button
    Then I wait for modal window to close
    And I verify unique link text on non editable page "<Root Group>"
    And I verify unique link text on non editable page "<Group>"
    And I verify unique link text on non editable page "<Task Name>"

  Examples:
    | Login User   | Login full username  | Task Name       | Template            | Group            | Root Group            |
    | DeleteAccess | Delete Access Access | Selenium Task B | Selenium Template B | Selenium Group B | Selenium Root Group B |
    | DeleteAccess | Delete Access Access | Selenium Task   | Selenium Schedule B | Selenium Group   | Selenium Root Group   |
