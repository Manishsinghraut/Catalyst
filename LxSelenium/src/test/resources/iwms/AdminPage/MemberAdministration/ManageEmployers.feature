@all
Feature: As a IWMS user I need to be able to manage employers.

  Background:
#    Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "LxSelenium" access credentials
    Then I check previous user login "Selenium Tester" and continue if user "LxSelenium" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Employers" link

  Scenario: I want to view the list of employers
    Given I see the "Employer" grid
    And I see these grid columns:
      | Company Type |
      | Name         |
      | Address      |
      | City         |
      | State        |
      | Vendor#      |
      | Actions      |
    And I see the grid contains records of type "Employer"
    And I see some rows with data in the grid
    And I see these row actions:
      | edit   |
      | delete |
    And I see page "1" in the grid's pagination controls
    And I see the number of pages in the grid's pagination controls
    When I click on the "edit" row action on row "1"
    Then I see the "Edit Employer" modal window
    And I click on the "Cancel" button

  Scenario: I want to create a new IWMS employer
    And I click the Add button
    And I see the "Add Employer" modal window
    And I set these field values on editable page
      | name                             | value        |
      | CompanyType                      | Other        |
      | Employer_EmployerName            | AAA Cucumber |
      | Employer_StreetAddress1          | Some Address |
      | Employer_City                    | Plano        |
      | Employer_IStateProvinceCountryID | TX           |
      | Employer_PostalCode              | 75024        |
      | availCodeContactTypeIDList       | Employer     |
    And I add Contact Type on the Form
    When I click on the "Add" button
    And I see "Successfully added Employer" in the grid header
    And I click "delete" row action for the row that has "AAA Cucumber" in column "Name"
    And I click "Yes" button on "Delete Employer" confirmation dialog
    And I see "Successfully deleted Employer" in the grid header
