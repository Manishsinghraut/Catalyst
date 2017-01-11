@all
Feature: Capital Program Wizard Roll up Budgets (Ref : Jira Ticket No : AUTOMATION-1205)

  Scenario Outline: As a delete user I import the following xmls in the following order

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/CapitalProgram/RollUpBudgets/"
    And I import following file name:
      | SeleniumBudget_1205.xml        |
      | aBudgetColumn_1205.xml         |
      | aBudgetColumn_1205.xml         |
      | FacilityOne123_1205.xml        |
      | FacilityTwo456_1205.xml        |
      | CapitalProgramSummary_1205.xml |


    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Page Layout Name>" sub row in the grid "main"
    And I switch to "Edit Layout" child window
    And I set following fields value on editable page
      | name                             | value |
      | _checkbox_ValidForCapitalProgram | true  |
      | _checkbox_ValidForCapitalProject | true  |
    And I click on "Update" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window


    And I click "build layout" action of "<Page Layout Name>" sub row in the grid "main"
    And I switch to "build layout" child window

    And I click on the "..." optional Field Label for the "Test Column a1" field
    And I set fields values on editable page
      | name                     | value |
      | json.RollupProjectValues | true  |
    And I click on "Set Options" Button

    And I click on the "..." optional Field Label for the "Test Column a2" field
    And I set fields values on editable page
      | name                     | value |
      | json.RollupProjectValues | true  |
    And I click on "Set Options" Button

    And I click on the "..." optional Field Label for the "Test Column a3" field
    And I set fields values on editable page
      | name                     | value |
      | json.RollupProjectValues | true  |
    And I click on "Set Options" Button

    And I click on "Save Layout" Button
    And I click on "Close" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Page Layout Name |
    | DeleteAccess | Delete Access Access | Capital RollUps  |


  Scenario Outline: Capital Program Wizard Roll up Budgets
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

    And I Add column type "Test Column a1" and click on upload spreadsheet drop down
    And I switch to "File Upload window" child window
    And I upload the following document from path "Data/ImportDataFiles/iwms/CapitalProgram/RollUpBudgets/":
      | TestColumnA1SS_1205.xls |
    And I click on upload budget button
    And I wait for second child window to close
    And I switch to main window
    And I click "Update" button

    And I click "Add" button
    And I Add column type "Test Column a2" and click on upload spreadsheet drop down
    And I switch to "File Upload window" child window
    And I upload the following document from path "Data/ImportDataFiles/iwms/CapitalProgram/RollUpBudgets/":
      | TestColumnA2SS_1205.xls |
    And I click on upload budget button
    And I wait for second child window to close
    And I switch to main window
    And I click "Update" button

    And I click "Add" button
    And I Add column type "Test Column a3" and click on upload spreadsheet drop down
    And I switch to "File Upload window" child window
    And I upload the following document from path "Data/ImportDataFiles/iwms/CapitalProgram/RollUpBudgets/":
      | TestColumnA3SS_1205.xls |
    And I click on upload budget button
    And I wait for second child window to close
    And I switch to main window
    And I click "Update" button
    And I click on the "Next" button

    And I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window

#    And I click on the "Previous" button
#    And I see the "<Setup Wizard> -> <Name> -> Assign Budget Template" modal window
#    And I verify a row from non frame grid "BudgetColumnGridDiv" having unique value "Column Type" under column header "BudgetTypeA"
#      | name               | value                    |
#      | Column Type        | BudgetTypeA              |
#      | Upload Spreadsheet | Uploaded total:$2,000.00 |
#    And I verify a row from non frame grid "BudgetColumnGridDiv" having unique value "Column Type" under column header "BudgetTypeB"
#      | name               | value                    |
#      | Column Type        | BudgetTypeB              |
#      | Upload Spreadsheet | Uploaded total:$3,000.00 |
#    And I verify a row from non frame grid "BudgetColumnGridDiv" having unique value "Column Type" under column header "BudgetTypeC"
#      | name               | value                    |
#      | Column Type        | BudgetTypeC              |
#      | Upload Spreadsheet | Uploaded total:$4,000.00 |

    And I click on the "Next" button
#    And I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
#    And I click on the "Next" button
    And I see the "<Setup Wizard> -> <Name> -> Schedule Set-up" modal window
    And I set following fields value on editable page
      | name             | value             |
      | entityTemplateID | Selenium Schedule |
      | projTemplateID   | Selenium Schedule |
    Then I select "Start on" from the list
    And I enter today's date as "startDate"
