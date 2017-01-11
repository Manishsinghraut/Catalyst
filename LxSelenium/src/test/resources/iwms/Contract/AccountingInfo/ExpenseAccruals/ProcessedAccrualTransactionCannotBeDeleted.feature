@all
Feature: (JIRA - Automation-948) Processed Accrual Transactions should not be deleted

  Scenario Outline: As a delete user I ensure that Processed Accrual Transactions should not be deleted

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/ExpenseAccruals/"
    And I import following file name:
      | ProcessedAccrualTransaction.xml |

    And I navigate to entity type "<Item>" named "<Contract Name>"
    Then I navigate to "Accounting Info"
    And I click on the "Accrual Transactions" tab
    And I click sort in header "Period Begin Date" from grid "thisDiv" in "Sort Ascending"
    And I assert the following values in grid "thisDiv"
      | Period Begin Date | Period End Date | Group     | Type     | Total Amount | Primary Tax | Period Year | Period Number | Posting Date |
      | 09/01/2015        | 09/30/2015      | Utilities | Water    | $2,083.33    |             | 2015        | 10            | 12/01/2015   |
      | 09/01/2015        | 09/30/2015      | CAM       | Interior | $7,083.33    |             | 2015        | 11            | 11/01/2015   |
      | 12/01/2015        | 12/31/2015      | Utilities | Water    | $2,083.33    |             | 2015        | 12            | 12/01/2015   |
      | 12/01/2015        | 12/31/2015      | CAM       | Interior | $7,083.33    |             | 2015        | 12            | 12/01/2015   |
    And I verify the following fields value on editable page
      | name                                       | value |
      | _checkbox_AccrualTransaction_ProcessedFlag | true  |
    And I click on the "Expense Accruals" tab
    And I click on the "Delete Accrual Payments" action panel button
    And I see the "Delete Accrual Payments" modal window
    And I set following fields value on editable page
      | name         | value |
      | yrToGenerate | 2015  |
      | postDate     |       |
    Then I set following list fields values on editable page
      | name         | value |
      | mnToGenerate | 10    |

    And I click on "OK" button and handle the alert "Are you sure you want to Delete Accrual Payments?"
    Then I verify the following failure message
      | Did not find any NOT Processed Accrual Transaction for Period Year 2015, period Number 10 |
      | 0 Contract was processed.                                                                 |
      | No Accrual Transaction Records deleted.                                                   |
    #And I click "OK" button
    And I click "OK" button in modal window "Failure"
    And I wait for "Failure" modal window to close

    And I set following fields value on editable page
      | name     | value      |
      | postDate | 11/01/2015 |
    And I click on "OK" button and handle the alert "Are you sure you want to Delete Accrual Payments?"
    Then I verify the following failure message
      | Did not find any NOT Processed Accrual Transaction with Posting Date 11/01/2015 |
      | 0 Contract was processed.                                                       |
      | No Accrual Transaction Records deleted.                                         |
    And I click "OK" button in modal window "Failure"
    And I wait for "Failure" modal window to close

    And I set following fields value on editable page
      | name       | value              |
      | batchNumbr | ACC20151223-010021 |
    And I click on "OK" button and handle the alert "Are you sure you want to Delete Accrual Payments?"
    Then I verify the following failure message
      | Did not find any NOT Processed Accrual Transaction with Batch Number ACC20151223-010021 |
      | 0 Contract was processed.                                                               |
      | No Accrual Transaction Records deleted.                                                 |
    And I click "OK" button in modal window "Failure"


    Examples:
      | Login User   | Login full username  | Contract Name                 | Item     |
      | DeleteAccess | Delete Access Access | Processed Accrual Transaction | Contract |