@all
Feature: As an IWMS user I need to be able to manage IWMS member records.

  Background: As an IWMS user I need to be able to manage IWMS member records.
#    Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "LxSelenium" access credentials
    Then I check previous user login "Selenium Tester" and continue if user "LxSelenium" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I wait for the Loading text to disappear in grid

  Scenario: I want to view the list of members
    Given I see these tabs:
      | Manage Members/Contacts |
      | Activate/Deactivate     |
    And I see these grid columns:
      | Name         |
      | Member?      |
      | Job Title    |
      | Job Function |
      | Email        |
      | Employer     |
      | User Class   |
      | Actions      |
    And I see the grid "id" "BOGridBOListExtGridPerson" contains records of type "Person"
    And I see some rows with data in the grid
    And I see these row actions:
      | edit            |
      | delete          |
      | login as member |
    And I see page "1" in the grid's pagination controls
    And I see the number of pages in the grid's pagination controls
    And I wait for the Loading text to disappear in grid
    When I click on the "edit" row action on row "1"
    Then I see the "Edit Person" modal window
    And I click on the "Cancel" button
    And I wait for modal window to close

  Scenario: I want to create a new IWMS member
    Given I click the Add button
    And I see the "Add Person" modal window
    And I set these field values on editable page
      | name                       | value                     |
      | FirstName                  | AAAContact                |
      | LastName                   | Cucumber                  |
      | CodeJobFunctionID          | Lx Administrator          |
      | CodeJobTitleID             | Lx Administrator          |
      | Person_Phone               | 111-222-3333              |
      | EmployerID                 | Lucernex                  |
      | EMail1                     | aaa.cucumber@lucernex.com |
      | LoginName                  | aaa12.cucumber            |
      | Password                   | secret                    |
      | CodeUserClassID            | Team Member               |
      | CodeLockOutReasonID        | Login enabled             |
      | availCodeContactTypeIDList | Broker                    |
    And I add Contact Type on the Form
    When I click on the "Add" button
    And I wait for modal window to close
    And I see "Successfully added Member" in the grid header

  Scenario: I want to delete new IWMS member created
#    And I click "delete" row action for the row that has "AAAContact Cucumber" in column "Name"
    And I click "delete" action for the row that has "AAAContact Cucumber" in column "Name"
    And I click "Yes" button on "Delete Person" confirmation dialog
    And I wait for modal window to close
    And I see "Successfully deleted Member" in the grid header

  Scenario: I want to attempt to delete Lx Administrator
#    Given I search for "Lx Administrator"
#    Given I click "delete" row action for the row that has "Lx Administrator" in column "Name"
    Given I click "delete" action for the row that has "Lx Administrator" in column "Name"
    And I click "Yes" button on "Delete Person" confirmation dialog
    Then I see the error message "Unable to delete, entry is currently in use by" in the Lx Modal Window

     #support for add Contact Type - Find a better way to handle this, right now using CSS but there are two buttons with same css. Xpath is not reliable ass it changes from page to page. - Rupi