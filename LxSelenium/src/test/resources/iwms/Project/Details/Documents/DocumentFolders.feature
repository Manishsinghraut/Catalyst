@all
Feature: Document Folders [Ref : Jira Ticket No : AUTOMATION-1444]

  Scenario Outline: As Delete User, I import the following file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Documents/"
    And I import following file name:
      | Portfolio_00020AndLocation_00020_1444.xml |
      | 125_Project_1444.xml                      |
      | SeleniumFolder_1444.xml                   |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, I verify The Root Folder should be added to the folder tree successfully.
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

    And I click on the "Add Root Folders"
    And I set following fields value on editable page
      | name  | value    |
      | entry | Test 125 |
    And I click on the " >> " button on "popup window"
    And I click "Create the list of folders" button

    And I select the following
      | Test 125 |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name | Second Level Tab | Third Level Tab | Folder Template          |
    | DeleteAccess | Delete Access Access | 125 Project | Details          | Documents       | Selenium Folder Template |
