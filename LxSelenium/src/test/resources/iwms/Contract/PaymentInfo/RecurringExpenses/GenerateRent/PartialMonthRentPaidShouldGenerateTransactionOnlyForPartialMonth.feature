@all
Feature: (JIRA - Automation-970) Partial Month Rent Paid should generate transaction only for the Partial month

  Scenario Outline: As a delete user I generate transaction only for the Partial month
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/GenerateRent/"
    And I import following file name:
      | PartialMonthRentContract.xml |

#    And I navigate to entity type "<Entity Type>" named "<Contract Name>"
    When I Search for the "<Contract Name>" that was created
    And Click on the name of the "<Contract Name>" in the results pop-up
    Then I see "<Contract Name>" name on the header

    And I verify the summary fields value on non-editable contract summary tab
      | name              | value      |
      | Payments End Date | 05/31/2015 |

#    And I navigate to "<Second Level Tab>"
#    And I click on the "<Second Level Tab>" tab
#    And I click on the "<Second Level Tab>" tab
#    And I click on the "Recurring Expenses" tab
#    And I navigate to second level "<Second Level Tab>" and third level "Recurring Expenses" tabs
    When I Search for the "<Contract Name>" that was created
    And Click on the name of the "<Contract Name>" in the results pop-up
    Then I see "<Contract Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | CAM        |
      | Expense Category | Expense    |
      | Begin Date       | 05/01/2015 |
      | End Date         | 05/17/2015 |
      | Frequency        | Monthly    |
      | Period Amount    |            |
      | Annual Amount    | $17,000.00 |

    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium-Employer" under column header "Vendor"
      | name            | value             |
      | Vendor#         | 1234              |
      | Payment Percent | 100.00000%        |
      | Address         | 5601 Democracy Dr |
      | Begin Date      | 01/01/2015        |
      | End Date        | 05/31/2015        |

    And I verify a row from grid "BOGridExpenseSchedule" having unique value "05/01/2015" under column header "Begin Date"
      | name           | value      |
      | End Date       | 05/17/2015 |
      | Payment Amount | $31,000.00 |

    Then I click on the "Generate Rent" action panel button
    Then I set fields values on editable page
      | name         | value  |
      | yrToGenerate | <Year> |

    And I set following list fields values on editable page
      | name         | value             |
      | paymntClass  | <Generate Option> |
      | mnToGenerate | <Month>           |

    And I click "OK" button
    And I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button

    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Group"
      | name             | value             |
      | Effective Date   | 05/01/2015        |
      | Type             | CAM               |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | No                |
      | Total Amount     | $17,000.00        |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |


    Examples:
      | Generate Option | Year | Month | Login User   | Login full username  | Entity Type | Contract Name                   | Second Level Tab |
      | Single Contract | 2015 | May   | DeleteAccess | Delete Access Access | Contract    | Partial Month Rent Contract-970 | Payment Info     |