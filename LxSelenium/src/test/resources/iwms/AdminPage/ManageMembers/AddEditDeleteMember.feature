@all
Feature: Manage Members Add,Edit and Delete - (Jira ticket Ref : AUTOMATION-1030,AUTOMATION-1031,AUTOMATION-1032)

  Scenario: As an delete user I'm able to Add Member - (Jira ticket Ref : AUTOMATION-1031)
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I wait for the Loading text to disappear in grid
    And I click "Add Person..." button
    And I see the "Add Person" modal window
    And I set these field values on editable page
      | name                | value              |
      | FirstName           | Selenium           |
      | LastName            | Webdriver          |
#      | CodeJobFunctionID          | Construction - Project Manager |
#      | CodeJobTitleID             | Construction Manager           |
      | CodeJobFunctionID   | No Access          |
      | CodeJobTitleID      | No Access          |
      | Person_Phone        | 111-222-3333       |
      | EmployerID          | Lucernex           |
      | EMail1              | svcQA@lucernex.com |
      | LoginName           | z_Delete           |
      | Password            | RegressionTest     |
      | CodeUserClassID     | Delete Access      |
      | CodeLockOutReasonID | Login enabled      |
    And I add following Contract type
      | Construction Manager |
    Then I click on the "Add" button
#    And I see "Successfully added Member" in the grid header
    And I search for member "Selenium Webdriver"
    And I click on the "login as member" row action of column "Selenium Webdriver" of column "0" from grid "BOGridBOListExtGridPerson"
    And I click "Login" button
    And I verify the following message "Failed to login The EULA has not been accepted."
    And I click "Close" button
    And I logout

  Scenario: Login as new member
    Given I Login to IWMS using "z_Delete" access credentials expecting EULA page
    Then Accept Eula and move on
    And I logout

  Scenario: As an delete user I'm able to Edit Member - (Jira ticket Ref : AUTOMATION-1032)
    Given I Login to IWMS using "EditAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I wait for the Loading text to disappear in grid
    And I search for member "Selenium Webdriver"
    And I click on the "edit" row action of column "Selenium Webdriver" of column "0" from grid "BOGridBOListExtGridPerson"
    And I set following fields value on editable page
      | name              | value         |
      | CodeJobFunctionID | Delete Access |
    Then I click on the "Update" button
#    And I see "Successfully updated Member" in the grid header
    And I search for member "Selenium Webdriver"
    And I click on the "edit" row action of column "Selenium Webdriver" of column "0" from grid "BOGridBOListExtGridPerson"
    And I verify the following fields value on editable page
      | name              | value         |
      | CodeJobFunctionID | Delete Access |
    Then I click on the "Cancel" button


  Scenario: As an delete user I'm able to Add Member
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I wait for the Loading text to disappear in grid
    And I click "Add Person..." button
    And I see the "Add Person" modal window
    And I set following fields value on editable page
      | name                | value              |
      | FirstName           | Selenium           |
      | LastName            | Delete             |
      | CodeJobFunctionID   | No Access          |
      | Person_Phone        | 111-222-3333       |
      | CodeJobTitleID      | No Access          |
      | EmployerID          | Lucernex           |
      | EMail1              | svcQA@lucernex.com |
      | LoginName           | d_Delete           |
      | Password            | RegressionTest     |
      | CodeUserClassID     | Delete Access      |
      | CodeLockOutReasonID | Login enabled      |
    And I add following Contract type
      | Construction Manager |
    Then I click on the "Add" button
    And I wait for modal window to close
#    And I see "Successfully added Member" in the grid header


  Scenario: As an delete user I'm able to Delete Member - (Jira ticket Ref : AUTOMATION-1033)
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I search for member "Selenium Delete"
    And I click on the "delete" row action of column "Selenium Delete" of column "0" from grid "BOGridBOListExtGridPerson"
    And I click "Yes" button on "Delete Person" confirmation dialog
    And I wait for modal window to close
#    And I see "Successfully deleted Member" in the grid header