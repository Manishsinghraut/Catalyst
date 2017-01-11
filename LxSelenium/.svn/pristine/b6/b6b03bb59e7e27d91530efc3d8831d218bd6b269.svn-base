@all
Feature: (JIRA - Automation-947) Delete accruals for specific posting date and Batch Number

  Scenario Outline: As a delete user I ensure all the accrual transaction for specific posting date should be deleted

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/ExpenseAccruals/"
    And I import following file name:
      | SpecificPostingDate.xml |

    And I navigate to entity type "<Item>" named "<Contract Name>"

    #Verify accrual transaction records
    Then I navigate to "Accounting Info"
    And I click on the "Accrual Transactions" tab
    And I click sort in header "Period Begin Date" from grid "thisDiv" in "Sort Ascending"
    And I assert the following values in grid "thisDiv"
      | Period Begin Date | Period End Date | Group     | Type     | Total Amount | Primary Tax | Period Year | Period Number | Posting Date |
      | 09/01/2015        | 09/30/2015      | Utilities | Water    | $2,083.33    |             | 2015        | 10            | 12/01/2015   |
      | 09/01/2015        | 09/30/2015      | CAM       | Interior | $7,083.33    |             | 2015        | 11            | 11/01/2015   |
      | 12/01/2015        | 12/31/2015      | Utilities | Water    | $2,083.33    |             | 2015        | 12            | 12/01/2015   |
      | 12/01/2015        | 12/31/2015      | CAM       | Interior | $7,083.33    |             | 2015        | 12            | 12/01/2015   |

    #Delete accrual transaction records- posting date
    And I click on the "Expense Accruals" tab
    And I click on the "Delete Accrual Payments" action panel button
    And I set following fields value on editable page
      | name         | value      |
      | yrToGenerate | 2016       |
      | postDate     | 12/01/2015 |
    Then I set following list fields values on editable page
      | name         | value |
      | mnToGenerate | 1     |
    And I click on "OK" button and handle the alert "Are you sure you want to Delete Accrual Payments?"
    And I verify "1 Contract was processed." message
    And I verify "3 Accrual Transaction records were deleted." message
    And I click "OK" button

     #Verify delete accrual transaction records
    And I click on the "Accrual Transactions" tab
    And I verify all rows count "1" in the grid "thisDiv"


    Examples:
      | Login User   | Login full username  | Contract Name         | Item     |
      | DeleteAccess | Delete Access Access | Specific Posting Date | Contract |

  Scenario Outline: As a delete user I ensure all the accrual transaction for batch number should be deleted

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "<Item>" named "<Contract Name>"
    Then I navigate to "Accounting Info"
    #Delete accrual transaction records- batch number
    And I click on the "Expense Accruals" tab
    And I click on the "Delete Accrual Payments" action panel button
    And I set following fields value on editable page
      | name       | value              |
      | batchNumbr | ACC20151223-111322 |
    And I click on "OK" button and handle the alert "Are you sure you want to Delete Accrual Payments?"
    And I verify "1 Contract was processed." message
    And I verify "1 Accrual Transaction record was deleted." message
    And I click "OK" button

     #Verify delete accrual transaction records
    And I click on the "Accrual Transactions" tab
    And I verify all rows count "0" in the grid "thisDiv"

    Examples:
      | Login User   | Login full username  | Contract Name         | Item     |
      | DeleteAccess | Delete Access Access | Specific Posting Date | Contract |
