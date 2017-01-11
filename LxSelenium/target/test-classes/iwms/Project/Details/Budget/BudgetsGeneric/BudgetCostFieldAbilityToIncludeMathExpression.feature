@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1076), Budget Cost Field - ability to include math expression

  Scenario Outline: As a delete user I import the following xmls in the following order
  1. Budget Type
  2. Budget Template
  3. Form with custom list
  3. Project entity

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following file name:
      | BudgetTemplate1076.xml  |
      | BudgetType1076.xml      |
      | FormWithCL1076.xml      |
      | TestCostProject1076.xml |
    And I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    And I verify the following values in non frame grid "BOGridCodeIssueType"
      | Name        | Description |
      | Budget Cost |             |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I verify the following values in non frame grid "BOGridBudgetColumnType"
      | Name                 | Selected Status | Are Budget Values Editable? | Use this Budget View | Allow one instance of this type per project | Allow multiple instances with Selected Status | Used For Bidding | Used For Bid Conditioning |
      | BudgetTestCostColumn | Default Status  | unchecked                   |                      | checked                                     | unchecked                                     | unchecked        | unchecked                 |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I verify the following values in non frame grid "BOGridBudgetTemplate"
      | Budget Template Name | Description                                     |
      | Selenium-Budget      | Selenium Budget template for Automation Testing |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click on "Add" Button
    And I switch to "Budget Summary Page Creation" child window
    And I set following fields value on editable page
      | name                      | value                      |
      | PageLayoutName            | <Summary Page>             |
      | Description               | To calculate yearly budget |
      | _checkbox_ValidForProject | true                       |

    And I click on "Add" Button
    And I switch to main window
    And I see "Successfully added item" message in the grid
    And I verify a row from reports grid "main" having the following header and cell value pair
      | name             | value          |
      | Page Layout Name | <Summary Page> |

    And I click "build layout" action of "<Summary Page>" sub row in the grid "main"
    And I switch to "Build Layout" child window
    And I wait for the Loading text to disappear in grid
    And I expand the following
      | Available Fields |
      | Budget Types     |
    Then I drag and drop the following
      | BudgetTestCostColumn |
    And I click on "Save Layout" Button
    And I click on "Close" Button
    And I switch to main window

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
#    And I click on the "<Expand All>" link
    And I click " Expand All " button
    And I click on the "<Check Out>" link
    And I wait for " " modal window to open in non frame page
    And I set following fields value on editable page
      | name          | value     |
      | Issue_Subject | Cost Test |

    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Budget | Price | Quantity |
      | Carpet | 2000  | 2        |
    And I click "Update" button
    And I verify the following values in non frame grid "^customListGrid"
      | Budget | Price     | Quantity | TotalCost |
      | Carpet | $2,000.00 | 2        | $4,000.00 |

    Examples:
      | Login User   | Login full username  | Summary Page             | Entity Name       |
      | DeleteAccess | Delete Access Access | Budget Cost Summary Page | Test Cost Project |