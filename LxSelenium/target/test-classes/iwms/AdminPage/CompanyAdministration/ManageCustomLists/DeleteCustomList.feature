@all
Feature: To ensure that users can delete a custom list that has NOT been used (Jira Ref. AUTOMATION-523)

  Scenario Outline: As a delete user I can able to delete a custom list that has NOT been used
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/"
    And I import following files:
      | Delete_Custom_List.xml |
    And I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    And I search member "<Form Name>"
    And I click "delete" row action in the non frame grid "<Form Grid ID>" having the following header and cell values
      | name | value        |
      | Name | Delete Forms |
    And I wait for "Delete Form Type" modal window to open in non frame page
    And I click on the "Yes" button
    And I wait for modal window to close
    Then I see "Successfully deleted Form Type" in the grid header
    And I search member "<Form Name>"
    And I verify row in grid "<Form Grid ID>" having value "<Form Name>" under column header "Name" not present

    And I navigate to the admin dashboard
    And I click on the "Manage Custom Lists" link
    And I search member "<Custom List Name>"
    And I click "delete" row action in the non frame grid "<CL Grid ID>" having the following header and cell values
      | name | value              |
      | Name | <Custom List Name> |
    And I wait for "Delete item" modal window to open in non frame page
    And I click on the "Yes" button
    And I wait for modal window to close
    Then I see "Successfully deleted item" in the grid header
    And I search member "<Custom List Name>"
    Then I verify row in grid "<CL Grid ID>" having value "<Custom List Name>" under column header "Name" not present


    Examples:
      | Custom List Name                    | Login User   | Login full username  | CL Grid ID                      | Form Grid ID        | Form Name    |
      | Delete Custom List - AUTOMATION-523 | DeleteAccess | Delete Access Access | BOGridReportGroupDataCustomList | BOGridCodeIssueType | Delete Forms |
