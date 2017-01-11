@all
Feature: Verify the members and Contacts information while Saving the Document - Project and Parcel (Ref : Jira Ticket No : AUTOMATION-1119)

  Scenario Outline: As a LxSelenium user I import files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | FolderTemplate_AUTOMATION-1119.xml            |
      | MemberSS_AUTOMATION-1119.xlsx                 |
      | ContactsSS_AUTOMATION-1119.xlsx               |
      | Project_Save_to_Documents_AUTOMATION-1119.xml |
      | Parcel_Save_to_Documents_AUTOMATION-1119.xml  |

    Examples:
      | Login User | Login full username |
      | LxSelenium | Selenium Tester     |

  Scenario Outline: As LxSelenium user, I verify the members and Contacts information while Saving the Document - Project and Parcel
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Documents" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear
    And I click on the "Apply Folder Template"
    And I wait for "" modal window to open in frame page
    And I set following fields value on editable page
      | name                   | value                    |
      | assignFolderTemplateID | Selenium Folder Template |
    And I click on the "Assign Folder Template" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear
    And I click "Expand All" button
    And I select the following
      | SeleniumTestRootFolder1         |
      | RenamedSeleniumTestSubFolder2   |
      | SeleniumTestTemplateRootFolder1 |

    And I click on the "Members/Contacts" tab
#    And I wait for the Loading text to disappear
#    And I verify the following values under "Name" header in grid "BOGridMember"
    And I verify the following values in frame grid "BOGridMember"
      | Name         |
      | Tester 1 QA  |
      | Tester 2 QA  |
      | Tester3 QA   |
      | Tester 4 QA  |
      | Tester 5 QA  |
      | Tester 6 QA  |
      | Tester 7 QA  |
      | Tester 8 QA  |
      | Tester 9 QA  |
      | Tester 10 QA |
      | Tester 11 QA |
      | Tester 12 QA |
      | Tester 13 QA |
      | Tester 14 QA |
      | Tester 15 QA |
      | Tester 16 QA |
      | Tester 17 QA |
      | Tester 18 QA |
      | Tester 19 QA |
      | Tester 20 QA |
      | Tester 21 QA |
      | Tester 22 QA |
      | Tester 23 QA |
      | Tester 24 QA |
      | Tester 25 QA |
      | Tester 26 QA |
      | Tester 27 QA |
      | Tester 28 QA |
      | Tester 29 QA |
      | Tester 30 QA |
      | Tester 31 QA |
      | Tester 32 QA |
      | Tester 33 QA |
      | Tester 34 QA |
      | Contact 1 QA |
      | Contact 2 QA |

    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window

    And I set following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | <Document Name>         |
    And I click on "Save" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I select the following
      | SeleniumTestRootFolder1 (1) |
#    And I select and right click on "<Document Name>.html" and click on "Download" option
    And I right click on a document "<Document Name>.html" and select menu option "Download"
    And I open latest downloaded file
#    Then I Open "<Document Name>.html" downloaded file and verify the content
#    And I verify the following values under "Name" header in grid "BOGridMember"
    And I verify the following values in non frame grid "BOGridMember"
      | Name         |
      | Tester 1 QA  |
      | Tester 2 QA  |
      | Tester3 QA   |
      | Tester 4 QA  |
      | Tester 5 QA  |
      | Tester 6 QA  |
      | Tester 7 QA  |
      | Tester 8 QA  |
      | Tester 9 QA  |
      | Tester 10 QA |
      | Tester 11 QA |
      | Tester 12 QA |
      | Tester 13 QA |
      | Tester 14 QA |
      | Tester 15 QA |
      | Tester 16 QA |
      | Tester 17 QA |
      | Tester 18 QA |
      | Tester 19 QA |
      | Tester 20 QA |
      | Tester 21 QA |
      | Tester 22 QA |
      | Tester 23 QA |
      | Tester 24 QA |
      | Tester 25 QA |
      | Tester 26 QA |
      | Tester 27 QA |
      | Tester 28 QA |
      | Tester 29 QA |
      | Tester 30 QA |
      | Tester 31 QA |
      | Tester 32 QA |
      | Tester 33 QA |
      | Tester 34 QA |
      | Contact 1 QA |
      | Contact 2 QA |

    And I close the "HTML window" child window

    Examples:
      | Login User | Login full username | Entity Name               | Document Name |
      | LxSelenium | Selenium Tester     | Project Save to Documents | SavingFile1   |
      | LxSelenium | Selenium Tester     | Parcel Save to Documents  | SavingFile2   |