@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1468), Update Budget Column and Budget item value via Spreadsheet

  Scenario Outline: As a delete user I import the following xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following files:
      | BudgetTemplate-1468.xml          |
      | BudgetUpdateColumn-1468.xml      |
      | BudgetUpdateProject1-1468.xml    |
      | BudgetUpdateSummaryPage-1468.xml |

    When I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Summary Page>" sub row in the grid "main"
    And I switch to "Edit Summary Page" child window
    And I set following fields value on editable page
      | name                      | value |
      | _checkbox_ValidForProject | true  |
    And I click on "Update" Button
    Then I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Summary Page        |
      | DeleteAccess | Delete Access Access | Update summary page |


  Scenario Outline: As a delete user verify A budget column line item will be populated with the total: $100.
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following files:
      | CreateBudgetLineItem-1468.xlsx |

    And I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Budget" tab
    And I click on the "Budget Summary" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | <Budget Type> |
      | Exterior                           | $100.00       |
      | Carpet                             | $100.00       |
      | Doors                              | $0.00         |
      | Interior                           | $0.00         |
      | Playground                         | $0.00         |
      | Patio Furniture                    | $0.00         |
      | Total                              | $100.00       |

    And I click on the "Budget Creation" action panel button
    Then I verify the following values in frame grid
      | Budget Name      | Description | Status         | Contractor | Total   | Created                        |
      | Parts budget #01 |             | Default Status |            | $100.00 | [Today's Date with Hour AM/PM] |


    Examples:
      | Project Name        | Summary Page        | Budget Type  |
      | BudgetUpdateProject | Update summary page | Parts budget |


  Scenario Outline: As a delete user I verify budget column line item will now be updated with a new total of: $150
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following files:
      | UpdateBudgetLineItem-1468.xlsx |

    And I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Budget" tab
    And I click on the "Budget Summary" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | <Budget Type> |
      | Exterior                           | $150.00       |
      | Carpet                             | $150.00       |
      | Doors                              | $0.00         |
      | Interior                           | $0.00         |
      | Playground                         | $0.00         |
      | Patio Furniture                    | $0.00         |
      | Total                              | $150.00       |

    And I click on the "Budget Creation" action panel button
    Then I verify the following values in frame grid
      | Budget Name       | Description | Status         | Contractor | Total   | Created                        |
      | <Budget Type> #01 |             | Default Status |            | $150.00 | [Today's Date with Hour AM/PM] |


    Examples:
      | Project Name        | Summary Page        | Budget Type  |
      | BudgetUpdateProject | Update summary page | Parts budget |