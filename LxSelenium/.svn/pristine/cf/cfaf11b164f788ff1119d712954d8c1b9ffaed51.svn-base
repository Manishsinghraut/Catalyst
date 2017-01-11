@all
Feature: (Jira Ref: Automation-1445) Move Documents

  Scenario Outline: As a delete user I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/DocumentsTab/"
    And I import following files:
      | Portfolio_00020AndLocation_00020-1445.xml |
      | Project-1445.xml                          |
      | MoveDocuments2-1445.zip                   |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Move Documents
    Given I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Documents" tab
    Then I wait for the Loading text to disappear
    And I expand the following
      | MoveDocuments2 (3) |
    And I select the following
      | MoveDocuments3 (3) |
    Then I verify the following values in frame grid "<Documents Grid>"
      | File Name   |
      | UploadA.txt |
      | UploadB.txt |
      | UploadC.txt |
    And I verify all rows count "3" in the frame grid "<Documents Grid>"

    And I check the checkbox of row in the grid "<Documents Grid>" having unique value "UploadA.txt"
    And I drag and drop the following documents from "UploadA.txt" to "MoveDocuments"
    And I select the following
      | MoveDocuments (1) |
    Then I verify the following values in frame grid "<Documents Grid>"
      | File Name   |
      | UploadA.txt |
    And I verify all rows count "1" in the frame grid "<Documents Grid>"

    And I select the following
      | MoveDocuments3 (2) |
    Then I verify the following values in frame grid "<Documents Grid>"
      | File Name   |
      | UploadB.txt |
      | UploadC.txt |
    And I verify all rows count "2" in the frame grid "<Documents Grid>"

    When I check the checkbox of row in the grid "<Documents Grid>" having unique value "UploadB.txt"
    And I check the checkbox of row in the grid "<Documents Grid>" having unique value "UploadC.txt"
    And I drag and drop the following documents from "UploadB.txt" to "MoveDocuments (1)"
    And I select the following
      | MoveDocuments (3) |
    Then I verify the following values in frame grid "<Documents Grid>"
      | File Name   |
      | UploadA.txt |
      | UploadB.txt |
      | UploadC.txt |
    And I verify all rows count "3" in the frame grid "<Documents Grid>"


    Examples:
      | Project Name                  | Documents Grid |
      | MoveDocuments-Automation-1445 | resultsPane    |