@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1015), Apply Budget Template Scenario Outline: As a delete user I Apply Budget Template

  Scenario Outline: As a delete user I import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/"
    And I import following file name:
      | BudgetTemplate.xml            |
      | ViewAccess1015.xls            |
      | ApplyBudgetTemplateEntity.xml |
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following file name:
      | SiteBudgetSummaryPage.xml |
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Summary Page>" sub row in the grid "main"
    And I switch to "edit Layout" child window
    And I set following fields value on editable page
      | name                               | value |
      | _checkbox_ValidForPotentialProject | true  |
    And I click on "Update" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Summary Page          |
      | DeleteAccess | Delete Access Access | SiteBudgetSummaryPage |


  Scenario Outline: As a delete user I Apply Budget Template and verify I can able to apply template

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/"
    And I import following file name:
      | BudgetTemplate.xml            |
      | ApplyBudgetTemplateEntity.xml |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Budget" tab
    And I switch to visible frame
    And I set following fields value on editable page
      | name                     | value           |
      | budgetTemplateIDToAssign | Selenium-Budget |
    And I click on "Assign Budget Template" Button
    And I see "Successfully assigned Budget Template" message in the header
    And I logout

    Examples:
      | Login User   | Login full username  | Entity Name                       |
      | DeleteAccess | Delete Access Access | Apply Budget Template Entity-1015 |


  Scenario Outline:  As a View Access user I verify I cannot apply template

    Given I Login to IWMS using "<Login User>" access credentials expecting EULA page
    And Accept Eula and move on

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Budget" tab
    And I switch to visible frame
    Then I verify the following fields are not editable
      | name                  | value                    |
      | Apply Budget Template | budgetTemplateIDToAssign |
    And I verify the following text in a page
      | Template: Selenium-Budget |
      | No budget data available. |
    And I click on the "Budget Creation" action panel button
    And I wait for the Loading text to disappear
    And I verify the following text in a page
      | Page Access Denied                                                                                                                                                |
      | Unable to access the requested page, you do not have access to the requested functionality.                                                                       |
      | Please click the "Back" button on your browser, make a different selection from the top menu bar, or click on the link below to re-login with appropriate access. |
      | Login As Different User                                                                                                                                           |

    And I logout

    Examples:
      | Login User       | Entity Name                       |
      | View Access 1015 | Apply Budget Template Entity-1015 |