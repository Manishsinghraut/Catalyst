@all
Feature: Creating Budget report with Java script expression (Jira Ref. : AUTOMATION-1370)

  Scenario Outline: Import the following test data files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/BudgetReporting/"
    And I import following file name:
      | Sprint17PortfolioandLocation-1370.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Import the following test data files and verify the Budget Template
    Given I used data files from "Data/ImportDataFiles/iwms/Reports/BudgetReporting/"
    And I import following file name:
      | 13552BudgetTemplate_1370.xml |
    Then I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I verify a row from non frame grid "<Grid>" having unique value "13552 Budget Template" under column header "Budget Template Name"
      | name                 | value                 |
      | Budget Template Name | 13552 Budget Template |

    Examples:
      | Grid |
      | main |


  Scenario Outline: Import the following test data files and verify it shall create 4 budget columns successfully
    Given I used data files from "Data/ImportDataFiles/iwms/Reports/BudgetReporting/"
    And I import following file name:
      | columns_1370.xml |
    Then I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I verify a row from non frame grid "<Grid>" having unique value "ConstructionA" under column header "Name"
      | name            | value          |
      | Name            | ConstructionA  |
      | Selected Status | Default Status |
    And I verify a row from non frame grid "<Grid>" having unique value "ConstructionB" under column header "Name"
      | name            | value          |
      | Name            | ConstructionB  |
      | Selected Status | Default Status |
    And I verify a row from non frame grid "<Grid>" having unique value "ConstructionC" under column header "Name"
      | name            | value          |
      | Name            | ConstructionC  |
      | Selected Status | Default Status |

    Examples:
      | Grid                   |
      | BOGridBudgetColumnType |

  Scenario Outline: Import the following test data files and I verify the create budget summary page successfully
    Given I used data files from "Data/ImportDataFiles/iwms/Reports/BudgetReporting/"
    And I import following file name:
      | 13552Layout_1370.xml      |
      | 13552_Project_1370.xml    |
      | JavaScriptReport_1370.xml |
    Then I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Budget Summary Page>" sub row in the grid "<Grid>"
    And I switch to "Budget Summary Edit" child window
    And I set following fields value on editable page
      | name                      | value |
      | _checkbox_ValidForProject | true  |
    And I click on the update button
    And I switch to main window

    Examples:
      | Grid | Budget Summary Page |
      | main | 13552 layout        |

  Scenario Outline: I verify the 13552 Project> Budget tab>Budget Summary
    Given I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I click on the "Budget Summary" action panel button
    And I select "<Budget Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on the "<Expand All>" link
    And I verify the following values in non frame grid
      | Name  <Collapse All>  <Hide Empty> | ConstructionA | ConstructionB | ConstructionC |
      | Level1                             | $16,500.00    | $16,000.00    | $14,900.00    |
      | Prima                              | $5,500.00     | $6,000.00     | $4,000.00     |
      | Paint                              | $6,000.00     | $7,000.00     | $6,000.00     |
      | Finishes                           | $5,000.00     | $3,000.00     | $4,900.00     |
      | Total                              | $16,500.00    | $16,000.00    | $14,900.00    |
    And I switch to default frame

    Examples:
      | Entity Name   | Third Level Tab | Budget Summary Page |
      | 13552 Project | Budget          | 13552 layout        |


  Scenario Outline: I verify the Run report titled 'Report-13551'
    Given I navigate to the reports dashboard
    And I click "edit" row action in the non frame grid "<Grid>" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "report" child window
    And I edit report step "Step 4 - Field List and Details"
    And I click on the "edit" row action of column "Script- Total" of column "0" from grid "BOGridCustomObjectDel"
    And I click on the "<Edit Expression>" link
    And I verify the following fields value on editable page
      | name                        | value                    |
      | json_ComputedSQLTableID     | Budget Column Item Value |
      | FieldContext                | BS                       |
      | _checkbox_json_debugValueJS | false                    |
    And I verify the following fields value contains on editable page
      | name                  | value                                                                                    |
      | json_ComputedDataType | Money                                                                                    |
      | json_computeValueJS   | var envOnly = getNum(${BudgetColumnItemValue.ItemValue:{BudgetColumnID:ConstructionA}}); |
      | json_computeValueJS   | var arc = getNum(${BudgetColumnItemValue.ItemValue:{BudgetColumnID:ConstructionB}});     |
      | json_computeValueJS   | var valueToSet = envOnly + arc;                                                          |
      | json_computeValueJS   | function getNum(n){return n;}                                                            |
    And I click "Close" button
    And I click "Cancel" button
    And I click on Finish button
    And I click on the "Save and Run Report" button on Modify and Save Report
    And I verify the following values in non frame grid
      | Name          | Script- Total | Line Item Code | Budget Line Item Name | ConstructionA | ConstructionB | ConstructionC |
      | 13552 Project | $8,000.00     | 11             | Finishes              | $5,000.00     | $3,000.00     | $4,900.00     |
      | 13552 Project |               | 1              | Level1                |               |               |               |
      | 13552 Project | $11,500.00    | 33             | Prima                 | $5,500.00     | $6,000.00     | $4,000.00     |
      | 13552 Project | $13,000.00    | 22             | Paint                 | $6,000.00     | $7,000.00     | $6,000.00     |
    And I close the "Report" child window
    And I switch to main window

    Examples:
      | Grid        | Report Name        |
      | ^editBOGrid | Java Script Report |