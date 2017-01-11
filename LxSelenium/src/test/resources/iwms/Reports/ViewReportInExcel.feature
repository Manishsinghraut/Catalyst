@all
Feature: (Jira Ref. : AUTOMATION-375) View Report in Excel

  Scenario Outline: View Report in Excel
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
    And I click on the "Excel View" link
    And I switch to "Excel View" third child window
    And I download file
    And I wait for the Loading text to disappear in grid
    And I rename files
    And I use this spreadsheet to compare "target/DownloadFiles/newfile.xls"
    Then I verify the following excel is generated
#    And I verify the following excel data
#      | PrintableViewOfReport | 0 | 0 |

    Examples:
      | Login User   | Login full username  | Grid        | Report Name           |
      | DeleteAccess | Delete Access Access | ^editBOGrid | PrintableViewOfReport |