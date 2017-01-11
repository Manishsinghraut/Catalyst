Feature: The list of employers can be very long, so the 'In Use' checkbox was created to narrow down the list. When the checkbox is selected only vendors that have been used in that contract will appear. and verify them in Contract> Payment Info> Recurring Expenses page (Jir Ref: AUTOMATION-554)

  Scenario Outline: I 'In Use' checkbox was created to narrow down the list. When the checkbox is selected only vendors that have been used in that contract will appear. and verify them in Contract> Payment Info> Recurring Expenses page
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
    And I set following fields value on editable page
      | name        | value |
      | InUseFilter | false |
    And I click on the row of "Selenium-Employer" of column "1" from grid a "editBOGrid"
#    And I select specific value "Selenium-Employer" under header "Name" from grid "^editBOGrid"
#      | name    | value |
#      | Vendor# | 1234  |
    And I set following fields value on editable page
      | name                                      | value |
      | ExpenseVendorAllocation_PaymentPercentage | 40    |
    And I click on the "Add" button

    Examples:
      | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
      | Utilities | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |

  Scenario Outline: Another 'In Use' checkbox was created to narrow down the list. When the checkbox is selected only vendors that have been used in that contract will appear. and verify them in Contract> Payment Info> Recurring Expenses page
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration"
    And I import following file name:
      | ImportEmployer.xlsx |
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
    And I set following fields value on editable page
      | name        | value |
      | InUseFilter | false |
    And I click on the row of "Selenium Employer Inc." of column "1" from grid a "editBOGrid"
##    And I click on the row of "Selenium Employer Inc." of column "1" from grid "Employer"
#    And I select specific value "Selenium Employer Inc." under header "Name" from grid "^editBOGrid"
#      | name    | value  |
#      | Vendor# | 200012 |
    And I set following fields value on editable page
      | name                                      | value |
      | ExpenseVendorAllocation_PaymentPercentage | 60    |
    And I click on the "Add" button

    Examples:
      | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID |
      | Utilities | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv |