@all
Feature: Reports - Generating errors when filtering by fiscal years (Ref : Jira Ticket No : Automation-759)

  Scenario Outline: Import the following xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Reports/"
    And I import following file name:
      | AllowancesContract.xml   |
      | FiscalYearReportTest.xml |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete I verify Report should display correct information after successful run
    When I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name           | value                 |
      | Report Name    | Allowance             |
      | Description    |                       |
      | Report Type    | Entity                |
      | Saved for?     | Me                    |
      | Scheduled Jobs |                       |
    #IWMS-22004
#      | Created By     | <Login full username> |
      | Created By     | Access, Delete Access |

    And I switch to "report" child window
    And I verify a row from reports grid "popupBody" having the following header and cell value pair
      | name            | value                         |
      | Name            | Allowances test               |
      | Allowance Group | Rent                          |
      | Allowance Type  | Cash                          |
      | End Date        | 03/01/2015                    |
      | Due Date        | 10/05/2011                    |
      | Notes           | $50 penalty for late payment. |
    And I click on "<Entity Name>" link
    And I close report window
    And I switch to main window
    And I verify user is directed to "Summary" tab
    And I navigate to "Payment Info"
    And I click on the "Allowances" tab
    And I verify a row from grid "thisDiv" having unique value "Rent" under column header "Group"
      | name          | value      |
      | Group         | Rent       |
      | Type          | Cash       |
      | Begin Date    | 03/01/2012 |
      | End Date      | 03/01/2015 |
      | Total Amount  | $5,000.00  |
      | Currency Type |            |
      | Amendment     |            |

    And I verify a row from grid "BOGridAllowanceTransaction" having unique value "10/05/2011" under column header "Request Date"
      | name             | value                         |
      | Amount Requested | $5,000.00                     |
      | Due Date         | 10/05/2011                    |
      | Received Date    | 10/10/2011                    |
      | Amount Received  | $5,000.00                     |
      | Penalty Amount   | $50.00                        |
      | Description      | $50 penalty for late payment. |

    Examples:
      | Login full username  | Entity Name     | Grid ID     |
      | Delete Access Access | Allowances test | ^editBOGrid |

