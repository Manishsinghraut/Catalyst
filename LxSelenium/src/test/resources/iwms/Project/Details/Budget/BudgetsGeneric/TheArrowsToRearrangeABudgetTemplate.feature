@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1068), The arrows to rearrange a budget template

  Scenario Outline: As a delete user I import the xml

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric"
    And I import following file name:
      | RearrangingBudget.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete use the arrows to rearrange a budget template

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I click "layout" row action in the non frame grid "BOGridBudgetTemplate" having the following header and cell values
      | name                 | value             |
      | Budget Template Name | <Budget Template> |
    And I assert the row position of budget line items in the grid "main"
      | Name  <Expand All> |  |  |                                        | Line Item Code | Category Code | Description | Default Amount |
      | Research           |  |  | <Add Group><Add Line Item><Deactivate> | 30             |               |             | $0.00          |
      | Construction       |  |  | <Add Group><Add Line Item><Deactivate> | 20             |               |             | $0.00          |
      | Equipment          |  |  | <Add Group><Add Line Item><Deactivate> | 10             |               |             | $0.00          |
    And I click "down" arrow of the line item "Research"
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I click "layout" row action in the non frame grid "BOGridBudgetTemplate" having the following header and cell values
      | name                 | value             |
      | Budget Template Name | <Budget Template> |
    And I assert the row position of budget line items in the grid "main"
      | Name  <Expand All> |  |  |                                        | Line Item Code | Category Code | Description | Default Amount |
      | Construction       |  |  | <Add Group><Add Line Item><Deactivate> | 20             |               |             | $0.00          |
      | Research           |  |  | <Add Group><Add Line Item><Deactivate> | 30             |               |             | $0.00          |
      | Equipment          |  |  | <Add Group><Add Line Item><Deactivate> | 10             |               |             | $0.00          |
    And I click "up" arrow of the line item "Equipment"
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I click "layout" row action in the non frame grid "BOGridBudgetTemplate" having the following header and cell values
      | name                 | value             |
      | Budget Template Name | <Budget Template> |
    And I assert the row position of budget line items in the grid "main"
      | Name  <Expand All> |  |  |                                        | Line Item Code | Category Code | Description | Default Amount |
      | Construction       |  |  | <Add Group><Add Line Item><Deactivate> | 20             |               |             | $0.00          |
      | Equipment          |  |  | <Add Group><Add Line Item><Deactivate> | 10             |               |             | $0.00          |
      | Research           |  |  | <Add Group><Add Line Item><Deactivate> | 30             |               |             | $0.00          |
    And I click "up" arrow of the line item "Equipment"
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I click "layout" row action in the non frame grid "BOGridBudgetTemplate" having the following header and cell values
      | name                 | value             |
      | Budget Template Name | <Budget Template> |
    And I assert the row position of budget line items in the grid "main"
      | Name  <Expand All> |  |  |                                        | Line Item Code | Category Code | Description | Default Amount |
      | Equipment          |  |  | <Add Group><Add Line Item><Deactivate> | 10             |               |             | $0.00          |
      | Construction       |  |  | <Add Group><Add Line Item><Deactivate> | 20             |               |             | $0.00          |
      | Research           |  |  | <Add Group><Add Line Item><Deactivate> | 30             |               |             | $0.00          |


    Examples:
      | Login User   | Login full username  | Budget Template   |
      | DeleteAccess | Delete Access Access | RearrangingBudget |