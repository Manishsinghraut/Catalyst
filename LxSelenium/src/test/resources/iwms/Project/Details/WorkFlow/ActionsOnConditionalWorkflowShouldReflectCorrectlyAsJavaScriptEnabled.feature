@all
Feature: Actions on Conditional Workflow should reflect correctly as JavaScript Enabled (Ref : Jira Ticket No : AUTOMATION-1364)

  Scenario Outline: As a delete user i import the files

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/WorkFlow/"
    And I import following file name:
      | Sprint17PortfolioAndLocation_1364.xml |
      | WFBudgetTemplate-15718_1364.xml       |
      | TotalColumn-15718_1364.xml            |
      | Forms-15718_1364.xml                  |
      | ConditionalWF-15718_1364.xml          |
      | ConditionalWFProject-15718_1364.xml   |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Navigate to "WFRProject" and add "WFMemberOne 1263" as the assignee, approver, and notifee to the first step of "ReplaceWF"
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click " Add Form... " button
    And I switch to default frame
    And I select form type "KickoffConditionalWF" in modal window
    And I click on the "OK" button
    And I click on the "Add" button
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name                | Third Level Tab | Grid         | Member                               |
    | DeleteAccess | Delete Access Access | ConditionalWFProject-15718 | Forms           | BOGridMember | Replace Remove Member 1 Testing 1264 |

  Scenario Outline: As a delete user I verify The pop-up will display the evaluated JavaScript.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
#    And I wait for the Loading text to disappear
#    And I verify row from grid "BOGridLX_Grid_WorkFlow" having unique value "ConditionalWF-15718" under column header "Name"
#      | name             | value                         |
#      | Name             | ConditionalWF-15718           |
#      | Title            | 10/10/2016                    |
#      | Status           | ACTIVE (Waiting for approval) |
#      | Days Open        | 0                             |
#      | Begun            | [CURRENT DATE]                |
#      | Completed        |                               |
#      | Active Step      | 1                             |
#      | Due Date         | [CURRENT DATE]                |
#      | Current Assignee | Delete Access Access          |
#      | Current Approver |                               |
#    And I expand all form lists
#    And I switch to default frame
    And I click " Expand All " button
    And I click on the "Budget stuff - BudgetForm-15718" link
    And I switch to default frame
    And I click on Check Out button
    And I click '+ Add' button to add line items
    And I enter the budget "Dual boiler", Quantity "1", Budget Cost "100000"
    And I click on the "Update" button "on pop window"
    And I click '+ Add' button to add line items
    And I enter the budget "Solenoid value", Quantity "1", Budget Cost "120000"
    And I click on the "Update" button "on pop window"
    And I click '+ Add' button to add line items
    And I enter the budget "Steam wand", Quantity "2", Budget Cost "50000"
    And I click on the "Update" button "on pop window"
    And I click on the "Update" button
    And I click on the "Close" button
    And I switch to visible frame
    And I click on "edit" link of step "Budget stuff - BudgetForm-15718" in work flow
    And I switch to default frame
    And I verify a "if (requestedA <250000)" on "Step status appears to be valid Popup window"
    And I verify a "{ ActionEnabled = true; }" on "Step status appears to be valid Popup window"
    And I verify a "ActionEnabled=false" on "Step status appears to be valid Popup window"
    And I verify a "requestedA=320000.00" on "Step status appears to be valid Popup window"

    And I verify a "if (requestedA >250000)" on "Step status appears to be valid Popup window"
    And I verify a "{ ActionEnabled = true; }" on "Step status appears to be valid Popup window"
    And I verify a "ActionEnabled=true" on "Step status appears to be valid Popup window"
    And I click "Close" button

  Examples:
    | Login User   | Login full username  | Entity Name                | Third Level Tab |
    | DeleteAccess | Delete Access Access | ConditionalWFProject-15718 | Work Flow       |

  Scenario Outline: As a delete user I verify The drop-down will display "denied!"
    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click " Expand All " button
    And I click on the "Budget stuff - BudgetForm-15718" link
    And I switch to default frame
    And I click "Update & Take Action" button

    And I set following fields value on editable page
      | name                         | value   |
      | WorkFlowTemplateStepActionID | Denied! |
      | WorkFlowTemplateStepActionID | <SELECT> |
    And I click "Close" button

