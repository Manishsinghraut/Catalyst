@all

Feature: (Ref : Jira Ticket No : AUTOMATION-1017), Download Template

  Scenario Outline: Scenario-1: Downloading a blank budget template.

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Import Data" link
    And I wait for the Loading text to disappear in grid
    And I click on the "Spreadsheets"
    And I wait for the Loading text to disappear in grid
    And I set following fields value on editable page
      | name        | value           |
      | handlerType | Budget Template |
    And I click on "Download" Button
    And I download file
    And I wait for the Loading text to disappear in grid
    And I verify file name "LxERPDataImport" of type ".xlsx" downloaded successfully

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Scenario-2: Downloading a specific budget template.

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/"
    And I import following file name:
      | BudgetTemplate(5).xml |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I click "download" row action in the non frame grid "BOGridBudgetTemplate" having the following header and cell values
      | name                 | value           |
      | Budget Template Name | Selenium-Budget |
    And I download file
    And I wait for the Loading text to disappear in grid
    And I use this spreadsheet to compare "target/DownloadFiles/Selenium-Budget.xlsx"
    And I verify the following excel data of row "7"
      | name                                  | value   |
      | BudgetLineLeaf.BudgetLineItemName     | Carpet  |
      | BudgetLineLeaf.LineItemCode           | 1.2     |
      | BudgetLineLeaf.DefaultAmount          | 0.00    |
      | BudgetLineLeaf.IsGroup                | false   |
      | BudgetLineLeaf.OverrunPercent         | 3.00000 |
      | BudgetLineLeaf.ParentBudgetLineItemID | 2.0     |

    And I verify the following excel data of row "8"
      | name                                    | value   |
      | BudgetLineLeaf.BudgetLineItemName       | Doors   |
      | BudgetLineLeaf.LineItemCode             | 1.1     |
      | BudgetLineLeaf.DefaultAmount            | 0.00    |
      | BudgetLineLeaf.IsGroup                  | false   |
      | BudgetLineLeaf.OverrunPercent           | 2.00000 |
      | BudgetLineLeaf.ParentBudgetLineItemID   | 2.0     |
      | BudgetLineLeaf.PreviousBudgetLineItemID | 1.2     |

    And I verify the following excel data of row "10"
      | name                                  | value      |
      | BudgetLineLeaf.BudgetLineItemName     | Playground |
      | BudgetLineLeaf.LineItemCode           | 2.2        |
      | BudgetLineLeaf.DefaultAmount          | 0.00       |
      | BudgetLineLeaf.IsGroup                | false      |
      | BudgetLineLeaf.OverrunPercent         | 2.00000    |
      | BudgetLineLeaf.ParentBudgetLineItemID | 1.0        |

    And I verify the following excel data of row "11"
      | name                                    | value           |
      | BudgetLineLeaf.BudgetLineItemName       | Patio Furniture |
      | BudgetLineLeaf.LineItemCode             | 2.1             |
      | BudgetLineLeaf.DefaultAmount            | 0.00            |
      | BudgetLineLeaf.IsGroup                  | false           |
      | BudgetLineLeaf.OverrunPercent           | 2.00000         |
      | BudgetLineLeaf.ParentBudgetLineItemID   | 1.0             |
      | BudgetLineLeaf.PreviousBudgetLineItemID | 2.2             |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |