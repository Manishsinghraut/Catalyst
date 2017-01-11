Feature: Expense Setup Spreadsheet - Create/Update (Jira Ref.AUTOMATION-409)

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: I create Expense Setup and verify them in  Contract > Payment Info > Recurring Expenses page
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses"
    And I import following file name:
      | Create_ExpenseSetup.xlsx |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "Utilities" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Water      |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2000 |
      | End Date         | 12/31/2015 |
      | Frequency        | Monthly    |
      | Period Amount    |            |
      | Annual Amount    |            |
    And I verify the following fields value on editable page
      | name                                 | value                            |
      | ExpenseSetup_CodeExpenseGroupID      | Utilities                        |
      | ExpenseSetup_CodeExpenseTypeID       | Water                            |
      | ExpenseSetup_CodeExpenseCategoryID   | Expense                          |
      | ExpenseSetup_CodeFrequencyID         | Monthly                          |
      | ExpenseSetup_Description             | This will be created upon import |
      | ExpenseSetup_CodeCurrencyTypeID      | USD                              |
      | ExpenseSetup_RentableArea            | 5,000                            |
      | ExpenseSetup_CodeBuildingAreaUnitID  | Square Feet                      |
      | ExpenseSetup_ProRataShareRate        | 25.00000%                        |
      | ExpenseSetup_RemitMessage            | Pay the water bill               |
      | ExpenseSetup_InternalReferenceNumber | 999999                           |
      | ExpenseSetup_CodePaymentMethodID     | Check                            |
      | ExpenseSetup_PaymentDueDay           | 12                               |

    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium-Employer" under column header "Vendor"
      | name            | value                            |
      | Vendor          | Selenium-Employer                |
      | Vendor#         | 1234                             |
      | Payment Percent | 100.00000%                       |
      | Address         | 5601 Democracy Dr                |
      | City            | Plano                            |
      | State           | TX                               |
      | Begin Date      | 01/01/2000                       |
      | End Date        | 12/31/2015                       |
      | Notes           | This will be created upon import |

    And I verify a row from grid "BOGridExpenseSchedule" having unique value "12/31/2015" under column header "End Date"
      | name            | value                              |
      | Begin Date      | 01/01/2000                         |
      | End Date        | 12/31/2015                         |
      | Approval Status | Review                             |
      | Payment Amount  | $500.00                            |
      | Annual Amount   | $7,000.00                          |
      | Rate            | $1.20                              |
      | First Payment   | $500.00                            |
      | Last Payment    | $500.00                            |
      | Note            | Note this needs to be paid monthly |

    And I verify the following fields value on editable page
      | name                                         | value |
      | _checkbox_ExpenseSetup_IsReceivable          | true  |
      | _checkbox_ExpenseSetup_ReconcilableExpense   | false |
      | _checkbox_ExpenseSetup_ReadyForPaymentFlag   | false |
      | _checkbox_ExpenseSetup_HoldFlag              | false |
      | _checkbox_ExpenseSetup_IncludeInPlanForecast | false |

    And I verify a row from grid "BOGridExpenseAllocation" having unique value "12/31/2015" under column header "End Date"
      | name                  | value                 |
      | Begin Date            | 01/01/2000            |
      | End Date              | 12/31/2015            |
      | Effective Date        | 01/01/2000            |
      | Organization          | Selenium-Organization |
      | Allocation Percentage | 25.00000%             |
      | Acct#1                | 000012548569          |
      | Acct#2                |                       |
      | Acct#3                |                       |
      | Acct#4                |                       |

    And I verify the following fields value on editable page
      | name                     | value                            |
      | ExpenseSetup_Notes       | This will be created upon import |
      | ExpenseSetup_CovenantID  | <SELECT>                         |
      | ExpenseSetup_Section     | 12                               |
      | ExpenseSetup_AmendmentID | <SELECT>                         |
    And I switch to default frame

  Examples:
    | Item     | Secondary Tab | Third Level Tab    | Entity Name       | grid    |
    | Contract | Payment Info  | Recurring Expenses | Selenium-Contract | thisDiv |


  Scenario Outline: I Update Expense Setup and verify them in  Contract > Payment Info > Recurring Expenses page
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses"
    And I import following file name:
      | Update_ExpenseSetup.xlsx |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "Utilities" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Water      |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2000 |
      | End Date         | 12/31/2015 |
      | Frequency        | Monthly    |
      | Period Amount    |            |
      | Annual Amount    |            |
    And I verify the following fields value on editable page
      | name                                 | value                            |
      | ExpenseSetup_CodeExpenseGroupID      | Utilities                        |
      | ExpenseSetup_CodeExpenseTypeID       | Water                            |
      | ExpenseSetup_CodeExpenseCategoryID   | Expense                          |
      | ExpenseSetup_CodeFrequencyID         | Monthly                          |
      | ExpenseSetup_Description             | This will be updated upon import |
      | ExpenseSetup_CodeCurrencyTypeID      | USD                              |
      | ExpenseSetup_RentableArea            | 5,000                            |
      | ExpenseSetup_CodeBuildingAreaUnitID  | Square Feet                      |
      | ExpenseSetup_ProRataShareRate        | 25.00000%                        |
      | ExpenseSetup_RemitMessage            | Pay the water bill               |
      | ExpenseSetup_InternalReferenceNumber | 999999                           |
      | ExpenseSetup_CodePaymentMethodID     | Check                            |
      | ExpenseSetup_PaymentDueDay           | 12                               |

    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium-Employer" under column header "Vendor"
      | name            | value                            |
      | Vendor          | Selenium-Employer                |
      | Vendor#         | 1234                             |
      | Payment Percent | 100.00000%                       |
      | Address         | 5601 Democracy Dr                |
      | City            | Plano                            |
      | State           | TX                               |
      | Begin Date      | 01/01/2000                       |
      | End Date        | 12/31/2015                       |
      | Notes           | This will be updated upon import |

    And I verify a row from grid "BOGridExpenseSchedule" having unique value "12/31/2015" under column header "End Date"
      | name            | value                              |
      | Begin Date      | 01/01/2000                         |
      | End Date        | 12/31/2015                         |
      | Approval Status | Review                             |
      | Payment Amount  | $500.00                            |
      | Annual Amount   | $7,000.00                          |
      | Rate            | $1.20                              |
      | First Payment   | $500.00                            |
      | Last Payment    | $500.00                            |
      | Note            | Note this needs to be paid monthly |

    And I verify the following fields value on editable page
      | name                                         | value |
      | _checkbox_ExpenseSetup_IsReceivable          | true  |
      | _checkbox_ExpenseSetup_ReconcilableExpense   | false |
      | _checkbox_ExpenseSetup_ReadyForPaymentFlag   | false |
      | _checkbox_ExpenseSetup_HoldFlag              | true  |
      | _checkbox_ExpenseSetup_IncludeInPlanForecast | false |

    And I verify a row from grid "BOGridExpenseAllocation" having unique value "12/31/2015" under column header "End Date"
      | name                  | value                 |
      | Begin Date            | 01/01/2000            |
      | End Date              | 12/31/2015            |
      | Effective Date        | 01/01/2000            |
      | Organization          | Selenium-Organization |
      | Allocation Percentage | 60.00000%             |
      | Acct#1                | 000012548569          |
      | Acct#2                |                       |
      | Acct#3                |                       |
      | Acct#4                |                       |

    And I verify the following fields value on editable page
      | name                     | value                            |
      | ExpenseSetup_Notes       | This will be created upon import |
      | ExpenseSetup_CovenantID  | <SELECT>                         |
      | ExpenseSetup_Section     | 12                               |
      | ExpenseSetup_AmendmentID | <SELECT>                         |
    And I switch to default frame

  Examples:
    | Item     | Secondary Tab | Third Level Tab    | Entity Name       | grid    |
    | Contract | Payment Info  | Recurring Expenses | Selenium-Contract | thisDiv |