#    And I set fields values on editable page
#      | name      | value                              |
#      | startDate | Today Date need to modify the code |
    And I click on the "Next" button
    And I see the "<Setup Wizard> -> <Name> -> Facility Project Set-up" modal window
    And I select facility "Facility one 123"
    And I select facility "Facility two 456"
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
      | Unable to apply schedule template for 'Facility two 456: <Name>', you must specify either a Start On or End By date. |
      | Unable to apply schedule template for 'Facility one 123: <Name>', you must specify either a Start On or End By date. |
    And I click on the "Finish" button
    Then I see that I am on the entity "Program: <Name>"

  Examples:
    | Name                            | Folder Template          | Setup Wizard                 | Budget Template |
    | Capital Program Wizard RollUps4 | Selenium Folder Template | Capital Program Setup Wizard | Selenium-Budget |


  Scenario Outline: As a delete user I Navigate to Admin > Manage Budget Summary Page
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Page Layout Name>" sub row in the grid "main"
    And I switch to "Edit Layout" child window
    And I set following fields value on editable page
      | name                             | value |
      | _checkbox_ValidForCapitalProgram | true  |
      | _checkbox_ValidForCapitalProject | true  |
    And I click on "Update" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window


    And I click "build layout" action of "<Page Layout Name>" sub row in the grid "main"
    And I switch to "build layout" child window

    And I click on the "..." optional Field Label for the "Test Column a1" field
    And I set fields values on editable page
      | name                     | value |
      | json.RollupProjectValues | true  |
    And I click on "Set Options" Button

    And I click on the "..." optional Field Label for the "Test Column a2" field
    And I set fields values on editable page
      | name                     | value |
      | json.RollupProjectValues | true  |
    And I click on "Set Options" Button

    And I click on the "..." optional Field Label for the "Test Column a3" field
    And I set fields values on editable page
      | name                     | value |
      | json.RollupProjectValues | true  |
    And I click on "Set Options" Button

    And I click on "Save Layout" Button
    And I click on "Close" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Page Layout Name |
    | DeleteAccess | Delete Access Access | Capital RollUps  |


  Scenario Outline: As a delete user I Navigate to Capital Project "Facility one 123: Capital Program Wizard RollUps" click on Budgets>Budget Creation and view the values
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "Facility one 123: <Name>" that was created
    And Click on the name of the "Facility one 123: <Name>" in the results pop-up
    Then I see "Facility one 123: <Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Budget Creation" action panel button
    And I switch to visible frame
    And I verify budget name "Test Column a1 #01" and Total "$2,000.00" on template
    And I verify budget name "Test Column a2 #01" and Total "$3,000.00" on template
    And I verify budget name "Test Column a3 #01" and Total "$4,000.00" on template
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Name                            | Secondary Tab | Third Level Tab |
    | DeleteAccess | Delete Access Access | Capital Program Wizard RollUps4 | Details       | Budget          |

  Scenario Outline: As a delete user I Navigate to Capital Project "Facility two 456: Capital Program Wizard RollUps" click on Budgets>Budget Creation and view the values
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "Facility two 456: <Name>" that was created
    And Click on the name of the "Facility two 456: <Name>" in the results pop-up
    Then I see "Facility two 456: <Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Budget Creation" action panel button
    And I switch to visible frame
    And I verify budget name "Test Column a1 #01" and Total "$2,000.00" on template
    And I verify budget name "Test Column a2 #01" and Total "$3,000.00" on template
    And I verify budget name "Test Column a3 #01" and Total "$4,000.00" on template
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Name                            | Secondary Tab | Third Level Tab |
    | DeleteAccess | Delete Access Access | Capital Program Wizard RollUps4 | Details       | Budget          |


  Scenario Outline: As a delete user I Navigate to Capital Program >Budgets>Budget Creation
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Budget Creation" action panel button

    And I switch to visible frame
    And I click on "Add" Button
    And I switch to default frame
    And I set following fields value on editable page
      | name         | value          |
      | PageLayoutID | Test Column a1 |
    And I click on "Submit" Button
    And I click on the "Add" button

    And I switch to visible frame
    And I click on "Add" Button
    And I switch to default frame
    And I set following fields value on editable page
      | name         | value          |
      | PageLayoutID | Test Column a2 |
    And I click on "Submit" Button
    And I click on the "Add" button

    And I switch to visible frame
    And I click on "Add" Button
    And I switch to default frame
    And I set following fields value on editable page
      | name         | value          |
      | PageLayoutID | Test Column a3 |
    And I click on "Submit" Button
    And I click on the "Add" button

    And I switch to visible frame
    And I verify budget name "Test Column a1 #02" on template
    And I verify budget name "Test Column a2 #02" on template
    And I verify budget name "Test Column a3 #02" on template
    And I switch to default frame

    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
#    And I click on row from grid "putTheGridHere" having unique value "Facility one 123: <Entity Name>" under column header ""
#      | name           | value                           |
#      |                | Facility one 123: <Entity Name> |
#      | Test Column a1 | $2,000.00                       |
#      | Test Column a2 | $3,000.00                       |
#      | Test Column a3 | $4,000.00                       |
#
#
#
#
#    And I click on row from grid "putTheGridHere" having unique value "Facility two 456: <Entity Name>" under column header ""
#      | name           | value                           |
#      |                | Facility two 456: <Entity Name> |
#      | Test Column a1 | $2,000.00                       |
#      | Test Column a2 | $3,000.00                       |
#      | Test Column a3 | $4,000.00                       |
#
#    And I click on row from grid "putTheGridHere" having unique value "<Entity Name> Total" under column header ""
#      | name           | value               |
#      |                | <Entity Name> Total |
#      | Test Column a1 | $4,000.00           |
#      | Test Column a2 | $6,000.00           |
#      | Test Column a3 | $8,000.00           |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name                     | Secondary Tab | Third Level Tab |
    | DeleteAccess | Delete Access Access | Capital Program Wizard RollUps4 | Details       | Budget          |
