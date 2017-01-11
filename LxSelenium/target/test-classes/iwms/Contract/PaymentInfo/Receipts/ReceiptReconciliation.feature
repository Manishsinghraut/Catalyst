@contract @all @smoke @smoke2Dot111
Feature: (Jira Ref: AUTOMATION-328) Test contract receipt reconciliation
  1) Login with administrator access rights
  2) Import contract test data
  3) Navigate to Contract->PaymentInfo->Receipts
  4) Click on Reconcile Receipt action button
  5) Check All checkbox items
  6) Click Reconcile
  7) Verify Amount Not Allocated is $0.00

  Scenario: Delete "Receipt Reconciliation Test" contract
#    Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I delete "Receipt Reconciliation Test" contract from "United States,TX" folders

  Scenario: Import contract xml data file from import data folder with no error
    When I navigate to import page
    And I used data files from "Data/ImportDataFiles/"
    And I import following file name:
      | 34 ReceiptReconciliation.xml                  |

  Scenario: I try to reconcile receipt with non-zero balance in Amount Not Allocated
    Given I navigate to "Contract, Payment Info, Receipts"
    When I navigate to folders "United States,TX" and contract "Receipt Reconciliation Test"
    And I see Amount Not Allocated is not zero
    And I click on the "Reconcile Receipt" action panel button
    And I select check All Checkbox
    And I click on the "Reconcile" button and wait
    And I see Amount Not Allocated is zero

  Scenario: I try to reconcile receipt with $0.00 in Amount Not Allocated and get error
    And I navigate to "Contract, Payment Info, Receipts"
    And I see Amount Not Allocated is zero
    And I click on the "Reconcile Receipt" action panel button
    Then I see alert box with message "There is no amount left to allocate in Amount Not Allocated"
