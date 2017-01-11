@all
Feature: (Ref : Jira Ticket No : Automation-655) Scenario 4 - Matching by Group and Type

  Scenario Outline: As a delete user I import xml for Scenario 1 - No match criteria specified and Processed transactions exist
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/Data/ImportDataFiles/iwms/Contract/PaymentInfo/ScheduledOffsets/"
    And I import following file name:
      | ScheduledOffsetsScenario4.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I apply offset
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click on the "Apply Offsets" action panel button
    And I see the "Apply Offsets" modal window
    And I set following fields value on editable page
      | name      | value      |
      | beginDate | 01/01/2014 |
      | endDate   | 05/31/2014 |
      | postDate  | 05/31/2014 |
      | batchDate | 02/20/2015 |

    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "4 Payment Transaction records were generated." message appear after generating rent
    And I click "OK" button
    And I verify a row from grid "thisDiv" having unique value "02/01/2014" under column header "Begin Date"
      | name              | value      |
      | End Date          |            |
      | Total Amount      | $10,000.00 |
      | Vendor            |            |
      | Amount Allocated  | $5,000.00  |
      | Remaining Balance | $5,000.00  |

    And I verify a row from grid "BOGridLinkSchedOffsetExpGrpType" having unique value "Base Rent" under column header "Expense Group"
      | name         | value |
      | Expense Type | Rent  |
      | Actions      | edit  |


    And I verify a row from grid "BOGridPaymentTransaction" having unique value "02/14/2014" under column header "Effective Date"
      | name          | value      |
      | Expense Group | Base Rent  |
      | Expense Type  | Rent       |
      | Total Amount  | -$1,000.00 |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "03/16/2014" under column header "Effective Date"
      | name          | value      |
      | Expense Group | Base Rent  |
      | Expense Type  | Rent       |
      | Total Amount  | -$1,000.00 |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "04/17/2014" under column header "Effective Date"
      | name          | value      |
      | Expense Group | Base Rent  |
      | Expense Type  | Rent       |
      | Total Amount  | -$1,500.00 |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "05/17/2014" under column header "Effective Date"
      | name          | value      |
      | Expense Group | Base Rent  |
      | Expense Type  | Rent       |
      | Total Amount  | -$1,500.00 |
    Examples:
      | Login User   | Login full username  | Item     | Entity Name                  | Second Level Tab | Third Level Tab   |
      | DeleteAccess | Delete Access Access | Contract | Scheduled offsets scenario 4 | Payment Info     | Scheduled Offsets |