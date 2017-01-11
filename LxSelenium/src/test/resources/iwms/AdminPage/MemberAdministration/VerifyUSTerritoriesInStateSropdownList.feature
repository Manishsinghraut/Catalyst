@all
Feature: As an IWMS user I need to be able to verify US territories in state dropdown list (Jira Ref : AUTOMATION-679)

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard

  Scenario Outline: I want to verify US territories in state dropdown list of employers
    Given I click on the "Manage Employers" link
    Then I see the "Employer" grid
    And I click the Add button
    And I see the "Add Employer" modal window
    And I set following fields value on editable page
      | name                             | value   |
      | Employer_IStateProvinceCountryID | <state> |
    And I verify the following fields value on editable page
      | name                             | value   |
      | Employer_IStateProvinceCountryID | <state> |
    Then I click on the "Cancel" button

  Examples:
    | state          |
    | Guam           |
    | Puerto Rico    |
    | Virgin Islands |

  Scenario: I want to verify new employer should be created with all the information
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    Then I import following file name:
      | VerifyUSTerritoriesInStateDropdownList.xlsx |
    And I click on the "Manage Employers" link
    Given I click on the "edit" row action of column "Jimmy" of column "1" from grid "id" "BOGridLX_Grid_Employer"
    And I verify the following fields value on editable page
      | name        | value |
      | CompanyType | Other |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/VerifyUSTerritoriesInStateDropdownList.xlsx"
    When I verify all fields values on editable page comparing with "7" th row of spreadsheet
      | name                             | value                   |
      | Employer_EmployerName            | Employer.EmployerName   |
      | Employer_StreetAddress1          | Employer.StreetAddress1 |
      | Employer_City                    | Employer.City           |
      | Employer_IStateProvinceCountryID | Employer.State          |
      | Employer_PostalCode              | Employer.PostalCode     |
      | Employer_CountryID               | Employer.Country        |
      | Employer_Phone                   | Employer.Phone          |
    And I click on the "Cancel" button
    Given I click on the "edit" row action of column "Joy" of column "1" from grid "id" "BOGridLX_Grid_Employer"
    Then I verify the following fields value on editable page
      | name        | value  |
      | CompanyType | Vendor |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/VerifyUSTerritoriesInStateDropdownList.xlsx"
    When I verify all fields values on editable page comparing with "6" th row of spreadsheet
      | name                             | value                   |
      | Employer_EmployerName            | Employer.EmployerName   |
      | Employer_StreetAddress1          | Employer.StreetAddress1 |
      | Employer_City                    | Employer.City           |
      | Employer_IStateProvinceCountryID | Employer.State          |
      | Employer_PostalCode              | Employer.PostalCode     |
      | Employer_CountryID               | Employer.Country        |
      | Employer_Phone                   | Employer.Phone          |
    Then I click on the "Cancel" button