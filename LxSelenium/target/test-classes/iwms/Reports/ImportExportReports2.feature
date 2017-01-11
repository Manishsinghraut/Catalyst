Feature: ImportExport Reports (Jira Ref. : AUTOMATION-382)

#  Scenario Outline: Export the Reports
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I see the Dashboard
#    Then I navigate to the reports dashboard
#    And I click on the "export" link to export the report "Related Contracts all" of column "0" from grid "<Grid>"
#    And I logout
#
#  Examples:s
#    | Login User   | Login full username  | Grid             |
#    | DeleteAccess | Delete Access Access | BOGridPageLayout |

  Scenario Outline: Import the Reports
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    And I used data files from "target/DownloadFiles/"
    And I Import the downloaded report "Task report"
    Then I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Grid>" having the following header and cell values
      | name        | value       |
      | Report Name | Task report |
    And I switch to "report" child window
    And I verify following "report results"
      | Name Task 1- F/A Start Date Task 1- F/A End Date Task 1- F/A Duration Task 2- F/A Start Date Task 2- F/A End Date Task 2- F/A Duration |
      | Lucernex-Project                                                                                                                       |
      | LucernexSite                                                                                                                           |
      | Selenium Webdriver Site                                                                                                                |
      | Delete Template Facility-868                                                                                                           |
      | Lucernex-Facility                                                                                                                      |
      | Multiple Task Predecessor from same Template                                                                                           |
    And I close the "Report" child window

    Examples:s
      | Login User   | Login full username  | Grid        |
      | DeleteAccess | Delete Access Access | ^editBOGrid |