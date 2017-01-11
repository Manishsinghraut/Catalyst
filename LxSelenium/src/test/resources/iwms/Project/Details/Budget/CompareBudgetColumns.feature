@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1019), Compare Budget Columns

  Scenario Outline: As a delete user I import files

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/"
    And I import following file name:
      | BudgetColumn(4).xml        |
      | BudgetTemplate1019.xml     |
      | BudgetSummaryPage.xml      |
      | CompareBudgetOnProject.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I compare budget columns

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
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
    And I click on the "Budget Creation" action panel button

    #Add budget column ColumnCost
    And I wait for the Loading text to disappear
    And I click on "Add" Button
    And I wait for "Select Item To Add" modal window to open in non frame page
    And I set following fields value on editable page
      | name         | value      |
      | PageLayoutID | ColumnCost |
    And I click on "Submit" Button
    And I set following fields value on editable page
      | name                     | value          |
      | CodeBudgetColumnStatusID | Default Status |
    And I verify the following fields value on editable page
      | name                | value      |
      | RawBudgetColumnName | ColumnCost |
    And I click "Add and View Values" button in modal window "Select Item To Add"
    #Edit budget column
    And I click on row from grid "putTheGridHere" having unique value "Carpet" under column header "Name"
      | name    | value |
      | Comment |       |
      | Value   | $0.00 |

    And I enter the following row values in grid "putTheGridHere" by the following values
      | Quantity  | 5     | 1 |
      | Unit Cost | 200   | 3 |
      | Comments  | Test1 | 0 |
    And I click "Update" button
    And I verify the following values in frame grid "putTheGridHere"
      | Name            | Comment | Quantity | Units | Unit Cost | Value     |
      | Exterior        |         |          |       |           | $1,000.00 |
      | Carpet          | Test1   | 5        |       | $200.00   | $1,000.00 |
      | Doors           |         |          |       |           | $0.00     |
      | Interior        |         |          |       |           | $0.00     |
      | Playground      |         |          |       |           | $0.00     |
      | Patio Furniture |         |          |       |           | $0.00     |
      | Total           |         |          |       |           | $1,000.00 |

    #Add budget column invoice cost
    And I click on the "Budget Creation" action panel button
    And I wait for the Loading text to disappear
    And I click on "Add" Button
    And I wait for "Select Item To Add" modal window to open in non frame page
    And I set following fields value on editable page
      | name         | value       |
      | PageLayoutID | InvoiceCost |
    And I click on "Submit" Button
    And I set following fields value on editable page
      | name                     | value          |
      | CodeBudgetColumnStatusID | Default Status |
    And I verify the following fields value on editable page
      | name                | value       |
      | RawBudgetColumnName | InvoiceCost |
    And I click "Add and View Values" button in modal window "Select Item To Add"
    Then I verify title "InvoiceCost" in a frame page
    #Edit budget column
    And I click on row from grid "putTheGridHere" having unique value "Carpet" under column header "Name"
      | name    | value |
      | Comment |       |
      | Value   | $0.00 |

    And I enter the following row values in grid "putTheGridHere" by the following values
      | Quantity  | 4     | 1 |
      | Unit Cost | 450   | 3 |
      | Comments  | Test2 | 0 |
    And I click "Update" button
    And I verify the following values in frame grid "putTheGridHere"
      | Name            | Comment | Quantity | Units | Unit Cost | Value     |
      | Exterior        |         |          |       |           | $1,800.00 |
      | Carpet          | Test2   | 4        |       | $450.00   | $1,800.00 |
      | Doors           |         |          |       |           | $0.00     |
      | Interior        |         |          |       |           | $0.00     |
      | Playground      |         |          |       |           | $0.00     |
      | Patio Furniture |         |          |       |           | $0.00     |
      | Total           |         |          |       |           | $1,800.00 |

     #Add budget column Processed cost
    And I click on the "Budget Creation" action panel button
    And I wait for the Loading text to disappear
    And I click on "Add" Button
    And I wait for "Select Item To Add" modal window to open in non frame page
    And I set following fields value on editable page
      | name         | value         |
      | PageLayoutID | ProcessedCost |
    And I click on "Submit" Button
    And I set following fields value on editable page
      | name                     | value          |
      | CodeBudgetColumnStatusID | Default Status |
    And I verify the following fields value on editable page
      | name                | value         |
      | RawBudgetColumnName | ProcessedCost |
    And I click "Add and View Values" button in modal window "Select Item To Add"
    Then I verify title "ProcessedCost" in a frame page
    #Edit budget column
    And I click on row from grid "putTheGridHere" having unique value "Carpet" under column header "Name"
      | name    | value |
      | Comment |       |
      | Value   | $0.00 |

    And I enter the following row values in grid "putTheGridHere" by the following values
      | Quantity  | 3     | 1 |
      | Unit Cost | 375   | 3 |
      | Comments  | Test3 | 0 |
    And I click "Update" button
    And I verify the following values in frame grid "putTheGridHere"
      | Name            | Comment | Quantity | Units | Unit Cost | Value     |
      | Exterior        |         |          |       |           | $1,125.00 |
      | Carpet          | Test3   | 3        |       | $375.00   | $1,125.00 |
      | Doors           |         |          |       |           | $0.00     |
      | Interior        |         |          |       |           | $0.00     |
      | Playground      |         |          |       |           | $0.00     |
      | Patio Furniture |         |          |       |           | $0.00     |
      | Total           |         |          |       |           | $1,125.00 |

    And I click on the "Budget Comparisons" action panel button
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name                | value          |
      | availBudgetColumnID | ColumnCost #01 |
    And I click on ">>" Button

    And I set following fields value on editable page
      | name                | value           |
      | availBudgetColumnID | InvoiceCost #01 |
    And I click on ">>" Button
    And I click on "Submit" Button
    And I click on "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All> | ColumnCost #01 | InvoiceCost #01 | Variance |
      | Exterior             | $1,000.00      | $1,800.00       | $800.00  |
      | Carpet               | $1,000.00      | $1,800.00       | $800.00  |
      | Doors                | $0.00          | $0.00           | $0.00    |
      | Interior             | $0.00          | $0.00           | $0.00    |
      | Playground           | $0.00          | $0.00           | $0.00    |
      | Patio Furniture      | $0.00          | $0.00           | $0.00    |
      | Total                | $1,000.00      | $1,800.00       | $800.00  |
    And I click on the "Budget Comparisons" action panel button
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name                | value          |
      | availBudgetColumnID | ColumnCost #01 |
    And I click on ">>" Button
    And I click on "Submit" Button and handle the alert "Must select at least two columns to compare."
    And I click on the "Budget Creation" action panel button


    Examples:
      | Login User   | Login full username  | Entity Name                    |
      | DeleteAccess | Delete Access Access | Compare Budget on Project-1019 |
