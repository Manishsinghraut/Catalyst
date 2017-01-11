@all
Feature: As an IWMS user I need to be able to Deletion of Straight Line schedule - Set 1 (Jira Ref : AUTOMATION-834)

  Scenario: I want Security Configuration for Import Data
    When I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    Then I click on the "Manage Security" link
    And I expand the following page access folders
      | Administration |
      | Dashboard      |
    Then I click on the "Delete" access of "Import Data" of column "3" from page access tab

  Scenario: I want Security Configuration for Delete Button on Accounting Info->Straight-Line Rent
    When I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    Then I click on the "Manage Security" link
    And I expand the following page access folders
      | Administration |
      | Dashboard      |
    Then I click on the "Delete" access of "Manage Contracts" of column "3" from page access tab

  Scenario Outline: I want to verify new employer should be created with all the information
    When I Login to IWMS using "DeleteAccess" access credentials
    And I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    Then I import following file name:
      | SL1.xml     |
      | SL1-834.xml |
#      | SL2.xml |
#      | SL3.xml |

#    When I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "thisDiv" having unique value "Base Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Rent       |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $1,000.00  |
      | Annual Amount    | $12,000.00 |
    And I verify a row from grid "thisDiv" having unique value "Utilities" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Water      |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $100.00    |
      | Annual Amount    | $1,200.00  |
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | CAM        |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $2,000.00  |
      | Annual Amount    | $24,000.00 |
    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
      | name             | value                |
      | Expense Type     | Building Maintenance |
      | Expense Category | Expense              |
      | Begin Date       | 01/01/2010           |
      | End Date         | 12/31/2020           |
      | Frequency        | Monthly              |
      | Period Amount    | $500.00              |
      | Annual Amount    | $6,000.00            |
    Examples:
      | Item     | Second Level Tab | Third Level Tab    | Entity Name                         |
      | Contract | Payment Info     | Recurring Expenses | Straight Line Deletion Contract-834 |


  Scenario Outline: I Deleting Active Single Straight line Rent Schedule with Posted Status
    When I Login to IWMS using "DeleteAccess" access credentials
#    And I navigate to entity type "<Item>" named "<Entity Name>"
    Then I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Change Status" action panel button
    And I set following fields value on editable page
      | name             | value                               |
      | desiredStatus    | Posted                              |
      | desiredEntity    | Straight Line Deletion Contract-834 |
      | CodeSLScheduleID | Base Rent SL                        |
      | minDate          | 01/01/2020                          |
      | maxDate          | 12/31/2030                          |
    And I click on the "Update" button
    And I click on the "Close" button
    And I verify a row from grid "thisDiv" having unique value "Base Rent SL" under column header "Name"
      | name                | value      |
      | Begin Date          | 01/01/2020 |
      | End Date            | 12/31/2030 |
      | Term Length         | 132.00     |
      | Balance Forward     | $0.00      |
      | Total Commitment    | $12,000.00 |
      | Last Balance Posted |            |
      | Last Posted Date    |            |
      | Inactive Date       |            |
      | Notes               |            |
    And I click row from grid "thisDiv" having unique value "Base Rent SL"
    And I verify a row from grid "BOGridSLPeriod" having unique value "2020" under column header "Year"
      | name   | value  |
      | Status | Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2021" under column header "Year"
      | name   | value  |
      | Status | Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2022" under column header "Year"
      | name   | value  |
      | Status | Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2023" under column header "Year"
      | name   | value  |
      | Status | Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2024" under column header "Year"
      | name   | value  |
      | Status | Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2025" under column header "Year"
      | name   | value  |
      | Status | Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2026" under column header "Year"
      | name   | value  |
      | Status | Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2027" under column header "Year"
      | name   | value  |
      | Status | Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2028" under column header "Year"
      | name   | value  |
      | Status | Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2029" under column header "Year"
      | name   | value  |
      | Status | Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2030" under column header "Year"
      | name   | value  |
      | Status | Posted |
    And I click on the "Delete Schedule" action panel button
    And I click on the "Yes" button in message box
    And I verify "Unable to delete, some periods have been posted to accounting" error message appear in top left corner of page

    Examples:
      | Item     | Second Level Tab | Third Level Tab    | Entity Name                         | Percentage Rent page                | Grid ID                  | Month    | Year |
      | Contract | Accounting Info  | Straight-Line Rent | Straight Line Deletion Contract-834 | Straight Line Deletion Contract-834 | BOGridVirtualSalesPeriod | December | 2014 |

  Scenario Outline: I Deleting Active Single Straight line Rent Schedule with Not Posted Status
    When I Login to IWMS using "DeleteAccess" access credentials
#    And I navigate to entity type "<Item>" named "<Entity Name>"
    Then I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "thisDiv" having unique value "SL Schedule 2" under column header "Name"
      | name                | value      |
      | Begin Date          | 01/01/2020 |
      | End Date            | 12/31/2030 |
      | Term Length         | 132.00     |
      | Balance Forward     | $0.00      |
      | Total Commitment    | $1,200.00  |
      | Last Balance Posted |            |
      | Last Posted Date    |            |
      | Inactive Date       |            |
      | Notes               |            |
    And I click row from grid "thisDiv" having unique value "SL Schedule 2"
    And I verify a row from grid "BOGridSLPeriod" having unique value "2020" under column header "Year"
      | name   | value      |
      | Status | Not Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2021" under column header "Year"
      | name   | value      |
      | Status | Not Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2022" under column header "Year"
      | name   | value      |
      | Status | Not Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2023" under column header "Year"
      | name   | value      |
      | Status | Not Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2024" under column header "Year"
      | name   | value      |
      | Status | Not Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2025" under column header "Year"
      | name   | value      |
      | Status | Not Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2026" under column header "Year"
      | name   | value      |
      | Status | Not Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2027" under column header "Year"
      | name   | value      |
      | Status | Not Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2028" under column header "Year"
      | name   | value      |
      | Status | Not Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2029" under column header "Year"
      | name   | value      |
      | Status | Not Posted |
    And I verify a row from grid "BOGridSLPeriod" having unique value "2030" under column header "Year"
      | name   | value      |
      | Status | Not Posted |
    And I click on the "Delete Schedule" action panel button
    And I click on the "Yes" button in message box
#    And I logout


    Examples:
      | Item     | Second Level Tab | Third Level Tab    | Entity Name                         |
      | Contract | Accounting Info  | Straight-Line Rent | Straight Line Deletion Contract-834 |