@all
Feature: (Ref : Jira Ticket No : Automation-654) Scenario 1 - No match criteria specified and Processed transactions exist

  Scenario Outline: As a delete user I import xml for Scenario 1 - No match criteria specified and Processed transactions exist
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/Data/ImportDataFiles/iwms/Contract/PaymentInfo/ScheduledOffsets/"
    And I import following file name:
      | ScheduledOffsetsScenario1.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I can able to add transactions with tax recalculation
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
      | postDate  | 02/06/2014 |
      | batchDate | 02/20/2015 |

    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "6 Payment Transaction records were generated." message appear after generating rent
    And I click "OK" button
    And I verify a row from grid "thisDiv" having unique value "01/01/2014" under column header "Begin Date"
      | name              | value      |
      | End Date          | 05/31/2014 |
      | Total Amount      | $2,000.00  |
      | Vendor            |            |
      | Amount Allocated  | $2,000.00  |
      | Remaining Balance | $0.00      |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "02/10/2014" under column header "Effective Date"
      | name          | value     |
      | Expense Group | Base Rent |
#      | Expense Type  | Base Rent |
      | Expense Type  | Rent      |
      | Total Amount  | -$600.00  |
      | Vendor        | Vendor A  |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "02/11/2014" under column header "Effective Date"
      | name          | value    |
      | Expense Group | CAM      |
      | Expense Type  | Interior |
      | Total Amount  | -$240.00 |
      | Vendor        | Vendor B |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "02/12/2014" under column header "Effective Date"
      | name          | value     |
      | Expense Group | Utilities |
      | Expense Type  | Water     |
      | Total Amount  | -$160.00  |
      | Vendor        | Vendor C  |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "03/11/2014" under column header "Effective Date"
      | name          | value     |
      | Expense Group | Base Rent |
#      | Expense Type  | Base Rent |
      | Expense Type  | Rent      |
      | Total Amount  | -$600.00  |
      | Vendor        | Vendor A  |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "03/12/2014" under column header "Effective Date"
      | name          | value    |
      | Expense Group | CAM      |
      | Expense Type  | Interior |
      | Total Amount  | -$240.00 |
      | Vendor        | Vendor B |

    And I verify a row from grid "BOGridPaymentTransaction" having unique value "03/16/2014" under column header "Effective Date"
      | name          | value     |
      | Expense Group | Utilities |
      | Expense Type  | Water     |
      | Total Amount  | -$160.00  |
      | Vendor        | Vendor C  |



    Examples:
      | Login User   | Login full username  | Item     | Entity Name                  | Second Level Tab | Third Level Tab   |
      | DeleteAccess | Delete Access Access | Contract | Scheduled offsets scenario 1 | Payment Info     | Scheduled Offsets |

