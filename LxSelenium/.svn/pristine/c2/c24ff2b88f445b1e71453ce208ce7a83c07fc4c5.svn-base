@all
Feature: Upload New Document [Ref : Jira Ticket No : AUTOMATION-1438]

  Scenario Outline: As Delete User, I import the following file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Documents/"
    And I import following file name:
      | Portfolio_00020AndLocation_00020_1438.xml |
      | UploadNewDocument_1438.xml                |
      | SeleniumFolder_1438.xml                   |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, I verify Document will be successfully uploaded and Email notification will be successfully generated and sent to svcQA@lucernex.com
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear
    And I click on the "Apply Folder Template"
    And I wait for "" modal window to open in frame page
    And I set following fields value on editable page
      | name                   | value             |
      | assignFolderTemplateID | <Folder Template> |

    And I click on the "Assign Folder Template" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear

    And I switch to default frame
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame

    And I click "Expand All" button
    And I select the following
      | SeleniumTestTemplateRootFolder1 |
    And I click on the "Upload to SeleniumTestTemplateRootFolder1"

    And I set following fields value on editable page
      | name        | value |
      | mailMembers | true  |
    And I add following members
      | Access, Delete Access |

    And I upload the following document from path "Data/ImportDataFiles/iwms/Project/Details/Documents/":
      | 10thAmendment_1438.docx |

    And I click on the "Upload" button
    And I wait for modal window to close
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name       | Second Level Tab | Third Level Tab | Folder Template          |
    | DeleteAccess | Delete Access Access | UploadNewDocument | Details          | Documents       | Selenium Folder Template |

  Scenario: As delete user, I verify Email notification will be successfully generated and sent to svcQA@lucernex.com
    Given I login to web mail on existing window
    And I search for the mail using subject "[LxRetail] UploadNewDocument LxRetail document upload"
    And I check mail body for the following contents
      | Document(s) have been uploaded into LxRetail.          |
      | Document Name: 10thAmendment_1438.docx                 |
      | Folder: /SeleniumTestTemplateRootFolder1               |
      | Author: Delete Access Access                           |
      | Description:                                           |
      | URL for Opening Project "UploadNewDocument"            |

    And I click application link within the mail body
    And I switch to lucernex application window
    And I close lucernex window
    And I close mail window
    And I switch to main window
