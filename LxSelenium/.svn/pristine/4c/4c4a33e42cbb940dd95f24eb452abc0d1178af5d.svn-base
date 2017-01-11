@all
Feature: (Ref : Jira Ticket No : AUTOMATION-838) Extending a Contract with Accrual Records

  Scenario Outline: As a delete user I create 2 fiscal calenders
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Fiscal Calendar" link
    Then I set following fields value on editable page
      | name         | value          |
      | Year         | <year>         |
      | TotalPeriods | <TotalPeriods> |
      | addStartDate | <start date>   |
      | addEndDate   | <end date>     |
    And I click on "Create Periods for Year" Button
    Then I wait for the Loading text to disappear in grid

    Examples:
      | Login User   | Login full username  | year | TotalPeriods | start date | end date   |
      | DeleteAccess | Delete Access Access | 2014 | 12           | 02/01/2014 | 01/31/2015 |
      | DeleteAccess | Delete Access Access | 2015 | 12           | 02/01/2015 | 01/31/2016 |


  Scenario Outline: As a delete user I import contract xml and ensure that Month to Month is set to "Yes",Payment Begin date:02/01/2014 and Payment End date:01/31/2015
    Given I used data files from "Data/ImportDataFiles/iwms/Contract/Details/Summary/"
    And I import following file name:
      | EC with Accrual Records.xml |
    And I navigate to entity type "Contracts" named "<Contract Name>" through search option
    And I navigate to "Details"
    And I click on the "Summary" tab
    And I verify the summary fields value on non-editable contract summary tab
      | name              | value      |
      | Month to Month?   | Yes        |
      | Payments Begin    | 02/01/2014 |
      | Payments End Date | 01/31/2015 |
    And I navigate to second level tab "Payment Info" and third level "Recurring Expenses" tab of entity "Contract"
    Then I verify page title "Contract Expense Setup List" after navigation
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Interior   |
      | Expense Category | Expense    |
      | Begin Date       | 02/01/2014 |
      | End Date         | 01/31/2015 |
      | Frequency        | Monthly    |
      | Period Amount    |            |
      | Annual Amount    | $1,000.00  |
    And I verify a row from grid "BOGridExpenseSchedule" having unique value "02/01/2014" under column header "Begin Date"
      | name            | value      |
      | End Date        | 01/31/2015 |
      | Approval Status | Review     |
      | Payment Amount  | $1,000.00  |
      | Annual Amount   | $12,000.00 |
      | Rate            |            |
      | First Payment   | $1,000.00  |
      | Last Payment    | $1,000.00  |

    Examples:
      | Contract Name           |
      | EC with Accrual Records |

  Scenario: I create Expense Accruals for a Contract
    Given I navigate to second level tab "Accounting Info" and third level "Expense Accruals" tab of entity "Contract"
    And I click on the "Create Wizard" action panel button
    Then I see the "Create Expense Accruals" modal window
    And I check "CAM" expense setup
    And I click on the "Create Accrual Setup Records" button
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Group"
      | name                   | value    |
      | Type                   | Interior |
      | Category               | Expense  |
      | Begin Period           | 1/2014   |
      | End Period             | 12/2014  |
      | Current Period Expense |          |
      | Current Annual Expense |          |

    And I verify a row from grid "BOGridExpenseAccrualSchedule" having unique value "1/2014" under column header "Begin Period"
      | name                | value      |
      | Begin Period        | 1/2014     |
      | End Period          | 12/2014    |
      | Period Amount       | $1,000.00  |
      | Annual Amount       | $12,000.00 |
      | Accrual Rate        |            |
      | First Period Amount | $1,000.00  |
      | Last Period Amount  | $1,000.00  |
      | Notes               |            |
      | Actions             | edit       |

  Scenario Outline: To verify the Extended by full period
    Given I navigate to second level tab "Details" and third level "Summary" tab of entity "Contract"
    When I click on the "Extend Contracts" action panel button
    Then I see the "Extend Contracts" modal window

    And I set following fields value on editable page
      | name           | value            |
      | expirationDate | <expirationDate> |
      | dateToExtend   | <datetoextend>   |

    Then I click on the "<Apply>" row action of column "<Contract Name>" of column "0" from grid "entitySelect"
    And I click on "Extend Leases" Button
    # Feature improvement  IWMS-20632
    Then I verify success message appear in top left corner of page
      | Finished processing                                                                                                                                                                                                                |
      | Total Entities Modified: 1                                                                                                                                                                                                         |
      | Details:                                                                                                                                                                                                                           |
      | Extending Dates for '<Contract Name>' contract from <expirationDate> to <datetoextend>                                                                                                                                             |
      | Updated Expense Schedule End Date - begin date(<Begin Date>), end date (<expirationDate>, payment amount ($1,000.00), Updated last payment amount from ($1,000.00), to ($1,000.00}) - Expense Group (CAM), Expense Type (Interior) |
    #|Issue exist hence commented below code   issue exist iwms - 20401
    #|Updated Expense Accrual Schedule End Period from 12 to 1, End Year from 2,014 to 2,015, Last Payment Amount from $1,000.00 to $1,000.00 - Expense Setup Group (CAM), Expense Setup Type (Interior)                                          |
      | Updated Expense Accrual Schedule End Period from 12 to 1, End Year from 2014 to 2015, Last Payment Amount from $1,000.00 to $1,000.00 - Expense Setup Group (CAM), Expense Setup Type (Interior)                                   |
      | Updated Payment End Date for '<Contract Name>' (CD-101234) contract                                                                                                                                                                |

    And I click on "Done" Button
    And I wait for the Loading text to disappear in grid

    And I navigate to entity type "Contracts" named "<Contract Name>" through search option
    And I navigate to second level tab "Accounting Info" and third level "Expense Accruals" tab of entity "Contract"
    Then  I verify a row from grid "BOGridExpenseAccrualSchedule" having unique value "1/2014" under column header "Begin Period"
      | name               | value     |
      | End Period         | 1/2015    |
      | Last Period Amount | $1,000.00 |

    Examples:
      | Apply   | Contract Name           | expirationDate | datetoextend | Begin Date |
      | <Apply> | EC with Accrual Records | 01/31/2015     | 02/28/2015   | 02/01/2014 |


  Scenario Outline: To verify the Extended by partial period
    Given I navigate to second level tab "Details" and third level "Summary" tab of entity "Contract"
    When I click on the "Extend Contracts" action panel button
    Then I see the "Extend Contracts" modal window

    And I set following fields value on editable page
      | name           | value            |
      | expirationDate | <expirationDate> |
      | dateToExtend   | <datetoextend>   |

    Then I click on the "<Apply>" row action of column "<Contract Name>" of column "0" from grid "entitySelect"
    And I click on "Extend Leases" Button
    Then I verify success message appear in top left corner of page
      | Finished processing                                                                                                                                                                                                              |
      | Total Entities Modified: 1                                                                                                                                                                                                       |
      | Details:                                                                                                                                                                                                                         |
      | Extending Dates for '<Contract Name>' contract from <expirationDate> to <datetoextend>                                                                                                                                           |
      | Updated Expense Schedule End Date - begin date(<Begin Date>), end date (<expirationDate>, payment amount ($1,000.00), Updated last payment amount from ($1,000.00), to ($451.61}) - Expense Group (CAM), Expense Type (Interior) |
      | Updated Expense Accrual Schedule End Period from 1 to 2, End Year from 2015 to 2015, Last Payment Amount from $1,000.00 to $451.61 - Expense Setup Group (CAM), Expense Setup Type (Interior)                                    |
      | Updated Payment End Date for '<Contract Name>' (CD-101234) contract                                                                                                                                                              |
    And I click on "Done" Button
    And I wait for the Loading text to disappear in grid

    Examples:
      | Apply   | Contract Name           | expirationDate | datetoextend | Begin Date |
      | <Apply> | EC with Accrual Records | 02/28/2015     | 03/14/2015   | 02/01/2014 |

  Scenario Outline: To verify the Extended by partial period
    Given I navigate to entity type "Contracts" named "<Contract Name>" through search option
    And I navigate to second level tab "Accounting Info" and third level "Expense Accruals" tab of entity "Contract"
    Then I verify a row from grid "BOGridExpenseAccrualSchedule" having unique value "1/2014" under column header "Begin Period"
      | name               | value   |
      | End Period         | 2/2015  |
      | Last Period Amount | $451.61 |

    Examples:
      | Contract Name           |
      | EC with Accrual Records |