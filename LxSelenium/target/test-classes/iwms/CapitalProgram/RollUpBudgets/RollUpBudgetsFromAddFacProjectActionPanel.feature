@all
Feature:  (Ref : Jira Ticket No : AUTOMATION-1204) Roll Up Budgets from Add Fac Project Action panel

  Scenario Outline: As a delete user I import the following xmls in the following order

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/CapitalProgram/RollUpBudgets/"
    And I import following file name:
      | BudgetTemplate_1204.xml          |
      | BudgetColumns_1204.xml           |
      | BudgetRollUpSummaryPage_1204.xml |
      | Entity_1204.xml                  |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Page Layout Name>" sub row in the grid "main"
    And I switch to "Edit Layout" child window
    And I set following fields value on editable page
      | name                             | value |
      | _checkbox_ValidForCapitalProgram | true  |
    And I click on "Update" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window


    Examples:
      | Login User   | Login full username  | Page Layout Name  |
      | DeleteAccess | Delete Access Access | Roll Up Summary A |


  Scenario Outline: Add Two capital projects as delete user
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    When I navigate to entity type "Capital Programs" named "<Capital Program>" through search option
    And I click on the "Add Fac. Project(s)" action panel button
    And I delete incomplete setup wizard if exist
    Then I wait for "Capital Program Setup Wizard -> <Capital Program> -> Folder Set-up" modal window to open in non frame page
    And I set following fields value on editable page
      | name           | value             |
      | projTemplateID | <Folder Template> |
    And I click on the "Next" button

    And I set following fields value on editable page
      | name                   | value             |
      | entityBudgetTemplateID | <Budget Template> |

    And I click "Add" button
    And I Add column type "Roll Construction Values" and click on upload spreadsheet drop down
    And I switch to "File Upload window" child window
    And I upload the following document from path "Data/ImportDataFiles/iwms/CapitalProgram/RollUpBudgets/":
      | RollConstruction_1024.xls |
    And I click on upload budget button
    And I wait for second child window to close
    And I switch to main window
    And I click "Update" button

    And I click "Add" button
    And I Add column type "Roll Excavation Values" and click on upload spreadsheet drop down
    And I switch to "File Upload window" child window
    And I upload the following document from path "Data/ImportDataFiles/iwms/CapitalProgram/RollUpBudgets/":
      | ExcavationConstruction_1204.xls |
    And I click on upload budget button
    And I wait for second child window to close
    And I switch to main window
    And I click "Update" button

    And I click "Add" button
    And I Add column type "Roll Leveling Values" and click on upload spreadsheet drop down
    And I switch to "File Upload window" child window
    And I upload the following document from path "Data/ImportDataFiles/iwms/CapitalProgram/RollUpBudgets/":
      | LevelingConstruction_1204.xls |
    And I click on upload budget button
    And I wait for second child window to close
    And I switch to main window
    And I click "Update" button

    And I verify all rows count "3" in non frame grid "BudgetColumnGridDiv"
    And I verify the following values in non frame grid "BudgetColumnGridDiv"
      | Column Type              | Upload Spreadsheet       |
      | Roll Construction Values | Uploaded total:$6,000.00 |
      | Roll Excavation Values   | Uploaded total:$8,000.00 |
      | Roll Leveling Values     | Uploaded total:$5,000.00 |
    And I click on the "Next" button

    And I set following fields value on editable page
      | name           | value               |
      | projTemplateID | <Schedule Template> |
    And I click on the "Next" button

    And I select facility "Roll Facility 1"
    And I select facility "Roll Facility 2"
    And I click on the "Next" button
    And I set following fields value on editable page
      | name              | value          |
      | CodeProjectTypeID | Retail Project |
    And I click on the "Create/Update Projects" button
    Then I verify success message after creating or importing projects
      | Finished processing                                                                                                            |
      | Total Projects Created: 2                                                                                                      |
      | Total Projects which Failed: 0                                                                                                 |
      | Warning Messages:                                                                                                              |
      | Unable to apply schedule template for 'Roll Facility 1: <Capital Program>', you must specify either a Start On or End By date. |
      | Unable to apply schedule template for 'Roll Facility 2: <Capital Program>', you must specify either a Start On or End By date. |
    And I click on the "Finish" button
    Then I see that I am on the entity "Program: <Capital Program>"
    And I wait for the Loading text to disappear
    And I expand the following tree
      | Open123 |
      |         |
      | Central |
    And I verify the following values in frame grid "multiGroupEx1"
      | Name                                       | Count | Delivered By |
      | Roll Facility 1: Roll Up Capital Program A | 1     |              |
      | Roll Facility 2: Roll Up Capital Program A | 1     |              |


    Examples:
      | Capital Program           | Folder Template          | Budget Template | Schedule Template | Login User   | Login full username  |
      | Roll Up Capital Program A | Selenium Folder Template | Selenium-Budget | Selenium Schedule | DeleteAccess | Delete Access Access |

  Scenario Outline: Verify the values in Capital Projects

#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Capital Project 1>" that was created
    And Click on the name of the "<Capital Project 1>" in the results pop-up
    Then I see "<Capital Project 1>" name on the header
    And I click on "Budget" tab
    And I select "<Page Layout Name>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name                  | Description | Status         | Contractor | Total     |
      | Roll Construction Values #01 |             | Default Status |            | $6,000.00 |
      | Roll Excavation Values #01   |             | Default Status |            | $8,000.00 |
      | Roll Leveling Values #01     |             | Default Status |            | $5,000.00 |

    And I Search for the "<Capital Project 2>" that was created
    And Click on the name of the "<Capital Project 2>" in the results pop-up
    Then I see "<Capital Project 2>" name on the header
    And I click on "Budget" tab
    And I select "<Page Layout Name>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name                  | Description | Status         | Contractor | Total     |
      | Roll Construction Values #01 |             | Default Status |            | $6,000.00 |
      | Roll Excavation Values #01   |             | Default Status |            | $8,000.00 |
      | Roll Leveling Values #01     |             | Default Status |            | $5,000.00 |

    And I navigate to entity type "Capital Program" named "Roll Up Capital Program A" through search option
    And I click on "Budget" tab
    And I click on the "Budget Summary" action panel button
    And I select "<Page Layout Name>" page layout from dropdown
    And I verify the following values in frame grid "putTheGridHere"
      |                                            |
      | Roll Facility 1: Roll Up Capital Program A |
      | Roll Facility 2: Roll Up Capital Program A |
      | Roll Up Capital Program A Total            |

    And I verify the following values in frame grid "$normal"
      | Roll Construction Values | Roll Excavation Values | Roll Leveling Values |
      | $6,000.00                | $8,000.00              | $5,000.00            |
      | $6,000.00                | $8,000.00              | $5,000.00            |
      | $12,000.00               | $16,000.00             | $10,000.00           |


    Examples:
      | Page Layout Name  | Login User   | Login full username  | Capital Project 1                          | Capital Project 2                          |
      | Roll Up Summary A | DeleteAccess | Delete Access Access | Roll Facility 1: Roll Up Capital Program A | Roll Facility 2: Roll Up Capital Program A |