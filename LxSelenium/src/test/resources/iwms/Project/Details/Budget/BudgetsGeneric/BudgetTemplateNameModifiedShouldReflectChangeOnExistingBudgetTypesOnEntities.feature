@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1467), Budget Template Name modified should reflect change on existing Budget types on entities

  Scenario Outline: As a delete user I import the following xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following files:
      | Portfolio_00020AndLocation_00020-1467.xml |
      | BudgetTemplate-1467.xml                   |
      | BudgetColumn-1467.xml                     |
      | BudgetSummary-1467.xml                    |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Navigate to Manage Budget Summary and click on edit.  Select option "valid for Project" and click update
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Summary Page>" sub row in the grid "main"
    And I switch to "Edit Summary Page" child window
    And I set following fields value on editable page
      | name                      | value |
      | _checkbox_ValidForProject | true  |
    And I click on "Update" Button
    Then I wait for browser windows count to be equal to "1"
    And I switch to main window
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following files:
      | 14960_Project-1467.xml |
    And I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Budget" tab
    And I click on the "Budget Summary" action panel button
    Then I wait for the Loading text to disappear
    And I verify the following text in a page
      | Template: <Template Name> |

    Examples:
      | Project Name  | Summary Page         | Template Name       |
      | 14960 Project | 14960 Budget Summary | Budget Construction |


  Scenario Outline: Budget Template Name modified should reflect change on existing Budget types on entities
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I click "edit" row action in the non frame grid "BOGridBudgetTemplate" having the following header and cell values
      | name                 | value           |
      | Budget Template Name | <Template Name> |
    Then I wait for "Edit Budget Template  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name         | value                  |
      | TemplateName | <Edited Template Name> |
    And I click on the "Update" button
    Then I wait for modal window to close

    And I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Budget" tab
    And I click on the "Budget Summary" action panel button
    Then I wait for the Loading text to disappear
    And I verify the following text in a page
      | Template: <Edited Template Name> |

    Examples:
      | Project Name  | Template Name       | Edited Template Name        |
      | 14960 Project | Budget Construction | Budget Construction Revised |