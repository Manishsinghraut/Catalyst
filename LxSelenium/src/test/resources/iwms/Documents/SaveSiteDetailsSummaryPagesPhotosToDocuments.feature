@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1121), Save Site details Summary Pages(Photos) to documents

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | PhotosTemplate.xml |
      | SiteforPhoto.xml   |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I upload photo to entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I wait for the Loading text to disappear
    And I click on "Upload Photo" link
    And I Upload selected image "Data/ImportDataFiles/iwms/Documents/":
      | WatchGuts.jpg |
#    And I verify the following text in a page
#      | WatchGuts.jpg |
    And I click on "Upload" Button
    And I wait for the Loading text to disappear
    And I verify the following text in a page
      | Change Photo |
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name  |
      | DeleteAccess | Delete Access Access | SiteforPhoto |


  Scenario Outline: Document should be downloaded successfully
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I wait for the Loading text to disappear
    And I verify entity photo

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
    And I right click on a document "<Document Name>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    Then I verify the following details in non editable summary page in non-frame grid
      | General Information |               |
      | Name                | <Entity Name> |
    And I verify entity photo
    And I close the "HTML window" child window

    Examples:
      | Login User   | Login full username  | Entity Name  | Document Name | Folder         |
      | DeleteAccess | Delete Access Access | SiteforPhoto | Site SEP      | PhotoGroup (1) |