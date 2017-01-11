@all
Feature: (Ref : Jira Ticket No : Automation-730) Recoveries-Update Escrow

  Scenario Outline: As a delete user I Import the attached Recoveries Contract_Escrow XML
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following file name:
      | RecoveriesContract_Escrow.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Ensure that the Recovery line item exist for 2014
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Contract" named "<Entity Name>"
#    And I navigate to "Payment Info"
    And I navigate to "Payment Info"
    And I click on the "Recoveries" tab
#    And I navigate to second level "Payment Info" and third level "Recoveries" tabs
    Then I verify page title "Contract Expense Recovery List" after navigation
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
      | name            | value      |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2014 |
      | End Date        | 12/31/2014 |
      | Recovery Period |            |
      | Reported Amount | $74,250.00 |
#      | Percent Change  | 0.00%      |
      | Percent Change  | 0.0000%      |
      | Approved Amount | $77,055.00 |
      | Pre-Paid Amount | $6,000.00  |
      | Amount Due      | $71,055.00 |
    And I set fields values on editable page
      | name                                 | value |
      | ExpenseRecovery_NewEscalationPayment | 3000  |
    And I click on the "Save Changes" action panel button
    And I click on the "Update Escrow" action panel button
    And I see the "Update Escrow" modal window
    Then I set fields values on editable page
      | name         | value |
      | yrToGenerate | 2014  |

    Then I set following list fields values on editable page
      | name         | value           |
      | mnToGenerate | December        |
      | paymntClass  | Single Contract |
    And I click "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "No Payment Transaction Records generated." message appear after generating rent
    And I verify "1 Escrow record was updated." message appear after generating rent
    And I click "OK" button

    And I click on the "Recurring Expenses" tab

    And I verify a row from grid "BOGridExpenseSchedule" having unique value "01/01/2000" under column header "Begin Date"
      | name            | value      |
      | End Date        | 11/30/2014 |
      | Approval Status | Review     |
      | Payment Amount  | $2,000.00  |
      | Annual Amount   | $2,000.00  |
      | Rate            |            |
      | First Payment   | $2,000.00  |
      | Last Payment    | $2,000.00  |
      | Notes           |            |
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "12/01/2014" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2020 |
      | Approval Status | Review     |
      | Payment Amount  | $3,000.00  |
      | Annual Amount   | $36,000.00 |
      | Rate            |            |
      | First Payment   | $3,000.00  |
      | Last Payment    | $3,000.00  |
      | Notes           |            |

    And I click on the "Recoveries" tab
    And I click row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
    And I verify the following fields value on editable page
      | name                                     | value |
      | _checkbox_ExpenseRecovery_ReconciledFlag | true  |
    And I set following fields value on editable page
      | name                                     | value |
      | _checkbox_ExpenseRecovery_ReconciledFlag | false |
    And I click on the "Save Changes" action panel button
    And I verify success message "Successfully updated Expense Recovery"
    And I click on the "Reconcile" action panel button
    And I set fields values on editable page
      | name             | value      |
      | invoiceDate      | 08/09/2015 |
      | invoiceNumber    | 100        |
      | allocateByVendor | true       |
    And I check Send Mail checkbox in Reconcile modal window
    And I click on OK button in Reconcile pop up
    And I click "Yes" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "12/31/2014" under column header "Effective Date"
      | name             | value             |
      | Group            | Lease             |
      | Type             | CAM               |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | $71,055.00        |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |

    And I verify the following fields value on editable page
      | name                                     | value             |
      | PaymentTransaction_VendorID              | Selenium-Employer |
      | _checkbox_PaymentTransaction_OneTimeFlag | true              |

  Examples:
    | Login User   | Login full username  | Entity Name                |
    | DeleteAccess | Delete Access Access | Recoveries_Escrow Contract |

  Scenario: I verify Email should be received for members in the "Attention Email to" column
    Given I login to web mail on existing window
    And I search the mail using subject "[LxRetail] Recoveries_Escrow Contract Reconcile 12/31/2014"
    And I verify attachment exist "LxReconcileEXP" of type "html"

    And I search the mail using subject "[LxRetail] Recoveries_Escrow Contract Update Escrow 12/01/2014"
    And I verify attachment exist "LxUpdateEscrowESC" of type "html"
