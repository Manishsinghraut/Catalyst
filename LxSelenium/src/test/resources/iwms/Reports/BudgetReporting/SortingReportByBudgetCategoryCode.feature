@all
Feature: Sorting Report by Budget Category Code (Jira Ref. : AUTOMATION-1372)

  Scenario Outline: Import the following test data files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/BudgetReporting/"
    And I import following file name:
      | Sprint17PortfolioAndLocation_1372.xml |
      | BudgetTemplate_1372.xml               |
      | BudgetColumn_1372.xml                 |
      | BudgetSummaryPage-13613_1372.xml      |
      | Project13613_1372.xml                 |
      | Report_1372.xml                       |

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
    And I close the "Budget Summary Edit" child window
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Grid | Budget Summary Page  |
      | main | 13613 Budget Summary |

  Scenario Outline: I verify the Budget Type values of Budget Type 13613 #01
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "<Third Level Tab>" tab
    And I select "<Budget Summary Page>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I wait for the Loading text to disappear
    And I click "<Budget Name>" for "values"
    And I verify the following values in frame grid "putTheGridHere"
      | Name             | Comment         | Quantity | Units | Unit Cost | Value   |
      | 13613 Group B    |                 |          |       |           | $85.00  |
      | 13613 Subgroup D |                 |          |       |           | $45.00  |
      | 13613 Subgroup C |                 |          |       |           | $40.00  |
      | 13613 Group A    |                 |          |       |           | $30.00  |
      | 13613 Subgroup B | Comment Testing |          |       |           | $10.00  |
      | 13613 Subgroup A |                 |          |       |           | $20.00  |
      | Total            |                 |          |       |           | $115.00 |
    And I switch to default frame

    Examples:
      | Entity Name   | Third Level Tab | Budget Name           | Budget Summary Page  |
      | Project 13613 | Budget          | Budget Type 13613 #01 | 13613 Budget Summary |

  Scenario Outline: I verify the Budget Type values of Budget Type 2 13613 #01
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "<Third Level Tab>" tab
    And I select "<Budget Summary Page>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I wait for the Loading text to disappear
    And I click "<Budget Name>" for "values"
    And I verify the following values in frame grid "putTheGridHere"
      | Name             | Comment         | Quantity | Units | Unit Cost | Value   |
      | 13613 Group B    |                 |          |       |           | $110.00 |
      | 13613 Subgroup D |                 |          |       |           | $50.00  |
      | 13613 Subgroup C |                 |          |       |           | $60.00  |
      | 13613 Group A    |                 |          |       |           | $150.00 |
      | 13613 Subgroup B | Testing Comment |          |       |           | $70.00  |
      | 13613 Subgroup A |                 |          |       |           | $80.00  |
      | Total            |                 |          |       |           | $260.00 |
    And I switch to default frame

    Examples:
      | Entity Name   | Third Level Tab | Budget Name             | Budget Summary Page  |Login User   | Login full username  |
      | Project 13613 | Budget          | Budget Type 2 13613 #01 | 13613 Budget Summary |DeleteAccess | Delete Access Access |


  Scenario Outline: I verify the Run report titled 'Report 13613'
    Given I navigate to the reports dashboard
    And I click "edit" row action in the non frame grid "<Grid>" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "report" child window
    And I click on the "Save and Run Report" button on Modify and Save Report
    And I verify the following values in non frame grid
      | Category Code | Name          | Budget Type 13613 | Budget Type 2 13613 |
      | 0001          |               |                   |                     |
      |               | Project 13613 | $20.00            | $80.00              |
      | 0002          |               |                   |                     |
      |               | Project 13613 | $10.00            | $70.00              |
      | 0003          |               |                   |                     |
      |               | Project 13613 | $40.00            | $60.00              |
      | 0004          |               |                   |                     |
      |               | Project 13613 | $45.00            | $50.00              |
    And I close the "Report" child window
    And I switch to main window

    Examples:
      | Grid        | Report Name  |
      | ^editBOGrid | Report 13613 |