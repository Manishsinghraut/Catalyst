@all
Feature: (Jira Ref: AUTOMATION-405) I create/update contacts through spreadsheet import

  Background:
    #Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario Outline: I create/update contacts through spreadsheet import
    Given I login to IWMS using LxAdmin credentials
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following file name:
      | Create_Contact.xls |
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I select contract radio button grid
    And I verify newly created member "<Contact Name>"
    And I click "edit" button of the member "<Contact Name>"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/Create_Contact.xls"
    Then I verify all fields values on editable page comparing with "<Row>" th row of spreadsheet
      | name                    | value                 |
      | EmployerID              | Person.EmployerID     |
      | StreetAddress1          | Person.StreetAddress1 |
      | StreetAddress2          | Person.StreetAddress2 |
      | City                    | Person.City           |
      | IStateProvinceCountryID | Person.State          |
      | Description             | Person.Description    |
    Then I verify attribute value on editable pop up by reading data from spread sheet row "<Row>"
      | name               | value                     |
      | UseEmployerAddress | Person.UseEmployerAddress |
    And I click on the "Cancel" button
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following file name:
      | Update_Contact.xls |
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I select contract radio button grid
    And I click "edit" button of the member "<Contact Name>"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/Update_Contact.xls"
    Then I verify all fields values on editable page comparing with "<Row>" th row of spreadsheet
      | name                    | value                     |
      | EmployerID              | Person.EmployerID         |
      | StreetAddress1          | Person.StreetAddress1     |
      | StreetAddress2          | Person.StreetAddress2     |
      | City                    | Person.City               |
      | IStateProvinceCountryID | Person.State              |
      | Description             | Person.Description        |
      | UseEmployerAddress      | Person.UseEmployerAddress |
    Then I verify attribute value on editable pop up by reading data from spread sheet row "<Row>"
      | name               | value                     |
      | UseEmployerAddress | Person.UseEmployerAddress |

  Examples:
    | Contact Name | Row |
    | Contact B    | 6   |
