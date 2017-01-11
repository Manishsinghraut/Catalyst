@all
Feature: Proper message on Job Log (Jira ref.:AUTOMATION-1174)

  Scenario Outline: purpose of the scenario is to import the data via admin import data page
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Import Data" link
#    And I import following files from "Data/ImportDataFiles/iwms/AdminPage/ImportData/":
#      | LogFile.xlsx |
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/ImportData/"
    And I import following file name:
      | LogFile.xlsx |
    And I click on "Job Log" tab
    And I search for a "LogFile.xlsx"
    And I verify a row from non frame grid "<grid>" having unique value "LogFile.xlsx" under column header "Input File"
      | name   | value                 |
      | Status | Completed with errors |
    And I verify imported Log file should display Total Processed "84" and Total Failuers "84" on the import summary page
    And I click on "LxImportLog" row action in the grid "<grid>" having the following header "Input File" and cell value "LogFile.xlsx"
      | name   | value                 |
      | Status | Completed with errors |
    And I switch to visible frame
    And I verify imported Log file should display Total Processed "84" and Total Failuers "84" on the import summary
    And I switch to default frame
    And I click "Cancel" button

    And I click on "view" row action in the grid "<grid>" having the following header "Input File" and cell value "LogFile.xlsx"
      | name   | value                 |
      | Status | Completed with errors |
    And I verify imported Log file should display Total Processed "84" and Total Failuers "84" on the view popup window
    And I click "Cancel" button


  Examples:
    | Login User   | Login full username  | grid         |
    | DeleteAccess | Delete Access Access | BOGridJobLog |