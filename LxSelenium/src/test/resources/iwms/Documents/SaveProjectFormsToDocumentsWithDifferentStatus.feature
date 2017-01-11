@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1124), Save Project - Forms to documents with different status

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | FormsForStatus-1124.xml    |
      | FormStatusProject-1124.xml |

  Examples:
    | Login User | Login full username |
    | LxSelenium | Selenium Tester     |

  Scenario Outline: Save Project - Forms to documents with closed status
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
#    And I click "06/01/2016" action of "0002" sub row in the grid "issueMainDiv"
    And I click on the "06/01/2016" row action of column "0002" of column "1" from grid "BOGridLX_Grid_Issue"
    And I wait for the Loading text to disappear
    And I click on "<Close>" link
    And I switch to default frame
    And I wait for the Loading text to disappear in grid
    And I switch to "Close form window" child window
    And I click on "Close Issue" Button
    And I switch to main window
    And I wait for the Loading text to disappear
#    And I verify message "Successfully closed issue"
    And I switch to visible frame
#    When  I sort form list with status type "Closed Items"
    And I set following fields value on editable page
      | name        | value        |
      | statusType | Closed Items |

    Then I verify form "06/01/2016" is displayed in form list

    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value           |
      | FolderID | PhotoGroup      |
      | BaseName | <Document Name> |
    And I click on "Save" Button
#    And I verify the save button will change to "Saving.."
    And I switch to main window
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
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
      | FormStatusProject, GA United States |
    And I set following fields value on editable page
      | name       | value        |
      | statusType | Closed Items |
    And I verify the following fields value on editable page
      | name       | value        |
      | formType   | All          |
      | statusType | Closed Items |
      | logType    | All Forms    |
    And I verify the following text in a page
      | 0002 |
    And I verify all rows count "1" in the non grid
    Then I verify the following values in non frame grid
      | Title      |  Due Date | Assignees | Form Type   | Creator         | Last Reply | # Replies |
      | 06/01/2016 |           |           | Form for ST | Selenium Tester |            | 0         |

#      | Title      | Days Open | Due Date | Assignees | Form Type   | Creator         | Last Reply | # Replies |
#      | 06/01/2016 | 69        |          |           | Form for ST | Selenium Tester |            | 0         |

    And I close the "HTML window" child window

  Examples:
    | Login User   | Login full username  | Entity Name       | Document Name | Folder         |
    | DeleteAccess | Delete Access Access | FormStatusProject | Closed Form   | PhotoGroup (1) |


  Scenario Outline: Save Project - Forms to documents with Open/Closed status
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
#    When  I sort form list with status type "Open/Closed Items"
    And I switch to visible frame
    And I set following fields value on editable page
      | name        | value             |
      | statusType  | Open/Closed Items |
    And I switch to default frame
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value           |
      | FolderID | PhotoGroup      |
      | BaseName | <Document Name> |
    And I click on "Save" Button
    And I switch to main window
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
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
      | FormStatusProject, GA United States |
    And I set following fields value on editable page
      | name       | value             |
      | statusType | Open/Closed Items |
    And I verify the following fields value on editable page
      | name       | value             |
      | formType   | All               |
      | statusType | Open/Closed Items |
      | logType    | All Forms         |
    And I verify the following text in a page
      | 0002 |
      | 0001 |
    And I verify all rows count "3" in the non grid
    Then I verify the following values in non frame grid
      | Title      |  Due Date | Assignees | Form Type   | Creator         | Last Reply | # Replies |
      | 06/01/2016 |           |           | Form for ST | Selenium Tester |            | 0         |
      | 06/01/2016 |           |           | Form for ST | Selenium Tester |            | 0         |
      | 06/01/2016 |           |           | Currency_PL | Selenium Tester |            | 0         |

#      | Title      | Days Open | Due Date | Assignees | Form Type   | Creator         | Last Reply | # Replies |
#      | 06/01/2016 | 69        |          |           | Form for ST | Selenium Tester |            | 0         |
#      | 06/01/2016 | 69        |          |           | Form for ST | Selenium Tester |            | 0         |
#      | 06/01/2016 | 69        |          |           | Currency_PL | Selenium Tester |            | 0         |

    And I close the "HTML window" child window

  Examples:
    | Login User   | Login full username  | Entity Name       | Document Name    | Folder         |
    | DeleteAccess | Delete Access Access | FormStatusProject | OpenClosed Forms | PhotoGroup (2) |


  Scenario Outline: Save Project - Forms to documents with open status
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
#    When  I sort form list with status type "Open Items"
    And I switch to visible frame
    And I set following fields value on editable page
      | name        | value      |
      | statusType | Open Items |
    And I switch to default frame
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value           |
      | FolderID | PhotoGroup      |
      | BaseName | <Document Name> |
    And I click on "Save" Button
    And I switch to main window
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
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
      | FormStatusProject, GA United States |
    And I set following fields value on editable page
      | name       | value      |
      | statusType | Open Items |
    And I verify the following fields value on editable page
      | name       | value      |
      | formType   | All        |
      | statusType | Open Items |
      | logType    | All Forms  |
    And I verify the following text in a page
      | 0001 |
    And I verify all rows count "2" in the non grid
    Then I verify the following values in non frame grid
      | Title      |  Due Date | Assignees | Form Type   | Creator         | Last Reply | # Replies |
      | 06/01/2016 |           |           | Form for ST | Selenium Tester |            | 0         |
      | 06/01/2016 |           |           | Currency_PL | Selenium Tester |            | 0         |

#      | Title      | Days Open | Due Date | Assignees | Form Type   | Creator         | Last Reply | # Replies |
#      | 06/01/2016 | 69        |          |           | Form for ST | Selenium Tester |            | 0         |
#      | 06/01/2016 | 69        |          |           | Currency_PL | Selenium Tester |            | 0         |

  Examples:
    | Login User   | Login full username  | Entity Name       | Document Name | Folder         |
    | DeleteAccess | Delete Access Access | FormStatusProject | Opened Forms  | PhotoGroup (3) |