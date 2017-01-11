@all
Feature: Downloading Checked Out Documents (Ref : Jira Ticket No : AUTOMATION-1451)

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/DocumentsTab/"
    And I import following files:
      | Portfolio_00020AndLocation_00020-1451.xml |
      | Project_15660-1451.xml                    |
      | Folder156660-1451.zip                     |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a Delete user, I Check Out, Download the document and Verify the Alert
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I click "Expand All" button
    And I select the following "Folder documents"
      | Folder156660 (1) |
      | Folder156660 (1) |
    Then I verify the following values in frame grid "resultsPane"
      | File Name   | Description | Author               | Status    | Ver | Checked Out |
      | UploadA.txt |             | Delete Access Access | Available | 1   |             |

    And I right click on a document "UploadA.txt" and select menu option "Check Out"
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I click "Expand All" button
    And I select the following "Folder documents"
      | Folder156660 (1) |
      | Folder156660 (1) |
    And I verify the following values in frame grid "resultsPane"
      | File Name   | Description | Author               | Status    | Ver | Checked Out          |
      | UploadA.txt |             | Delete Access Access | Available | 1   | Delete Access Access |
    And I right click on a document "UploadA.txt" and select menu option "Download"
    And I verify alert box with message "Selected document is checked out!"
    And I verify file name "UploadA(Version=1)" of type ".txt" downloaded successfully

    Examples:
      | Entity Name   |
      | Project 15660 |

  Scenario Outline: As Delete user, I Check In the Checked Out Document, Download and verify the downloaded file
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I click "Expand All" button
    And I select the following "Folder documents"
      | Folder156660 (1) |
      | Folder156660 (1) |
    And I right click on a document "UploadA.txt" and select menu option "Check In"
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I click "Expand All" button
    And I select the following "Folder documents"
      | Folder156660 (1) |
      | Folder156660 (1) |
    And I right click on a document "UploadA.txt" and select menu option "Download"
    And I verify file name "UploadA(Version=1) (1)" of type ".txt" downloaded successfully

    Examples:
      | Entity Name   |
      | Project 15660 |