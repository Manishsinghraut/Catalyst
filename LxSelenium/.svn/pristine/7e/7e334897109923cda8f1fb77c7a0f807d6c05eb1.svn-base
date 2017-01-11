@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1176), Budget Value Spreadsheet

  Scenario Outline: As a delete user I import the following xmls in the following order
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/"
    And I import following files:
      | BudgetTemplate-1176.xml              |
      | UpdateBudgetColumn-1176.xml          |
      | Budget_Value_Update_Project-1176.xml |
      | UpdateBudgetSummaryPage-1176.xml     |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I click "layout" row action in the non frame grid "BOGridBudgetTemplate" having the following header and cell values
      | name                 | value             |
      | Budget Template Name | <Budget Template> |
    And I click on "<Expand All>" link
    And I wait for the Loading text to disappear in grid
    And I assert the row position of budget line items in the grid "main"
      | Name  <Collapse All> |  |  |                                        | Line Item Code | Category Code | Description | Default Amount |
      | Exterior             |  |  | <Add Group><Add Line Item><Deactivate> | 2.0            |               |             | $0.00          |
      | Carpet               |  |  | <Deactivate>                           | 1.2            |               |             | $0.00          |
      | Doors                |  |  | <Deactivate>                           | 1.1            |               |             | $0.00          |
      | Interior             |  |  | <Add Group><Add Line Item><Deactivate> | 1.0            |               |             | $0.00          |
      | Playground           |  |  | <Deactivate>                           | 2.2            |               |             | $0.00          |
      | Patio Furniture      |  |  | <Deactivate>                           | 2.1            |               |             | $0.00          |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I verify the following values in non frame grid "BOGridBudgetColumnType"
      | Name          | Selected Status | Are Budget Values Editable? | Use this Budget View | Allow one instance of this type per project | Allow multiple instances with Selected Status | Used For Bidding | Used For Bid Conditioning |
      | <Budget Type> | Default Status  | checked                     |                      | unchecked                                   | checked                                       | unchecked        | unchecked                 |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Summary Page>" sub row in the grid "main"
    And I switch to "Edit Summary Page" child window
    And I wait for browser windows count to be equal to "2"
    And I set following fields value on editable page
      | name                      | value |
      | _checkbox_ValidForProject | true  |
    And I click on "Update" Button
    And I switch to main window

    And I click "build layout" action of "<Summary Page>" sub row in the grid "main"
    And I switch to "Page Layout" child window
    And I wait for browser windows count to be equal to "2"
    And I verify the "Layout: Update Budget Summary Page, Table: BudgetColumnType" page header
    And I verify the "Update Budget Value " field is displayed on Form layout
    And I click on "Close" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | <Budget Type> |
      | Exterior                           | $3,000.00     |
      | Carpet                             | $1,000.00     |
      | Doors                              | $2,000.00     |
      | Interior                           | $7,000.00     |
      | Playground                         | $3,000.00     |
      | Patio Furniture                    | $4,000.00     |
      | Total                              | $10,000.00    |

    Examples:
      | Login User   | Login full username  | Budget Type         | Summary Page               | Entity Name                      | Budget Template |
      | DeleteAccess | Delete Access Access | Update Budget Value | Update Budget Summary Page | Budget Value Update Project-1176 | Selenium-Budget |


  Scenario Outline: As a delete user I import the following spreadsheet
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/"
    And I import following files:
      | Update Budget-1176.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | <Budget Type> |
      | Exterior                           | $11,000.00    |
      | Carpet                             | $5,000.00     |
      | Doors                              | $6,000.00     |
      | Interior                           | $15,000.00    |
      | Playground                         | $7,000.00     |
      | Patio Furniture                    | $8,000.00     |
      | Total                              | $26,000.00    |


    Examples:
      | Login User   | Login full username  | Budget Type         | Summary Page               | Entity Name                      |
      | DeleteAccess | Delete Access Access | Update Budget Value | Update Budget Summary Page | Budget Value Update Project-1176 |