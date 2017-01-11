@all
Feature: Actions on Conditional Workflow should reflect correctly as JavaScript Enabled (Ref : Jira Ticket No : AUTOMATION-1364)

  Scenario Outline: As a delete user i import the files

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/WorkFlow/"
    And I import following file name:
#      | Sprint17PortfolioAndLocation_1364.xml |
#      | WFBudgetTemplate-15718_1364.xml       |
#      | TotalColumn-15718_1364.xml            |
#      | Forms-15718_1364.xml                  |
#      | ConditionalWF-15718_1364.xml          |
      | ConditionalWFProject-15718_1364.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Navigate to "WFRProject" and add "WFMemberOne 1263" as the assignee, approver, and notifee to the first step of "ReplaceWF"
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click "Add Form..." button of frame grid "BOGridLX_Grid_Issue"
    And I switch to default frame
    And I select form type "KickoffConditionalWF" in modal window
    And I click on the "OK" button
    And I click on the "Add" button
    And I wait for modal window to close

    Examples:
      | Entity Name                | Third Level Tab |
      | ConditionalWFProject-15718 | Forms           |

  Scenario Outline: As a delete user I verify The pop-up will display the evaluated JavaScript.
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    Then I verify the following values in frame grid "BOGridLX_Grid_WorkFlow"
      | Name                | Title          | Status                        | Days Open | Begun          | Completed | Active Step | Due Date       | Current Assignee | Current Approver     |
      | ConditionalWF-15718 | [Today's Date] | ACTIVE (Waiting for approval) | 0         | [Today's Date] |           | 1           | [Today's Date] |                  | Delete Access Access |

    And I click on button contains text "Expand All"
    And I click on the "Budget stuff - BudgetForm-15718" link
    And I switch to default frame
    And I click on "Check Out" Button

    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Budget      | Quantity | Budget Cost |
      | Dual boiler | 1        | 100000      |
    And I click on the "Update" button "on pop window"

    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Budget         | Quantity | Budget Cost |
      | Solenoid value | 1        | 120000      |
    And I click on the "Update" button "on pop window"

    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Budget     | Quantity | Budget Cost |
      | Steam wand | 2        | 50000       |
    And I click on the "Update" button "on pop window"

    And I click on "Update" button
    And I click on "Close" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear
    And I click on "edit" link of step "Budget stuff - BudgetForm-15718" in work flow
    And I switch to default frame
    And I wait for modal window to open
    And I verify a "if (requestedA <250000)" on "Step status appears to be valid Popup window"
    And I verify a "{ ActionEnabled = true; }" on "Step status appears to be valid Popup window"
    And I verify a "ActionEnabled=false" on "Step status appears to be valid Popup window"
    And I verify a "requestedA=320000.00" on "Step status appears to be valid Popup window"

    And I verify a "if (requestedA >250000)" on "Step status appears to be valid Popup window"
    And I verify a "{ ActionEnabled = true; }" on "Step status appears to be valid Popup window"
    And I verify a "ActionEnabled=true" on "Step status appears to be valid Popup window"
    And I click on the "Close" button
    And I wait for modal window to close

    Examples:
      | Entity Name                | Third Level Tab |
      | ConditionalWFProject-15718 | Work Flow       |

  Scenario Outline: As a delete user I verify The drop-down will display "denied!"
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click on button contains text "Expand All"
    And I click on the "Budget stuff - BudgetForm-15718" link
    And I switch to default frame
    And I click on "Check Out" Button
    And I click "Update & Take Action" button
    And I set following fields value on editable page
      | name                         | value    |
      | WorkFlowTemplateStepActionID | Denied!  |
      | WorkFlowTemplateStepActionID | <SELECT> |
    And I click on "Close" button
    And I wait for modal window to close

    Examples:
      | Entity Name                | Third Level Tab |
      | ConditionalWFProject-15718 | Work Flow       |


  Scenario Outline: As a delete user I verify The pop-up will show the re-evaluated JavaScript
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click on button contains text "Expand All"
    And I click on the "Budget stuff - BudgetForm-15718" link
    And I switch to default frame
    And I click on Check Out button

    And I click on the text "Solenoid value"
    And I enter the budget "Solenoid value", Quantity "1", Budget Cost "10000"
    And I click on the "Update" button "on pop window"

    And I click on the text "Steam wand"
    And I enter the budget "Steam wand", Quantity "1", Budget Cost "50000"
    And I click on the "Update" button "on pop window"

    And I click on "Update" button
    And I click on "Close" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear
    And I click on "edit" link of step "Budget stuff - BudgetForm-15718" in work flow
    And I switch to default frame
    And I verify a "if (requestedA <250000)" on "Step status appears to be valid Popup window"
    And I click on the "Close" button
    And I wait for modal window to close

    Examples:
      | Entity Name                | Third Level Tab |
      | ConditionalWFProject-15718 | Work Flow       |


  Scenario Outline: As a delete user I verify The "Successfully updated workflow step approver" message will appear on top.
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click on button contains text "Expand All"
    And I click on the "Budget stuff - BudgetForm-15718" link
    And I switch to default frame
    And I wait for modal window to open
    And I click on "Check Out" Button
    And I click "Update & Take Action" button
    And I set following fields value on editable page
      | name                         | value                            |
      | WorkFlowTemplateStepActionID | Approved- Fill out expected date |
    And I click on "Update" button
    And I click on "Close" button

    Examples:
      | Entity Name                | Third Level Tab |
      | ConditionalWFProject-15718 | Work Flow       |

  Scenario Outline: As a delete user I verify The "Successfully updated workflow step approver" message will appear on top.
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click on button contains text "Expand All"
    And I click on the "Date - Step2-15718" link
    And I switch to default frame
    And I click on "Check Out" Button
    And I click "Update & Take Action" button

    And I set following fields value on editable page
      | name                         | value     |
      | WorkFlowTemplateStepActionID | Completed |
    And I click on "Update" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear
    And I verify a "item successfully updated" on "message appears on top of the grid"

    Examples:
      | Entity Name                | Third Level Tab |
      | ConditionalWFProject-15718 | Work Flow       |

