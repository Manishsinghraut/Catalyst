@all @smoke @smoke1
Feature: As an IWMS user I need to be able to manage folder templates records.

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Folder Templates" link
    Then I wait for the Loading text to disappear in grid

  Scenario: I want to create folder template from manage folder templates
    Given I click on the "Add Folder Template..."
    And I see the "Add Folder Template  ***Required fields in red" modal window
    And I set these field values on editable page
      | name         | value                          |
      | TemplateName | Selenium Admin Folder Template |
      | Description  | Test Description               |
    And I select following entities checkbox from model window
      | locator | element          |
      | name    | Portfolio        |
      | name    | Prototype        |
      | name    | Parcel           |
      | name    | OpenProject      |
      | name    | CapProject       |
      | name    | CapProgram       |
      | name    | Location         |
      | name    | PotentialProject |
      | name    | Facility         |
      | name    | Contract         |
    When I click on the "Add" button
    And I wait for modal window to close
    #IWMS-22139
#    And I see "Successfully added Folder Template" in the grid header
    Given I see these grid columns:
      | Folder Template Name |
      | Description          |
      | Actions              |
    And I see some rows with data in the grid
    And I see these row actions:
      | edit   |
      | delete |
    And I see page "1" in the grid's pagination controls
    And I see the number of pages in the grid's pagination controls

  Scenario: I want to Modify Folder Structure Add a root folder to manage folder templates
    Given I click on the "Modify folder structure" row action of column "Selenium Admin Folder Template" of column "1" from grid "id" "BOGridFolderTemplate"
    And I wait for the Loading text to disappear in grid
    And I click on the "Add Root Folders"
    And I set following fields value on editable page
      | name  | value                   |
      | entry | SeleniumTestRootFolder1 |
    And I click on the add to list button
    And I click on the "Create the list of folders" button
    And I wait for modal window to close
    And I see the created folder "SeleniumTestRootFolder1"

  Scenario: I want to Modify Folder Structure Add a root folder to manage folder templates
    Given I click on the "Modify folder structure" row action of column "Selenium Admin Folder Template" of column "1" from grid "id" "BOGridFolderTemplate"
    And I wait for the Loading text to disappear in grid
    And I click on the "Add Root Folders"
    And I set following fields value on editable page
      | name  | value                   |
      | entry | SeleniumTestRootFolder2 |
    And I click on the add to list button
    And I click on the "Create the list of folders" button
    And I wait for modal window to close
    And I see the created folder "SeleniumTestRootFolder2"

  Scenario: I want to Modify Folder Structure - Add a sub folder to manage folder templates
    Given I click on the "Modify folder structure" row action of column "Selenium Admin Folder Template" of column "1" from grid "id" "BOGridFolderTemplate"
    And I wait for the Loading text to disappear in grid
    And I right click on a "SeleniumTestRootFolder1" root folder then select menu option "Create Sub Folders"
    And I set following fields value on editable page
      | name  | value                  |
      | entry | SeleniumTestSubFolder1 |
    And I click on the add to list button
    And I click on the "Create the list of folders" button
    And I wait for modal window to close
    And I see the created folder "SeleniumTestSubFolder1"

  Scenario: I want to Modify Folder Structure - Add a sub folder to manage folder templates
    Given I click on the "Modify folder structure" row action of column "Selenium Admin Folder Template" of column "1" from grid "id" "BOGridFolderTemplate"
    And I wait for the Loading text to disappear in grid
    And I expand the following
      | SeleniumTestRootFolder1 |
    And I right click on a "SeleniumTestSubFolder1" root folder then select menu option "Create Sub Folders"
    And I set following fields value on editable page
      | name  | value                                |
      | entry | SeleniumTestSubFolder1withSubFolders |
    And I click on the add to list button
    And I click on the "Create the list of folders" button
    And I wait for modal window to close
    And I see the created folder "SeleniumTestSubFolder1withSubFolders"

  Scenario: I want to Modify Folder Structure - Rename a folder to manage folder templates
    Given I click on the "Modify folder structure" row action of column "Selenium Admin Folder Template" of column "1" from grid "id" "BOGridFolderTemplate"
    And I wait for the Loading text to disappear in grid
    And I right click on a "SeleniumTestRootFolder2" root folder then select menu option "Rename Folder"
    And I set following fields value on editable page
      | name       | value                         |
      | FolderName | RenamedSeleniumTestSubFolder2 |
    And I click on the "Update" button
    And I wait for modal window to close
    And I see the created folder "RenamedSeleniumTestSubFolder2"

  Scenario: I want to Modify Folder Structure - Folder Security to manage folder templates
    Given I click on the "Modify folder structure" row action of column "Selenium Admin Folder Template" of column "1" from grid "id" "BOGridFolderTemplate"
    And I wait for the Loading text to disappear in grid
    And I click on the "Folder Structure" link
    And I wait for the Loading text to disappear in grid
    And I expand the following
      | SeleniumTestRootFolder1 |
    And I right click on a "RenamedSeleniumTestSubFolder2" root folder then select menu option "Folder Security"
    And I set following fields value on editable page
      | name           | value    |
      | foldersecurity | Download |
    And I click on the "Update Folder Security" button
    And I wait for modal window to close

  Scenario: I want to Modify Folder Structure - Move around folders to manage folder templates
    Given I click on the "Modify folder structure" row action of column "Selenium Admin Folder Template" of column "1" from grid "id" "BOGridFolderTemplate"
    And I wait for the Loading text to disappear in grid
    And Select a folder to move from the "RenamedSeleniumTestSubFolder2" to "SeleniumTestRootFolder1" the folder template
    And I wait for the Loading text to disappear in grid
    And I see the created folder "RenamedSeleniumTestSubFolder2"

  Scenario: I want to create folder template from manage folder templates
    And I see some rows with data in the grid
    And I see these row actions:
      | edit   |
      | delete |
    And I see page "1" in the grid's pagination controls
    And I see the number of pages in the grid's pagination controls
    And I click on the "Add Folder Template..."
    And I see the "Add Folder Template  ***Required fields in red" modal window
    And I set these field values on editable page
      | name         | value                        |
      | TemplateName | Selenium Admin test template |
      | Description  | Test Description             |
    When I click on the "Add" button
    And I wait for modal window to close
    #IWMS-22139
