@all
Feature: (Jira Ref : AUTOMATION-693) As an IWMS user I need to be able to Deleting active/Inactive Straight line Rent Schedule with Posted Status does exist in other schedules

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

  Scenario Outline: I want Successfully import the attached XMLS i.e SL1.XML and SL4.XML
    When I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    Then I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following file name:
      | SL1-693.xml |
      | SL4-693.xml |
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
      | Contract | Payment Info     | Recurring Expenses | Straight Line Deletion Contract_693 |

  Scenario Outline: I want to verify accounting info > straight line rent
    When I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to dashboard page
#    Then I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "thisDiv" having unique value "SL Schedule 4" under column header "Name"
      | name                | value      |
      | Begin Date          | 01/01/2016 |
      | End Date            | 12/31/2020 |
      | Term Length         | 60.00      |
      | Balance Forward     | $0.00      |
      | Total Commitment    | $30,000.00 |
      | Last Balance Posted |            |
      | Last Posted Date    |            |
      | Inactive Date       |            |
      | Notes               |            |

    Examples:
      | Item     | Second Level Tab | Third Level Tab    | Entity Name                         |
      | Contract | Accounting Info  | Straight-Line Rent | Straight Line Deletion Contract_693 |


  Scenario Outline: I Active Single Straight line Rent Schedule with Posted Status
    When I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to dashboard page
#    Then I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Change Status" action panel button
    And I set following fields value on editable page
      | name             | value                               |
      | desiredStatus    | Posted                              |
      | desiredEntity    | Straight Line Deletion Contract_693 |
      | CodeSLScheduleID | SL Schedule 4                       |
      | minDate          | 01/01/2016                          |
      | maxDate          | 12/31/2020                          |
    And I click on the "Update" button
    And I click on the "Close" button
    And I verify a row from grid "thisDiv" having unique value "SL Schedule 4" under column header "Name"
      | name                | value      |
      | Begin Date          | 01/01/2016 |
      | End Date            | 12/31/2020 |
      | Term Length         | 60.00      |
      | Balance Forward     | $0.00      |
      | Total Commitment    | $30,000.00 |
      | Last Balance Posted |            |
      | Last Posted Date    |            |
      | Inactive Date       |            |
      | Notes               |            |
    And I click row from grid "thisDiv" having unique value "SL Schedule 4"
    And I verify a row from grid "BOGridSLPeriod" having unique value "2016" under column header "Year"
      | name   | value  |
      | Status | Posted |

    Examples:
      | Item     | Second Level Tab | Third Level Tab    | Entity Name                         |
      | Contract | Accounting Info  | Straight-Line Rent | Straight Line Deletion Contract_693 |

  Scenario Outline: I want Successfully import the attached XMLS i.e SL5.XML
    When I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    Then I import following file name:
      | SL5-693.xml |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "thisDiv" having unique value "120.00" under column header "Term Length"
      | name                | value      |
      | Begin Date          | 01/01/2016 |
      | End Date            | 12/31/2025 |
      | Term Length         | 120.00     |
      | Balance Forward     | $0.00      |
      | Total Commitment    | $30,000.00 |
      | Last Balance Posted | $0.00      |
      | Last Posted Date    |            |
      | Inactive Date       |            |
      | Notes               |            |

    Examples:
      | Item     | Second Level Tab | Third Level Tab    | Entity Name                         |
      | Contract | Accounting Info  | Straight-Line Rent | Straight Line Deletion Contract_693 |

  Scenario Outline: I verify the SL Schedule 4 Active Straight-line Schedule and Status should be changed to Posted
    When I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to dashboard page
#    Then I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Change Status" action panel button
    And I set following fields value on editable page
      | name             | value                               |
      | desiredStatus    | Posted                              |
      | desiredEntity    | Straight Line Deletion Contract_693 |
      | CodeSLScheduleID | SL Schedule 4                       |
      | minDate          | 01/01/2016                          |
      | maxDate          | 12/31/2025                          |
    And I click on the "Update" button
    And I click on the "Close" button
    And I verify a row from grid "thisDiv" having unique value "120.00" under column header "Term Length"
      | name                | value      |
      | Begin Date          | 01/01/2016 |
      | End Date            | 12/31/2025 |
      | Term Length         | 120.00     |
      | Balance Forward     | $0.00      |
      | Total Commitment    | $30,000.00 |
      | Last Balance Posted | $0.00      |
      | Last Posted Date    |            |
      | Inactive Date       |            |
      | Notes               |            |
    And I click row from grid "thisDiv" having unique value "120.00"
    And I verify a row from grid "BOGridSLPeriod" having unique value "2016" under column header "Year"
      | name   | value  |
      | Status | Posted |

    Examples:
      | Item     | Second Level Tab | Third Level Tab    | Entity Name                         |
      | Contract | Accounting Info  | Straight-Line Rent | Straight Line Deletion Contract_693 |

  Scenario Outline: Active Straight line Rent Schedule with Posted Status does exist in other schedules
    When I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to dashboard page
    And I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    Then I import following file name:
      | SL6-693.xml |
#    And I navigate to entity type "<Item>" named "<Entity Name>"
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "thisDiv" having unique value "01/01/2021" under column header "Begin Date"
      | name                | value         |
      | Name                | SL Schedule 4 |
      | Begin Date          | 01/01/2021    |
      | End Date            | 12/31/2025    |
      | Term Length         | 60.00         |
      | Balance Forward     | $0.00         |
      | Total Commitment    | $0.00         |
      | Last Balance Posted | $0.00         |
      | Last Posted Date    |               |
      | Inactive Date       |               |
      | Notes               |               |
    And I click row from grid "thisDiv" having unique value "01/01/2021"
    And I click on the "Delete Schedule" action panel button
    And I click on the "Yes" button in message box
    And I verify success message "Successfully deleted Straight-Line Schedule"
    And I logout

    Examples:
      | Item     | Second Level Tab | Third Level Tab    | Entity Name                         |
      | Contract | Accounting Info  | Straight-Line Rent | Straight Line Deletion Contract_693 |

  Scenario Outline: Inactive Straight line Rent Schedule with Posted Status does exist in other schedules
    When I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to dashboard page
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
#    Then I navigate to entity type "<Item>" named "<Entity Name>"
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "thisDiv" having unique value "12/31/2020" under column header "End Date"
      | name                | value         |
      | Name                | SL Schedule 4 |
      | Begin Date          | 01/01/2016    |
      | End Date            | 12/31/2020    |
      | Term Length         | 60.00         |
      | Balance Forward     | $0.00         |
      | Total Commitment    | $30,000.00    |
      | Last Balance Posted | $0.00         |
      | Last Posted Date    |               |
      | Inactive Date       |               |
      | Notes               |               |
    And I click row from grid "thisDiv" having unique value "01/01/2021"
    And I click on the "Delete Schedule" action panel button
    And I click on the "Yes" button in message box
    And I verify success message "Successfully deleted Straight-Line Schedule"
    And I logout

    Examples:
      | Item     | Second Level Tab | Third Level Tab    | Entity Name                         |
      | Contract | Accounting Info  | Straight-Line Rent | Straight Line Deletion Contract_693 |
