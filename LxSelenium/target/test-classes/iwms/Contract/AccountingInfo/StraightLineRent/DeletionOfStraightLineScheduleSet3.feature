@all
Feature: Deletion of Straight Line schedule - Set 3 (Ref : Jira Ticket No : AUTOMATION-836)

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

  Scenario Outline: I import file for Deletion of Straight Line schedule - Set 2
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/StraightLineRent/"
    And I import following file name:
#      | SL1.xml |
#      | SL4.xml |
      | SL1-836.xml |
      | SL4-836.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Ensure there are 4 Line items Expense Schedule associated with it
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    #And I verify all rows count "4" in the grid "thisDiv"
    And I verify a row from grid "thisDiv" having unique value "Base Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Rent       |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $1,000.00  |
      | Annual Amount    | $12,000.00 |

    And I verify a unique row in grid "thisDiv" having unique value "Utilities" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Water      |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $100.00    |
      | Annual Amount    | $1,200.00  |

    And I verify a unique row in grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | CAM        |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $2,000.00  |
      | Annual Amount    | $24,000.00 |

    And I verify a unique row in grid "thisDiv" having unique value "Lease Expense" under column header "Expense Group"
      | name             | value                |
      | Expense Type     | Building Maintenance |
      | Expense Category | Expense              |
      | Begin Date       | 01/01/2010           |
      | End Date         | 12/31/2020           |
      | Frequency        | Monthly              |
      | Period Amount    | $500.00              |
      | Annual Amount    | $6,000.00            |

  Examples:
    | Login User   | Login full username  | Entity Name                         |
    | DeleteAccess | Delete Access Access | Straight Line Deletion Contract-836 |

#  Scenario Outline: As a delete user I Navigate to Accounting Info> Straight-Line Rent .Ensure it has line items
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "Contract" named "<Entity Name>"
#    Then I navigate to "Accounting Info"
#    And I click on the "Straight-Line Rent" tab
##    And I verify all rows count "4" in the grid "thisDiv"
#    And I switch to visible frame
#    And I verify a unique row in grid "thisDiv" having unique value "Base Rent SL" under column header "Name"
#      | name             | value      |
#      | Begin Date       | 01/01/2020 |
#      | End Date         | 12/31/2030 |
#      | Term Length      | 132.00     |
#      | Balance Forward  | $0.00      |
#      | Total Commitment | $12,000.00 |
#
#    And I verify a unique row in grid "thisDiv" having unique value "SL Schedule 2" under column header "Name"
#      | name             | value      |
#      | Begin Date       | 01/01/2020 |
#      | End Date         | 12/31/2030 |
#      | Term Length      | 132.00     |
#      | Balance Forward  | $0.00      |
#      | Total Commitment | $1,200.00  |
#
#    And I verify a unique row in grid "thisDiv" having unique value "SL Schedule 4" under column header "Name"
#      | name             | value      |
#      | Begin Date       | 01/01/2016 |
#      | End Date         | 12/31/2020 |
#      | Term Length      | 60.00      |
#      | Balance Forward  | $0.00      |
#      | Total Commitment | $30,000.00 |
#    And I switch to default frame
#
#  Examples:
#    | Login User   | Login full username  | Entity Name                     |
#    | DeleteAccess | Delete Access Access | Straight Line Deletion Contract-836 |


  Scenario Outline: As a delete user I Verify the SL Schedule 4 Active Straight-line Schedule
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Accounting Info"
    And I click on the "Straight-Line Rent" tab
    And I switch to visible frame
    And I click on row from grid "thisDiv" having unique value "12/31/2020" under column header "End Date"
      | name             | value      |
      | Begin Date       | 01/01/2016 |
      | End Date         | 12/31/2020 |
      | Term Length      | 60.00      |
      | Balance Forward  | $0.00      |
      | Total Commitment | $30,000.00 |
    And I switch to default frame
    And I click on the "Change Status" action panel button
    And I see the "Change Status" modal window
    And I set following fields value on editable page
      | name             | value         |
      | desiredStatus    | Posted        |
      | minDate          | 01/01/2016    |
      | maxDate          | 12/31/2025    |
      | CodeSLScheduleID | SL Schedule 4 |

    And I verify the following fields value on editable page
      | name          | value         |
      | desiredEntity | <Entity Name> |
    And I click on the "Update" button
    And I see "Updated 60 records" message in the grid
    And I click on the "Close" button
