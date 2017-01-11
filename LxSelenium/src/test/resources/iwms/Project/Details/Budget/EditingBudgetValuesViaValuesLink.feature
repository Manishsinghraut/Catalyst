@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1020), Editing Budget Values via Values Link

  Scenario Outline: As a delete user I Edit Budget Values via Values Link

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/"
    And I import following file name:
      | BudgetTemplate(5).xml   |
      | BudgetValuesProject.xml |
      | BudgetValuesColumn.xml  |
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
    And I wait for the Loading text to disappear

    #Add budget column
    And I click on "Add" Button
    And I wait for "Select Item To Add" modal window to open in non frame page
    And I set following fields value on editable page
      | name         | value        |
      | PageLayoutID | Parts budget |
    And I click on "Submit" Button
    And I set following fields value on editable page
      | name                     | value          |
      | CodeBudgetColumnStatusID | Default Status |
    And I click "Add and View Values" button in modal window "Select Item To Add"
    Then I verify title "Parts budget" in a frame page
    And I verify the following values in frame grid "putTheGridHere"
      | Name            | Comment | Quantity | Units | Unit Cost | Value |
      | Exterior        |         |          |       |           | $0.00 |
      | Carpet          |         |          |       |           | $0.00 |
      | Doors           |         |          |       |           | $0.00 |
      | Interior        |         |          |       |           | $0.00 |
      | Playground      |         |          |       |           | $0.00 |
      | Patio Furniture |         |          |       |           | $0.00 |
      | Total           |         |          |       |           | $0.00 |

    #Edit budget column

    And I click on row from grid "putTheGridHere" having unique value "Carpet" under column header "Name"
      | name    | value |
      | Comment |       |
      | Value   | $0.00 |

    And I enter the following row values in grid "putTheGridHere" by the following values
      | Quantity  | 10 | 1 |
      | Unit Cost | 30 | 3 |
    And I click "Update" button

    And I click on row from grid "putTheGridHere" having unique value "Doors" under column header "Name"
      | name    | value |
      | Comment |       |
      | Value   | $0.00 |

    And I enter the following row values in grid "putTheGridHere" by the following values
      | Quantity  | 6  | 1 |
      | Unit Cost | 50 | 3 |
    And I click "Update" button


    And I click on row from grid "putTheGridHere" having unique value "Playground" under column header "Name"
      | name    | value |
      | Comment |       |
      | Value   | $0.00 |

    And I enter the following row values in grid "putTheGridHere" by the following values
      | Quantity  | 1    | 1 |
      | Unit Cost | 2000 | 3 |
    And I click "Update" button

    And I click on row from grid "putTheGridHere" having unique value "Patio Furniture" under column header "Name"
      | name    | value |
      | Comment |       |
      | Value   | $0.00 |

    And I enter the following row values in grid "putTheGridHere" by the following values
      | Quantity  | 12 | 1 |
      | Unit Cost | 20 | 3 |
    And I click "Update" button


    And I verify the following values in frame grid "putTheGridHere"
      | Name            | Comment | Quantity | Units | Unit Cost | Value     |
      | Exterior        |         |          |       |           | $600.00   |
      | Carpet          |         | 10       |       | $30.00    | $300.00   |
      | Doors           |         | 6        |       | $50.00    | $300.00   |
      | Interior        |         |          |       |           | $2,240.00 |
      | Playground      |         | 1        |       | $2,000.00 | $2,000.00 |
      | Patio Furniture |         | 12       |       | $20.00    | $240.00   |
      | Total           |         |          |       |           | $2,840.00 |


    Examples:
      | Login User   | Login full username  | Entity Name              |
      | DeleteAccess | Delete Access Access | BudgetValuesProject-1020 |