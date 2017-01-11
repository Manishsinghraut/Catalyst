@all
Feature: (JIRA - Automation-946) Deleting all Accruals for a specific time period

  Scenario Outline: As a delete user I ensure all the accrual transaction for specific time period should be deleted

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/ExpenseAccruals/"
    And I import following file name:
      | SpecifictimeperiodContract.xml |

    And I navigate to entity type "<Item>" named "<Contract Name>"
    #Generate accrual transaction records
    Then I navigate to "Accounting Info"
    And I click on the "Expense Accruals" tab
    And I click on the "Generate Accruals" action panel button
    And I see the "Generate Accruals" modal window
    And I set following fields value on editable page
      | name         | value      |
      | yrToGenerate | 2015       |
      | postDate     | 12/20/2015 |
    Then I set following list fields values on editable page
      | name         | value |
      | mnToGenerate | 9     |
    And I click on the "OK" button
    And I verify "1 Contract was processed." message
    And I verify "2 Accrual Transaction records were generated." message
    And I click "OK" button

    #Verify generated accrual transaction records
    And I click on the "Accrual Transactions" tab
    And I click sort in header "Period Begin Date" from grid "thisDiv" in "Sort Ascending"
    And I assert the following values in grid "thisDiv"
      | Period Begin Date | Period End Date | Group     | Type     | Total Amount | Primary Tax | Period Year | Period Number | Posting Date |
      | 09/01/2015        | 09/30/2015      | Utilities | Water    | $2,083.33    |             | 2015        | 9             | 12/20/2015   |
      | 09/01/2015        | 09/30/2015      | CAM       | Interior | $7,083.33    |             | 2015        | 9             | 12/20/2015   |

    #Delete generated accrual transaction records
    And I click on the "Expense Accruals" tab
    And I click on the "Delete Accrual Payments" action panel button
    And I set following fields value on editable page
      | name         | value |
      | yrToGenerate | 2015  |
      | postDate     |       |
    Then I set following list fields values on editable page
      | name         | value |
      | mnToGenerate | 9     |
    And I click on "OK" button and handle the alert "Are you sure you want to Delete Accrual Payments?"
    And I verify "1 Contract was processed." message
    And I verify "2 Accrual Transaction records were deleted." message
    And I click "OK" button

     #Verify delete accrual transaction records
    And I click on the "Accrual Transactions" tab
    And I verify all rows count "0" in the grid "thisDiv"

    Examples:
      | Login User   | Login full username  | Contract Name                 | Item     |
      | DeleteAccess | Delete Access Access | Specific time period Contract | Contract |