@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1203), Sort Budget line item on Capital Program tab

  Scenario Outline: As a delete user I import the following xmls in the following order

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/CapitalProgram/RollUpBudgets/"
    And I import following files:
      | BudgetTemplate-1203.xml     |
      | BudgetColumns-1203.xml      |
      | BudgetSummary Sort-1203.xml |
      | Entity-1203.xml             |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Page Layout Name>" sub row in the grid "main"
    And I switch to "Edit Layout" child window
    And I set following fields value on editable page
      | name                             | value |
      | _checkbox_ValidForCapitalProgram | true  |
      | _checkbox_ValidForCapitalProject | true  |
    And I click on "Update" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Page Layout Name |
      | DeleteAccess | Delete Access Access | Sort Summary     |

  Scenario Outline: Verify Column cost calculations shall no longer be displayed on the Summary page

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Capital Program" named "Sort Capital Program" through search option
    And I click on "Budget" tab
    And I click on the "Budget Summary" action panel button
    And I select "<Page Layout Name>" page layout from dropdown
    And I verify the following values in frame grid "putTheGridHere"
      |                                       |
      | Sort Facility A: Sort Capital Program |
      | Sort Facility B: Sort Capital Program |
      | Sort Facility C: Sort Capital Program |
      | Sort Capital Program Total            |
    And I verify the following values in frame grid "$normal"
      | Cost Calculations | Post Curing | PreApproved Cost | Technical Cost |
      | $2,000.00         | $9,000.00   | $5,000.00        | $4,500.00      |
      | $3,333.00         | $4,500.00   | $7,500.00        | $6,800.00      |
      | $6,500.00         | $1,000.00   | $2,000.00        | $8,700.00      |
      | $11,833.00        | $14,500.00  | $14,500.00       | $20,000.00     |
    And I deselect the following header items exist for column header "Cost Calculations" in the grid "$normal"
      | Cost Calculations |
    And I verify the following headers not present in frame grid "$normal"
      | Cost Calculations |
    And I expand the following
      | Sort Facility A: Sort Capital Program |
    And I verify the following values in frame grid "putTheGridHere"
      |                                       |
      | Sort Facility A: Sort Capital Program |
      | Capital                               |
      | Lse Acq Costs-New                     |
      | Lse Acq Cost                          |
      | Land-New                              |
      | Land                                  |
      | Misc Land Costs                       |
      | Soft Costs-New                        |
      | Legal Costs                           |
      | Consulting Services                   |
      | Environmental Services                |
      | Permits/Fees                          |
      | Overhead Costs                        |
      | Misc Soft Costs                       |
      | Construction                          |
    And I verify the following values in budget summary grid "$normal"
      | Post Curing | PreApproved Cost | Technical Cost |
      | $9,000.00   | $5,000.00        | $4,500.00      |
      | $9,000.00   | $5,000.00        | $4,500.00      |
      | $0.00       | $5,000.00        | $0.00          |
      | $0.00       | $5,000.00        | $0.00          |
      | $0.00       | $0.00            | $0.00          |
      | $0.00       | $0.00            | $0.00          |
      | $0.00       | $0.00            | $0.00          |
      | $9,000.00   | $0.00            | $0.00          |
      | $9,000.00   | $0.00            | $0.00          |
      | $0.00       | $0.00            | $0.00          |
      | $0.00       | $0.00            | $0.00          |
      | $0.00       | $0.00            | $0.00          |
      | $0.00       | $0.00            | $0.00          |
      | $0.00       | $0.00            | $0.00          |
      | $0.00       | $0.00            | $4,500.00      |

    Examples:
      | Page Layout Name | Login User   | Login full username  |
      | RollUps          | DeleteAccess | Delete Access Access |