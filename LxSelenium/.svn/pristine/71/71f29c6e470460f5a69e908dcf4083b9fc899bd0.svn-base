@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1125), Save Project - Workflow to documents with different status

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | WFStatusForm-1125.xml    |
      | StatusWF-1125.xml        |
      | WFStatusProject-1125.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: Save Project - Workflow to documents with different active status
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Work Flow" tab
    And I wait for the Loading text to disappear
#    And I click on "<Expand All>" link
    And I click " Expand All " button
    And I wait for the Loading text to disappear
    And I click on the "<Deactivate>" link
    And I switch to "Deactivate" child window
    And I click on "Yes" Button
    And I switch to main window
    And I wait for the Loading text to disappear
#    Then I verify message "Successfully deactivated Work Flow"
#    And I click on "<Expand All>" link
    And I click " Expand All " button
    And I wait for the Loading text to disappear
    And I click on the "<Deactivate>" link
    And I switch to "Deactivate" child window
    And I click on "Yes" Button
    And I switch to main window
    And I wait for the Loading text to disappear
#    Then I verify message "Successfully deactivated Work Flow"
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value           |
      | FolderID | PhotoGroup      |
      | BaseName | <Document Name> |
    And I click on "Save" Button
#    And I verify the save button will change to "Saving.."
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name     | Document Name    | Folder         |
    | DeleteAccess | Delete Access Access | WFStatusProject | Work flow Active | PhotoGroup (1) |

  Scenario Outline: I verify the Save Project - Workflow to documents with different active status
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And  I navigate to dashboard page
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | <Folder> |
    And I verify the following values in frame grid "resultsPane"
      | File Name            | Description          | Author               | Status    |
      | <Document Name>.html | <Document Name>.html | Delete Access Access | Available |
    And I right click on a document "<Document Name>.html" and select menu option "Download"
    And I wait for the Loading text to disappear

    Given I open latest downloaded file
    Then I verify the following values in non frame grid
      | Name        | Title      | Status           | Days Open | Begun          | Completed | Active Step | Due Date       | Current Assignee | Current Approver |
      | ApprovalsWF | 06/02/2016 | ACTIVE (Invalid) | 0         | [Today's Date] |           | 1           | [Today's Date] |                  |                  |
    And I close the "HTML window" child window

  Examples:
    | Login User   | Login full username  | Entity Name     | Document Name    | Folder         |
    | DeleteAccess | Delete Access Access | WFStatusProject | Work flow Active | PhotoGroup (1) |


  Scenario Outline: Save Project - Workflow to documents with different Inactive status
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Work Flow" tab
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name       | value    |
      | statusType | Inactive |
    And I click on "Submit" Button
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
    And I switch to visible frame
    And I select the following
      | <Folder> |
    And I verify the following values in frame grid "resultsPane"
      | File Name            | Description          | Author               | Status    |
      | <Document Name>.html | <Document Name>.html | Delete Access Access | Available |
    And I right click on a document "<Document Name>.html" and select menu option "Download"
    And I wait for the Loading text to disappear

    Given I open latest downloaded file
    Then I verify the following values in non frame grid
      | Name        | Title      | Status             | Days Open | Begun          | Completed | Active Step | Due Date       | Current Assignee | Current Approver |
      | ApprovalsWF | 06/04/2016 | INACTIVE (Invalid) | 0         | [Today's Date] |           | 1           | [Today's Date] |                  |                  |
      | ApprovalsWF | 06/03/2016 | INACTIVE (Invalid) | 0         | [Today's Date] |           | 1           | [Today's Date] |                  |                  |
    And I close the "HTML window" child window

  Examples:
    | Login User   | Login full username  | Entity Name     | Document Name      | Folder         |
    | DeleteAccess | Delete Access Access | WFStatusProject | Work flow Inactive | PhotoGroup (2) |