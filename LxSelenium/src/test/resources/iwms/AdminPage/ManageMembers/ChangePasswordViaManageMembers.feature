@all
Feature:Change Password Via Manage Members - (Jira ticket Ref : AUTOMATION-1060)

  Scenario: As an delete user I'm able to Change Password Via Manage Members
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I wait for the Loading text to disappear in grid
    And I click "Add Person..." button
    And I see the "Add Person" modal window
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
    Then I click on the "Add" button
    And I verify the following error message "Failed to validate password: The password should not contain user information"
    Then I click on the "Cancel" button
