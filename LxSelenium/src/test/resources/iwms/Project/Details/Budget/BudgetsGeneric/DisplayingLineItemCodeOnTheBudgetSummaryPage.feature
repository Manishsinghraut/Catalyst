@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1075), Ability to display Line Item Code on the Budget Summary Page

  Scenario Outline: As a delete user I import the following xmls in the following order
  1. Budget Column
  2. Budget Template
  3. Line item code

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following file name:
      | BudgetTemplate1075.xml        |
      | BudgetCodeColumns.xml         |
      | BudgetSummaryPage.xml         |
      | BudgetLineItemCodeProject.xml |
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link

    And I verify the following values in non frame grid "BOGridBudgetColumnType"
      | Name          | Selected Status | Are Budget Values Editable? | Use this Budget View | Allow one instance of this type per project | Allow multiple instances with Selected Status | Used For Bidding | Used For Bid Conditioning |
      | Code Column 2 | Default Status  | checked                     |                      | unchecked                                   | checked                                       | unchecked        | unchecked                 |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Summary Page>" sub row in the grid "main"
    And I switch to "Budget Summary Page Creation" child window
    And I set following fields value on editable page
      | name                      | value |
      | _checkbox_ValidForProject | true  |
    And I click on "Update" Button
    And I switch to main window
    And I see "Successfully updated item" message in the grid

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Budget" tab

    And I click on the "Budget Summary" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | Code Column 1 | Line Item Code |
      | Exterior                           | $102.00       | 2.0            |
      | Carpet                             | $102.00       | 1.2            |
      | Doors                              | $0.00         | 1.1            |
      | Interior                           | $520.00       | 1.0            |
      | Playground                         | $520.00       | 2.2            |
      | Patio Furniture                    | $0.00         | 2.1            |
      | Total                              | $622.00       |                |
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name       | Description | Status         | Contractor | Total   |
      | Code Column 1 #01 |             | Default Status |            | $622.00 |


    Examples:
      | Login User   | Login full username  | Summary Page           | Entity Name                   |
      | DeleteAccess | Delete Access Access | Line Item Display Page | Budget Line Item Code Project |