@all
Feature: (Jira Ref. : AUTOMATION-379) Rerun Report from Report Results

  Scenario Outline: Rerun Report from Report Results
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | ReportForAutomation-374.xml |
    Then I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Grid>" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "Run Report" child window
    And I click on the "Rerun Report" link
    And I verify the report header "<Report Name>"
    And I verify the following values in non frame grid
      | Portfolio         | Name             |
      | Lucernex-Selenium |                  |
      |                   | Lucernex-Project |
    And I close the "Run Report" child window
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Grid        | Report Name           |
      | DeleteAccess | Delete Access Access | ^editBOGrid | PrintableViewOfReport |