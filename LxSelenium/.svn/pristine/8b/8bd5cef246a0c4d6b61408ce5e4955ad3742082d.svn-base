@all @smoke @smoke5
Feature: (Jira - Automation-348) As an admin I should be able to convert capital program to project

  Background:
#    Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: when I navigate to Dash board I can see the search box
    When I see the Dashboard
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Add Fac. Project(s)" action panel button
    And I set fields values on editable page
      | name           | value                    |
      | projTemplateID | Selenium Folder Template |
    And I click on the "Next" button
    And I set following fields value on editable page
      | name                   | value             |
      | entityBudgetTemplateID | <Budget Template> |
    And I click on the "Next" button
    And I set fields values on editable page
      | name           | value             |
      | projTemplateID | Selenium Schedule |
    And I click on the "Next" button
    And I select facility "<Facility>"
#    Then I click on the "img" tag element "" row action of column "Selenium Webdriver Facility" of column "2" from grid "cssselector" "div[id^=wizfacpicker]"
    And I click on the "Next" button
    And I set list fields values on editable page
      | name              | value          |
      | CodeProjectTypeID | Retail Project |
    And I click on the "Create/Update Projects" button
    And I click on the "Finish" button
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I verify pair of values on non editable summary page
      | name            | value                    |
      | Name            | <Entity Name>            |
      | Description     | Selenium Capital Program |
      | Active Projects | 1                        |
      | Total Projects  | 1                        |
    And I verify management members "Lx Administrator"
    And I verify management member link "Lx Administrator"
    And I click on the "Members/Contacts" tab
    And I verify the Members/Contacts tab
      | type        | name             |
      | Team Member | Lx Administrator |
#    And I navigate to "<Item>, Documents"
#    And I click on the "Documents" tab
#    And I verify the list of folders Document
#      | SeleniumTestRootFolder1 |
    #    When I navigate to link "Capital Project, Details"
    #    And I verify the scheduler already applied
    #      | Pre-Contruction |

    Examples:
      | Item    | Second Level Tab | Entity Name                       | Facility          | Budget Template |
      | Project | Details          | Selenium Webdriver CapitalProgram | Lucernex-Facility | Selenium-Budget |