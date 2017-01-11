@all @smoke @smoke5
Feature: (JIRA Ref: AUTOMATION-350) As an admin I should be able to Import Facility when Create Capital Project

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: when I navigate to Dash board I can see the search box
    When I see the Dashboard
    And I Search for the "<Name>" that was created
    And Click on the name of the "<Name>" in the results pop-up
    Then I see "<Name>" name on the header
    And I click on the "Add Fac. Project(s)" action panel button
    And I set following fields value on editable page
      | name           | value                    |
      | projTemplateID | Selenium Folder Template |
    And I click on the "Next" button
    And I set following fields value on editable page
      | name                   | value             |
      | entityBudgetTemplateID | <Budget Template> |
    And I click on the "Next" button
    And I set following fields value on editable page
      | name           | value             |
      | projTemplateID | Selenium Schedule |
    And I click on the "Next" button
    When I used data files from "Data/ImportDataFiles/iwms/SetupWizards/"
    Then I import following file name:
      | ProgramFacilities.xls |
    And I click on the "Next" button
    And I set list fields values on editable page
      | name              | value          |
      | CodeProjectTypeID | Retail Project |
    And I click on the "Create/Update Projects" button
    Then I verify success message after creating or importing projects
      | Finished processing |
    And I click on the "Finish" button
    When I navigate to "Program, Details"
    And I verify pair of values on non editable summary page
      | name            | value         |
      | Name            | <Name>        |
      | Description     | <Description> |
      | Active Projects | 1             |
      | Total Projects  | 1             |
    And I verify management members "Lx Administrator"
    And I verify management member link "Lx Administrator"
    And I click on the "Members/Contacts" tab
    And I verify the Members/Contacts tab
      | type        | name             |
      | Team Member | Lx Administrator |
#    And I click on the "Documents" tab
#    And I verify the list of folders Document
#      | SeleniumTestRootFolder1 |
    #    When I navigate to link "Capital Project, Details"
    #    And I verify the scheduler already applied
    #      | Pre-Contruction |
    Examples:
      | Name                              | Budget Template |
      | Selenium Webdriver CapitalProgram | Selenium-Budget |
