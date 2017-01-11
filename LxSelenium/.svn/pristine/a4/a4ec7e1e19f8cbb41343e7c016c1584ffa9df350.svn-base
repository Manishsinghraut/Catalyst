@all @smoke @smoke3
Feature: Add Multiple Expense Vendor Allocations and verify them in Contract> Payment Info> Recurring Expenses page (Ref : Jira Ticket No : AUTOMATION-561)

  Scenario Outline: Add Multiple Expense Vendor Allocations - Selenium Vendor A-561
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses"
    And I import following file name:
      | RecurringExpenseContract.xml |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    Then I click on "Add Expense Vendor Allocation..." grid button
    And I switch to default frame
    And I Click the "..." next to the "ExpenseVendorAllocation" dropdown
#    And I click on the " Add Employer... "
    #Space is removed from the button name
    And I click on the "Add Employer..."
    And I set following fields value on editable page
      | name                             | value                |
      | CompanyType                      | Vendor               |
      | Employer_EmployerName            | <Vendor>             |
      | Employer_StreetAddress1          | 1901 Democracy Drive |
      | Employer_City                    | Palno                |
      | Employer_IStateProvinceCountryID | TX                   |
      | Employer_PostalCode              | 75024                |
      | Employer_CountryID               | United States        |
      | Employer_Phone                   | 9786397863           |
      | Employer_Notes                   | <Notes>              |
      | Employer_APVendorNumber          | 12345                |
      | Employer_FederalTaxID            | 909090               |
      | Employer_BankRoutingNumber       | 98989                |
      | Employer_BankAccountNumber       | abc 123              |
      | Employer_HourlyRate              | 65                   |
      | Employer_TravelRate              | 85                   |
      | Employer_CodeCoverageID          | Full                 |
      | Employer_NumberOfStates          | 30                   |
      | Employer_NumberOfTechnicians     | 100                  |
      | Employer_NumberOfServiceTrucks   | 40                   |
      | Employer_BusinessHours           | Test hours           |
      | Employer_AfterHoursContact       | Test Contact         |
      | Employer_CodeVendorGradeID       | Excellent            |
    And I set fields values on editable page
      | name                       | value             |
      | availCodeContactTypeIDList | Equipment Manager |
    And I click on ">>" Add Assignee button
    And I click on the "Add" button to add employer
    And I wait for the Loading text to disappear in grid
    And I set following fields value on editable page
      | name                                      | value      |
      | ExpenseVendorAllocation_PaymentPercentage | 10         |
      | ExpenseVendorAllocation_BeginDate         | 01/01/2000 |
      | ExpenseVendorAllocation_EndDate           | 12/31/2020 |
    And I click on the "Add" button
    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "<Vendor>" under column header "Vendor"
      | name            | value                |
      | Vendor#         | 12345                |
      | Payment Percent | 10                   |
      | Address         | 1901 Democracy Drive |
      | City            | Palno                |
      | State           | TX                   |
      | Begin Date      | 01/01/2000           |
      | End Date        | 12/31/2020           |
#      | Notes           | <Notes>              |
#      | Actions         | edit                 |
    And I switch to default frame
    And I logout
  Examples:
    | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID | Vendor                | Notes                  |
    | Base Rent | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv | Selenium Vendor A-561 | Selenium Vendor1 notes |

  Scenario Outline: Add Multiple Expense Vendor Allocations - Selenium Vendor B-561
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses"
    And I import following file name:
      | RecurringExpenseContract.xml |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    Then I click on "Add Expense Vendor Allocation..." grid button
    And I switch to default frame
    And I Click the "..." next to the "ExpenseVendorAllocation" dropdown
#    And I click on the " Add Employer... "
  #Space is removed from the button name
    And I click on the "Add Employer..."
    And I set following fields value on editable page
      | name                             | value                |
      | CompanyType                      | Vendor               |
      | Employer_EmployerName            | <Vendor>             |
      | Employer_StreetAddress1          | 1901 Democracy Drive |
      | Employer_City                    | Palno                |
      | Employer_IStateProvinceCountryID | TX                   |
      | Employer_PostalCode              | 75024                |
      | Employer_CountryID               | United States        |
      | Employer_Phone                   | 9786397863           |
      | Employer_Notes                   | <Notes>              |
      | Employer_APVendorNumber          | 12345                |
      | Employer_FederalTaxID            | 909090               |
      | Employer_BankRoutingNumber       | 98989                |
      | Employer_BankAccountNumber       | abc 123              |
      | Employer_HourlyRate              | 65                   |
      | Employer_TravelRate              | 85                   |
      | Employer_CodeCoverageID          | Full                 |
      | Employer_NumberOfStates          | 30                   |
      | Employer_NumberOfTechnicians     | 100                  |
      | Employer_NumberOfServiceTrucks   | 40                   |
      | Employer_BusinessHours           | Test hours           |
      | Employer_AfterHoursContact       | Test Contact         |
      | Employer_CodeVendorGradeID       | Excellent            |
    And I set fields values on editable page
      | name                       | value             |
      | availCodeContactTypeIDList | Equipment Manager |
    And I click on ">>" Add Assignee button
    And I click on the "Add" button to add employer
    And I wait for the Loading text to disappear in grid
    And I set following fields value on editable page
      | name                                      | value      |
      | ExpenseVendorAllocation_PaymentPercentage | 10         |
      | ExpenseVendorAllocation_BeginDate         | 01/01/2000 |
      | ExpenseVendorAllocation_EndDate           | 12/31/2020 |
#    And I click on the "Add" button
    And I click "Add" button
    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "<Vendor>" under column header "Vendor"
      | name            | value                |
      | Vendor#         | 12345                |
      | Payment Percent | 10                   |
      | Address         | 1901 Democracy Drive |
      | City            | Palno                |
      | State           | TX                   |
      | Begin Date      | 01/01/2000           |
      | End Date        | 12/31/2020           |
#      | Notes           | <Notes>              |
#      | Actions         | edit                 |
    And I switch to default frame
    And I logout
  Examples:
    | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID | Vendor                | Notes                  |
    | Base Rent | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv | Selenium Vendor B-561 | Selenium Vendor2 notes |