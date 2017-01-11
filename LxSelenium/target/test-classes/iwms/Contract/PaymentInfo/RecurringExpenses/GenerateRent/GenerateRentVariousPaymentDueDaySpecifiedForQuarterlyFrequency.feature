@all
Feature: (JIRA - AUTOMATION-951)Generate Rent - Various Payment Due day specified for Quarterly Frequency

  Scenario Outline: As a delete user I Generate Rent - Various Payment Due day specified for Quarterly Frequency
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/GenerateRent/"
    And I import following file name:
      | PaymentFrequenciesQuarterly.xml |
    And I navigate to entity type "<Entity Type>" named "<Contract Name>"
    And I navigate to second level tab "<Second Level Tab>" and third level "Recurring Expenses" tab of entity "Contract"
    And I verify a row from grid "thisDiv" having unique value "Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Base Rent  |
      | Expense Category | Rent       |
      | Begin Date       | 01/01/2000 |
      | End Date         | 12/31/2020 |
      | Frequency        | Quarterly  |
      | Period Amount    | $3,333.33  |
      | Annual Amount    | $40,000.00 |

    And I verify the following fields value on editable page
      | name                         | value     |
      | ExpenseSetup_CodeFrequencyID | Quarterly |
      | ExpenseSetup_PaymentDueDay   |           |
    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium-Employer" under column header "Vendor"
      | name            | value             |
      | Vendor#         | 1234              |
      | Payment Percent | 100.00000%        |
      | Address         | 5601 Democracy Dr |
      | Begin Date      | 01/01/2000        |
      | End Date        | 12/31/2020        |
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "01/01/2000" under column header "Begin Date"
      | name           | value       |
      | End Date       | 12/31/2020  |
      | Payment Amount | $10,000.00  |
      | Annual Amount  | $120,000.00 |
      | Rate           | $1.33       |
      | First Payment  | $10,000.00  |
      | Last Payment   | $10,000.00  |


    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Interior   |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2000 |
      | End Date         | 12/31/2020 |
      | Frequency        | Quarterly  |
      | Period Amount    | $6,666.67  |
      | Annual Amount    | $80,000.00 |
    And I verify the following fields value on editable page
      | name                         | value     |
      | ExpenseSetup_CodeFrequencyID | Quarterly |
      | ExpenseSetup_PaymentDueDay   | 0         |

    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium-Employer" under column header "Vendor"
      | name            | value             |
      | Vendor#         | 1234              |
      | Payment Percent | 100.00000%        |
      | Address         | 5601 Democracy Dr |
      | Begin Date      | 01/01/2000        |
      | End Date        | 12/31/2020        |
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "01/01/2000" under column header "Begin Date"
      | name           | value       |
      | End Date       | 12/31/2020  |
      | Payment Amount | $20,000.00  |
      | Annual Amount  | $240,000.00 |
      | Rate           | $2.67       |
      | First Payment  | $20,000.00  |
      | Last Payment   | $20,000.00  |


    And I verify a row from grid "thisDiv" having unique value "Expense" under column header "Expense Group"
      | name             | value       |
      | Expense Type     | Interior    |
      | Expense Category | Expense     |
      | Begin Date       | 01/01/2000  |
      | End Date         | 12/31/2020  |
      | Frequency        | Quarterly   |
      | Period Amount    | $10,000.00  |
      | Annual Amount    | $120,000.00 |

    And I verify the following fields value on editable page
      | name                         | value     |
      | ExpenseSetup_CodeFrequencyID | Quarterly |
      | ExpenseSetup_PaymentDueDay   | 25        |
    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium-Employer" under column header "Vendor"
      | name            | value             |
      | Vendor#         | 1234              |
      | Payment Percent | 100.00000%        |
      | Address         | 5601 Democracy Dr |
      | Begin Date      | 01/01/2000        |
      | End Date        | 12/31/2020        |
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "01/01/2000" under column header "Begin Date"
      | name           | value       |
      | End Date       | 12/31/2020  |
      | Payment Amount | $30,000.00  |
      | Annual Amount  | $360,000.00 |
      | Rate           | $4.00       |
      | First Payment  | $30,000.00  |
      | Last Payment   | $30,000.00  |


    Then I click on the "Generate Rent" action panel button
    Then I set fields values on editable page
      | name         | value  |
      | yrToGenerate | <Year> |

    And I set following list fields values on editable page
      | name         | value             |
      | paymntClass  | <Generate Option> |
      | mnToGenerate | <Month>           |

    And I click "OK" button
    And I verify "1 Contract was processed." message appear after generating rent
    And I verify "3 Payment Transaction records were generated." message appear after generating rent
    And I click "OK" button

    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "Expense" under column header "Group"
      | name             | value             |
      | Effective Date   | 01/01/2015        |
      | Type             | Interior          |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | No                |
      | Total Amount     | $30,000.00        |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |

    And I verify the following fields value on editable page
      | name                       | value      |
      | PaymentTransaction_DueDate | 01/25/2015 |

    And I verify a row from grid "thisDiv" having unique value "Rent" under column header "Group"
      | name             | value             |
      | Effective Date   | 01/01/2015        |
      | Type             | Base Rent         |
      | Category         | Rent              |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | No                |
      | Total Amount     | $10,000.00        |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |

    And I verify the following fields value on editable page
      | name                       | value      |
      | PaymentTransaction_DueDate | 01/01/2015 |


    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Group"
      | name             | value             |
      | Effective Date   | 01/01/2015        |
      | Type             | Interior          |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | No                |
      | Total Amount     | $20,000.00        |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |

    And I verify the following fields value on editable page
      | name                       | value      |
      | PaymentTransaction_DueDate | 01/31/2015 |
      #IWMS-20992
#      | PaymentTransaction_DueDate | 03/31/2015 |


    Examples:
      | Generate Option | Year | Month   | Login User   | Login full username  | Entity Type | Contract Name                 | Second Level Tab |
      | Single Contract | 2015 | January | DeleteAccess | Delete Access Access | Contract    | Payment Frequencies Quarterly | Payment Info     |
#      | Single Contract | 2015 | January | LxSelenium | Selenium Tester     | Contract    | Payment Frequencies Quarterly | Payment Info     |