@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1122), Save Reports to documents for contract and project

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | FolderTemplate-1122.xml   |
      | Project_Values-1122.xml   |
      | ProjectReport-1122.xml    |
      | Values_Contracts-1122.xml |
      | ContractReport-1122.xml   |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: Save Reports to documents for contract and project
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

    And I navigate to second level tab "Reports" and third level "<Third level tab>" tab of entity "<Entity Type>"
    And I switch to visible frame
    And I click "List All Reports" button
#    Then I verify the following values in frame grid "BOGridPageLayout"
#    Then I verify the following values in frame grid "^editBOGrid"
#      | Report Name   | Description | Report Type | Saved for? | Scheduled Jobs | Created By            |
#      | <Report Name> |             | Entity      | All        |                | Access, Delete Access |
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name           | value                 |
      | Report Name    | <Report Name>         |
      | Description    |                       |
      | Report Type    | Entity                |
      | Saved for?     | All                   |
      | Scheduled Jobs |                       |
      | Created By     | Access, Delete Access |

    And I switch to "report" child window
    And I close the "Report" child window
    And I switch to main window

    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | <Document Name>         |
    And I click on "Save" Button
    And I switch to main window

    And I navigate to second level tab "Details" and third level "Documents" tab of entity "<Entity Type>"
    And I wait for the Loading text to disappear


#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header

    And I click on the "Documents" tab

    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | <Folder> |
    And I verify the following values in frame grid "resultsPane"
      | File Name            | Description          | Author               | Status    |
      | <Document Name>.html | <Document Name>.html | Delete Access Access | Available |
    And I right click on a document "<Document Name>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | <Banner> |
    And I verify the following fields value on editable page
      | name     | value       |
      | showType | All Reports |

#    And I switch to visible frame
    And I click "List All Reports" button
#    Then I verify the following values in frame grid "BOGridPageLayout"
    Then I verify the following values in frame grid "^editBOGrid"
      | Report Name   | Description | Report Type | Saved for? | Scheduled Jobs | Created By            |
      | <Report Name> |             | Entity      | All        |                | Access, Delete Access |
    And I close the "HTML window" child window

  Examples:
    | Third level tab  | Banner                                          | Report Name     | Entity Type | Login User   | Login full username  | Entity Name      | Document Name           | Folder                  |
    | Contract Reports | Values Contracts, Plano, TX 75024 United States | Contract Report | Contract    | DeleteAccess | Delete Access Access | Values Contracts | Contract Report Details | SeleniumTestRootFolder1 |
#    | Project Reports  | Project Values, TX United States                | Project Report  | Project     | DeleteAccess | Delete Access Access | Project Values   | Project Report Details  | SeleniumTestRootFolder1 |
#    | Contract Reports | Values Contracts, Plano, TX 75024 United States | Contract Report | Contract    | DeleteAccess | Delete Access Access | Values Contracts | Contract Report Details | SeleniumTestRootFolder1 (1) |
#    | Project Reports  | Project Values, TX United States                | Project Report  | Project     | DeleteAccess | Delete Access Access | Project Values   | Project Report Details  | SeleniumTestRootFolder1 (1) |


  Scenario Outline: Save Reports to documents for contract and project1
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

    And I navigate to second level tab "Reports" and third level "<Third level tab>" tab of entity "<Entity Type>"
    And I switch to visible frame
    And I click "List All Reports" button
#    Then I verify the following values in frame grid "BOGridPageLayout"
#    Then I verify the following values in frame grid "^editBOGrid"
#      | Report Name   | Description | Report Type | Saved for? | Scheduled Jobs | Created By            |
#      | <Report Name> |             | Entity      | All        |                | Access, Delete Access |
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name           | value                 |
      | Report Name    | <Report Name>         |
      | Description    |                       |
      | Report Type    | Entity                |
      | Saved for?     | All                   |
      | Scheduled Jobs |                       |
      | Created By     | Access, Delete Access |

    And I switch to "report" child window
    And I close the "Report" child window
    And I switch to main window

    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | <Document Name>         |
    And I click on "Save" Button
    And I switch to main window

    And I navigate to second level tab "Details" and third level "Documents" tab of entity "<Entity Type>"
    And I wait for the Loading text to disappear


#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header

    And I click on the "Documents" tab

    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | <Folder> |
    And I verify the following values in frame grid "resultsPane"
      | File Name            | Description          | Author               | Status    |
      | <Document Name>.html | <Document Name>.html | Delete Access Access | Available |
    And I right click on a document "<Document Name>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | <Banner> |
    And I verify the following fields value on editable page
      | name     | value       |
      | showType | All Reports |

#    And I switch to visible frame
    And I click "List All Reports" button
#    Then I verify the following values in frame grid "BOGridPageLayout"
    Then I verify the following values in frame grid "^editBOGrid"
      | Report Name   | Description | Report Type | Saved for? | Scheduled Jobs | Created By            |
      | <Report Name> |             | Entity      | All        |                | Access, Delete Access |
    And I close the "HTML window" child window

  Examples:
    | Third level tab  | Banner                                          | Report Name     | Entity Type | Login User   | Login full username  | Entity Name      | Document Name           | Folder                  |
    | Project Reports  | Project Values, TX United States                | Project Report  | Project     | DeleteAccess | Delete Access Access | Project Values   | Project Report Details  | SeleniumTestRootFolder1 |

