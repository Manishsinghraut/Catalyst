@all
Feature: (Ref : Jira Ticket No : Automation-984) Applying Cash Receipts to non A/R Payment Transaction Records

  Scenario Outline: As a delete user I Import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Receipts/"
    And I import following files:
      | CashReceiptsToPaymentTransactionRecords-984.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify transactions and Receipt line items
    When I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to second level tab "Payment Info" and third level "Transactions" tab of entity "Contract"
    And I verify the following values in frame grid "thisDiv"
      | Effective Date | Group     | Type     | Category | Vendor            | Vendor# | One-Time Expense | Total Amount | Primary Tax | Hold Flag |
      | 01/01/2020     | Base Rent | Rent     | Rent     | Selenium-Employer | 1234    | Yes              | $10,000.00   |             | No        |
      | 01/01/2020     | CAM       | Interior | Expense  | Selenium-Employer | 1234    | Yes              | $2,000.00    |             | No        |
    And I click on row from grid "thisDiv" having unique value "Base Rent" under column header "Group"
      | name | value |
      | Type | Rent  |
    And I verify the following fields value on editable page
      | name                                      | value |
      | _checkbox_PaymentTransaction_IsReceivable | false |

    And I click on row from grid "thisDiv" having unique value "CAM" under column header "Group"
      | name | value    |
      | Type | Interior |
    And I verify the following fields value on editable page
      | name                                      | value |
      | _checkbox_PaymentTransaction_IsReceivable | true  |

    And I click on the "Receipts" tab
    And I verify the following line items in frame grid "thisDiv"
      | Effective Date | Period Year | Period Month | Receipt Number | Receipt Type | Amount Received | Currency Type | Amount Not Allocated |
      | 01/01/2000     | 2017        | 3            | Receipt 123    | Credit       | $1,000,000.00   | USD           | $1,000,000.00        |
    And I click on the "Reconcile Receipt" action panel button
    And I see the "Reconcile Receipt" modal window
    And I set following fields value on editable page
      | name      | value      |
      | BeginDate | 01/01/2020 |
      | EndDate   | 12/31/2020 |
    And I verify the following values in non frame grid "ContractReceiptReconciliationDiv"
      | Effective Date | Group     | Type     | Vendor            | Amount     | Tax Amount | Amount Allocated | Amount Not Allocated | Description | One Time? | Notes |
      | 01/01/2020     | Base Rent | Rent     | Selenium-Employer | $10,000.00 |            |                  | $10,000.00           |             | checked   |       |
      | 01/01/2020     | CAM       | Interior | Selenium-Employer | $2,000.00  |            |                  | $2,000.00            |             | checked   |       |

    And I select the following transactions
      | CAM       |
      | Base Rent |

    And I click on the "Reconcile" button
    And I verify success message "Receipt was Successfully reconciled!"

    And I verify the following line items in frame grid "thisDiv"
      | Effective Date | Period Year | Period Month | Receipt Number | Receipt Type | Amount Received | Currency Type | Amount Not Allocated |
      | 01/01/2000     | 2017        | 3            | Receipt 123    | Credit       | $1,000,000.00   | USD           | $988,000.00          |
    And I verify following pair of values on non editable page
      | name                 | value       |
      | Amount Allocated     | $12,000.00  |
      | Amount Not Allocated | $988,000.00 |
    And I verify the following line items in frame grid "BOGridPaymentTransaction"
      | Effective Date | Expense Group | Expense Type | Total Amount | One Time? | Vendor            | Is Receivable? |
      | 01/01/2020     | CAM           | Interior     | $2,000.00    | checked   | Selenium-Employer | checked        |
      | 01/01/2020     | Base Rent     | Rent         | $10,000.00   | checked   | Selenium-Employer | unchecked      |

    And I click on the "Reconcile Receipt" action panel button
    And I see the "Reconcile Receipt" modal window
    And I set following fields value on editable page
      | name      | value      |
      | BeginDate | 01/01/2020 |
      | EndDate   | 12/31/2020 |
    And I verify the following values in non frame grid "ContractReceiptReconciliationDiv"
      | Effective Date | Group     | Type     | Vendor            | Amount     | Tax Amount | Amount Allocated | Amount Not Allocated | Description | One Time? | Notes |
      | 01/01/2020     | Base Rent | Rent     | Selenium-Employer | $10,000.00 |            | $10,000.00       | $0.00                |             | checked   |       |
      | 01/01/2020     | CAM       | Interior | Selenium-Employer | $2,000.00  |            | $2,000.00        | $0.00                |             | checked   |       |

    And I set following fields value on editable page
      | name   | value |
      | onlyAR | true  |
    And I verify all rows count "1" in the non frame grid "ContractReceiptReconciliationDiv"
    And I verify the following values in non frame grid "ContractReceiptReconciliationDiv"
      | Effective Date | Group | Type     | Vendor            | Amount    | Tax Amount | Amount Allocated | Amount Not Allocated | Description | One Time? | Notes |
      | 01/01/2020     | CAM   | Interior | Selenium-Employer | $2,000.00 |            | $2,000.00        | $0.00                |             | checked   |       |


    Examples:
      | Entity Name                                      |
      | Cash Receipts To Payment Transaction Records-984 |