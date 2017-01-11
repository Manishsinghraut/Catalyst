@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1070), Budget Math Fields- Zero should be displayed if a column in the math is 0

  Scenario Outline: As a delete user I import the following xmls in the following order
  1. Budget Template
  2. Budget Types Column
  3. Project entity

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following file name:
      | BudgetTemplate1070.xml          |
      | BudgetColumnsForMathFields.xml  |
      | ProjectForMathfieldinBudget.xml |
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I verify the following values in non frame grid "BOGridBudgetColumnType"
      | Name         | Selected Status | Are Budget Values Editable? | Use this Budget View | Allow one instance of this type per project | Allow multiple instances with Selected Status | Used For Bidding | Used For Bid Conditioning |
      | Estimate One | Default Status  | checked                     |                      | unchecked                                   | checked                                       | unchecked        | unchecked                 |

    And I verify the following values in non frame grid "BOGridBudgetColumnType"
      | Name         | Selected Status | Are Budget Values Editable? | Use this Budget View | Allow one instance of this type per project | Allow multiple instances with Selected Status | Used For Bidding | Used For Bid Conditioning |
      | Estimate Two | Default Status  | checked                     |                      | unchecked                                   | checked                                       | unchecked        | unchecked                 |

    And I verify the following values in non frame grid "BOGridBudgetColumnType"
      | Name           | Selected Status | Are Budget Values Editable? | Use this Budget View | Allow one instance of this type per project | Allow multiple instances with Selected Status | Used For Bidding | Used For Bid Conditioning |
      | Estimate Three | Default Status  | checked                     |                      | unchecked                                   | checked                                       | unchecked        | unchecked                 |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click on "Add" Button
    And I switch to "Budget Summary Page Creation" child window
    And I set following fields value on editable page
      | name                      | value                      |
      | PageLayoutName            | <Summary Page>             |
      | Description               | To calculate yearly budget |
      | _checkbox_ValidForProject | true                       |
    And I click on "Add" Button
    And I switch to main window
    And I see "Successfully added item" message in the grid
    And I verify a row from reports grid "main" having the following header and cell value pair
      | name             | value          |
      | Page Layout Name | <Summary Page> |

    And I click "build layout" action of "<Summary Page>" sub row in the grid "main"
    And I switch to "Build Layout" child window
    And I wait for the Loading text to disappear in grid
    And I expand the following
      | Available Fields |
      | Budget Types     |
    Then I drag and drop the following
      | Estimate One   |
      | Estimate Two   |
      | Estimate Three |
    #Insert math field 1
    And I insert the new field "Math Field"
    And I see a modal window
    And I set fields values on editable page
      | name              | value              |
      | defaultLabel      | <Field Name 1>     |
      | codeSQLTableID    | Budget Column Type |
      | formFieldType     | Total              |
      | reportGroupDataID | Budget Types       |
    And I expand the following math operation tree
      | Available Fields |
      | Budget Types     |
    And I double click on following fields
      | Estimate One |
    And I click on + button
    And I double click on following fields
      | Estimate Two |
    And I click on + button
    And I double click on following fields
      | Estimate Three |
    And I wait for the Loading text to disappear in grid
    And I click on "Submit" Button
    And I wait for modal window to close

    #Insert math field 2
    And I insert the new field "Math Field"
    And I see a modal window
    And I set fields values on editable page
      | name              | value              |
      | defaultLabel      | <Field Name 2>     |
      | codeSQLTableID    | Budget Column Type |
      | formFieldType     | Currency           |
      | reportGroupDataID | Budget Types       |
    And I expand the following math operation tree
      | Available Fields |
      | Budget Types     |
    And I double click on following fields
      | Estimate One |
    And I click on "/" Button
    And I double click on following fields
      | Estimate Two |
    And I wait for the Loading text to disappear in grid
    And I click on "Submit" Button
    And I wait for modal window to close

    #Insert math field 3
    And I insert the new field "Math Field"
    And I see a modal window
    And I set fields values on editable page
      | name              | value              |
      | defaultLabel      | <Field Name 3>     |
      | codeSQLTableID    | Budget Column Type |
      | formFieldType     | Percentage         |
      | reportGroupDataID | Budget Types       |
    And I expand the following math operation tree
      | Available Fields |
      | Budget Types     |
    And I double click on following fields
      | Estimate One |
    And I click on "/" Button
    And I double click on following fields
      | Estimate Three |
    And I wait for the Loading text to disappear in grid
    And I click on "Submit" Button
    And I wait for modal window to close

    And I click on "Save Layout" Button
    And I click on "Close" Button
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Summary Page           | Field Name 1 | Field Name 2 | Field Name 3      |
      | DeleteAccess | Delete Access Access | MathFieldBudgetSummary | Total        | E1divE2      | E1divE3Percentage |


  Scenario Outline: As a delete user I verify Values in all the columns

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name        | Description | Status         | Contractor | Total   |
      | Estimate One #01   |             | Default Status |            | $650.00 |
      | Estimate Three #01 |             | Default Status |            | $450.00 |
      | Estimate Two #01   |             | Default Status |            | $700.00 |

    And I click on the "Budget Summary" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | Estimate One | Estimate Two | Estimate Three | Total     | E1divE2 | E1divE3Percentage |
      | Exterior                           | $350.00      | $400.00      | $250.00        | $1,000.00 | $0.88   | 140.00%           |
      | Carpet                             | $150.00      | $0.00        | $250.00        | $400.00   | $0.00   | 60.00%            |
      | Doors                              | $200.00      | $400.00      | $0.00          | $600.00   | $0.50   | $0.00             |
      | Interior                           | $300.00      | $300.00      | $200.00        | $800.00   | $1.00   | 150.00%           |
      | Playground                         | $200.00      | $300.00      | $0.00          | $500.00   | $0.67   | $0.00             |
      | Patio Furniture                    | $100.00      | $0.00        | $200.00        | $300.00   | $0.00   | 50.00%            |
      | Total                              | $650.00      | $700.00      | $450.00        | $1,800.00 | $0.93   | 144.44%           |


    Examples:
      | Login User   | Login full username  | Entity Name                 | Summary Page           |
      | DeleteAccess | Delete Access Access | ProjectForMathfieldinBudget | MathFieldBudgetSummary |