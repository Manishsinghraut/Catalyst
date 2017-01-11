@all
Feature: (Jira Ref. : AUTOMATION-387) Run Report Button - Configuration

  Scenario Outline: Run Report Button - Configuration
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | ReportForAutomation-374.xml |
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I click on " Add item... " button in grid
    And I set these field values on editable page
      | name                  | value                       |
      | PageLayoutName        | <Page Layout>               |
      | PrimaryCodeSQLTableID | Portfolio / Capital Program |
      | Description           | Run report button config    |
    And I select Allow Edit 'Yes' radio button on modal window
    And I expand the following
      | Portfolio |
      | Details   |
    And I select the following
      | Summary |
    And I click on the "Add" button
    Then I see "Successfully added item" in the grid header
    And I wait for modal window to close
    And I click "build layout" row action in the non frame grid "BOGridPageLayout" having the following header and cell values
      | name             | value         |
      | Page Layout Name | <Page Layout> |
    And I switch to "build layout" child window
    And I expand the following
      | Related Fields       |
      | Summary Information  |
      | Summary Page Buttons |
    Then I drag and drop the following
      | Run Report Action |
    And I click edit option for the "Run Report Action" field
    And I wait for modal window to open
    And I select radio option "Run Report In Foreground"
    And I set following fields value on editable page
      | name     | value         |
      | context1 | <Report Name> |
    And I click on the "OK"
    And I click on "Set Options" Button
    And I wait for modal window to close
    And I click on "Save Layout" Button
    And I see the "Save Changes?" modal window
    And I click on the "Yes" button
    And I click on "Close" Button
    And I switch to main window

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I select an option "<Page Layout>"
    And I click on the "Run Report Action" action panel button
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
      | Page Layout                         | Login User   | Login full username  | Report Name           | Entity Name       |
      | PageLayoutFor-RunReportButtonConfig | DeleteAccess | Delete Access Access | PrintableViewOfReport | Lucernex-Selenium |