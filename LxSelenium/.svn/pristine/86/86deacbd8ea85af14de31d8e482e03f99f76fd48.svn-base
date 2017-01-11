@all
Feature: (Ref : Jira Ticket No : Automation-685) Calculate a Straight Line Schedule

  Scenario Outline: I import file for Calculate a Straight Line Schedule
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/StraightLineRent/"
    And I import following file name:
      | CalculateStraightLineSchedule.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Ensure there are 4 Line items Expense Schedule associated with it
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "Base Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Rent       |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $1,000.00  |
      | Annual Amount    | $12,000.00 |

    And I verify a unique row in grid "BOGridExpenseSchedule" having unique value "01/01/2010" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2020 |
      | Approval Status | Review     |
      | Payment Amount  | $1,000.00  |
      | Annual Amount   | $12,000.00 |
      | Rate            | $0.02      |
      | First Payment   | $1,000.00  |
      | Last Payment    | $1,000.00  |
      | Notes           |            |

    And I verify a unique row in grid "thisDiv" having unique value "Utilities" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Water      |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $100.00    |
      | Annual Amount    | $1,200.00  |

    And I verify a unique row in grid "BOGridExpenseSchedule" having unique value "01/01/2010" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2020 |
      | Approval Status | Review     |
      | Payment Amount  | $100.00    |
      | Annual Amount   | $1,200.00  |
      | Rate            | $0.00      |
      | First Payment   | $100.00    |
      | Last Payment    | $100.00    |
      | Notes           |            |

    And I verify a unique row in grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | CAM        |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $2,000.00  |
      | Annual Amount    | $24,000.00 |

    And I verify a unique row in grid "BOGridExpenseSchedule" having unique value "01/01/2010" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2020 |
      | Approval Status | Review     |
      | Payment Amount  | $2,000.00  |
      | Annual Amount   | $24,000.00 |
      | Rate            | $0.05      |
      | First Payment   | $2,000.00  |
      | Last Payment    | $2,000.00  |
      | Notes           |            |

    And I verify a unique row in grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
      | name             | value                |
      | Expense Type     | Building Maintenance |
      | Expense Category | Expense              |
      | Begin Date       | 01/01/2010           |
      | End Date         | 12/31/2020           |
      | Frequency        | Monthly              |
      | Period Amount    | $500.00              |
      | Annual Amount    | $6,000.00            |

    And I verify a unique row in grid "BOGridExpenseSchedule" having unique value "01/01/2010" under column header "Begin Date"
      | name            | value      |
      | End Date        | 12/31/2020 |
      | Approval Status | Review     |
      | Payment Amount  | $500.00    |
      | Annual Amount   | $6,000.00  |
      | Rate            | $0.01      |
      | First Payment   | $500.00    |
      | Last Payment    | $500.00    |
      | Notes           |            |

    Examples:
      | Login User   | Login full username  | Entity Name                      |
      | DeleteAccess | Delete Access Access | Calculate Straight Line Schedule |

  Scenario Outline: As a delete user I Calculate Straight Line Schedule
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "Contract" named "<Entity Name>"
    Then I navigate to "Accounting Info"
    And I click on the "Straight-Line Rent" tab
    And I click on the "Calculate Schedule" action panel button
    And I see the "Create New Straight-line Schedule" modal window
    And I set following fields value on editable page
      | name             | value               |
      | BeginDate        | 01/01/2010          |
      | EndDate          | 12/31/2020          |
      | CodeSLScheduleID | Create Base Rent SL |
      | Notes            | This is a simple SL |
    And I click on the "Create Schedule" button
    And I click on the "Straight-Line Rent" tab
    And I verify a row from grid "thisDiv" having unique value "Create Base Rent SL" under column header "Name"
      | name                | value               |
      | Begin Date          | 01/01/2010          |
      | End Date            | 12/31/2020          |
      | Term Length         | 132.00              |
      | Balance Forward     | $0.00               |
      | Total Commitment    | $132,000.00         |
      | Last Balance Posted |                     |
      | Last Posted Date    |                     |
      | Inactive Date       |                     |
      | Notes               | This is a simple SL |

    And I verify the following values in frame grid "BOGridSLPeriod"
      | Year | Period | Period Length | Cash Rent  | Rent Expense | Deferred Rent | Cumulative Balance | Begin Date | End Date   | Status     |
      | 2010 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2010 | 12/31/2010 | Not Posted |
      | 2011 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2011 | 12/31/2011 | Not Posted |
      | 2012 |        | 366           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2012 | 12/31/2012 | Not Posted |
      | 2013 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2013 | 12/31/2013 | Not Posted |
      | 2014 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2014 | 12/31/2014 | Not Posted |
      | 2015 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2015 | 12/31/2015 | Not Posted |
      | 2016 |        | 366           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2016 | 12/31/2016 | Not Posted |
      | 2017 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2017 | 12/31/2017 | Not Posted |
      | 2018 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2018 | 12/31/2018 | Not Posted |
      | 2019 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2019 | 12/31/2019 | Not Posted |
      | 2020 |        | 366           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2020 | 12/31/2020 | Not Posted |

