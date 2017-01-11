@all
Feature: Manage Add,Edit,Delete Contract type - (Jira ticket Ref : AUTOMATION-1033,AUTOMATION-1035,AUTOMATION-1034)


  Scenario: As an delete user I'm able to Add Contract type - (Jira ticket Ref : AUTOMATION-1033)
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I wait for the Loading text to disappear in grid
    And I click "Add Person..." button
    And I see the "Add Person" modal window
    And I set following fields value on editable page
      | name              | value              |
      | FirstName         | Contract           |
      | LastName          | type               |
      | CodeJobFunctionID | No Access          |
      | CodeJobTitleID    | No Access          |
      | Person_Phone      | 111-222-3333       |
      | EmployerID        | Lucernex           |
      | EMail1            | svcQA@lucernex.com |
    And I add following Contract type
      | Construction Manager |
    And I set following fields on editable page
      | name            | value |
      | ConvertToMember | false |
    Then I click on the "Add" button
    And I wait for modal window to close
#    And I see "Successfully added Contact" in the grid header
    And I click on "contacts" radio button
    And I click on the "edit" row action of column "Contract type" of column "0" from grid "BOGridBOListExtGridPerson"
    And I verify the following fields value on editable page
      | name              | value              |
      | FirstName         | Contract           |
      | LastName          | type               |
      | CodeJobFunctionID | No Access          |
      | CodeJobTitleID    | No Access          |
      | Person_Phone      | 111-222-3333       |
      | EmployerID        | Lucernex           |
      | EMail1            | svcQA@lucernex.com |
    Then I click on the "Cancel" button

  Scenario: As an delete user I'm able to Edit Contract type - (Jira ticket Ref : AUTOMATION-1035)
    Given I Login to IWMS using "EditAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I wait for the Loading text to disappear in grid
    And I click on "contacts" radio button
    And I search for member "Contract type"
    And I click on the "edit" row action of column "Contract type" of column "0" from grid "BOGridBOListExtGridPerson"
    And I add following Contract type
      | Broker |
    Then I click on the "Update" button
#    And I see "Successfully updated Contact" in the grid header
    And I click on "contacts" radio button
    And I click on the "edit" row action of column "Contract type" of column "0" from grid "BOGridBOListExtGridPerson"
    And I verify the following fields value on editable page
      | name                  | value              |
      | FirstName             | Contract           |
      | LastName              | type               |
      | CodeJobFunctionID     | No Access          |
      | CodeJobTitleID        | No Access          |
      | Person_Phone          | 111-222-3333       |
      | EmployerID            | Lucernex           |
      | EMail1                | svcQA@lucernex.com |
      | CodeContactTypeIDList | Broker             |
    And I verify the contract type selected value
      | name                  | value                |
      | CodeContactTypeIDList | Construction Manager |
      | CodeContactTypeIDList | Broker               |

    Then I click on the "Cancel" button

  Scenario: As an delete user I'm able to Delete contract - (Jira ticket Ref : AUTOMATION-1034)
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I click on "contacts" radio button
    And I click on the "delete" row action of column "Contract type" of column "0" from grid "BOGridBOListExtGridPerson"
    And I click "Yes" button on "Delete Person" confirmation dialog
    And I wait for modal window to close
#    And I see "Successfully deleted Contact" in the grid header
    And I verify row "Contract type" of column "Name" does not exist from grid "BOGridBOListExtGridPerson"
