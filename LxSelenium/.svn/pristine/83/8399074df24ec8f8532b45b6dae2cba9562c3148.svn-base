@all
Feature: Payment Variance Report (Ref : Jira Ticket No : Automation-760)
  #Issue exist iwms-20106 - fixed

  Scenario Outline: Import the following xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Reports/"
    And I import following file name:
      | PaymentContract(4).xml |
      | PRReport.xml           |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete I verify Report should display correct information after successful run
    When I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name           | value            |
      | Report Name    | PR Report        |
      | Description    |                  |
      | Report Type    | Program          |
      | Saved for?     | Me               |
      | Scheduled Jobs |                  |
    #IWMS-22004
#      | Created By     | <Login full username> |
      | Created By     | <Login username> |

    And I switch to "report" child window
    And I set fields values on editable page
      | name     | value |
      | calMonth | April |
      | calYear  | 2015  |
    And I click on "Next" Button

    And I verify a row from payment variance reports grid "popupBody" having the following header and cell value pair
      | name           | value   |
      | Invoice Amount | $850.00 |
      | Total Amount   | $850.00 |
      | Invoice Amount | $900.00 |
      | Total Amount   | $900.00 |
      | Invoice Amount | $50.00  |
      | Total Amount   | $50.00  |

    Then I verify entity name "<Entity Name>" is clickable
    And I click on "<Entity Name>" link
    And I close report window
    And I switch to main window
    And I verify user is directed to "Summary" tab
    And I navigate to "Payment Info"
    And I click on the "Transactions" tab
    Then I verify a row from grid "thisDiv" having unique value "04/01/2015" under column header "Effective Date"
      | name             | value     |
      | Group            | Base Rent |
      | Type             | Rent      |
      | Category         | Expense   |
      | Vendor           |           |
      | Vendor#          |           |
      | One-Time Expense | No        |
      | Total Amount     | $900.00   |
      | Primary Tax      | $0.00     |
      | Hold Flag        | No        |

    Then I verify a row from grid "thisDiv" having unique value "03/01/2015" under column header "Effective Date"
      | name             | value     |
      | Group            | Base Rent |
      | Type             | Rent      |
      | Category         | Expense   |
      | Vendor           |           |
      | Vendor#          |           |
      | One-Time Expense | No        |
      | Total Amount     | $850.00   |
      | Primary Tax      | $0.00     |
      | Hold Flag        | No        |

    Examples:
      | Login full username  | Entity Name      | Grid ID     | Login username        |
      | Delete Access Access | Payment Contract | ^editBOGrid | Access, Delete Access |

