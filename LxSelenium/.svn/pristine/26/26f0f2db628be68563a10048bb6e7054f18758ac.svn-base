@all @smoke @smoke5
Feature: (Jira - Automation-347) As an admin I should be able to create capital program

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario: I import test data files
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ManageSecurity/"
    And I import following file name:
      | BuudgetTemplate.xml |

  Scenario Outline: when I navigate to Tools page I can add new Items from the set up wizard
    When I navigate to "Tools,Setup Wizards"
    Then I see the "Setup Wizard" modal window
    And I delete incomplete setup wizard if exist
    And I set fields values on editable page
      | name              | value          |
      | projectEntityType | CapitalProgram |
    And I click on the "Next" button
    And I see the "Capital Program Setup Wizard" modal window
    And I set these field values on editable page
      | name                        | value             |
      | Program_ProgramName         | <Name>            |
      | Program_Description         | <Description>     |
      | _ManagerIDList_MemberID_add | Administrator, Lx |
    And I click on the "Next" button
    And I see the "<Setup Wizard> -> <Name> -> Org Chart Set-up" modal window
    Then I set fields values on editable page
      | name           | value                             |
      | orgTypeRequest | duplicate                         |
      | srcProgramID   | Selenium Webdriver CapitalProgram |
    And I click on the "Next" button
#    And I click on the "Close" btn
    And I verify success message after importing org chart
      | Status:Finished |
      | Execution time: |
    And I close org chart window
    And I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
    And I set following fields value on editable page
      | name             | value             |
      | entityTemplateID | <Folder Template> |
      | projTemplateID   | <Folder Template> |

    And I click on the "Next" button
    And I see the "<Setup Wizard> -> <Name> -> Assign Budget Template" modal window
    And I set following fields value on editable page
      | name                   | value             |
      | entityBudgetTemplateID | <Budget Template> |
#      | projBudgetTemplateID | <Budget Template> |
    And I click on the "Next" button
    And I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
    And I click on Assign Members button
    And I add following members
      | Access, Delete |
      | Access, Edit   |
    And I click on "Update  members to <Name>" Button
    And I click on the "Finish Assigning Members" button
    And I click on the "Next" button
    And I see the "<Setup Wizard> -> <Name> -> Schedule Set-up" modal window
    And I set following fields value on editable page
      | name             | value             |
      | entityTemplateID | Selenium Schedule |
      | projTemplateID   | Selenium Schedule |
    Then I select "Start on" from the list
    And I set fields values on editable page
      | name      | value      |
      | startDate | 01/01/2015 |

    And I click on the "Next" button
    And I see the "<Setup Wizard> -> <Name> -> Facility Project Set-up" modal window
    And I select facility "<Facility>"
    And I click on the "Next" button
    And I see the "<Setup Wizard> -> <Name> -> Facility Project Set-up" modal window
    And I set following fields value on editable page
      | name              | value          |
      | CodeProjectTypeID | Retail Project |
    And I click on the "Create/Update Projects" button
    Then I verify success message after creating or importing projects
      | Finished processing            |
      | Total Projects Created: 1      |
      | Total Projects which Failed: 0 |
    And I click on the "Finish" button
    Then I see that I am on the entity "Program: <Name>"

    Examples:
      | Item            | Grid Header                  | Name                 | Description              | Facility          | Folder Template          | Setup Wizard                 | Budget Template |
      | Capital Program | Capital Program Setup Wizard | New Capital Program2 | Selenium Capital Program | Lucernex-Facility | Selenium Folder Template | Capital Program Setup Wizard | Selenium-Budget |

  Scenario Outline: I want to verify the created new IWMS capital program fields on non-editable page
    When I navigate to "<Item>, Details"
    And I expand portfolio navigation tab
    And I verify pair of values on non editable summary page
      | name            | value         |
      | Name            | <Name>        |
      | Description     | <Description> |
      | Active Projects | 1             |
      | Total Projects  | 1             |
    And I verify management members "Lx Administrator"
    And I verify management member link "Lx Administrator"

    Examples:
      | Item    | Name                 | Description              |
      | Program | New Capital Program2 | Selenium Capital Program |

  Scenario Outline: I want to verify members added in  Members/Contacts tab
    When I navigate to "<Item>, Details"
    And I click on the "Members/Contacts" tab
    And I verify the Members/Contacts tab
      | type        | name             |
      | Team Member | Lx Administrator |
      | Broker      | Delete Access    |
      | Broker      | Edit Access      |

    Examples:
      | Item    |
      | Program |

  Scenario Outline: I want to verify folder list
    When I navigate to "<Item>, Details"
    And I click on the "Documents" tab
#    And I verify the list of folders Document
#      | SeleniumTestRootFolder1 |
    And I wait for the Loading text to disappear
    And I select the following
      | <Folder> |

    Examples:
      | Item    | Folder                  |
      | Program | SeleniumTestRootFolder1 |

  Scenario Outline: I want to verify organization chart
    When I navigate to "<Item>, Details"
    When I navigate to "Org Chart"
    And I verify organization chart "Central Dallas"
    And I verify management members "Lx Administrator"

    Examples:
      | Item    |
      | Program |