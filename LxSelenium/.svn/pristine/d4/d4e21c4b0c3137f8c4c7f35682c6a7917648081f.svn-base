@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1072), Duplicate Budget Template from another template

  Scenario Outline: As a delete user I import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following file name:
      | BudgetTemplate1072.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I create Budget Template from the existing budget template

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    #Verify original template
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I click "layout" row action in the non frame grid "BOGridBudgetTemplate" having the following header and cell values
      | name                 | value           |
      | Budget Template Name | <Template Name> |
    And I click on the "<Expand All>" link

    And I verify the following grid "main" values in non frame
      | Name  <Collapse All> |  |  |                                        | Line Item Code | Category Code | Description | Default Amount |
      | Exterior             |  |  | <Add Group><Add Line Item><Deactivate> | 2.0            |               |             | $0.00          |
      | Carpet               |  |  | <Deactivate>                           | 1.2            |               |             | $0.00          |
      | Doors                |  |  | <Deactivate>                           | 1.1            |               |             | $0.00          |
      | Interior             |  |  | <Add Group><Add Line Item><Deactivate> | 1.0            |               |             | $0.00          |
      | Playground           |  |  | <Deactivate>                           | 2.2            |               |             | $0.00          |
      | Patio Furniture      |  |  | <Deactivate>                           | 2.1            |               |             | $0.00          |

#    #Add duplicate budget template
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I click on "Add Budget Template..." button in grid
    Then I see the "Add Budget Template  ***Required fields in red" modal window
    And I set following fields value on editable page
      | name                            | value                     |
      | TemplateName                    | <Duplicate Template Name> |
      | Description                     | Testing Automation-1072   |
      | Notes                           | Automation test           |
      | _checkbox_IsValidForPortfolio   | true                      |
      | _checkbox_IsValidForOpenProject | true                      |
      | BudgetTemplateID                | <Template Name>           |
    And I click on the "Add" button
    And I wait for modal window to close
#    IWMS-22139
#    Then I see "Successfully added Budget Template" in the grid header
    Then I verify success message "Successfully added Budget Template" in non frame page
    Then I verify the following values in non frame grid "BOGridBudgetTemplate"
      | Budget Template Name      | Description             |
      | <Duplicate Template Name> | Testing Automation-1072 |

    And I click "layout" row action in the non frame grid "BOGridBudgetTemplate" having the following header and cell values
      | name                 | value                     |
      | Budget Template Name | <Duplicate Template Name> |
      | Description          | Testing Automation-1072   |
    And I click on the "<Expand All>" link

    And I verify the following grid "main" values in non frame
      | Name  <Collapse All> |  |  |                                        | Line Item Code | Category Code | Description | Default Amount |
      | Exterior             |  |  | <Add Group><Add Line Item><Deactivate> | 2.0            |               |             | $0.00          |
      | Carpet               |  |  | <Deactivate>                           | 1.2            |               |             | $0.00          |
      | Doors                |  |  | <Deactivate>                           | 1.1            |               |             | $0.00          |
      | Interior             |  |  | <Add Group><Add Line Item><Deactivate> | 1.0            |               |             | $0.00          |
      | Playground           |  |  | <Deactivate>                           | 2.2            |               |             | $0.00          |
      | Patio Furniture      |  |  | <Deactivate>                           | 2.1            |               |             | $0.00          |


    Examples:
      | Login User   | Login full username  | Template Name   | Duplicate Template Name   |
      | DeleteAccess | Delete Access Access | Selenium-Budget | Duplicate-Selenium-Budget |