#  @all
#Feature: I create and update Expense Setup and verify them in  Contract > Payment Info > Recurring Expenses page
#
#  Background:
#    Given I Login to IWMS using "DeleteAccess" access credentials
#
#  Scenario Outline: I create Expense Setup and verify them in  Contract > Payment Info > Recurring Expenses page
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses"
#    And I import following file name:
#      | Create_ExpenseSetup.xlsx |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I select last row from the grid "thisDiv"
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/Create_ExpenseSetup.xlsx"
#    Then I verify in grid "thisDiv" in row "5" by reading data from spread sheet row "6"
#      | name          | value                           |
#      | Frequency     | ExpenseSetup.CodeFrequencyID    |
#      | Expense Group | ExpenseSetup.CodeExpenseGroupID |
#      | Expense Type  | ExpenseSetup.CodeExpenseTypeID  |
#    And I click in grid "thisDiv" in row "5" by reading data from spread sheet row "6"
#      | name          | value                           |
#      | Expense Group | ExpenseSetup.CodeExpenseGroupID |
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/Create_ExpenseSetup.xlsx"
#    Then I verify in grid "BOGridExpenseVendorAllocation" in row "1" by reading data from spread sheet row "8"
#      | name            | value                                     |
#      | Vendor          | ExpenseVendorAllocation.VendorID          |
#      | Payment Percent | ExpenseVendorAllocation.PaymentPercentage |
#    And I verify date values in grid "BOGridExpenseSchedule" in row "1" by reading data from spread sheet row "8"
#      | name       | value                             |
#      | Begin Date | ExpenseVendorAllocation.BeginDate |
#      | End Date   | ExpenseVendorAllocation.EndDate   |
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/Create_ExpenseSetup.xlsx"
#    Then I compare attribute value on editable page by reading data from spread sheet row "6"
#      | name                     | value                    |
#      | ExpenseSetup_Description | ExpenseSetup.Description |
#    And I verify date values in grid "BOGridExpenseVendorAllocation" in row "1" by reading data from spread sheet row "8"
#      | name  | value                    |
#      | Notes | ExpenseSetup.Description |
#    And I verify date values in grid "BOGridExpenseAllocation" in row "1" by reading data from spread sheet row "9"
#      | name       | value                       |
#      | Begin Date | ExpenseAllocation.BeginDate |
#      | End Date   | ExpenseAllocation.EndDate   |
#    Then I verify in grid "BOGridExpenseAllocation" in row "1" by reading data from spread sheet row "9"
#      | name                  | value                                  |
#      | Allocation Percentage | ExpenseAllocation.AllocationPercentage |
#    And I click "edit" link of the row "1" in grid "BOGridExpenseSchedule"
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/Create_ExpenseSetup.xlsx"
#    And I verify all fields values on editable page comparing with "7" th row of spreadsheet
#      | name                        | value                       |
#      | ExpenseSchedule_Description | ExpenseSchedule.Description |
#    And I logout
#
#  Examples:
#    | Item     | Secondary Tab | Third Level Tab    | Entity Name       |
#    | Contract | Payment Info  | Recurring Expenses | Selenium-Contract |
