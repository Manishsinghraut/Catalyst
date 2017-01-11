@all
Feature: Test decimal on certain foreign currency on all relevant contract areas [Jira Ref : AUTOMATION-1375]

  Scenario Outline: As a delete user I Navigate to  Admin Dashboard > Manage Company > Financial Settings > and select JPY as the 'Home Currency' and click 'Update'
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID | JPY   |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/"
    And I import following file name:
      | Sprint17PortfolioAndLocation_1375.xml |
      | CurrencyContract_13622_1375.xml       |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Navigate to "CurrencyContract-13622" and verify the currency type
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify the field "Annual Total Amount" is "¥12,012"
    And I verify the field "Aggregate Total Amount" is "¥180,180"
    And I verify the field "Monthly Total Rent" is "¥1,001"
    And I verify the field "Aggregate Base Rent" is "¥0"
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name            | Third Level Tab |
    | DeleteAccess | Delete Access Access | CurrencyContract-13622 | Summary         |

  Scenario Outline: As a delete user I verify the line item will update and the "payment amount" field will have the value of "¥1,002"
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame

    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Interior   |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2016 |
      | End Date         | 12/31/2030 |
      | Frequency        | Monthly    |
      | Period Amount    | ¥1,001     |
      | Annual Amount    | ¥12,012    |

    And I click on "edit" row action in the grid "BOGridExpenseSchedule" having the following header "End Date" and cell value "12/31/2030"
      | name            | value      |
      | Begin Date      | 01/01/2016 |
      | End Date        | 12/31/2030 |
      | Approval Status | Review     |
      | Payment Amount  | ¥1,001     |
      | Annual Amount   | ¥12,006    |
      | Rate            |            |
      | First Payment   | ¥1,001     |
      | Last Payment    | ¥1,001     |

    And I switch to default frame

#    And I verify the following fields value on editable page
#      | name                                 | value          |
#      | ExpenseSchedule_BeginDate            | 01/01/2016     |
#      | ExpenseSchedule_EndDate              | 12/31/2030     |
#      | ExpenseSchedule_CodeApprovalStatusID | Review         |
#      | ExpenseSchedule_AnnualAmount         | ¥12,006        |
#      | ExpenseSchedule_FirstPaymentAmount   | ¥1,001         |
#      | ExpenseSchedule_LastPaymentAmount    | ¥1,001         |
#      | calcOptions                          | Payment Amount |
#      | _checkbox_ExpenseSchedule_HoldFlag   | false          |

    And I set following fields value on editable page
      | name                          | value   |
      | ExpenseSchedule_PaymentAmount | 1001.50 |

    And I click on the "Update" button
    And I wait for modal window to close

    And I switch to visible frame

    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Interior   |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2016 |
      | End Date         | 12/31/2030 |
      | Frequency        | Monthly    |
      | Period Amount    | ¥1,002     |
      | Annual Amount    | ¥12,024    |

    And I click on "edit" row action in the grid "BOGridExpenseSchedule" having the following header "End Date" and cell value "12/31/2030"
      | name            | value      |
      | Begin Date      | 01/01/2016 |
      | End Date        | 12/31/2030 |
      | Approval Status | Review     |
      | Payment Amount  | ¥1,002     |
      | Annual Amount   | ¥12,018    |
      | Rate            |            |
      | First Payment   | ¥1,002     |
      | Last Payment    | ¥1,002     |

    And I switch to default frame

    And I set following fields value on editable page
      | name                          | value   |
      | ExpenseSchedule_PaymentAmount | 1002.49 |

    And I click on the "Update" button
    And I wait for modal window to close


    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Interior   |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2016 |
      | End Date         | 12/31/2030 |
      | Frequency        | Monthly    |
      | Period Amount    | ¥1,002     |
      | Annual Amount    | ¥12,024    |

    And I click on "edit" row action in the grid "BOGridExpenseSchedule" having the following header "End Date" and cell value "12/31/2030"
      | name            | value      |
      | Begin Date      | 01/01/2016 |
      | End Date        | 12/31/2030 |
      | Approval Status | Review     |
      | Payment Amount  | ¥1,002     |
      | Annual Amount   | ¥12,030    |
      | Rate            |            |
      | First Payment   | ¥1,002     |
      | Last Payment    | ¥1,002     |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name            | Second Level Tab | Third Level Tab    |
    | DeleteAccess | Delete Access Access | CurrencyContract-13622 | Payment Info     | Recurring Expenses |


  Scenario Outline: As a delete user I verify the Transactions line item
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab

    And I switch to visible frame
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Group"
      | name             | value      |
      | Effective Date   | 01/01/2016 |
      | Group            | CAM        |
      | Type             | Interior   |
      | Category         | Expense    |
      | Vendor           |            |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | ¥1,130     |
      | Primary Tax      | ¥20        |
      | Hold Flag        | No         |

    And I verify these field values on editable page
      | name                             | value  |
      | PaymentTransaction_InvoiceAmount | ¥1,000 |
      | PaymentTransaction_TaxAmount1    | ¥20    |
      | PaymentTransaction_TaxAmount2    | ¥10    |
      | PaymentTransaction_TaxAmount3    | ¥5     |
      | PaymentTransaction_FreightAmount | ¥80    |
      | PaymentTransaction_MiscAmount    | ¥15    |

  Examples:
    | Login User   | Login full username  | Entity Name            | Second Level Tab | Third Level Tab |
    | DeleteAccess | Delete Access Access | CurrencyContract-13622 | Payment Info     | Transactions    |


  Scenario Outline: As a delete user I Navigate back to "manage company" and change the currency back to null post testing
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID |       |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |