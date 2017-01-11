@all
Feature: Manage Members Grid - (Jira ticket Ref : AUTOMATION-1037)

  Scenario: As an delete user I'm able to verify Manage Members Grid - (Jira ticket Ref : AUTOMATION-1037)
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I wait for the Loading text to disappear in grid
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
#    And I search by "Name" "Selenium Webdriver"
    And I search by "Name" "Delete Access Access"
    And I click "edit" row action in the non frame grid "BOGridBOListExtGridPerson" having the following header and cell values
      | name | value                |
      | Name | Delete Access Access |
    And I wait for "Edit Person  ***Required fields in red" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name      | value         |
      | FirstName | Delete Access |
      | LastName  | Access        |
    And I click on the "Cancel" button
    And I wait for "Edit Person  ***Required fields in red" modal window to close


    And I search by "Job Function" "System Administrator"
    And I click "edit" row action in the non frame grid "BOGridBOListExtGridPerson" having the following header and cell values
      | name         | value                |
      | Name         | Delete Access Access |
      | Job Function | System Administrator |
    And I wait for "Edit Person  ***Required fields in red" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name              | value                |
      | CodeJobFunctionID | System Administrator |
    And I click on the "Cancel" button
    And I wait for "Edit Person  ***Required fields in red" modal window to close

    And I search by "Job Title" "No Access"
    And I click "edit" row action in the non frame grid "BOGridBOListExtGridPerson" having the following header and cell values
      | name      | value     |
      | Name      | No Access |
      | Job Title | No Access |
    And I wait for "Edit Person  ***Required fields in red" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name           | value     |
      | CodeJobTitleID | No Access |
    And I click on the "Cancel" button
    And I wait for "Edit Person  ***Required fields in red" modal window to close

    And I search by "Email" "svcQA@lucernex.com"
    And I click "edit" row action in the non frame grid "BOGridBOListExtGridPerson" having the following header and cell values
      | name  | value                |
      | Name  | Delete Access Access |
      | Email | svcQA@lucernex.com   |
    And I wait for "Edit Person  ***Required fields in red" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name   | value              |
      | EMail1 | svcQA@lucernex.com |
    And I click on the "Cancel" button
    And I wait for "Edit Person  ***Required fields in red" modal window to close

    And I search by "Employer" "Lucernex"
    And I click "edit" row action in the non frame grid "BOGridBOListExtGridPerson" having the following header and cell values
      | name     | value              |
      | Name     | Edit Access Access |
      | Employer | Lucernex           |
    And I wait for "Edit Person  ***Required fields in red" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name       | value    |
      | EmployerID | Lucernex |
    And I click on the "Cancel" button
    And I wait for "Edit Person  ***Required fields in red" modal window to close

    And I search by "User Class" "Delete Access"
    And I click "edit" row action in the non frame grid "BOGridBOListExtGridPerson" having the following header and cell values
      | name       | value         |
      | Name       | Delete Access |
      | User Class | Delete Access |
    And I wait for "Edit Person  ***Required fields in red" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name            | value         |
      | CodeUserClassID | Delete Access |
    And I click on the "Cancel" button
    And I wait for "Edit Person  ***Required fields in red" modal window to close

    And I search by "Member?" "Yes"
    And I click "edit" row action in the non frame grid "BOGridBOListExtGridPerson" having the following header and cell values
      | name | value                |
      | Name | Delete Access Access |
    And I wait for "Edit Person  ***Required fields in red" modal window to open in non frame page
    And I click on the "Cancel" button
    And I wait for "Edit Person  ***Required fields in red" modal window to close
