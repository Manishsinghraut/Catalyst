@all @smoke @smoke1
Feature: Add and Edit Budget Type - Smoke Test (JIRA Ref. : AUTOMATION-798)

  Scenario Outline: Add and Edit Budget Type
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I wait for the Loading text to disappear in grid
    And I click on "Add Budget Type..." button in grid
    And I wait for the loading text to be disappear
    And I set fields values on editable page
      | name                                 | value         |
      | BudgetColumnTypeName                 | <Budget Type> |
      | _checkbox_AllowMultiSelect           | true          |
      | _checkbox_IsValidForPortfolio        | true          |
      | _checkbox_IsValidForCapProgram       | true          |
      | _checkbox_IsValidForPrototype        | true          |
      | _checkbox_IsValidForLocation         | true          |
      | _checkbox_IsValidForParcel           | true          |
      | _checkbox_IsValidForPotentialProject | true          |
      | _checkbox_IsValidForOpenProject      | true          |
      | _checkbox_IsValidForFacility         | true          |
      | _checkbox_IsValidForCapProject       | true          |
      | _checkbox_IsValidForContract         | true          |
    And I click on the "Add" button
    And I wait for the loading text to be disappear
    And I verify the following message "Successfully added Budget Type"
    And I click on the "edit" row action of column "<Budget Type>" of column "1" from grid "BOGridBudgetColumnType"
    And I click on the "Update" button
    And I wait for the loading text to be disappear
    And I verify the following message "Successfully updated Budget Type"

  Examples:
    | Budget Type   | Login User   | Login full username  |
    | BudgetType009 | DeleteAccess | Delete Access Access |