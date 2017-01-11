@all
Feature: Create a Budget Category report and apply a budget view (Jira Ref. : AUTOMATION-1369)

  Scenario Outline: Import the following test data files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/BudgetReporting/"
    And I import following file name:
      | Sprint17PortfolioAndLocation_1369.xml |
      | BudgetTemplate-13551_1369.xml         |
      | BudgetColumns-13551_1369.xml          |
      | BudgetSummaryPage-13551_1369.xml      |
      | BudgetViewProject-13551_1369.xml      |
      | BudgetViewReport-13551_1369.xml       |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I verify the Manage Budget Summary Page
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Budget Summary Page>" sub row in the grid "<Grid>"
    And I switch to "Budget Summary Edit" child window
    And I set following fields value on editable page
      | name                      | value |
      | _checkbox_ValidForProject | true  |
    And I click on the update button
    And I switch to main window

    Examples:
      | Grid | Budget Summary Page     |
      | main | BudgetSummaryPage-13551 |


  Scenario Outline: I verify the Manage Budget Views
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Views" link
    And I click "Add Budget Template View..." button
    And I set following fields value on editable page
      | name           | value                       |
      | BudgetViewName | <Budget Template View Name> |
    And I click "Add" button
    And I click "build view" row action in the non frame grid "<Grid>" having the following header and cell values
      | name                      | value                       |
      | Budget Template View Name | <Budget Template View Name> |
    And I select the template line items "Water" under "Equipment"
    And I select the template line item "Sand" under "Equipment"
    And I select the template line item "Cement" under "Equipment"
#    And I select the template line items "Water" under "Cement"
    And I click "Update View" button

    Examples:
      | Grid             | Budget Template View Name |
      | BOGridBudgetView | BTView-13551              |


  Scenario Outline: I verify the Manage Budget Types
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I click "edit" row action in the non frame grid "<Grid>" having the following header and cell values
      | name | value  |
      | Name | BTView |
    And I set following fields value on editable page
      | name         | value        |
      | BudgetViewID | BTView-13551 |
    And I click "Update" button

    Examples:
      | Grid                   |
      | BOGridBudgetColumnType |


  Scenario Outline: I verify the "V1" and "V2" rows for columns "BT1" "BT2" and "BTView" will be blank.
    Given I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I click on the "Budget Summary" action panel button
    And I select "<Budget Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on the "<Expand All>" link
    And I verify the following values in non frame grid
      | Name  <Collapse All>  <Hide Empty> | BT1       | BT2       | BTView    |
      | Equipment                          | $5,900.00 | $5,165.00 | $5,860.00 |
      | Water                              | $2,500.00 | $200.00   | $800.00   |
      | Sand                               | $400.00   | $765.00   | $60.00    |
      | Cement                             | $500.00   | $600.00   | $5,000.00 |
      | Tractor                            | $2,500.00 | $3,600.00 |           |
      | Cement                             | $2,750.00 | $250.00   | $300.00   |
      | Sand                               | $2,000.00 | $100.00   |           |
      | Water                              | $750.00   | $150.00   | $300.00   |
      | Total                              | $8,650.00 | $5,415.00 | $6,160.00 |

    Examples:
      | Entity Name             | Third Level Tab | Budget Summary Page     |
      | BudgetViewProject-13551 | Budget          | BudgetSummaryPage-13551 |


  Scenario Outline: I verify the Run report titled 'Report-13551'
    Given I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Grid>" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "report" child window
    And I verify the text "No items found for this report" on "Report"
    And I close the "Report" child window
    And I switch to main window
    Then I navigate to the reports dashboard
    And I click "edit" row action in the non frame grid "<Grid>" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "report" child window
    And I edit report step "Step 1 - Portfolio Objects"
    And I click on "Next>>" Button
    And I click on "Next>>" Button
    And I click on "Next>>" Button
    And I click on "Next>>" Button
    And I click on "Next>>" Button
    And I click on "Next>>" Button
    And I click on "Next>>" Button
    And I click on "Next>>" Button
    And I click on the "Save and Run Report" button on Modify and Save Report
    And I verify the following values in non frame grid
      | Name                    | BT1       | BT2       | BTView    | Category Code |
      | BudgetViewProject-13551 |           |           |           | V1            |
      | BudgetViewProject-13551 | $750.00   | $150.00   | $300.00   | V1.1          |
      | BudgetViewProject-13551 | $2,000.00 | $100.00   |           | V1.2          |
      | BudgetViewProject-13551 |           |           |           | V2            |
      | BudgetViewProject-13551 | $2,500.00 | $3,600.00 |           | V2.1          |
      | BudgetViewProject-13551 | $500.00   | $600.00   | $5,000.00 | V2.2          |
      | BudgetViewProject-13551 | $400.00   | $765.00   | $60.00    | V2.3          |
      | BudgetViewProject-13551 | $2,500.00 | $200.00   | $800.00   | V2.4          |

    And I close the "Report" child window
    And I switch to main window


    Examples:
      | Grid        | Report Name  |
      | ^editBOGrid | Report-13551 |

