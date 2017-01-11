@all @smoke @smoke5
Feature: (Jira Ticket : AUTOMATION-1061) Change Password Via Wizard

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: when I navigate to Tools page I can add new Items from the set up wizard
    When I navigate to "Tools,Setup Wizards"
    Then I see the "Setup Wizard" modal window
    And I delete incomplete setup wizard if exist
    And I select "<Item>" from the list
    And I select "<Portfolio>" from the Program List
    Then I click on the "Next" button
    And I see the "<Grid Header>" modal window
    And I set following fields value on editable page
      | name                                  | value                                               |
      | ProjectEntity_ProjectEntityName       | <Name>                                              |
      | ProjectEntity_RegionID                | Central (Central region - preOpen) Frisco(Pre-Open) |
      | ProjectEntity_CodeMarketAreaID        | Legacy Market Area                                  |
      | ProjectEntity_IStateProvinceCountryID | TX                                                  |
      | ProjectEntity_CountryID               | United States                                       |


    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
    And I set fields values on editable page
      | name             | value             |
      | entityTemplateID | <Folder Template> |
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
    And I click on Setup Members button
    And I click "Add Person..." button
#    And I see the "Add Person" modal window
    And I set following fields value on editable page
      | name              | value              |
      | FirstName         | SeleniumUser       |
      | LastName          | WebDriver          |
      | CodeJobFunctionID | No Access          |
      | CodeJobTitleID    | No Access          |
      | Person_Phone      | 111-222-3333       |
      | EmployerID        | Lucernex           |
      | EMail1            | svcQA@lucernex.com |
    And I add following Contract type
      | Broker |
    And I set following fields value on editable page
      | name            | value         |
      | LoginName       | WebDriverUser |
      | Password        | SeleniumUser  |
      | Language        | English       |
      | CodeUserClassID | Broker        |
    And I click "Add" button
    And I verify the following error message "Failed to validate password: The password should not contain user information"
    And I click "Cancel" button
    And I click on the "Finish Managing Members" button
    And I click on the "Next" button
    And I click on the "Finish" button

  Examples:
    | Item | Grid Header       | Portfolio         | Name                     | Setup Wizard      | Prototype                    | Folder Template          |
    | Site | Site Setup Wizard | Lucernex-Selenium | ChangePasswordViaWizard4 | Site Setup Wizard | Selenium Webdriver Prototype | Selenium Folder Template |
