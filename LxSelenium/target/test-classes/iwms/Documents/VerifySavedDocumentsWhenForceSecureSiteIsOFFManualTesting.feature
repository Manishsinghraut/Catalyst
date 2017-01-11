@all
Feature: Verify saved documents when Force secure site is OFF - Manual Testing (Ref : Jira Ticket No : AUTOMATION-1117)

  Scenario Outline: As a LxSelenium user I import files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I set following fields value on editable page
      | name            | value |
      | json_RequireSSL | false |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | FolderTemplate_AUTOMATION-1117.xml                       |
      | Project_for_Force_secure_site_report_AUTOMATION-1117.xml |
      | ForceSecureSiteIsOFFReport_AUTOMATION-1117.xml           |
    And I logout

    Examples:
      | Login User | Login full username |
      | LxSelenium | Selenium Tester     |

  Scenario Outline: As LxSelenium user, I verify the members and Contacts information while Saving the Document - Project
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I click on the "Apply Folder Template"
    And I wait for "" modal window to open in frame page
    And I set following fields value on editable page
      | name                   | value                    |
      | assignFolderTemplateID | Selenium Folder Template |
    And I click on the "Assign Folder Template" button
    And I wait for modal window to close
    And I navigate to the reports dashboard

#    And I click "run" row action in the non frame grid "BOGridPageLayout" having the following header and cell values
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value                           |
      | Report Name | Force secure site is OFF Report |

    And I switch to "report" child window
#    And I click on the "Save To Documents" link "from report window"
    And I click on "Save To Documents" link
    And I wait for browser windows count to be equal to "3"
    And I switch to "Save To Documents" third child window
    And I set following fields value on editable page
      | name        | value             |
      | portfolioID | Lucernex-Selenium |
    And I set following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | <File Name>             |
    And I click on "Save" Button
    And I wait for browser windows count to be equal to "2"
    And I switch to "Report" child window
    And I close the "Report" child window
    And I switch to main window

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | SeleniumTestRootFolder1 (1) |
    And I select and right click on "<File Name>.html" and click on "Download" option
#    Then I Open "<File Name>.html" downloaded file and verify the content
#      | <Entity Name> |
    And I open latest downloaded file
    And I verify the following text in a page
      | <Entity Name> |
    And I close the "HTML window" child window
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Entity Name       | File Name |
      | DeleteAccess | Delete Access Access | Lucernex-Selenium | Project   |

  Scenario Outline: As LxSelenium user, I verify the members and Contacts information while Saving the Document - Project
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the reports dashboard
#    And I click "run" row action in the non frame grid "BOGridPageLayout" having the following header and cell values
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value                           |
      | Report Name | Force secure site is OFF Report |
    And I switch to "report" child window
    And I click on the "Printable View" link "from report window"

    And I switch to "Printable view" third child window
    And I verify "<Entity Name>" on "printable view window"
    And I close the "Printable view" third child window
    And I wait for browser windows count to be equal to "2"
    And I switch to "report" child window

    And I click on the "PDF View" link
    And I close the "Run report" child window
    And I switch to main window
    And I wait for the Loading text to disappear in grid
    And I verify file name "LxReport" of type ".pdf" downloaded successfully

    Examples:
      | Login User   | Login full username  | Entity Name       |
      | DeleteAccess | Delete Access Access | Lucernex-Selenium |