#    And I switch to visible frame
#    And I click on the "Budget stuff - BudgetForm-15718" link
#    And I switch to default frame
#    And I enter the budget "Solenoid value", Quantity "1", Budget Cost "10000"
#    And I click on the "Update" button "on pop window"
#    And I click "Update" button
#    And I click on "edit" link of step "Budget stuff - BudgetForm-15718" in work flow
#    And I switch to default frame
#    And I verify the text "if (requestedA <250000)" on "Step status appears to be valid Popup window"
#    And I click "Close" button
#
#    And I switch to visible frame
#    And I click on the "Budget stuff - BudgetForm-15718" link
#    And I switch to default frame
#    And I click "Update & Take Action" button
#    And I verify these field values on editable page
#      | name                         | value                                |
#      | WorkFlowTemplateStepActionID | Approved- Fill out the expected date |
#    And I click "Update" button
#
#
#    And I switch to visible frame
#    And I click on the "Date - Step2-15718  " link
#    And I switch to default frame
#    And I click on Check Out button
#    And I click "Update & Take Action" button
#
#    And I verify these field values on editable page
#      | name                         | value     |
#      | WorkFlowTemplateStepActionID | Completed |
#
#    And I click "Update" button
#    And I switch to visible frame
#    And I verify the text "item successfully updated" on "message appears on top of the grid"

  Examples:
    | Login User   | Login full username  | Entity Name                | Third Level Tab |
    | DeleteAccess | Delete Access Access | ConditionalWFProject-15718 | Work Flow       |


  Scenario Outline: As a delete user I verify The pop-up will show the re-evaluated JavaScript
    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click " Expand All " button
    And I click on the "Budget stuff - BudgetForm-15718" link
    And I switch to default frame
    And I click on Check Out button

    And I click on the text "Solenoid value"
    And I enter the budget "Solenoid value", Quantity "1", Budget Cost "10000"
    And I click on the "Update" button "on pop window"

    And I click on the text "Steam wand"
    And I enter the budget "Steam wand", Quantity "1", Budget Cost "50000"
    And I click on the "Update" button "on pop window"

    And I click "Update" button
    And I click "Close" button

    And I click on "edit" link of step "Budget stuff - BudgetForm-15718" in work flow
    And I switch to default frame
    And I verify a "if (requestedA <250000)" on "Step status appears to be valid Popup window"
    And I click "Close" button

  Examples:
    | Login User   | Login full username  | Entity Name                | Third Level Tab |
    | DeleteAccess | Delete Access Access | ConditionalWFProject-15718 | Work Flow       |


  Scenario Outline: As a delete user I verify The "Successfully updated workflow step approver" message will appear on top.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click " Expand All " button
    And I click on the "Budget stuff - BudgetForm-15718" link
    And I switch to default frame
    And I click "Update & Take Action" button
    And I set following fields value on editable page
      | name                         | value                                |
      | WorkFlowTemplateStepActionID | Approved- Fill out expected date |
    And I click "Update" button

  Examples:
    | Login User   | Login full username  | Entity Name                | Third Level Tab |
    | DeleteAccess | Delete Access Access | ConditionalWFProject-15718 | Work Flow       |

  Scenario Outline: As a delete user I verify The "Successfully updated workflow step approver" message will appear on top.
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click " Expand All " button
    And I click on the "Date - Step2-15718" link
    And I switch to default frame
    And I click on Check Out button
    And I click "Update & Take Action" button

    And I set following fields value on editable page
      | name                         | value     |
      | WorkFlowTemplateStepActionID | Completed |
    And I click "Update" button
    And I switch to visible frame
    And I verify a "item successfully updated" on "message appears on top of the grid"

  Examples:
    | Login User   | Login full username  | Entity Name                | Third Level Tab |
    | DeleteAccess | Delete Access Access | ConditionalWFProject-15718 | Work Flow       |

