@all
Feature: Document Ready for Release [Ref : Jira Ticket No : AUTOMATION-1450]

  Scenario Outline: As Delete User, I import the following file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Documents/"
    And I import following file name:
      | Portfolio_00020AndLocation_00020_1450.xml |
      | ReayForReleaseTesting15592_1450.xml       |
      | Testing-15592Folder_1450.zip              |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, I verify Navigate to 'ReadyForRelease -Testing 15592' entity>Documents tab and expand all.Click on Sub folder titled 'Testing-15592 Folder Upload' and view the three files.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click "Expand All" button
    And I select the following
      | Testing-15592 Folder (3)        |
      | Testing-15592 Folder Upload (3) |

    And I verify the following values in frame grid "resultsPane"
      | File Name             | Description | Author               | Status    | Ver |
      | <Document Name>A1.txt |             | Delete Access Access | Available | 1   |
    And I verify the following values in frame grid "resultsPane"
      | File Name             | Description | Author               | Status    | Ver |
      | <Document Name>B1.txt |             | Delete Access Access | Available | 1   |
    And I verify the following values in frame grid "resultsPane"
      | File Name             | Description | Author               | Status    | Ver |
      | <Document Name>C1.txt |             | Delete Access Access | Available | 1   |
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name                   | Second Level Tab | Third Level Tab | Document Name |
    | DeleteAccess | Delete Access Access | ReadyForRelease-Testing 15592 | Details          | Documents       | Upload        |


  Scenario Outline: As a delete user, I verify Successfully set document not ready for release message should be displayed
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click "Expand All" button
    And I select the following
      | Testing-15592 Folder (3)        |
      | Testing-15592 Folder Upload (3) |

    And I right click on a document "<Document Name>A1.txt" and select menu option "View Revision History"
    And I wait for the Loading text to disappear in grid
    And I Uncheck the Ready for Release option on Revisions for "UploadA1.txt" pop-up window
    And I click "Close" button

    And I right click on a document "<Document Name>A1.txt" and select menu option "View Revision History"
    And I wait for the Loading text to disappear in grid
    And I verify Uncheck the Ready for Release option on Revisions for "UploadA1.txt" pop-up window
    And I click "Close" button

    And I right click on a document "<Document Name>A1.txt" and select menu option "View Revision History"
    And I wait for the Loading text to disappear in grid
    And I check the Ready for Release option on Revisions for "UploadA1.txt" pop-up window
    And I click "Close" button

    And I right click on a document "<Document Name>A1.txt" and select menu option "View Revision History"
    And I wait for the Loading text to disappear in grid
    And I verify check the Ready for Release option on Revisions for "UploadA1.txt" pop-up window
    And I click "Close" button

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name                   | Second Level Tab | Third Level Tab | Document Name |
    | DeleteAccess | Delete Access Access | ReadyForRelease-Testing 15592 | Details          | Documents       | Upload        |

#  Scenario Outline: As Delete user, I verify The report will display data related to the folder structure for entity "DocumentReportProject-2927"
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#
#    Then I navigate to the reports dashboard
#
#    And I click on the "run" row action of column "DocumentReport-2927" of column "0" from grid "<Grid>"
#    And I switch to "report" child window
#
#    And I verify the following values in non frame grid
#      | Name                       | Author               | File Size | Document Type | File Created Date      | Version |
#      | DocumentReportProject-2927 | Delete Access Access | 26        | Image         | 08/30/2015 12:00:00 AM | 1       |
#      |                            | Delete Access Access | 4         | Image         | 08/30/2015 12:00:00 AM | 1       |
#      |                            | Delete Access Access | 5         | Image         | 08/30/2015 12:00:00 AM | 1       |
#    And I close the "Report" child window
#    And I switch to main window
#
#
#    Then I navigate to the reports dashboard
#
#    And I click on the "run" row action of column "FolderReport-2927" of column "0" from grid "<Grid>"
#    And I switch to "report" child window
#
#    And I verify the following values in non frame grid
#      | Name                       | Parent Folder | Downloadable | Full Folder List          | Path Name                 | Uploadable Only |
#      | DocumentReportProject-2927 | PFolder       | Yes          | /PFolder                  | /PFolder/Report Documents | No              |
#      |                            | PFolder       | Yes          | /PFolder/Report Documents | /PFolder/Report Documents | No              |
#      |                            | PFolder       | Yes          |                           | /PFolder/Report Documents | No              |
#    And I close the "Report" child window
#    And I switch to main window
#
#
#  Examples:
#    | Login User   | Login full username  | Grid        |
#    | DeleteAccess | Delete Access Access | pageContent |
#
#
#  Scenario Outline: As a delete user, I verify The report will display document data and the "document" document type file will have a version of "2" and the created date will also be modified to today's date.
#    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    And I click on the "<Second Level Tab>" tab
#    And I click on the "<Third Level Tab>" tab
#    And I switch to visible frame
#    And I click "Expand All" button
#    And I select the following
#      | PFolder (3           |
#      | Report Documents (3) |
#
#    And I verify the following values in frame grid "resultsPane"
#      | File Name            | Description | Author               | Status    | Ver |
#      | <Document Name>D.txt |             | Delete Access Access | Available | 1   |
#
#    And I right click on a document "<Document Name>D.txt" and select menu option "Download"
#    And I wait for the Loading text to disappear in grid
#
#    And I right click on a document "<Document Name>D.txt" and select menu option "Upload new version"
#    And I wait for the Loading text to disappear
#
#    And I upload the following document from path "target/DownloadFiles/":
#      | DocumentD(Version=1).txt |
#
#    And I click on the "Upload" button
#
#    And I verify the following values in frame grid "resultsPane"
#      | File Name            | Description | Author               | Status    | Ver |
#      | <Document Name>D.txt |             | Delete Access Access | Available | 2   |
#
#    And I switch to default frame
#
#  Examples:
#    | Login User   | Login full username  | Entity Name                | Second Level Tab | Third Level Tab | Document Name |
#    | DeleteAccess | Delete Access Access | DocumentReportProject-2927 | Details          | Documents       | Document      |
#
#
#  Scenario Outline: As Delete user, I The report will display document data and the "document" document type file will have a version of "2" and the created date will also be modified to today's date
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#
#    Then I navigate to the reports dashboard
#    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
#      | name        | value               |
#      | Report Name | DocumentReport-2927 |
#
#    And I switch to "report" child window
#    And I verify File Created Date "[Today's Date]" and Version "2" of Name "DocumentReportProject-2927"
#    And I close the "Report" child window
#    And I switch to main window
#
#  Examples:
#    | Login User   | Login full username  |
#    | DeleteAccess | Delete Access Access |