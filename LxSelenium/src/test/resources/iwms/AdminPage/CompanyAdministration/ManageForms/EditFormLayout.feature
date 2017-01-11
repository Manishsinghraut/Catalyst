@all
Feature: (Jira - AUTOMATION-474)As an IWMS user I need to be able to edit form layouts.

  Scenario Outline: As a delete user I can able to add custom list to form layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageForms/"
    And I import following file name:
      | Edit-Form-Layout.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I want to edit form layout from manage forms
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    And I wait for the Loading text to disappear in grid
    Then I expand the "<Form Layout>" row in grid "<Grid ID>"
    And I click "build layout" action of "<Form Layout>" sub row in the grid "<Grid ID>"
    And I switch to "Form layout" child window
    And I expand the following
      | Available Fields |
      | Forms            |
      | ALL              |
    Then I drag the "Creator" field to be on the row below the "Description" field
    And I click on the save layout button on page layout
    And I click on the "Yes" button in confirmation pop up
    And I click on the close button on page layout
    And I switch to main window

  Examples:
    | Form Layout      | Login User | Login full username |Grid ID             |
    | Edit-Form-Layout | EditAccess | Edit Access Access  |BOGridCodeIssueType |