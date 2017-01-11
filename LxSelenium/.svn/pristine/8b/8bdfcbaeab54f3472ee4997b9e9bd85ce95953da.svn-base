@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1079), 	Xml Imports for BudgetColumn/BudgetColumnItemValue records without using the lxID/clientID attributes.

  Scenario Outline: As a delete user I import the following xmls in the following order
  1. Budget Template
  2. Budget Types Column
  3. Site entity

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following file name:
      | BudgetTemplate1079.xml      |
      | SiteBudgetColumn.xml        |
      | SiteBudgetSummaryPage.xml   |
      | SiteForBudgetImport1079.xml |
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I verify the following values in non frame grid "BOGridBudgetColumnType"
      | Name      | Selected Status | Are Budget Values Editable? | Use this Budget View | Allow one instance of this type per project | Allow multiple instances with Selected Status | Used For Bidding | Used For Bid Conditioning |
      | BudgetCL1 | Default Status  | checked                     |                      | unchecked                                   | checked                                       | unchecked        | unchecked                 |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Summary Page>" sub row in the grid "main"
    And I switch to "edit Layout" child window
    And I set following fields value on editable page
      | name                               | value |
      | _checkbox_ValidForPotentialProject | true  |
    And I click on "Update" Button
    And I switch to main window
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Budget" tab
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name   | Description | Status         | Contractor | Total   |
      | BudgetCL1 #01 |             | Default Status |            | $600.00 |
    And I click on the "Budget Summary" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | BudgetCL1 | BudgetCL1 Comments |
      | Exterior                           | $200.00   |                    |
      | Carpet                             | $200.00   |                    |
      | Doors                              | $0.00     |                    |
      | Interior                           | $400.00   |                    |
      | Playground                         | $0.00     |                    |
      | Patio Furniture                    | $400.00   |                    |
      | Total                              | $600.00   |                    |

    Examples:
      | Login User   | Login full username  | Summary Page          | Entity Name         |
      | DeleteAccess | Delete Access Access | SiteBudgetSummaryPage | SiteForBudgetImport |


  Scenario Outline: As a delete user verify budget summary page

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following file name:
      | BudgetColumnValuesAddedandUpdated(1).xml |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Budget" tab
#    And I click on the "Budget Creation" action panel button
#    And I verify the following values in frame grid
#      | Budget Name   | Description | Status         | Contractor | Total     |
##      | BudgetCL1 #01 |             | Default Status |            | $600.00   |
#      | BudgetCL1 #01 |             | Default Status |            | $2,200.00 |

    And I click on the "Budget Summary" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | BudgetCL1 | BudgetCL1 Comments |
      | Exterior                           | $1,000.00 |                    |
      | Carpet                             | $600.00   |                    |
      | Doors                              | $400.00   |                    |
      | Interior                           | $1,200.00 |                    |
      | Playground                         | $700.00   |                    |
      | Patio Furniture                    | $500.00   |                    |
      | Total                              | $2,200.00 |                    |



    Examples:
      | Login User   | Login full username  | Summary Page          | Entity Name         |
      | DeleteAccess | Delete Access Access | SiteBudgetSummaryPage | SiteForBudgetImport |