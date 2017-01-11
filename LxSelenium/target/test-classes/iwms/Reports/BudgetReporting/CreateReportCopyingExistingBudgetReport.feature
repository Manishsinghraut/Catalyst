@all
Feature: Create Report copying existing Budget Report (Jira Ref. : AUTOMATION-1371)

  Scenario Outline: Import the following test data files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/BudgetReporting/"
    And I import following file name:
      | Sprint17PortfolioAndLocation_1371.xml |
      | BudgetTemplate-13551_1371.xml         |
      | BudgetColumns-13551_1371.xml          |
      | BudgetSummaryPage-13549_1371.xml      |
      | BudgetMathFieldReport-13549_1371.xml  |
      | BudgetMathFieldProject-13549_1371.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario: I verify the Run report titled 'Report-13551'
    Given I navigate to the reports dashboard
    And I click " Create Report... " button
    And I switch to "report" child window
    And I set following fields value on editable page
      | name              | value              |
      | reportAbout       | chkExistingReport  |
      | existingReports   | BudgetReport-13549 |
      | chkSites          | false              |
      | chkProjects       | true               |
      | chkFacilities     | false              |
      | chkCapProjects    | false              |
      | chkLocations      | false              |
      | chkParcels        | false              |
      | chkContracts      | false              |
      | chkAssetContracts | false              |
      | chkPrograms       | false              |
      | chkPrototypes     | false              |
    And I click on "Next>>" Button
    And I click on Finish button
    And I set following fields value on editable page
      | name           | value |
      | IsGlobalReport | false |
    And I click on the "Save and Run Report" button on Modify and Save Report
    And I verify the following values in non frame grid
      | Name                         | Category Code | BT1       | BT2     |
      | BudgetMathFieldProject-13549 | V1            |           |         |
      | BudgetMathFieldProject-13549 | V1.1          | $2,000.00 | $800.00 |
      | BudgetMathFieldProject-13549 | V1.2          | $5,000.00 | $500.00 |
      | BudgetMathFieldProject-13549 | V2            |           |         |
      | BudgetMathFieldProject-13549 | V2.1          | $5,000.00 | $150.00 |
      | BudgetMathFieldProject-13549 | V2.2          | $800.00   | $100.00 |
      | BudgetMathFieldProject-13549 | V2.3          | $200.00   | $400.00 |
      | BudgetMathFieldProject-13549 | V2.4          | $200.00   | $500.00 |
    And I close the "Report" child window
    And I switch to main window