#
#    And I verify line items in the straight line schedule grid "BOGridSLPeriod"
#      | year | period | periodLength | cashRent   | rentExpense | deferredRent | cumulativeBalance | status     | beginDate  | endDate    | blank |
#      | 2010 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2010 | 12/31/2010 |       |
#      | 2011 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2011 | 12/31/2011 |       |
#      | 2012 |        | 366          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2012 | 12/31/2012 |       |
#      | 2013 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2013 | 12/31/2013 |       |
#      | 2014 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2014 | 12/31/2014 |       |
#      | 2015 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2015 | 12/31/2015 |       |
#      | 2016 |        | 366          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2016 | 12/31/2016 |       |
#      | 2017 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2017 | 12/31/2017 |       |
#      | 2018 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2018 | 12/31/2018 |       |
#      | 2019 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2019 | 12/31/2019 |       |
#      | 2020 |        | 366          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2020 | 12/31/2020 |       |

    Examples:
      | Login User   | Login full username  | Entity Name                      |
      | DeleteAccess | Delete Access Access | Calculate Straight Line Schedule |


#  Scenario Outline: (Ref : Jira Ticket No : Automation-686)Change Straight Line Rent Status
#  As a delete user I Change status of  Straight Line Schedule  to posted for single contract
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "Contract" named "<Entity Name>"
#    Then I navigate to "Accounting Info"
#    And I click on the "Straight-Line Rent" tab
#    And I click on row from grid "thisDiv" having unique value "Create Base Rent SL" under column header "Name"
#      | name             | value       |
#      | Begin Date       | 01/01/2010  |
#      | End Date         | 12/31/2020  |
#      | Term Length      | 132.00      |
#      | Balance Forward  | $0.00       |
#      | Total Commitment | $132,000.00 |
#
#    And I click on the "Change Status" action panel button
#    And I see the "Change Status" modal window
#    And I set following fields value on editable page
#      | name             | value            |
#      | desiredStatus    | Posted           |
#      | minDate          | 01/01/2010       |
#      | maxDate          | 05/05/2015       |
#      | CodeSLScheduleID | <Schedule>       |
#      | desiredEntity    | <Desired Entity> |
#    And I click on the "Update" button
#    And I see "Updated 64 records" message in the grid
#    And I click on the "Close" button
#    And I verify the following values in frame grid "BOGridSLPeriod"
#      | Year | Period | Period Length | Cash Rent  | Rent Expense | Deferred Rent | Cumulative Balance | Begin Date | End Date   | Status     |
#      | 2010 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2010 | 12/31/2010 | Posted     |
#      | 2011 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2011 | 12/31/2011 | Posted     |
#      | 2012 |        | 366           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2012 | 12/31/2012 | Posted     |
#      | 2013 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2013 | 12/31/2013 | Posted     |
#      | 2014 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2014 | 12/31/2014 | Posted     |
#      | 2015 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2015 | 12/31/2015 | Mixed      |
#      | 2016 |        | 366           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2016 | 12/31/2016 | Not Posted |
#      | 2017 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2017 | 12/31/2017 | Not Posted |
#      | 2018 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2018 | 12/31/2018 | Not Posted |
#      | 2019 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2019 | 12/31/2019 | Not Posted |
#      | 2020 |        | 366           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2020 | 12/31/2020 | Not Posted |
#
#
##    And I verify line items in the straight line schedule grid "BOGridSLPeriod"
##      | year | period | periodLength | cashRent   | rentExpense | deferredRent | cumulativeBalance | status     | beginDate  | endDate    | blank |
##      | 2010 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Posted     | 01/01/2010 | 12/31/2010 |       |
##      | 2011 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Posted     | 01/01/2011 | 12/31/2011 |       |
##      | 2012 |        | 366          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Posted     | 01/01/2012 | 12/31/2012 |       |
##      | 2013 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Posted     | 01/01/2013 | 12/31/2013 |       |
##      | 2014 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Posted     | 01/01/2014 | 12/31/2014 |       |
##      | 2015 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Mixed      | 01/01/2015 | 12/31/2015 |       |
##      | 2016 |        | 366          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2016 | 12/31/2016 |       |
##      | 2017 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2017 | 12/31/2017 |       |
##      | 2018 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2018 | 12/31/2018 |       |
##      | 2019 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2019 | 12/31/2019 |       |
##      | 2020 |        | 366          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2020 | 12/31/2020 |       |
#
#    Examples:
#      | Schedule            | Login User   | Login full username  | Entity Name                      | Desired Entity                   |
#      | Create Base Rent SL | DeleteAccess | Delete Access Access | Calculate Straight Line Schedule | Calculate Straight Line Schedule |
#
#  Scenario Outline: As a delete user I Change status of  Straight Line Schedule  to not posted for all single contracts
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "Contract" named "<Entity Name>"
#    Then I navigate to "Accounting Info"
#    And I click on the "Straight-Line Rent" tab
#    And I click on row from grid "thisDiv" having unique value "Create Base Rent SL" under column header "Name"
#      | name             | value       |
#      | Begin Date       | 01/01/2010  |
#      | End Date         | 12/31/2020  |
#      | Term Length      | 132.00      |
#      | Balance Forward  | $0.00       |
#      | Total Commitment | $132,000.00 |
#
#    And I click on the "Change Status" action panel button
#    And I see the "Change Status" modal window
#    And I set following fields value on editable page
#      | name             | value            |
#      | desiredStatus    | Not Posted       |
#      | minDate          | 01/01/2010       |
#      | maxDate          | 05/05/2015       |
#      | CodeSLScheduleID | <Schedule>       |
#      | desiredEntity    | <Desired Entity> |
#    And I click on the "Update" button
#    And I click on the "Close" button
#    And I verify the following values in frame grid "BOGridSLPeriod"
#      | Year | Period | Period Length | Cash Rent  | Rent Expense | Deferred Rent | Cumulative Balance | Begin Date | End Date   | Status     |
#      | 2010 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2010 | 12/31/2010 | Not Posted |
#      | 2011 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2011 | 12/31/2011 | Not Posted |
#      | 2012 |        | 366           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2012 | 12/31/2012 | Not Posted |
#      | 2013 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2013 | 12/31/2013 | Not Posted |
#      | 2014 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2014 | 12/31/2014 | Not Posted |
#      | 2015 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2015 | 12/31/2015 | Not Posted |
#      | 2016 |        | 366           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2016 | 12/31/2016 | Not Posted |
#      | 2017 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2017 | 12/31/2017 | Not Posted |
#      | 2018 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2018 | 12/31/2018 | Not Posted |
#      | 2019 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2019 | 12/31/2019 | Not Posted |
#      | 2020 |        | 366           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2020 | 12/31/2020 | Not Posted |
#
##
##    And I verify line items in the straight line schedule grid "BOGridSLPeriod"
##      | year | period | periodLength | cashRent   | rentExpense | deferredRent | cumulativeBalance | status     | beginDate  | endDate    | blank |
##      | 2010 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2010 | 12/31/2010 |       |
##      | 2011 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2011 | 12/31/2011 |       |
##      | 2012 |        | 366          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2012 | 12/31/2012 |       |
##      | 2013 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2013 | 12/31/2013 |       |
##      | 2014 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2014 | 12/31/2014 |       |
##      | 2015 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2015 | 12/31/2015 |       |
##      | 2016 |        | 366          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2016 | 12/31/2016 |       |
##      | 2017 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2017 | 12/31/2017 |       |
##      | 2018 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2018 | 12/31/2018 |       |
##      | 2019 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2019 | 12/31/2019 |       |
##      | 2020 |        | 366          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2020 | 12/31/2020 |       |
#
#    Examples:
#      | Login User   | Login full username  | Entity Name                      | Desired Entity | Schedule            |
#      | DeleteAccess | Delete Access Access | Calculate Straight Line Schedule | All Contracts  | Create Base Rent SL |
#
#
#  Scenario Outline: As a delete user I Change status of  Straight Line Schedule  to posted for single contract
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "Contract" named "<Entity Name>"
#    Then I navigate to "Accounting Info"
#    And I click on the "Straight-Line Rent" tab
#    And I click on row from grid "thisDiv" having unique value "Create Base Rent SL" under column header "Name"
#      | name             | value       |
#      | Begin Date       | 01/01/2010  |
#      | End Date         | 12/31/2020  |
#      | Term Length      | 132.00      |
#      | Balance Forward  | $0.00       |
#      | Total Commitment | $132,000.00 |
#
#    And I click on the "Change Status" action panel button
#    And I see the "Change Status" modal window
#    And I set following fields value on editable page
#      | name             | value            |
#      | desiredStatus    | Posted           |
#      | minDate          | 01/01/2010       |
#      | maxDate          | 05/05/2015       |
#      | CodeSLScheduleID | <Schedule>       |
#      | desiredEntity    | <Desired Entity> |
#    And I click on the "Update" button
#    And I see "Updated 64 records" message in the grid
#    And I click on the "Close" button
#
#    And I verify the following values in frame grid "BOGridSLPeriod"
#      | Year | Period | Period Length | Cash Rent  | Rent Expense | Deferred Rent | Cumulative Balance | Begin Date | End Date   | Status     |
#      | 2010 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2010 | 12/31/2010 | Posted     |
#      | 2011 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2011 | 12/31/2011 | Posted     |
#      | 2012 |        | 366           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2012 | 12/31/2012 | Posted     |
#      | 2013 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2013 | 12/31/2013 | Posted     |
#      | 2014 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2014 | 12/31/2014 | Posted     |
#      | 2015 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2015 | 12/31/2015 | Mixed      |
#      | 2016 |        | 366           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2016 | 12/31/2016 | Not Posted |
#      | 2017 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2017 | 12/31/2017 | Not Posted |
#      | 2018 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2018 | 12/31/2018 | Not Posted |
#      | 2019 |        | 365           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2019 | 12/31/2019 | Not Posted |
#      | 2020 |        | 366           | $12,000.00 | $12,000.00   | $0.00         | $0.00              | 01/01/2020 | 12/31/2020 | Not Posted |
#
#
##    And I verify line items in the straight line schedule grid "BOGridSLPeriod"
##      | year | period | periodLength | cashRent   | rentExpense | deferredRent | cumulativeBalance | status     | beginDate  | endDate    | blank |
##      | 2010 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Posted     | 01/01/2010 | 12/31/2010 |       |
##      | 2011 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Posted     | 01/01/2011 | 12/31/2011 |       |
##      | 2012 |        | 366          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Posted     | 01/01/2012 | 12/31/2012 |       |
##      | 2013 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Posted     | 01/01/2013 | 12/31/2013 |       |
##      | 2014 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Posted     | 01/01/2014 | 12/31/2014 |       |
##      | 2015 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Mixed      | 01/01/2015 | 12/31/2015 |       |
##      | 2016 |        | 366          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2016 | 12/31/2016 |       |
##      | 2017 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2017 | 12/31/2017 |       |
##      | 2018 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2018 | 12/31/2018 |       |
##      | 2019 |        | 365          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2019 | 12/31/2019 |       |
##      | 2020 |        | 366          | $12,000.00 | $12,000.00  | $0.00        | $0.00             | Not Posted | 01/01/2020 | 12/31/2020 |       |
#
#    Examples:
#      | Schedule            | Login User   | Login full username  | Entity Name                      | Desired Entity                   |
#      | Create Base Rent SL | DeleteAccess | Delete Access Access | Calculate Straight Line Schedule | Calculate Straight Line Schedule |
#
#
#  Scenario Outline: (Ref : Jira Ticket No : Automation-690) Negative - Changing Status for All Contracts and specifying SL Schedule type
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "Contract" named "<Entity Name>"
#    Then I navigate to "Accounting Info"
#    And I click on the "Straight-Line Rent" tab
#    And I click on row from grid "thisDiv" having unique value "Create Base Rent SL" under column header "Name"
#      | name             | value       |
#      | Begin Date       | 01/01/2010  |
#      | End Date         | 12/31/2020  |
#      | Term Length      | 132.00      |
#      | Balance Forward  | $0.00       |
#      | Total Commitment | $132,000.00 |
#
#    And I click on the "Change Status" action panel button
#    And I see the "Change Status" modal window
#    And I set following fields value on editable page
#      | name             | value         |
#      | desiredStatus    | Posted        |
#      | minDate          | 01/01/2010    |
#      | maxDate          | 05/05/2015    |
#      | CodeSLScheduleID | <Schedule>    |
#      | desiredEntity    | All Contracts |
#    And I click on the "Update" button
#    And I see "You must select a single Contract to update a particular Schedule or don't select a Schedule to update All Contracts" message in the header
#    And I click on the "Close" button
#
#    Examples:
#      | Schedule            | Login User   | Login full username  | Entity Name                      |
##      | Create Base Rent SL | DeleteAccess | Delete Access Access | Calculate Straight Line Schedule |
#      | Create Base Rent SL | LxSelenium | Selenium Tester     | Calculate Straight Line Schedule |
