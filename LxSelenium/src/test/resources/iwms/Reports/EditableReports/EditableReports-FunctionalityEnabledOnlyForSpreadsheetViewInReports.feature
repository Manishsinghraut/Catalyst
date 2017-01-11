@all
Feature: (Jira Ref. : AUTOMATION-1393) Editable reports - Functionality enabled only for Spreadsheet View in Reports

  Scenario Outline: Import xmls as delete user
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/EditableReports/"
    And I import following files:
      | RegressionPortfolio-1393.xml |
      | PortfolioInfoReport-1393.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Navigate to reports and verify the report
  A pop-up will display that will contain data related to existing portfolio(s). A portfolio called "Regression Portfolio" will be populated with the following info:
  Program or Portfolio: Portfolio
  State: TX
  Regions Summary: Dallas
  Refer to screenshot "3. Populated report".

    Given I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "Reports" child window
    Then I verify the following fields in "Reports"
      | Name                 | Regression Portfolio |
      | Program or Portfolio | Portfolio            |
      | State                | TX                   |
      | Regions Summary      | Dallas               |
    And I close the "Reports" child window
    And I wait for browser windows count to be equal to "1"
    Then I switch to main window


    Examples:
      | Report Name    |
      | Portfolio Info |

  Scenario Outline: Editable reports - Functionality enabled only for Spreadsheet View in Reports
    Given I navigate to the reports dashboard
    And I click "edit" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "Reports" child window
    And I click edit next to "Step 7 - View type and currency"
    Then I see a page title "Step 7: Choose the view type and currency"
    And I set following fields value on editable page
      | name             | value       |
      | outputType       | Spreadsheet |
      | multilineDisplay | true        |
      | allowInPlaceEdit | true        |
    And I click on "FINISH" Button
    Then I see a page title "Step 9: Modify and Save Report"
    And I click on "Save and Run Report" Button
    And I verify the following values are "editable"
      | Regression Portfolio |
      | Portfolio            |
      | TX                   |
    And I verify the following values are "non-editable"
      | Dallas |
    Then I close the "Reports" child window
    And I switch to main window


    Examples:
      | Report Name    |
      | Portfolio Info |