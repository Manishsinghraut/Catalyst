@all
Feature: Match by Group, Type, Vendor and apply offsets multiple times (Ref : Jira Ticket No : Automation-651)

  Scenario Outline: I import file for Scheduled Offset Scenario 2 entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/ScheduledOffSets/"
    And I import following file name:
      | ScheduledOffsetScenario2.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Apply 1st time : Match by Group, Type, Vendor and apply offsets
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Apply Offsets" action panel button
    And I set following fields value on editable page
      | name      | value          |
      | beginDate | <Begin Date>   |
      | endDate   | <End Date>     |
      | postDate  | <Posting Date> |
      | batchDate | <Batch Date>   |
    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "3 Payment Transaction records were generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear
    And I verify Remaining Balance should be "$4,000.00"
    And I verify a row from grid "BOGridPaymentTransaction" having unique value "01/01/2014" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 01/01/2014 |
      | Expense Group  | Base Rent  |
#      | Expense Type   | Base Rent  |
      | Expense Type   | Rent       |
      | Total Amount   | -$2,000.00 |
      | One Time?      |            |
      | Vendor         | Vendor A   |
      | Is Receivable? |            |
    And I verify a row from grid "BOGridPaymentTransaction" having unique value "02/01/2014" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 02/01/2014 |
      | Expense Group  | Base Rent  |
#      | Expense Type   | Base Rent  |
      | Expense Type   | Rent       |
      | Total Amount   | -$2,000.00 |
      | One Time?      |            |
      | Vendor         | Vendor A   |
      | Is Receivable? |            |
    And I verify a row from grid "BOGridPaymentTransaction" having unique value "03/01/2014" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 03/01/2014 |
      | Expense Group  | Base Rent  |
#      | Expense Type   | Base Rent  |
      | Expense Type   | Rent       |
      | Total Amount   | -$2,000.00 |
      | One Time?      |            |
      | Vendor         | Vendor A   |
      | Is Receivable? |            |
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Item     | Entity Name                 | Second Level Tab | Third Level Tab   | Begin Date | End Date   | Posting Date | Batch Date |
      | DeleteAccess | Delete Access Access | Contract | Scheduled Offset Scenario 2 | Payment Info     | Scheduled Offsets | 01/01/2014 | 03/31/2014 | 02/06/2014   | 02/06/2014 |

  Scenario Outline: Apply 2nd time : Match by Group, Type, Vendor and apply offsets
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Apply Offsets" action panel button
    And I set following fields value on editable page
      | name      | value          |
      | beginDate | <Begin Date>   |
      | endDate   | <End Date>     |
      | postDate  | <Posting Date> |
      | batchDate | <Batch Date>   |
    And I click "OK" button
    #Then I verify "processed." message appear after generating rent
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "2 Payment Transaction records were generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear
    And I verify Remaining Balance should be "$0.00"
    And I verify a row from grid "BOGridPaymentTransaction" having unique value "04/01/2014" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 04/01/2014 |
      | Expense Group  | Base Rent  |
#      | Expense Type   | Base Rent  |
      | Expense Type   | Rent       |
      | Total Amount   | -$3,000.00 |
      | One Time?      |            |
      | Vendor         | Vendor A   |
      | Is Receivable? |            |
    And I verify a row from grid "BOGridPaymentTransaction" having unique value "05/01/2014" under column header "Effective Date"
      | name           | value      |
      | Effective Date | 05/01/2014 |
      | Expense Group  | Base Rent  |
#      | Expense Type   | Base Rent  |
      | Expense Type   | Rent       |
      | Total Amount   | -$1,000.00 |
      | One Time?      |            |
      | Vendor         | Vendor A   |
      | Is Receivable? |            |
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Item     | Entity Name                 | Second Level Tab | Third Level Tab   | Begin Date | End Date   | Posting Date | Batch Date |
      | DeleteAccess | Delete Access Access | Contract | Scheduled Offset Scenario 2 | Payment Info     | Scheduled Offsets | 04/01/2014 | 05/31/2014 | 02/10/2014   | 02/10/2014 |