@all
Feature: (Ref : Jira Ticket No : Automation-1418), Search functionalities-Basic and Advanced

  Scenario Outline: I import files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PaymentDetails/"
    And I import following files:
      | PortfolioAndLocation-1418.xml |
      | SearchFunction-1418.xml       |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Search functionalities-Basic and Advanced - Recurring Expenses
    Given I navigate to entity type "Contracts" named "<Contract Name>" through search option
    And I navigate to second level tab "Payment Info" and third level "Recurring Expenses" tab of entity "Contract"
    And I wait for the Loading text to disappear
    And I verify all rows count "6" in the frame grid "<Grid ID>"
    And I click "Show All" button of frame grid "<Grid ID>"
    And I verify all rows count "7" in the frame grid "<Grid ID>"
    And I search for record "600"
    And I verify all rows count "1" in the frame grid "<Grid ID>"
    Then I verify the following values in frame grid "<Grid ID>"
      | Expense Group | Expense Type | Expense Category | Begin Date | End Date   | Frequency | Period Amount | Annual Amount | Tax #1 | Tax #2 | Tax #3 |
      | Rent          |              |                  | 10/13/2016 | 10/14/2035 | Monthly   | $600.00       | $1,567.74     |        |        |        |
    And I clear search field in the grid "<Grid ID>"
    And I click "Show Page" button of frame grid "<Grid ID>"
    And I verify all rows count "6" in the frame grid "<Grid ID>"
    And I click on "Next Page" button in the grid
    And I verify all rows count "1" in the frame grid "<Grid ID>"
    Then I verify the following values in frame grid "<Grid ID>"
      | Expense Group | Expense Type | Expense Category | Begin Date | End Date   | Frequency | Period Amount | Annual Amount | Tax #1 | Tax #2 | Tax #3 |
      | Utilities     |              |                  | 10/13/2016 | 10/14/2035 | Monthly   | $700.00       | $1,829.03     |        |        |        |
    And I click on "Previous Page" button in the grid
    And I search for record "Utilities"
    And I verify all rows count "1" in the frame grid "<Grid ID>"
    Then I verify the following values in frame grid "<Grid ID>"
      | Expense Group | Expense Type | Expense Category | Begin Date | End Date   | Frequency | Period Amount | Annual Amount | Tax #1 | Tax #2 | Tax #3 |
      | Utilities     |              |                  | 10/13/2016 | 10/14/2035 | Monthly   | $700.00       | $1,829.03     |        |        |        |

    Examples:
      | Contract Name  | Grid ID |
      | SearchFunction | thisDiv |


  Scenario Outline: Search functionalities-Basic and Advanced - Transactions
    Given I navigate to entity type "Contracts" named "<Contract Name>" through search option
    And I navigate to second level tab "Payment Info" and third level "Transactions" tab of entity "Contract"
    And I wait for the Loading text to disappear
    And I verify all rows count "6" in the frame grid "<Grid ID>"
    And I click "Show All" button of frame grid "<Grid ID>"
    And I verify all rows count "7" in the frame grid "<Grid ID>"
    And I search for record "Base Rent"
    And I verify all rows count "1" in the frame grid "<Grid ID>"
    Then I verify the following values in frame grid "<Grid ID>"
      | Effective Date | Group     | Type | Category | Vendor | Vendor# | One-Time Expense | Total Amount | Primary Tax | Hold Flag |
      | 10/14/2016     | Base Rent |      |          |        |         | Yes              | $4.00        |             | No        |
    And I clear search field in the grid "<Grid ID>"
    And I click "Show Page" button of frame grid "<Grid ID>"
    And I verify all rows count "6" in the frame grid "<Grid ID>"
    And I click on "Next Page" button in the grid
    And I verify all rows count "1" in the frame grid "<Grid ID>"
    Then I verify the following values in frame grid "<Grid ID>"
      | Effective Date | Group | Type | Category | Vendor | Vendor# | One-Time Expense | Total Amount | Primary Tax | Hold Flag |
      | 10/14/2016     | CAM   |      |          |        |         | Yes              | $3.00        |             | No        |
    And I click on "Previous Page" button in the grid
    And I search for record "3.00"
    And I verify all rows count "1" in the frame grid "<Grid ID>"
    Then I verify the following values in frame grid "<Grid ID>"
      | Effective Date | Group | Type | Category | Vendor | Vendor# | One-Time Expense | Total Amount | Primary Tax | Hold Flag |
      | 10/14/2016     | CAM   |      |          |        |         | Yes              | $3.00        |             | No        |

    Examples:
      | Grid ID | Contract Name  |
      | thisDiv | SearchFunction |