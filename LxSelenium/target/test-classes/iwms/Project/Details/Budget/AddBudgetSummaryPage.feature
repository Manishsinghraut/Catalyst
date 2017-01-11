@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1022), Add Budget Summary page

  Scenario Outline: As a delete user I import the following xmls in the following order
  1. Import the attached budget template "Selenium-budget" xml successfully.
  2. Import the attached project "YearlyBudgetProject" xml successfully.
  3. Import the attached "SemiAnnualBudgetColumns" xml successfully.

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/"
    And I import following file name:
      | Selenium-budget.xml            |
      | YearlyBudgetProject.xml        |
      | SemiAnnualBudgetColumns(1).xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Budget Creation

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
    And I select "Yearly Budget" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I wait for the Loading text to disappear
    And I click on "Add" Button

    And I wait for "Select Item To Add" modal window to open in non frame page
    And I set following fields value on editable page
      | name         | value        |
      | PageLayoutID | January_June |
    And I click on "Submit" Button
    And I set following fields value on editable page
      | name                     | value          |
      | CodeBudgetColumnStatusID | Default Status |
    And I click "Add and View Values" button in modal window "Select Item To Add"
    Then I verify title "January_June" in a frame page
    And I verify the following values in frame grid "putTheGridHere"
      | Name            | Comment | Quantity | Units | Unit Cost | Value |
      | Exterior        |         |          |       |           | $0.00 |
      | Carpet          |         |          |       |           | $0.00 |
      | Doors           |         |          |       |           | $0.00 |
      | Interior        |         |          |       |           | $0.00 |
      | Playground      |         |          |       |           | $0.00 |
      | Patio Furniture |         |          |       |           | $0.00 |
      | Total           |         |          |       |           | $0.00 |

    And I click on row from grid "putTheGridHere" having unique value "Playground" under column header "Name"
      | name    | value |
      | Comment |       |
      | Value   | $0.00 |

    And I enter the following row values in grid "putTheGridHere" by the following values
      | Quantity  | 5   | 1 |
      | Unit Cost | 200 | 3 |
    And I click "Update" button

#    And I select an option "Budget Creation"
    And I click on the "Budget Creation" action panel button
    And I wait for the Loading text to disappear
    And I click on "Add" Button
    And I wait for "Select Item To Add" modal window to open in non frame page
    And I set following fields value on editable page
      | name         | value         |
      | PageLayoutID | July_December |
    And I click on "Submit" Button
    And I set following fields value on editable page
      | name                     | value          |
      | CodeBudgetColumnStatusID | Default Status |
    And I click "Add and View Values" button in modal window "Select Item To Add"
    Then I verify title "July_December" in a frame page
    And I verify the following values in frame grid "putTheGridHere"
      | Name            | Comment | Quantity | Units | Unit Cost | Value |
      | Exterior        |         |          |       |           | $0.00 |
      | Carpet          |         |          |       |           | $0.00 |
      | Doors           |         |          |       |           | $0.00 |
      | Interior        |         |          |       |           | $0.00 |
      | Playground      |         |          |       |           | $0.00 |
      | Patio Furniture |         |          |       |           | $0.00 |
      | Total           |         |          |       |           | $0.00 |

    And I click on the "Playground"
    And I enter the following row values in grid "putTheGridHere" by the following values
      | Quantity  | 3   | 1 |
      | Unit Cost | 150 | 3 |

    And I click "Update" button


    Examples:
      | Login User   | Login full username  | Entity Name              |
      | DeleteAccess | Delete Access Access | YearlyBudgetProject-1022 |


  Scenario Outline: As a delete user I add budget summary page

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click on "Add" Button
    And I switch to "Budget Summary Page Creation" child window
    And I set following fields value on editable page
      | name                      | value                      |
      | PageLayoutName            | <Page Layout Name>         |
      | Description               | To calculate yearly budget |
      | _checkbox_ValidForProject | true                       |
    And I click on "Add" Button
    And I switch to main window
    And I see "Successfully added item" message in the grid
    And I verify a row from reports grid "main" having the following header and cell value pair
      | name             | value              |
      | Page Layout Name | <Page Layout Name> |

    And I click "build layout" action of "<Page Layout Name>" sub row in the grid "main"
    And I switch to "Build Layout" child window
    And I wait for the Loading text to disappear in grid
    And I expand the following
      | Available Fields |
      | Budget Types     |
    Then I drag and drop the following
      | January_June  |
      | July_December |
    And I insert the new field "Math Field"

    And I see a modal window
    And I set fields values on editable page
      | name              | value              |
      | defaultLabel      | <Math Field Name>  |
      | codeSQLTableID    | Budget Column Type |
      | formFieldType     | Currency           |
      | reportGroupDataID | Budget Types       |
    And I expand the following math operation tree
      | Available Fields |
      | Budget Types     |
    And I double click on following fields
      | January_June |
    And I click on + button
    And I double click on following fields
      | July_December |
    And I wait for the Loading text to disappear in grid

    And I click on "Submit" Button
    And I wait for modal window to close
    And I click on "Save Layout" Button
    And I click on "Close" Button
    And I switch to main window
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Budget" tab
    And I click on the "Budget Summary" action panel button
    And I select "<Page Layout Name>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | January_June | July_December | <Math Field Name> |
      | Exterior                           | $0.00        | $0.00         | $0.00             |
      | Carpet                             | $0.00        | $0.00         | $0.00             |
      | Doors                              | $0.00        | $0.00         | $0.00             |
      | Interior                           | $1,000.00    | $450.00       | $1,450.00         |
      | Playground                         | $1,000.00    | $450.00       | $1,450.00         |
      | Patio Furniture                    | $0.00        | $0.00         | $0.00             |
      | Total                              | $1,000.00    | $450.00       | $1,450.00         |


    Examples:
      | Login User   | Login full username  | Entity Name              | Math Field Name | Page Layout Name |
      | DeleteAccess | Delete Access Access | YearlyBudgetProject-1022 | Yearly Total    | Yearly Budget    |