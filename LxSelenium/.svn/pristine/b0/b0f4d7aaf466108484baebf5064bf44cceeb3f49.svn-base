@all
Feature: Adding Sorting and grouping To Budget Line item report (Jira Ref. : AUTOMATION-1373)

  Scenario Outline: Import the following test data files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/BudgetReporting/"
    And I import following file name:
      | Sprint17PortfolioAndLocation_1373.xml |
      | 15846Template_1373.xml                |
      | 15846Columns_1373.xml                 |
      | 15846Summary_1373.xml                 |
      | 15846_Project_1373.xml                |
      | 15846Report_1373.xml                  |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Import the following test data files and verify the Budget Template
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I verify a row from non frame grid "<Grid>" having unique value "15846 Template" under column header "Budget Template Name"
      | name                 | value          |
      | Budget Template Name | 15846 Template |

    Examples:
      | Grid |
      | main |


  Scenario Outline: Import the following test data files and verify it shall create 4 budget columns successfully
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I verify a row from non frame grid "<Grid>" having unique value "Column Arc" under column header "Name"
      | name            | value      |
      | Name            | Column Arc |
      | Selected Status | Default    |
    And I verify a row from non frame grid "<Grid>" having unique value "Column Gec" under column header "Name"
      | name            | value      |
      | Name            | Column Gec |
      | Selected Status | Default    |
    And I verify a row from non frame grid "<Grid>" having unique value "Column Rec" under column header "Name"
      | name            | value      |
      | Name            | Column Rec |
      | Selected Status | Default    |

    Examples:
      | Grid                   |
      | BOGridBudgetColumnType |


  Scenario Outline: I verify the Manage Budget Summary Page
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Budget Summary Page>" sub row in the grid "<Grid>"
    And I switch to "Budget Summary Edit" child window
    And I set following fields value on editable page
      | name                      | value |
      | _checkbox_ValidForProject | true  |
    And I click on the update button
    And I close the "Budget Summary Edit" child window
    And I switch to main window

    Examples:
      | Grid | Budget Summary Page |
      | main | 15846 Summary       |

  Scenario Outline: I verify the Report displays label Default amount and is sorted by the Default amount
    Given I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I click on the "Budget Summary" action panel button
    And I select "<Budget Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on the "<Expand All>" link
    And I verify the following values in non frame grid
      | Name  <Collapse All>  <Hide Empty> | Column Arc | Column Gec | Column Rec |
      | Group2345                          | $1,233.00  | $1,154.00  | $1,658.00  |
      | LineitemPr3                        | $333.00    | $220.00    | $508.00    |
      | LineitemPr2                        | $400.00    | $334.00    | $450.00    |
      | LineitemPr1                        | $500.00    | $600.00    | $700.00    |
      | Total                              | $1,233.00  | $1,154.00  | $1,658.00  |
    And I switch to default frame

    Then I navigate to the reports dashboard
    And I click "edit" row action in the non frame grid "<Grid>" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "report" child window
    And I edit report step "Step 6 - Grouping and sorting"
    And I click on Finish button
    And I click on the "Save and Run Report" button on Modify and Save Report
    And I verify the following values in non frame grid
      | Default Amount | Name          | Budget Line Item Name | Budget Line Item ClientID | Column Arc | Column Gec | Column Rec | Default Amount |
      | $14,000.00     |               |                       |                           |            |            |            | $14,000.00     |
      |                | 15846 Project | Group2345             | client-16613              |            |            |            |                |
      | $2,000.00      |               |                       |                           |            |            |            | $2,000.00      |
      |                | 15846 Project | LineitemPr2           | client-16615              | $400.00    | $334.00    | $450.00    |                |
      | $3,000.00      |               |                       |                           |            |            |            | $3,000.00      |
      |                | 15846 Project | LineitemPr1           | client-16614              | $500.00    | $600.00    | $700.00    |                |
      | $9,000.00      |               |                       |                           |            |            |            | $9,000.00      |
      |                | 15846 Project | LineitemPr3           | client-16616              | $333.00    | $220.00    | $508.00    |                |
    And I close the "Report" child window
    And I switch to main window


    Examples:
      | Entity Name   | Third Level Tab | Grid        | Report Name  | Budget Summary Page |
      | 15846 Project | Budget          | ^editBOGrid | 15846 Report | 15846 Summary       |
