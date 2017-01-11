@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1145), Saving Special characters and Logo on Summary page to documents - Project

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | ProjectPageLayouts.xml |
      | Photo____Project.xml   |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Saving Special characters and Logo on Summary page to documents - Project
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on "Manage Data Fields" link
    And I expand the the following data fields group
      | Summary Information         |
      | General Summary Information |
    And I click on "edit" action of "Logo" sub row in the grid "main"
    And I switch to "Logo" child window
    And I click on "Upload Logo" Button
    And I wait for modal window to open
    And I Upload selected image "Data/ImportDataFiles/iwms/Documents/":
      | lucernexlogo.png |
    And I click on "Upload" Button
    And I switch to main window
    And I wait for the Loading text to disappear in grid

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Document should be downloaded successfully
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value           |
      | FolderID | EntityPhoto     |
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
      | General Information |                                   |
      | Name                | <Entity Name>                     |
      | Description         | Special Characters Project @#$%"" |
    And I verify the logo
    And I close the "HTML window" child window


    Examples:
      | Login User   | Login full username  | Entity Name      | Document Name | Folder          |
      | DeleteAccess | Delete Access Access | Photo$%^&Project | Summary Doc   | EntityPhoto (1) |