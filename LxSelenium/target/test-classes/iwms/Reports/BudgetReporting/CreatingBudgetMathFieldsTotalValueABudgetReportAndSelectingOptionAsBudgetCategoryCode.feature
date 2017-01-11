@all
Feature: Creating Budget Math fields (Total value) a Budget report and selecting - option as Budget category code (Jira Ref. : AUTOMATION-1367)

  Scenario Outline: Import the following test data files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/BudgetReporting/"
    And I import following file name:
      | Sprint17PortfolioAndLocation_1367.xml |
      | BudgetTemplate-13551_1367.xml         |
      | BudgetColumns-13551_1367.xml          |
      | BudgetSummaryPage-13549_1367.xml      |
      | BudgetMathFieldReport-13549_1367.xml  |
      | BudgetMathFieldProject-13549_1367.xml |

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
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Grid | Budget Summary Page     |
      | main | BudgetSummaryPage-13549 |

  Scenario Outline: I verify the Report displays label Default amount and is sorted by the Default amount
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "<Third Level Tab>" tab
    And I click on the "Budget Summary" action panel button
    And I select "<Budget Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on the "<Expand All>" link
    And I verify the following values in non frame grid
      | Name  <Collapse All>  <Hide Empty> | BT1        | BT2       | Total Amount-2016 |
      | Equipment                          | $6,200.00  | $1,150.00 | $7,350.00         |
      | Water                              | $200.00    | $500.00   | $700.00           |
      | Sand                               | $200.00    | $400.00   | $600.00           |
      | Cement                             | $800.00    | $100.00   | $900.00           |
      | Tractor                            | $5,000.00  | $150.00   | $5,150.00         |
      | Cement                             | $7,000.00  | $1,300.00 | $8,300.00         |
      | Sand                               | $5,000.00  | $500.00   | $5,500.00         |
      | Water                              | $2,000.00  | $800.00   | $2,800.00         |
      | Total                              | $13,200.00 | $2,450.00 | $15,650.00        |
    And I switch to default frame
    Then I navigate to the reports dashboard
    And I click "edit" row action in the non frame grid "<Grid>" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |

    And I switch to "report" child window
    And I edit report step "Step 4 - Field List and Details"
    And I click on the "<Add a mathematical operations field>" link
    And I set fields values on editable page
      | name            | value                 |
      | fieldName       | Total budgeted amount |
      | availableFields | BT1                   |
    And I click on >> button to move selected field
    And I click on "+" Button
    And I set fields values on editable page
      | name            | value |
      | availableFields | BT2   |
    And I click on >> button to move selected field
    Then I click "Submit" button
    Then I click "Submit" button
    And I verify a row from non frame grid "BOGridCustomObjectDel" having unique value "Total budgeted amount" under column header "Field Name On Report"
      | name                 | value                       |
      | Field Name On Report | Total budgeted amount       |
      | Lx Default Name      | Math: Total budgeted amount |
      | Data Type            | Number                      |
    And I click on "Next>>" Button
    And I click on "Next>>" Button
    And I click on "Next>>" Button
    And I click on "Next>>" Button
    And I set fields values on editable page
      | name             | value                              |
      | selectBoxHeader4 | Total budgeted amount (Math:)(1x1) |
    And I click on Finish button
    And I click on the "Save and Run Report" button on Modify and Save Report
    And I verify the following values in non frame grid
      | Name                         | Category Code | BT1       | BT2     | Total budgeted amount |
      | BudgetMathFieldProject-13549 | V1            |           |         | 0                     |
      | BudgetMathFieldProject-13549 | V1.1          | $2,000.00 | $800.00 | 2,800                 |
      | BudgetMathFieldProject-13549 | V1.2          | $5,000.00 | $500.00 | 5,500                 |
      | BudgetMathFieldProject-13549 | V2            |           |         | 0                     |
      | BudgetMathFieldProject-13549 | V2.1          | $5,000.00 | $150.00 | 5,150                 |
      | BudgetMathFieldProject-13549 | V2.2          | $800.00   | $100.00 | 900                   |
      | BudgetMathFieldProject-13549 | V2.3          | $200.00   | $400.00 | 600                   |
      | BudgetMathFieldProject-13549 | V2.4          | $200.00   | $500.00 | 700                   |
    And I close the "Report" child window
    And I switch to main window


    Examples:
      | Entity Name                  | Third Level Tab | Grid        | Report Name        | Budget Summary Page     |
      | BudgetMathFieldProject-13549 | Budget          | ^editBOGrid | BudgetReport-13549 | BudgetSummaryPage-13549 |
