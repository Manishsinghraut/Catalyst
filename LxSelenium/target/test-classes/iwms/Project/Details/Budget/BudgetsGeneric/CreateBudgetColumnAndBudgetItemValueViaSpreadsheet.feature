@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1078), Create Budget Column and Budget item value via Spreadsheet

  Scenario Outline: As a delete user I add budget summary page

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric"
    And I import following file name:
      | BudgetTemplate1078.xml       |
      | BudgetForCapitalProjects.xml |

    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click on "Add" Button
    And I switch to "Budget Summary Page Creation" child window
    And I set following fields value on editable page
      | name                             | value              |
      | PageLayoutName                   | <Page Layout Name> |
      | Description                      | Automation-1078    |
      | _checkbox_ValidForCapitalProject | true               |
    And I verify the following fields value on editable page
      | name                             | value              |
      | PageLayoutName                   | <Page Layout Name> |
      | Description                      | Automation-1078    |
      | _checkbox_ValidForCapitalProject | true               |

    And I click on "Add" Button
    And I switch to main window
    And I see "Successfully added item" message in the grid
    And I click "build layout" action of "<Page Layout Name>" sub row in the grid "main"
    And I switch to "Build Layout" child window
    And I wait for the Loading text to disappear in grid
    And I expand the following
      | Available Fields |
      | Budget Types     |
    Then I drag and drop the following
      | Capital Project Budget Type |
    And I click on "Save Layout" Button
    And I click on "Close" Button
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Page Layout Name        |
      | DeleteAccess | Delete Access Access | Capital Project Summary |

  Scenario Outline: As a delete Create Budget Column and Budget item value via Spreadsheet

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric"
    And I import following file name:
      | BudgetCreationandValueAddedSS.xlsx |

    And I Search for the "Budget for Capital project 1" that was created
    And Click on the name of the "Budget for Capital project 1" in the results pop-up
    Then I see "Budget for Capital project 1" name on the header
    And I click on "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name                                         | Description | Status         | Contractor        | Total      |
      | Capital Project Budget Type - Selenium-Employer #01 |             | Default Status | Selenium-Employer | $10,000.00 |

    And I click on the "Budget Summary" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I switch to visible frame
    And I click on the "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | Capital Project Budget Type |
      | Exterior                           | $3,000.00                   |
      | Carpet                             | $2,000.00                   |
      | Doors                              | $1,000.00                   |
      | Interior                           | $7,000.00                   |
      | Playground                         | $4,000.00                   |
      | Patio Furniture                    | $3,000.00                   |
      | Total                              | $10,000.00                  |

    And I Search for the "Budget for Capital project 2" that was created
    And Click on the name of the "Budget for Capital project 2" in the results pop-up
    Then I see "Budget for Capital project 2" name on the header
    And I click on "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name                                         | Description | Status         | Contractor        | Total      |
      | Capital Project Budget Type - Selenium-Employer #01 |             | Default Status | Selenium-Employer | $26,000.00 |

    And I click on the "Budget Summary" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I switch to visible frame
    And I click on the "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | Capital Project Budget Type |
      | Exterior                           | $11,000.00                  |
      | Carpet                             | $6,000.00                   |
      | Doors                              | $5,000.00                   |
      | Interior                           | $15,000.00                  |
      | Playground                         | $8,000.00                   |
      | Patio Furniture                    | $7,000.00                   |
      | Total                              | $26,000.00                  |

    And I Search for the "Budget for Capital project 3" that was created
    And Click on the name of the "Budget for Capital project 3" in the results pop-up
    Then I see "Budget for Capital project 3" name on the header
    And I click on "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name                                         | Description | Status         | Contractor        | Total      |
      | Capital Project Budget Type - Selenium-Employer #01 |             | Default Status | Selenium-Employer | $14,600.00 |

    And I click on the "Budget Summary" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I switch to visible frame
    And I click on the "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | Capital Project Budget Type |
      | Exterior                           | $7,100.00                   |
      | Carpet                             | $3,600.00                   |
      | Doors                              | $3,500.00                   |
      | Interior                           | $7,500.00                   |
      | Playground                         | $3,800.00                   |
      | Patio Furniture                    | $3,700.00                   |
      | Total                              | $14,600.00                  |


    And I Search for the "Budget for Capital project 4" that was created
    And Click on the name of the "Budget for Capital project 4" in the results pop-up
    Then I see "Budget for Capital project 4" name on the header
    And I click on "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name                                         | Description | Status         | Contractor        | Total      |
      | Capital Project Budget Type - Selenium-Employer #01 |             | Default Status | Selenium-Employer | $16,600.00 |

    And I click on the "Budget Summary" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I switch to visible frame
    And I click on the "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | Capital Project Budget Type |
      | Exterior                           | $8,100.00                   |
      | Carpet                             | $4,100.00                   |
      | Doors                              | $4,000.00                   |
      | Interior                           | $8,500.00                   |
      | Playground                         | $4,300.00                   |
      | Patio Furniture                    | $4,200.00                   |
      | Total                              | $16,600.00                  |


    And I Search for the "Budget for Capital project 5" that was created
    And Click on the name of the "Budget for Capital project 5" in the results pop-up
    Then I see "Budget for Capital project 5" name on the header
    And I click on "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name                                         | Description | Status         | Contractor        | Total      |
      | Capital Project Budget Type - Selenium-Employer #01 |             | Default Status | Selenium-Employer | $20,600.00 |

    And I click on the "Budget Summary" action panel button
    And I select "<Summary Page>" page layout from dropdown
    And I switch to visible frame
    And I click on the "<Expand All>" link
    And I verify the following values in frame grid
      | Name  <Collapse All>  <Hide Empty> | Capital Project Budget Type |
      | Exterior                           | $10,100.00                  |
      | Carpet                             | $5,100.00                   |
      | Doors                              | $5,000.00                   |
      | Interior                           | $10,500.00                  |
      | Playground                         | $5,300.00                   |
      | Patio Furniture                    | $5,200.00                   |
      | Total                              | $20,600.00                  |


    Examples:
      | Login User   | Login full username  | Summary Page            |
      | DeleteAccess | Delete Access Access | Capital Project Summary |