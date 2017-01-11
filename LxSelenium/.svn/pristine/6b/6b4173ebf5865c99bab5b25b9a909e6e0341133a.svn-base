@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1362),Save Forms Reports to documents

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | 8445_Form_1362.xml          |
      | Form_Report_Entity_1362.xml |
      | 8445_Form_Report_1362.xml   |
      | Lucernex_Selenium_1362.xml  |

    Examples:
      | Login User | Login full username |
      | LxSelenium | Selenium Tester     |

  Scenario Outline: Save Forms Reports to documents
    When I navigate to the reports dashboard
    And I click on the "Unspecified"
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value            |
      | Report Name | 8445 form report |
    And I switch to "Reports" child window
    And I click on "Save To Documents" link
    And I switch to "Save to Documents" third child window
    And I set following fields value on editable page
      | name        | value       |
      | portfolioID | <Portfolio> |
    And I set following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | <Document Name>         |
    And I click on "Save" Button
    And I wait for browser windows count to be equal to "2"
    And I switch to "Reports" child window
    And I close the "Reports" child window
    And I wait for browser windows count to be equal to "1"
    And I switch to main window
    When I navigate to entity type "Portfolios" named "<Portfolio>" through search option
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I select the following
      | <Folder> |
    And I verify the following values in frame grid "resultsPane"
      | File Name            | Description          | Author          | Status    |
      | <Document Name>.html | <Document Name>.html | Selenium Tester | Available |
    And I right click on a document "<Document Name>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Examples:
      | Portfolio         | Document Name | Folder                      |
      | Lucernex-Selenium | 8445 File     | SeleniumTestRootFolder1 (1) |


  Scenario: Verify document
    Given I open latest downloaded file
    And I verify the following text in a page
      | 8445 form report |
#    And I verify all rows count "1" in the non grid
    And I verify rows count "1" in the non grid
    Then I verify the following values in non frame grid
      | Row | Name               | Title | Number A | Number B | Assignee(s) | CheckBox | Currency | Description                     |
      | 1   | Form report Entity | 8445  | 1        | 2        |             | Yes      | $100.00  | Save Forms Reports to documents |
