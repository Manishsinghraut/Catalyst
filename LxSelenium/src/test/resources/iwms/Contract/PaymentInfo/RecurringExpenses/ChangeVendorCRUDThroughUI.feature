Feature: Change vendor functionality was created so that user could swap out one vendor for another within multiple expense setups all at once and verify them in Contract> Payment Info> Recurring Expenses page (Jira Ref.AUTOMATION-564)

  Scenario Outline: I Change vendor functionality was created so that user could swap out one vendor for another within multiple expense setups all at once
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses"
    And I import following file name:
      | RecurringExpenseContract.xml |
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/GenerateRent"
    And I import following file name:
      | Basic_Generate_Rent.xml |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    And I switch to default frame
    And I click on the "Change Vendor" action panel button
    And I switch to default frame
    And I select the "<Field>" row of column "1" from grid "ChangeVendorDiv"
    And I set following fields value on editable page
      | name        | value     |
      | oldVendorID | <Vendor2> |
      | newVendorID | <Vendor1> |
    And I click on the "Change Vendor" button
    And I see the following note on the "pop up window"
      | New Vendor allocation record was created with new Vendor: Expense Group (Utilities), Expense Type(Water), Start Date ([CURRENT DATE]), End Date(12/31/2025), PercentagePercentage (100,00000%)          |
#      | New Vendor allocation record was created with new Vendor: Expense Group (Utilities), Expense Type(Water), Start Date ([CURRENT DATE]), End Date (12/31/2025), PercentagePercentage (100,00000%)          |
#       | New Vendor allocation record was created with new Vendor: Expense Group (Utilities), Expense Type(Water), Start Date ([CURRENT DATE]), End Date(12/31/2025), Percentage (100.00000%)                |
  #      | New Vendor allocation record was created with new Vendor: Expense Group (Utilities), Expense Type (Water), Start Date ([CURRENT DATE]), End Date (12/31/2025), Percentage: 100.00000%                    |
  #        New Vendor allocation record was created with new Vendor: Expense Group (Utilities), Expense Type (Water), Start Date (07/09/2015), End Date (12/31/2025), Percentage: 100.00000%
  #      | Existing Vendor allocation record was updated with new End Date: Expense Group (Utilities), Expense Type (Water), Start Date ([CURRENT DATE]), New End Date ([CURRENT END DATE]), Percentage :100.00000% |
      | Existing Vendor allocation record was updated with new End Date: Expense Group (Utilities), Expense Type(Water), Start Date (01/01/2010), New End Date([CURRENT END DATE]), Percentage (100.00000%) |
      | Vendor was successfully changed                                                                                                                                                                     |
    And I click on the "Close" button
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
#    And I switch to default frame
#    And I verify row from grid "BOGridExpenseVendorAllocation" having unique value "12/31/2025"
    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "<Vendor1>" under column header "Vendor"
      | name            | value          |
      | Vendor#         |                |
      | Payment Percent | 100.00000%     |
      | Address         | 8025 Ohio Dr   |
      | City            | Plano          |
      | State           | TX             |
      | Begin Date      | [CURRENT DATE] |
      | End Date        | 12/31/2025     |
    And I switch to default frame
#        And I verify row from grid "BOGridExpenseVendorAllocation" having unique value "12/31/2025"
    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "<Vendor2>" under column header "Vendor"
      | name            | value                |
      | Vendor#         |                      |
      | Payment Percent | 100.00000%           |
      | Address         | 5601 Democracy Drive |
      | City            | Plano                |
      | State           | TX                   |
      | Begin Date      | 03/01/2015           |
      | End Date        | [CURRENT END DATE]   |
    And I switch to default frame


  Examples:
    | Field     | Second Level Tab | Third Level Tab    | Entity Name                | Grid title                  | Grid ID | Vendor1  | Vendor2  |
    | Utilities | Payment Info     | Recurring Expenses | Recurring Expense Contract | Contract Expense Setup List | thisDiv | Vendor A | Vendor B |
