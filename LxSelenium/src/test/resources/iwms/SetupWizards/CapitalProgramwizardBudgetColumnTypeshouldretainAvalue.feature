@all @smoke @smoke5
Feature: Capital Program wizard - Budget Column Type should retain a value (Jira - AUTOMATION-1202)

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario: I import test data files
    When I used data files from "Data/ImportDataFiles/iwms/CapitalProgram/"
    And I import following file name:
      | Selenium-budget_1202.xml |
      | Column_1202.xml          |
      | FacilityTest1a_1202.xml  |
      | FacilityTest2a_1202.xml  |

  Scenario Outline: Budget values should be retained on the wizard when clicking next and returning to the previous step on capital program Wizard
    And I navigate to dashboard page
    When I navigate to "Tools,Setup Wizards"
    Then I see the "Setup Wizard" modal window
    And I delete incomplete setup wizard if exist
    And I set following fields value on editable page
      | name              | value          |
      | projectEntityType | CapitalProgram |
    And I click on the "Next" button
    And I set following fields value on editable page
      | name                | value  |
      | Program_ProgramName | <Name> |
    And I click on the "Next" button
    And I see the "Capital Program Setup Wizard" modal window
    And I select Create Organization Chart by duplicating Organization Chart from Select "Migrate Selenium Entity" from drop down
    And I click on the "Next" button
    And I see the "Duplicating OrgChart" "on active modal window"
    Then I verify success message after creating or importing projects
      | Status:Finished |
    And I click on close button from Duplicating OrgChart
    And I click on the "Next" button
    And I set following fields value on editable page
      | name             | value             |
      | entityTemplateID | <Folder Template> |
      | projTemplateID   | <Folder Template> |
    And I click on the "Next" button
    And I set following fields value on editable page
      | name                   | value             |
      | entityBudgetTemplateID | <Budget Template> |
    And I click "Add" button
    And I Add column type "BudgetTypeA" and click on upload spreadsheet drop down
    And I switch to "File Upload window" child window
    And I upload the following document from path "Data/ImportDataFiles/iwms/CapitalProgram/":
      | BudgetTypeA_1202.xls |
    And I click on upload budget button
    And I wait for second child window to close
    And I switch to main window
    And I click "Update" button

    And I click "Add" button
    And I Add column type "BudgetTypeB" and click on upload spreadsheet drop down
    And I switch to "File Upload window" child window
    And I upload the following document from path "Data/ImportDataFiles/iwms/CapitalProgram/":
      | BudgetTypeB_1202.xls |
    And I click on upload budget button
    And I wait for second child window to close
    And I switch to main window
    And I click "Update" button

    And I click "Add" button
    And I Add column type "BudgetTypeC" and click on upload spreadsheet drop down
    And I switch to "File Upload window" child window
    And I upload the following document from path "Data/ImportDataFiles/iwms/CapitalProgram/":
      | BudgetTypeC_1202.xls |
    And I click on upload budget button
    And I wait for second child window to close
    And I switch to main window
    And I click "Update" button
    And I click on the "Next" button
    And I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
    And I click on the "Previous" button
    And I see the "<Setup Wizard> -> <Name> -> Assign Budget Template" modal window
    And I verify a row from non frame grid "BudgetColumnGridDiv" having unique value "Column Type" under column header "BudgetTypeA"
      | name               | value                    |
      | Column Type        | BudgetTypeA              |
      | Upload Spreadsheet | Uploaded total:$2,000.00 |
    And I verify a row from non frame grid "BudgetColumnGridDiv" having unique value "Column Type" under column header "BudgetTypeB"
      | name               | value                    |
      | Column Type        | BudgetTypeB              |
      | Upload Spreadsheet | Uploaded total:$3,000.00 |
    And I verify a row from non frame grid "BudgetColumnGridDiv" having unique value "Column Type" under column header "BudgetTypeC"
      | name               | value                    |
      | Column Type        | BudgetTypeC              |
      | Upload Spreadsheet | Uploaded total:$4,000.00 |
    And I click on the "Next" button
    And I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
    And I click on the "Next" button
    And I see the "<Setup Wizard> -> <Name> -> Schedule Set-up" modal window
    And I set following fields value on editable page
      | name             | value             |
      | entityTemplateID | Selenium Schedule |
      | projTemplateID   | Selenium Schedule |
    Then I select "Start on" from the list
    And I set fields values on editable page
      | name      | value      |
      | startDate | 04/28/2016 |
    And I click on the "Next" button
    And I see the "<Setup Wizard> -> <Name> -> Facility Project Set-up" modal window
    And I select facility "Facility Test 1a"
    And I select facility "Facility Test 2a"
    And I click on the "Next" button
    And I see the "<Setup Wizard> -> <Name> -> Facility Project Set-up" modal window
    And I set following fields value on editable page
      | name              | value          |
      | CodeProjectTypeID | Retail Project |
    And I click on the "Create/Update Projects" button

    Then I verify success message after creating or importing projects
      | Finished processing                                                                                                  |
      | Total Projects Created: 2                                                                                            |
      | Total Projects which Failed: 0                                                                                       |
      | Warning Messages:                                                                                                    |
      | Unable to apply schedule template for 'Facility Test 2a: <Name>', you must specify either a Start On or End By date. |
      | Unable to apply schedule template for 'Facility Test 1a: <Name>', you must specify either a Start On or End By date. |
    And I click on the "Finish" button
    Then I see that I am on the entity "Program: <Name>"

  Examples:
    | Name                | Folder Template          | Setup Wizard                 | Budget Template |
    | Test Retain values6 | Selenium Folder Template | Capital Program Setup Wizard | Selenium-Budget |