#    When I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "Accounting Info"
#    And I click on the "Straight-Line Rent" tab
#    And I switch to visible frame
#    And I click on row from grid "thisDiv" having unique value "$30,000.00" under column header "Total Commitment"
#      | name             | value         |
#      | Name             | SL Schedule 4 |
#      | Begin Date       | 01/01/2016    |
#      | End Date         | 12/31/2020    |
#      | Term Length      | 60.00        |
#      | Balance Forward  | $0.00         |
#      | Total Commitment | $30,000.00    |
    And I verify atleast "5" row count in the grid "BOGridSLPeriod" having value "Posted" under header "Status"
    And I switch to default frame


  Examples:
    | Login User   | Login full username  | Entity Name                         |
    | DeleteAccess | Delete Access Access | Straight Line Deletion Contract-836 |

  Scenario Outline: I import file to create new straight line schedule item
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/StraightLineRent/"
    And I import following file name:
#      | SL5.xml |
      | SL5-836.xml |

  Examples:s
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Verify the SL Schedule 4 Active Straight-line Schedule for new line item 2
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Accounting Info"
    And I click on the "Straight-Line Rent" tab
#    And I switch to visible frame
#    And I click on row from grid "thisDiv" having unique value "01/01/2021" under column header "Begin Date"
#      | name             | value         |
#      | Name             | SL Schedule 4 |
#      | Begin Date       | 01/01/2021    |
#      | End Date         | 12/31/2025    |
#      | Term Length      | 60.00         |
#      | Balance Forward  | $0.00         |
#      | Total Commitment | $0.00         |
#    And I switch to default frame
    And I click on the "Change Status" action panel button
    And I see the "Change Status" modal window
    And I set following fields value on editable page
      | name             | value         |
      | desiredStatus    | Posted        |
      | minDate          | 01/01/2016    |
      | maxDate          | 12/31/2025    |
      | CodeSLScheduleID | SL Schedule 4 |

    And I verify the following fields value on editable page
      | name          | value         |
      | desiredEntity | <Entity Name> |
    And I click on the "Update" button
    And I see "Updated 60 records" message in the grid
    And I click on the "Close" button
    And I switch to visible frame
    And I verify atleast "5" row count in the grid "BOGridSLPeriod" having value "Posted" under header "Status"
    And I verify row from grid "BOGridSLPeriod" having unique value "Not Posted" not present under column header "Status"
    And I switch to default frame
  Examples:
    | Login User   | Login full username  | Entity Name                         |
    | DeleteAccess | Delete Access Access | Straight Line Deletion Contract-836 |

  Scenario Outline: I import file to create new straight line schedule item
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/StraightLineRent/"
    And I import following file name:
#      | SL6.xml |
      | SL6-836.xml |


  Examples:s
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: Active Straight line Rent Schedule with Posted Status does not exist in other schedule
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Accounting Info"
    And I click on the "Straight-Line Rent" tab
    And I switch to visible frame
    And I click on row from grid "thisDiv" having unique value "01/01/2021" under column header "Begin Date"
      | name             | value         |
      | Name             | SL Schedule 4 |
      | Begin Date       | 01/01/2021    |
      | End Date         | 12/31/2025    |
      | Term Length      | 60.00         |
      | Balance Forward  | $0.00         |
      | Total Commitment | $0.00         |
    And I switch to default frame
    And I click on the "Delete Schedule" action panel button
    And I switch to visible frame
    And I see the "Delete Straight-Line Schedule?" modal window
    And I click on the "Yes" button
    And I switch to default frame
    And I navigate to dashboard page
#    And I see "Unable to delete, some periods have been posted to accounting" message in the header
    And I logout

  Examples:
    | Login User   | Login full username  | Entity Name                         |
    | DeleteAccess | Delete Access Access | Straight Line Deletion Contract-836 |


  Scenario Outline: Inactive Straight line Rent Schedule with Posted Status does not exist in other schedule
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Accounting Info"
    And I click on the "Straight-Line Rent" tab
    And I switch to visible frame
    And I click on row from grid "thisDiv" having unique value "12/31/2020" under column header "End Date"
      | name             | value         |
      | Name             | SL Schedule 4 |
      | Begin Date       | 01/01/2016    |
      | End Date         | 12/31/2020    |
      | Term Length      | 60.00         |
      | Balance Forward  | $0.00         |
      | Total Commitment | $30,000.00    |
    And I switch to default frame
    And I click on the "Delete Schedule" action panel button
    And I switch to visible frame
    And I see the "Delete Straight-Line Schedule?" modal window
    And I click on the "Yes" button
    And I see "Unable to delete, some periods have been posted to accounting" message in the header
    And I switch to visible frame

  Examples:
    | Login User   | Login full username  | Entity Name                         |
    | DeleteAccess | Delete Access Access | Straight Line Deletion Contract-836 |
