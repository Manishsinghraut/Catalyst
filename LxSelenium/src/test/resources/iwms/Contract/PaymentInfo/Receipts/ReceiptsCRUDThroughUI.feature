@all @smoke @smoke2Dot1
Feature: Payment Info - Receipts (Ref : Jira Ticket No : Automation-768)

  Scenario Outline: As a delete user I Import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Receipts/"
    And I import following files:
      | ReceiptsContract.xml |
    And I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to second level tab "Payment Info" and third level "Receipts" tab of entity "Contract"

    Examples:
      | Login User   | Login full username  | Entity Name       |
      | DeleteAccess | Delete Access Access | Receipts Contract |

  Scenario Outline: As a delete user I add 3 Receipt line items
    When I click on the "Add item" action panel button
    Then I verify page title "Contract Receipts List" after navigation
    And I set fields values on editable page
      | name                          | value             |
      | PaymentReceipt_PeriodYear     | <Year>            |
      | PaymentReceipt_PeriodMonth    | 12                |
      | PaymentReceipt_EffectiveDate  | <Date>            |
      | PaymentReceipt_PostingDate    | <Date>            |
      | PaymentReceipt_ReceiptDate    | <Date>            |
      | PaymentReceipt_ReceiptNumber  | <Receipt Number>  |
      | PaymentReceipt_ReceivedAmount | <Amount Received> |

    And I set list fields values on editable page
      | name                              | value |
      | PaymentReceipt_CodeReceiptTypeID  | Check |
      | PaymentReceipt_CodeCurrencyTypeID | USD   |

    And I click on the "Save Changes" action panel button
    And I verify success message "Successfully added Payment Receipt"
    And I click on the "Receipts" tab
    And I verify a row from grid "<Grid ID>" having unique value "<Date>" under column header "Effective Date"
      | name                 | value                         |
      | Period Year          | <Year>                        |
      | Period Month         | 12                            |
      | Receipt Number       | <Receipt Number>              |
      | Receipt Type         | Check                         |
      | Amount Received      | <Amount Received with format> |
      | Currency Type        | USD                           |
      | Amount Not Allocated | <Amount Received with format> |


    Examples:
      | Year | Date       | Receipt Number | Amount Received | Amount Received with format | Grid ID |
      | 2015 | 10/06/2015 | 0001           | 1500            | $1,500.00                   | thisDiv |
      | 2014 | 10/06/2014 | 0002           | 500             | $500.00                     | thisDiv |
      | 2013 | 10/06/2013 | 0003           | 100             | $100.00                     | thisDiv |


  Scenario Outline: As a delete user I sort  Receipt line items
    When I click sort in header "Effective Date" from grid "<Grid ID>" in "Sort Ascending"
    And I verify line items in the receipt grid "thisDiv"
      | effectiveDate | periodYear | periodMonth | receiptNumber | receiptType | amountReceived | currencyType | amountNotAllocated |
      | 10/06/2013    | 2013       | 12          | 0003          | Check       | $100.00        | USD          | $100.00            |
      | 10/06/2014    | 2014       | 12          | 0002          | Check       | $500.00        | USD          | $500.00            |
      | 10/06/2015    | 2015       | 12          | 0001          | Check       | $1,500.00      | USD          | $1,500.00          |

    And I click sort in header "Receipt Number" from grid "<Grid ID>" in "Sort Ascending"
    And I verify line items in the receipt grid "<Grid ID>"
      | effectiveDate | periodYear | periodMonth | receiptNumber | receiptType | amountReceived | currencyType | amountNotAllocated |
      | 10/06/2015    | 2015       | 12          | 0001          | Check       | $1,500.00      | USD          | $1,500.00          |
      | 10/06/2014    | 2014       | 12          | 0002          | Check       | $500.00        | USD          | $500.00            |
      | 10/06/2013    | 2013       | 12          | 0003          | Check       | $100.00        | USD          | $100.00            |

    And I click sort in header "Amount Received" from grid "<Grid ID>" in "Sort Ascending"
    And I verify line items in the receipt grid "<Grid ID>"
      | effectiveDate | periodYear | periodMonth | receiptNumber | receiptType | amountReceived | currencyType | amountNotAllocated |
      | 10/06/2013    | 2013       | 12          | 0003          | Check       | $100.00        | USD          | $100.00            |
      | 10/06/2014    | 2014       | 12          | 0002          | Check       | $500.00        | USD          | $500.00            |
      | 10/06/2015    | 2015       | 12          | 0001          | Check       | $1,500.00      | USD          | $1,500.00          |


    Examples:
      | Grid ID |
      | thisDiv |

  Scenario Outline: As an edit user I EDIT Receipt
    When I select a row from grid "thisDiv" having unique value "<Date>" under column header "Effective Date"
      | name                 | value                         |
      | Period Year          | <Year>                        |
      | Period Month         | 12                            |
      | Receipt Number       | <Receipt Number>              |
      | Receipt Type         | Check                         |
      | Amount Received      | <Amount Received with format> |
      | Currency Type        | USD                           |
      | Amount Not Allocated | <Amount Received with format> |

    And I set fields values on editable page
      | name                          | value |
      | PaymentReceipt_ReceivedAmount | 2000  |

    And I click on the "Save Changes" action panel button
    And I verify success message "Successfully updated Payment Receipt"
    And I click on the "Receipts" tab
    And I verify a row from grid "<Grid ID>" having unique value "<Date>" under column header "Effective Date"
      | name                 | value            |
      | Period Year          | <Year>           |
      | Period Month         | 12               |
      | Receipt Number       | <Receipt Number> |
      | Receipt Type         | Check            |
      | Amount Received      | $2,000.00        |
      | Currency Type        | USD              |
      | Amount Not Allocated | $2,000.00        |

    Examples:
      | Year | Date       | Receipt Number | Amount Received with format | Grid ID |
      | 2015 | 10/06/2015 | 0001           | $1,500.00                   | thisDiv |

  Scenario Outline: As a delete user I delete  Receipt
    Given I select a row from grid "<Grid ID>" having unique value "<Date>" under column header "Effective Date"
      | name                 | value            |
      | Period Year          | <Year>           |
      | Period Month         | 12               |
      | Receipt Number       | <Receipt Number> |
      | Receipt Type         | Check            |
      | Amount Received      | $2,000.00        |
      | Currency Type        | USD              |
      | Amount Not Allocated | $2,000.00        |
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    And I verify success message "Successfully deleted Payment Receipt"
    Then I verify row from grid "<Grid ID>" having unique value "<Receipt Number>" not present

    Examples:
      | Year | Date       | Receipt Number | Grid ID |
      | 2015 | 10/06/2015 | 0001           | thisDiv |