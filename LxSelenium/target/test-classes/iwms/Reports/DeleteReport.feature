Feature: Delete Report (Jira Ref. : AUTOMATION-380)

  Scenario Outline: Delete Report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Contract/"
    And I import following file name:
      | Task.xml |
    Then I navigate to the reports dashboard
#    And I click on the "delete" link to export the report "Task report" of column "0" from grid "<Grid>"
    And I click "delete" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value       |
      | Report Name | Task report |

    And I click "Yes" button
    And I verify row "Task report" of column "Report Name" does not exist from grid "<Grid>"

  Examples:s
    | Login User   | Login full username  | Grid        |
    | DeleteAccess | Delete Access Access | pageContent |
#    | DeleteAccess | Delete Access Access | BOGridPageLayout |