@all
Feature: Creating a Budget report and selecting - option as Budget Line item (Jira Ref. : AUTOMATION-1366)

  Scenario Outline: Import the following test data files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/BudgetReporting/"
    And I import following file name:
      | Sprint17PortfolioAndLocation_1366.xml            |
      | budgettemplate13548a_1366.xml                    |
      | BudgetType_13548.xml                             |
      | 13548SummaryPage_1366.xml                        |
      | Project_13548a_1366.xml                          |
      | MessengerExportData_4294124257262258240_1366.xml |

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

  Scenario Outline: I verify the Run report titled 'Report 13548'
    Given I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Grid>" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "report" child window
    And I verify the following values in non frame grid
      | Name           | aaBudget Type 13548 | bbBudget Type 13548 | ccBudget Type 13548 | Default Amount | Description | Budget Line Item Name |
      | Project 13548a |                     |                     |                     | $1,887.00      |             | bbBudgetGroup         |
      | Project 13548a | $100.00             | $15.00              | $60.00              | $999.00        | test a      | ddlineitem            |
      | Project 13548a | $50.00              | $30.00              | $70.00              | $888.00        | test b      | cclineitem            |
      | Project 13548a |                     |                     |                     | $1,443.00      |             | aaBudgetGroup         |
      | Project 13548a | $10.00              | $40.00              | $80.00              | $666.00        | test d      | bblineitem            |
      | Project 13548a | $150.00             | $45.00              | $90.00              | $777.00        | test 3      | aalineitem            |

    And I close the "Report" child window
    And I switch to main window

    Examples:
      | Grid        | Report Name  |
      | ^editBOGrid | Report 13548 |

