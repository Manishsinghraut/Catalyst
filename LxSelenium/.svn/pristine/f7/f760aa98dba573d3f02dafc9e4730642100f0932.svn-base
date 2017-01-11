@all
Feature: Delete Document [Ref : Jira Ticket No : AUTOMATION-1442]

  Scenario Outline: As Delete User, I import the following file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Documents/"
    And I import following file name:
      | Portfolio_00020AndLocation_00020(1)(1)(1)_1442.xml |
      | Employer-46_1442.xlsx                              |
      | Member-Dwight(3)_1442.xlsx                         |
      | DocumentDeleteProject_46_1442.xml                  |
      | DeleteAccessDocumentStructure-46(5)_1442.zip       |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, I Navigate to the entity "	DocumentDeleteProject-46" and give folder security of "download/upload" to "Delete Access" user class for folders "example", "Dwight's Documents", and "DeleteAccess Documents". Refer to screenshots "2a. Security option" and "2b. Option selected"
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
    And I wait for the Loading text to disappear
    And I click "Expand All" button
    And I switch to default frame

    And I switch to visible frame
    And I select the following documents
      | example (3)                |
      | Dwight's Documents         |
      | DeleteAccess Documents (3) |

    And I wait for the loading text to be disappear
    And I right click on the "Dwight's Documents" root folder then select menu option "Folder Security"
    And I switch to default frame
    And I wait for modal window to open
    And I select value "Upload/Download" of field "Delete Access" on "popup window"
    And I click "Update Folder Security" button
    And I wait for modal window to close

    And I switch to visible frame
    And I select the following documents
      | example (3)                |
      | Dwight's Documents         |
      | DeleteAccess Documents (3) |
    And I wait for the loading text to be disappear
    And I right click on the "DeleteAccess Documents (3)" root folder then select menu option "Folder Security"
    And I switch to default frame
    And I wait for modal window to open
    And I select value "Upload/Download" of field "Delete Access" on "popup window"
    And I click "Update Folder Security" button
    And I wait for modal window to close

    And I switch to visible frame
    And I wait for the Loading text to disappear
    And I select the following documents
      | example (3) |
    And I wait for the loading text to be disappear
    And I right click on the "example (3)" root folder then select menu option "Folder Security"
    And I switch to default frame
    And I wait for modal window to open
    And I select value "Upload/Download" of field "Delete Access" on "popup window"
    And I click "Update Folder Security" button
    And I wait for modal window to close

    And I logout

  Examples:
    | Login User   | Login full username  | Entity Name              | Second Level Tab | Third Level Tab | Document Name |
    | DeleteAccess | Delete Access Access | DocumentDeleteProject-46 | Details          | Documents       | DVP44         |

  Scenario Outline: As Delete User, I import the "DocumentStructureUpdate-44.zip" file
    Given I Login to IWMS using "<Login User>" access credentials expecting EULA page
    Then Accept Eula and move on
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Documents/"
    And I import following file name:
      | DwightDocumentStructure-46(3)_1442.zip |

    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear
    And I click "Expand All" button
    And I select the following
      | example (6) |
      | Dwight      |
    And I verify the following values in frame grid "resultsPane"
      | File Name            | Description | Author         | Status                | Ver |
      | <Document Name>D.txt |             | Dwight Schrute | Not Ready for Release | 1   |
    And I right click on a document "<Document Name>D.txt" and select menu option "Delete Document"
    And I wait for the Loading text to disappear

    And I click "Delete" button
    And I wait for modal window to close

    And I verify the following values in frame grid "resultsPane"
      | File Name            | Description | Author         | Status                | Ver |
      | <Document Name>E.txt |             | Dwight Schrute | Not Ready for Release | 1   |
    And I verify the following values in frame grid "resultsPane"
      | File Name            | Description | Author         | Status                | Ver |
      | <Document Name>F.txt |             | Dwight Schrute | Not Ready for Release | 1   |

    And I select checkbox from grid "resultsPane" having unique value "<Document Name>E.txt"
    And I select checkbox from grid "resultsPane" having unique value "<Document Name>F.txt"

    And I right click on a document "<Document Name>E.txt" and select menu option "Delete Selected"
    And I wait for the Loading text to disappear

    And I click "Delete All Versions" button
    And I wait for modal window to close

    And I select the following
      | example (3)                |
      | DeleteAccess Documents (3) |


    And I verify the following values in frame grid "resultsPane"
      | File Name            | Description | Author               | Status    | Ver |
      | <Document Name>A.txt |             | Delete Access Access | Available | 1   |
    And I right click on a document "<Document Name>A.txt" and verify menu option "Delete Document" is disabled
    And I wait for the Loading text to disappear

    And I select checkbox from grid "resultsPane" having unique value "<Document Name>B.txt"
    And I select checkbox from grid "resultsPane" having unique value "<Document Name>C.txt"

    And I right click on a document "<Document Name>A.txt" and select menu option "Delete Selected"
    And I wait for the Loading text to disappear
    And I click "Delete All Versions" button
    And I wait for "Files may only be deleted by the uploader. Please contact your system administrator.." is visible
    And I click "Ok" button
    And I wait for modal window to close
    And I logout

  Examples:
    | Login User | Login full username | Entity Name              | Second Level Tab | Third Level Tab | Document Name |
    | dschrute   | Dwight Schrute      | DocumentDeleteProject-46 | Details          | Documents       | Document      |