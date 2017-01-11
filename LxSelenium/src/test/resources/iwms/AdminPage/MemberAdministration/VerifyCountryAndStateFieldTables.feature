@all @smoke @smoke1
Feature: As an IWMS user I need to be able to verify Country and State field tables (Jira Ref : AUTOMATION-680)

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard

  Scenario Outline: I want to verify country and state drop down list of employers
    Given I click on the "Manage Employers" link
    Then I see the "Employer" grid
    And I click the Add button
    And I see the "Add Employer" modal window
    And I set following fields value on editable page
      | name                             | value     |
      | Employer_CountryID               | <country> |
      | Employer_IStateProvinceCountryID | <state>   |
    And I verify the following fields value on editable page
      | name                             | value     |
      | Employer_CountryID               | <country> |
      | Employer_IStateProvinceCountryID | <state>   |
    Then I click on the "Cancel" button

    Examples:
      | country   | state     |
      | Australia | ACT       |
#      | Australia | Australia |
      | Australia | NSW       |
      | Australia | NT        |
      | Australia | QLD       |
      | Australia | SA        |
      | Australia | TAS       |
      | Australia | VIC       |
      | Australia | WA        |


  Scenario: I want to verify new employer should be created with all the information
    Given I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    Then I import following file name:
      | VerifyCountryAndStateFieldTables.xls |
    And I click on the "Manage Employers" link
    When I click on the "edit" row action of column "SaloniK" of column "1" from grid "id" "BOGridLX_Grid_Employer"
    Then I verify the following fields value on editable page
      | name                                    | value  |
      | CompanyType                             | Vendor |
      | _checkbox_Employer_SelfPerform          | true   |
      | _checkbox_Employer_HasAfterHoursSupport | true   |
      | _checkbox_Employer_IsPreferredVendor    | true   |
      | _checkbox_Employer_IsMinorityOwned      | true   |
      | _checkbox_Employer_IsGLBTOwned          | true   |
      | _checkbox_Employer_IsFemaleOwned        | true   |
      | _checkbox_Employer_IsSBAProgram         | true   |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/VerifyCountryAndStateFieldTables.xls"
    Then I verify all fields values on editable page comparing with "6" th row of spreadsheet
      | name                             | value                          |
      | Employer_EmployerName            | Employer.EmployerName          |
      | Employer_StreetAddress1          | Employer.StreetAddress1        |
      | Employer_City                    | Employer.City                  |
      | Employer_IStateProvinceCountryID | Employer.State                 |
      | Employer_PostalCode              | Employer.PostalCode            |
      | Employer_CountryID               | Employer.Country               |
      | Employer_Phone                   | Employer.Phone                 |
#      | Employer_Fax                     | Employer.Fax                   |
      | Employer_Department              | Employer.Department            |
      | Employer_MobileNumber            | Employer.MobileNumber          |
      | Employer_EMail1                  | Employer.EMail1                |
      | Employer_WebSite                 | Employer.WebSite               |
      | Employer_NameAKA                 | Employer.NameAKA               |
      | Employer_Notes                   | Employer.Notes                 |
      | Employer_APVendorNumber          | Employer.APVendorNumber        |
      | Employer_FederalTaxID            | Employer.FederalTaxID          |
      | Employer_BankRoutingNumber       | Employer.BankRoutingNumber     |
      | Employer_BankAccountNumber       | Employer.BankAccountNumber     |
      | Employer_HourlyRate              | Employer.HourlyRate            |
      | Employer_TravelRate              | Employer.TravelRate            |
      | Employer_AfterHoursRate          | Employer.AfterHoursRate        |
      | Employer_CodeCoverageID          | Employer.CodeCoverageID        |
      | Employer_NumberOfStates          | Employer.NumberOfStates        |
      | Employer_NumberOfTechnicians     | Employer.NumberOfTechnicians   |
      | Employer_NumberOfServiceTrucks   | Employer.NumberOfServiceTrucks |
      | Employer_BusinessHours           | Employer.BusinessHours         |
      | Employer_AfterHoursContact       | Employer.AfterHoursContact     |
      | Employer_CodeVendorGradeID       | Employer.CodeVendorGradeID     |
    And I click on the "Cancel" button