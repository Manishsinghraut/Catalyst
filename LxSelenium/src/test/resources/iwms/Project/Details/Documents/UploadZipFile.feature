@all
Feature: Upload Zip File [Ref : Jira Ticket No : AUTOMATION-1441]

  Scenario Outline: As Delete User, I import the following file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Documents/"
    And I import following file name:
      | Portfolio_00020AndLocation_00020_1441.xml |
      | UploadZipFile_1441.xml                    |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, I upload "UploadZipFile.zip" document and verify Upload Zip File
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
    And I select the following
      | <Folder> |

    And I click on the "Upload to <Folder>"
    And I upload the following document from path "Data/ImportDataFiles/iwms/Project/Details/Documents/":
      | 10thAmendment_1441.zip |
    And I click on the "Upload" button

    And I switch to default frame
    And I switch to "Zip file Upload" child window
    And I click on the "Save all files in the zipfile separately" button on "Zip file Upload window"
    And I wait for second child window to close
#    And I wait for "<string>" modal window to close
    And I switch to main window
    And I switch to visible frame
    And I verify the "Multiple Document Upload" message
    And I verify the "Note: Folder names in brackets" message

#    And I verify text value in a page
#      | 10th Amendment.docx |
#      | 10th Amendment.jpg  |
    And I set following fields value on editable page
      | name     | value          |
      | folder_0 | UploadaZipFile |
      | folder_1 | UploadaZipFile |
    And I click submit button
    And I verify the "Successfully imported 10th Amendment.docx" message
    And I verify the "Successfully imported 10th Amendment.jpg" message
    And I switch to default frame

    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear
    And I click "Expand All" button
    And I select the following
      | <Folder> (2) |
    And I verify the following values in frame grid "resultsPane"
      | File Name           | Description | Author               | Status    | Ver |
      | 10th Amendment.docx |             | Delete Access Access | Available | 1   |

    And I verify the following values in frame grid "resultsPane"
      | File Name          | Description | Author               | Status    | Ver |
      | 10th Amendment.jpg |             | Delete Access Access | Available | 1   |

  Examples:
    | Login User   | Login full username  | Entity Name   | Second Level Tab | Third Level Tab | Folder         |
    | DeleteAccess | Delete Access Access | UploadZipFile | Details          | Documents       | UploadaZipFile |