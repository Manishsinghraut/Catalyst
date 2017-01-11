@all
Feature: (Ref : Jira Ticket No : Automation-985) Receipts-Reconcile function should update Bank Routing # and Bank Account # on Payment Information Section

  Scenario Outline: As a delete user I Import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Receipts/"
    And I import following file name:
      | S001- Location-985.xml |
      | Receipts-985.xml       |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify transactions and Receipt line items
    When I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to second level tab "Payment Info" and third level "Transactions" tab of entity "Contract"
    And I verify the following values in frame grid "thisDiv"
      | Effective Date | Group     | Type     | Category | Vendor | Vendor# | One-Time Expense | Total Amount | Primary Tax | Hold Flag |
      | 12/31/2015     | Base Rent | Rent     | Rent     |        |         | Yes              | $2,000.00    |             | No        |
      | 03/01/2015     | CAM       | Interior | Expense  |        |         | Yes              | $1,000.00    |             | No        |
    And I click on row from grid "thisDiv" having unique value "Base Rent" under column header "Group"
      | name | value |
      | Type | Rent  |
    And I verify the following fields value on editable page
      | name                                      | value |
      | _checkbox_PaymentTransaction_IsReceivable | false |
      | _checkbox_PaymentTransaction_CreditFlag   | false |
      | PaymentTransaction_Description            |       |
      | PaymentTransaction_RemitMessage           |       |
#      | PaymentTransaction_CodePaymentMethodID    |       |
      | PaymentTransaction_CheckDate              |       |
      | PaymentTransaction_InternalRefNumber      |       |
      | PaymentTransaction_BankAccountNumber      |       |
      | PaymentTransaction_CheckNumber            |       |
      | PaymentTransaction_CheckAmount            |       |
      | PaymentTransaction_BankRoutingNumber      |       |

    And I click on row from grid "thisDiv" having unique value "CAM" under column header "Group"
      | name | value    |
      | Type | Interior |
    And I verify the following fields value on editable page
      | name                                      | value |
      | _checkbox_PaymentTransaction_IsReceivable | false |
      | _checkbox_PaymentTransaction_CreditFlag   | false |
      | PaymentTransaction_Description            |       |
      | PaymentTransaction_RemitMessage           |       |
#      | PaymentTransaction_CodePaymentMethodID    |       |
      | PaymentTransaction_CheckDate              |       |
      | PaymentTransaction_InternalRefNumber      |       |
      | PaymentTransaction_BankAccountNumber      |       |
      | PaymentTransaction_CheckNumber            |       |
      | PaymentTransaction_CheckAmount            |       |
      | PaymentTransaction_BankRoutingNumber      |       |


    And I click on the "Receipts" tab
    And I verify the following values in frame grid "thisDiv"
      | Effective Date | Period Year | Period Month | Receipt Number | Receipt Type | Amount Received | Currency Type | Amount Not Allocated |
      | 03/01/2015     | 2015        | 3            | r001           | ACH          | $800.00         | USD           | $800.00              |
      | 12/31/2015     | 2015        | 12           | r002           | ACH          | $2,000.00       | USD           | $2,000.00            |

    And I click on row from grid "thisDiv" having unique value "$800.00" under column header "Amount Received"
      | name           | value      |
      | Effective Date | 03/01/2015 |
      | Receipt Number | r001       |
    And I verify the following fields value on editable page
      | name                              | value      |
      | PaymentReceipt_PeriodYear         | 2015       |
      | PaymentReceipt_PeriodMonth        | 3          |
      | PaymentReceipt_EffectiveDate      | 03/01/2015 |
      | PaymentReceipt_CodeReceiptTypeID  | ACH        |
      | PaymentReceipt_ReceivedAmount     | $800.00    |
      | PaymentReceipt_BankRoutingNumber  | 10055451   |
      | PaymentReceipt_ReceiptNumber      | r001       |
      | PaymentReceipt_BankAccountNumber  | 9558745    |
      | PaymentReceipt_PostingDate        |            |
      | PaymentReceipt_ReceiptDate        |            |
      | PaymentReceipt_CodeCurrencyTypeID | USD        |
    And I click on the "Reconcile Receipt" action panel button
    And I see the "Reconcile Receipt" modal window
    And I set following fields value on editable page
      | name      | value      |
      | BeginDate | 01/01/2015 |
      | EndDate   | 12/31/2015 |
    And I select the following transactions
      | CAM |
    And I click on the "Reconcile" button
    And I verify success message "Receipt was Successfully reconciled!"


    And I click on row from grid "thisDiv" having unique value "$2,000.00" under column header "Amount Received"
      | name           | value      |
      | Effective Date | 12/31/2015 |
      | Receipt Number | r002       |
    And I verify the following fields value on editable page
      | name                              | value      |
      | PaymentReceipt_PeriodYear         | 2015       |
      | PaymentReceipt_PeriodMonth        | 12         |
      | PaymentReceipt_EffectiveDate      | 12/31/2015 |
      | PaymentReceipt_CodeReceiptTypeID  | ACH        |
      | PaymentReceipt_ReceivedAmount     | $2,000.00  |
      | PaymentReceipt_BankRoutingNumber  | 10055451   |
      | PaymentReceipt_ReceiptNumber      | r002       |
      | PaymentReceipt_BankAccountNumber  | 9558745    |
      | PaymentReceipt_PostingDate        |            |
      | PaymentReceipt_ReceiptDate        |            |
      | PaymentReceipt_CodeCurrencyTypeID | USD        |

    And I click on the "Reconcile Receipt" action panel button
    And I see the "Reconcile Receipt" modal window
    And I set following fields value on editable page
      | name      | value      |
      | BeginDate | 01/01/2015 |
      | EndDate   | 12/31/2015 |
    And I select the following transactions
      | Base Rent |
    And I click on the "Reconcile" button
    And I verify success message "Receipt was Successfully reconciled!"

    And I click on the "Transactions" tab
    And I click on row from grid "thisDiv" having unique value "Base Rent" under column header "Group"
      | name | value |
      | Type | Rent  |
    And I verify following pair of values on non editable page
      | name            | value     |
      | Amount Received | $2,000.00 |
    And I verify the following fields value on editable page
      | name                                 | value    |
      | PaymentTransaction_BankRoutingNumber | 10055451 |
      | PaymentTransaction_BankAccountNumber | 9558745  |
      | PaymentTransaction_CheckNumber       | r002     |

    And I click on row from grid "thisDiv" having unique value "CAM" under column header "Group"
      | name | value    |
      | Type | Interior |
    And I verify following pair of values on non editable page
      | name            | value   |
      | Amount Received | $800.00 |
    And I verify the following fields value on editable page
      | name                                 | value    |
      | PaymentTransaction_BankRoutingNumber | 10055451 |
      | PaymentTransaction_BankAccountNumber | 9558745  |
      | PaymentTransaction_CheckNumber       | r001     |


    Examples:
      | Entity Name  |
      | Receipts-985 |