#    And I see "Successfully added Folder Template" in the grid header

  Scenario: I want to Modify Folder Structure Add a root folder to manage folder templates
    Given I click on the "Modify folder structure" row action of column "Selenium Admin Folder Template" of column "1" from grid "id" "BOGridFolderTemplate"
    And I wait for the Loading text to disappear in grid
    And I click on the "Add Root Folders"
    And I set following fields value on editable page
      | name  | value                           |
      | entry | SeleniumTestTemplateRootFolder1 |
    And I click on the add to list button
    And I click on the "Create the list of folders" button
    And I wait for modal window to close
    And I see the created folder "SeleniumTestTemplateRootFolder1"

  Scenario: I want to Folder Structure - Apply Folder Template to manage folder templates
    Given I click on the "Modify folder structure" row action of column "Selenium Admin Folder Template" of column "1" from grid "id" "BOGridFolderTemplate"
    And I wait for the Loading text to disappear in grid
    And I click on the "Apply Folder Template"
    And I set following fields value on editable page
      | name                   | value                        |
      | assignFolderTemplateID | Selenium Admin test template |
    And I click on the "Assign Folder Template" button
    And I wait for modal window to close
    And I see the assign template folder structure "SeleniumTestTemplateRootFolder1"

  Scenario: I want to Modify Folder Structure - Delete a folder from manage folder templates
    Given I click on the "Modify folder structure" row action of column "Selenium Admin Folder Template" of column "1" from grid "id" "BOGridFolderTemplate"
    And I wait for the Loading text to disappear in grid
    And I right click on a "SeleniumTestRootFolder1" root folder then select menu option "Delete Folder"
    Then I see the message "Folder delete failed. Cannot delete non-empty Folder" in the Lx Modal Window
    And I click on the "Ok" button

  Scenario: I want to Modify Folder Structure - Delete a folder from manage folder templates
    Given I click on the "Modify folder structure" row action of column "Selenium Admin Folder Template" of column "1" from grid "id" "BOGridFolderTemplate"
    And I wait for the Loading text to disappear in grid
    And I expand the following
      | SeleniumTestRootFolder1 |
    And I right click on a "SeleniumTestSubFolder1" root folder then select menu option "Delete Folder"
    Then I see the message "Folder delete failed. Cannot delete non-empty Folder" in the Lx Modal Window
    And I click on the "Ok" button

  Scenario: I want to Modify Folder Structure - Delete a folder from manage folder templates1
    Given I click on the "Modify folder structure" row action of column "Selenium Admin Folder Template" of column "1" from grid "id" "BOGridFolderTemplate"
    And I wait for the Loading text to disappear in grid
    And I expand the following
      | SeleniumTestRootFolder1 |
      | SeleniumTestSubFolder1  |
    And I right click on a "SeleniumTestSubFolder1withSubFolders" root folder then select menu option "Delete Folder"
    And I verified that deleted folder "SeleniumTestSubFolder1withSubFolders" does not exist
    And I right click on a "SeleniumTestSubFolder1" root folder then select menu option "Delete Folder"
    And I verified that deleted folder "SeleniumTestSubFolder1" does not exist
    And I right click on a "SeleniumTestRootFolder1" root folder then select menu option "Delete Folder"
    And I verified that deleted folder "SeleniumTestRootFolder1" does not exist

