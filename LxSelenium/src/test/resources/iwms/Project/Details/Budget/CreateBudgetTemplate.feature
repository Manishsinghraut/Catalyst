@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1021), Create Budget Template

  Scenario Outline: Create Budget Template

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I click on "Add Budget Template..." button in grid
    Then I see the "Add Budget Template  ***Required fields in red" modal window
    And I set following fields value on editable page
      | name                            | value                   |
      | TemplateName                    | <Template Name>         |
      | Description                     | Testing Automation-1021 |
      | Notes                           | Automation test         |
      | _checkbox_IsValidForPortfolio   | true                    |
      | _checkbox_IsValidForOpenProject | true                    |
    And I click on the "Add" button
    And I wait for modal window to close
#    Then I see "Successfully added Budget Template" in the grid header
    Then I verify success message "Successfully added Budget Template" in non frame page
    Then I verify the following values in non frame grid "BOGridBudgetTemplate"
      | Budget Template Name | Description             |
      | <Template Name>      | Testing Automation-1021 |

    And I click "layout" row action in the non frame grid "BOGridBudgetTemplate" having the following header and cell values
      | name                 | value                   |
      | Budget Template Name | <Template Name>         |
      | Description          | Testing Automation-1021 |

    And I click on the "<Add Root Group>" link
    And I switch to "Modifying this template" child window
    And I verify the following text in a page
      | Modifying this template will modify all budgets using it as well. Are you sure? |

    And I click on "Yes" Button
    And I set following fields value on editable page
      | name               | value                               |
      | BudgetLineItemName | Excavation 12                       |
      | LineItemCode       | 01                                  |
      | OverrunPercent     | 100                                 |
      | CodeCSIIDMaster_   | Division 09 - Finishes              |
      | CodeCSIID_         | 0170 - Maintenance of Wall Finishes |
    And I click on "Add" Button
    And I switch to main window
#    Then I see "Successfully added Budget Group" message in the header
    Then I verify success message "Successfully added Budget Group" in non frame page
    And I verify a row from reports grid "main" having the following header and cell value pair
      | name           | value        |
      | Name           | <Group Name> |
      | Line Item Code | 01           |
      | Category Code  |              |
      | Description    |              |
      | Default Amount | $0.00        |

    And I click on the "<Add Line Item>" link
    And I switch to "Modifying this template" child window
    And I verify the following text in a page
      | Modifying this template will modify all budgets using it as well. Are you sure? |

    And I click on "Yes" Button
    And I set these field values on editable page
      | name               | value       |
      | BudgetLineItemName | <Sub Group> |
      | LineItemCode       | 001         |
      | OverrunPercent     | 100         |
    And I click on "Add" Button
    And I switch to main window
#    Then I see "Successfully added Budget Item" message in the header
    Then I verify success message "Successfully added Budget Item" in non frame page
    And I click on the "<Expand All>" link
    And I verify a row from reports grid "main" having the following header and cell value pair
      | name           | value       |
      | Name           | <Sub Group> |
      | Line Item Code | 001         |
      | Category Code  |             |
      | Description    |             |
      | Default Amount | $0.00       |


    Examples:
      | Login User   | Login full username  | Template Name               | Group Name    | Sub Group           |
      | DeleteAccess | Delete Access Access | Multi Testing Template-1021 | Excavation 12 | Line Item Levelling |