@all
Feature: Matching by Vendor and apply offsets on transactions with Taxes (Ref : Jira Ticket No : Automation-652)

  Scenario Outline: I import file for Scheduled Offset Scenario 5 entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/ScheduledOffSets/"
    And I import following file name:
      | ScheduledOffsetsScenario5.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Matching by Vendor and apply offsets on transactions with Taxes
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Apply Offsets" action panel button
    And I set following fields value on editable page
      | name      | value        |
      | beginDate | <Begin Date> |
    And I click "OK" button
    Then I verify "processed." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear
    And I verify Remaining Balance should be "$0.00"
    And I verify a row from grid "BOGridPaymentTransaction" having unique value "01/12/2014" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 01/12/2014 |
      | Expense Group  | Base Rent  |
      | Expense Type   | Rent       |
      | Total Amount   | -$1,650.00 |
      | One Time?      |            |
      | Vendor         | Vendor A   |
      | Is Receivable? |            |
    And I verify a row from grid "BOGridPaymentTransaction" having unique value "02/14/2014" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 02/14/2014 |
      | Expense Group  | Base Rent  |
      | Expense Type   | Rent       |
      | Total Amount   | -$1,024.00 |
      | One Time?      |            |
      | Vendor         | Vendor A   |
      | Is Receivable? |            |
    And I switch to default frame
    And I click on the "Transactions" tab
    Then I verify page title "Contract Payments List" after navigation
    And I verify a row from grid "thisDiv" having unique value "-$1,650.00" under column header "Total Amount"
      | name             | value      |
      | Effective Date   | 01/12/2014 |
      | Group            | Base Rent  |
#      | Type             | Base Rent  |
      | Type             | Rent       |
      | Category         | Expense    |
      | Vendor           | Vendor A   |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | -$1,650.00 |
      | Primary Tax      | -$150.00   |
      | Hold Flag        | No         |
    And I click on the "Transactions" tab
    Then I verify page title "Contract Payments List" after navigation
    And I verify a row from grid "thisDiv" having unique value "-$1,024.00" under column header "Total Amount"
      | name             | value      |
      | Effective Date   | 02/14/2014 |
      | Group            | Base Rent  |
#      | Type             | Base Rent  |
      | Type             | Rent       |
      | Category         | Expense    |
      | Vendor           | Vendor A   |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | -$1,024.00 |
      | Primary Tax      | -$24.00    |
      | Hold Flag        | No         |
    And I switch to default frame


    Examples:
      | Login User   | Login full username  | Item     | Entity Name                | Second Level Tab | Third Level Tab   | Begin Date |
      | DeleteAccess | Delete Access Access | Contract | ScheduledOffsetsScenario 5 | Payment Info     | Scheduled Offsets | 01/12/2014 |
