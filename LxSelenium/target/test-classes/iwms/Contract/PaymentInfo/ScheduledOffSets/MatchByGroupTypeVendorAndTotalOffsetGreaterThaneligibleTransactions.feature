@all
Feature: (Ref : Jira Ticket No : Automation-656) Scenario 3 - Match by Group, Type, Vendor and Total offset greater than eligible transactions

  Scenario Outline: As a delete user I import xml for Scenario 3 - Match by Group, Type, Vendor and Total offset greater than eligible transactions
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/Data/ImportDataFiles/iwms/Contract/PaymentInfo/ScheduledOffsets/"
    And I import following file name:
      | ScheduledOffsetScenario3.xml |

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
      | endDate   | 05/31/2014 |
      | postDate  | 02/06/2014 |
      | batchDate | 02/06/2014 |

    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "5 Payment Transaction records were generated." message appear after generating rent
    And I click "OK" button
    And I verify a row from grid "thisDiv" having unique value "01/01/2014" under column header "Begin Date"
      | name              | value      |
      | End Date          |            |
      | Total Amount      | $10,000.00 |
      | Vendor            | Vendor A   |
      | Amount Allocated  | $9,000.00  |
      | Remaining Balance | $1,000.00  |

    And I verify following pair of values on non editable page
      | name              | value     |
      | Remaining Balance | $1,000.00 |
      | Amount Allocated  | $9,000.00 |

    And I verify a row from grid "BOGridLinkSchedOffsetExpGrpType" having unique value "Base Rent" under column header "Expense Group"
      | name         | value |
#      | Expense Type | Base Rent |
      | Expense Type | Rent  |
      | Actions      | edit  |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "01/12/2014" under column header "Effective Date"
      | name          | value      |
      | Expense Group | Base Rent  |
#      | Expense Type  | Base Rent  |
      | Expense Type  | Rent       |
      | Total Amount  | -$1,000.00 |
      | Vendor        | Vendor A   |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "02/14/2014" under column header "Effective Date"
      | name          | value      |
      | Expense Group | Base Rent  |
#      | Expense Type  | Base Rent  |
      | Expense Type  | Rent       |
      | Total Amount  | -$1,000.00 |
      | Vendor        | Vendor A   |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "03/16/2014" under column header "Effective Date"
      | name          | value      |
      | Expense Group | Base Rent  |
#      | Expense Type  | Base Rent  |
      | Expense Type  | Rent       |
      | Total Amount  | -$1,000.00 |
      | Vendor        | Vendor A   |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "04/17/2014" under column header "Effective Date"
      | name          | value      |
      | Expense Group | Base Rent  |
#      | Expense Type  | Base Rent  |
      | Expense Type  | Rent       |
      | Total Amount  | -$3,000.00 |
      | Vendor        | Vendor A   |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "05/17/2014" under column header "Effective Date"
      | name          | value      |
      | Expense Group | Base Rent  |
#      | Expense Type  | Base Rent  |
      | Expense Type  | Rent       |
      | Total Amount  | -$3,000.00 |
      | Vendor        | Vendor A   |

    Examples:
      | Login User   | Login full username  | Item     | Entity Name                 | Second Level Tab | Third Level Tab   |
      | DeleteAccess | Delete Access Access | Contract | Scheduled Offset Scenario 3 | Payment Info     | Scheduled Offsets |