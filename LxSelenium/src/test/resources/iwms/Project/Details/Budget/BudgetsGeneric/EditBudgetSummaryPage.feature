@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1071), Edit Budget Summary Page

  Scenario Outline: As a delete user I import the following xmls in the following order
  1. Budget Column
  2. Budget Template
  3. Project entity

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following file name:
      | BudgetTemplate1071.xml    |
      | BudgetColumnTypes1071.xml |
      | ProjectSummary1071.xml    |
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click on "Add" Button
    And I switch to "Budget Summary Page Creation" child window
    And I set following fields value on editable page
      | name                               | value                      |
      | PageLayoutName                     | <Summary Page>             |
      | Description                        | To calculate yearly budget |
      | _checkbox_ValidForPotentialProject | true                       |
      | _checkbox_ValidForProject          | true                       |
      | _checkbox_ValidForFacility         | true                       |
      | _checkbox_ValidForPrototype        | true                       |
      | _checkbox_ValidForProgram          | true                       |
      | _checkbox_ValidForCapitalProgram   | true                       |
      | _checkbox_ValidForCapitalProject   | true                       |
      | _checkbox_ValidForLocation         | true                       |
      | _checkbox_ValidForParcel           | true                       |

    And I verify the following fields value on editable page
      | name                               | value                      |
      | PageLayoutName                     | <Summary Page>             |
      | Description                        | To calculate yearly budget |
      | _checkbox_ValidForPotentialProject | true                       |
      | _checkbox_ValidForProject          | true                       |
      | _checkbox_ValidForFacility         | true                       |
      | _checkbox_ValidForPrototype        | true                       |
      | _checkbox_ValidForProgram          | true                       |
      | _checkbox_ValidForCapitalProgram   | true                       |
      | _checkbox_ValidForCapitalProject   | true                       |
      | _checkbox_ValidForLocation         | true                       |
      | _checkbox_ValidForParcel           | true                       |
    And I click on "Add" Button
    And I switch to main window
    And I click "build layout" action of "<Summary Page>" sub row in the grid "main"
    And I switch to "Build Layout" child window
    And I wait for the Loading text to disappear in grid
    And I expand the following
      | Available Fields |
      | Budget Types     |
    Then I drag and drop the following
      | Curing Concrete        |
      | Excavation             |
      | Footing and Foundation |
    And I remove following field from the layout "Footing and Foundation"

    And I insert the new field "Math Field"
    And I see a modal window
    And I set fields values on editable page
      | name              | value              |
      | defaultLabel      | <Math Field Name>  |
      | codeSQLTableID    | Budget Column Type |
      | formFieldType     | Number             |
      | reportGroupDataID | Budget Types       |
    And I expand the following math operation tree
      | Available Fields |
      | Budget Types     |
    And I double click on following fields
      | Excavation |
    And I click on + button
    And I double click on following fields
      | Curing Concrete |
    And I click on "Submit" Button
    And I wait for modal window to close
    And I click on "Save Layout" Button
    And I click on "Close" Button
    And I switch to main window

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I wait for the Loading text to disappear

    And I click on "Add" Button
    And I wait for "Select Item To Add" modal window to open in non frame page
    And I set following fields value on editable page
      | name         | value      |
      | PageLayoutID | Excavation |
    And I click on "Submit" Button
    And I set following fields value on editable page
      | name                     | value          |
      | CodeBudgetColumnStatusID | Default Status |
    And I click "Add and View Values" button in modal window "Select Item To Add"
    Then I verify title "Excavation" in a frame page

    And I click on the "Budget Summary" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I switch to visible frame
    And I click on "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | Curing Concrete | Excavation | <Math Field Name> |
      | Exterior                           | $0.00           | $0.00      | $0.00             |
      | Carpet                             | $0.00           | $0.00      | $0.00             |
      | Doors                              | $0.00           | $0.00      | $0.00             |
      | Interior                           | $0.00           | $0.00      | $0.00             |
      | Playground                         | $0.00           | $0.00      | $0.00             |
      | Patio Furniture                    | $0.00           | $0.00      | $0.00             |
      | Total                              | $0.00           | $0.00      | $0.00             |

    Examples:
      | Login User   | Login full username  | Summary Page          | Math Field Name  | Entity Name          |
      | DeleteAccess | Delete Access Access | Summary Page Edit Add | Math Number-1071 | Project Summary-1071 |