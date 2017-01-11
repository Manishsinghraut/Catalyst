@all
Feature: As an IWMS user I need to be able to Manage Client Dropdowns (Jira Ref : AUTOMATION-682)

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard

  Scenario: I want to add manage client drop downs of employers
    Given I click on the "Client Drop Downs" link
    Then I click on the "Add Custom Drop Down..."
    And I set following fields value on editable page
      | name                                     | value                 |
      | CustomCodeTableName                      | Selenium Custom table |
      | _CustomCodeField_CustomCodeFieldName_add | Selenium Custom       |
      | _CustomCodeField_Description_add         | Selenium Description  |
      | Description                              | Test Description      |
    And I click "add" link "from List For Drop Down"
    And I click on the "Add" button

  Scenario: I want to edit existing manage client drop downs of employers
    Given I click on the "Client Drop Downs" link
    Then I click on the "edit" row action of column "Selenium Custom table" of column "0" from grid "id" "BOGridCustomCodeTable"
    And I set following fields value on editable page
      | name                | value                  |
      | CustomCodeTableName | Selenium Custom Update |
    And I click on the "Update" button

  Scenario: I want to delete existing manage client drop downs of employers
    Given I click on the "Client Drop Downs" link
    Then I click on the "delete" row action of column "Selenium Custom Update" of column "0" from grid "id" "BOGridCustomCodeTable"
    And I click "Yes" button on "Delete Custom Drop Down" confirmation dialog
    And I verify the following message "Unable to delete, entry is currently in use by Custom Field."
    And I click on the "OK" button

  Scenario: I want to delete created manage client drop downs of employers
    Given I click on the "Client Drop Downs" link
    Then I click on the "Add Custom Drop Down..."
    And I set following fields value on editable page
      | name                | value                     |
      | CustomCodeTableName | New Selenium Custom table |
      | Description         | Test Description          |
    And I click on the "Add" button
    Then I click on the "delete" row action of column "New Selenium Custom table" of column "0" from grid "id" "BOGridCustomCodeTable"
    And I click "Yes" button on "Delete Custom Drop Down" confirmation dialog

