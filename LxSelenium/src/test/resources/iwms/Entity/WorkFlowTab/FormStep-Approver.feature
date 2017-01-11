@all
Feature: (Jira Ref: Automation-1435) Form Step - Approver

  Scenario Outline: As a delete user I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/WorkFlowTab/"
    And I import following files:
      | FormTesting 54-1437.xml                   |
      | WorkflowForTesting54-1437.xml             |
      | Portfolio_00020AndLocation_00020-1437.xml |
      | Form_Approval_Site-1437.xml               |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Add Form Step
    Given I navigate to the admin dashboard
    And I click on "Manage Work Flows" link
    And I click "add form step" row action in the non frame grid "<WF Grid>" having the following header and cell values
      | name           | value            |
      | Work Flow name | <Work Flow name> |
    And I set following fields value on editable page
      | name                        | value    |
      | WorkFlowTemplateStepName    | <Step 1> |
      | _checkbox_RequiresApprovers | true     |

    And I select the following radio under section "ApproverType"
      | name          | value |
      | by User Class | true  |
    And I set following fields value on editable page
      | name                    | value                  |
      | StepNumber              | 1                      |
      | Priority                | Critical               |
      | PageLayoutApproversID   | Form Testing 54 layout |
      | DurationDaysApprovers   | 1                      |
      | DaysUntilWarnApprovers  | 1                      |
      | DaysUntilAlertApprovers | 1                      |
    And I set following fields value on editable page
      | name                       | value         |
      | ApproverTypeList_available | Delete Access |

    And I click on visible ">>" Button

    And I click on "<<Add Action>>" link
    And I switch to "Manage Work Flow Step Action" child window
    And I set following fields value on editable page
      | name                           | value                                                                                                                                               |
      | WorkFlowTemplateStepActionName | Approved                                                                                                                                            |
      | TheStepAction                  | true                                                                                                                                                |
      | IsEnabledLxJSCode              | var ActionEnabled = false; var total = '${Issue.math_TotalAmount_0}';if (total >= 50000 && "${Issue.IsCritical}" == "Yes"){ ActionEnabled = true; } |
    And I click on "Add" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    And I click on "<<Add Action>>" link
    And I switch to "Manage Work Flow Step Action" child window
    And I set following fields value on editable page
      | name                           | value    |
      | WorkFlowTemplateStepActionName | Rejected |
    And I select the following radio by value
      | name           | value |
      | IsDenialAction | true  |
    And I click on "Add" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window
    Then I verify the following values in non frame grid "^lxmodalwindow"
      | Action Name | Disable further editing on status of Complete or Denied |
      | Approved    | unchecked                                               |
      | Rejected    | unchecked                                               |
    And I click on the "Update" button
    Then I see "Successfully added Step" message in the header

    Examples:
      | Work Flow name          | WF Grid                | Step 1                 |
      | Workflow for Testing 54 | BOGridWorkFlowTemplate | Form Step 1 Testing 54 |

  Scenario Outline: Add Workflow to entity
    Given I navigate to entity type "Sites" named "<Site Name>" through search option
    And I click on the "Work Flow" tab
    And I wait for the Loading text to disappear
    And I click "Add Workflow..." button of frame grid "<WorkFlow Grid ID>"
    And I switch to default frame
    And I wait for modal window to open
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I click '+ Add' button to add line items
    And I enter row values in grid "<CustomList Gird ID>" by the following values
      | Modified Date | Item Name | Quantity | Price |
      |               | Item A    | 1500     | 2500  |
    And I click "Update" button
    And I set following fields value on editable page
      | name             | value |
      | Issue_IsCritical | true  |
    And I click 'Add' button to add line items
    And I wait for the Loading text to disappear
    And I verify message "Form Testing 54 item successfully added"
    And I verify the following values in frame grid "<WorkFlow Grid ID>"
      | Name                    | Title          | Status                        | Days Open | Begun          | Completed | Active Step | Due Date       | Current Assignee | Current Approver     |
      | Workflow for Testing 54 | [Today's Date] | ACTIVE (Waiting for approval) | 0         | [Today's Date] |           | 1           | [Today's Date] |                  | Delete Access Access |

    Examples:
      | Site Name          | Form Type              | WorkFlow Grid ID       | CustomList Gird ID |
      | Form Approval Site | Form Testing 54 layout | BOGridLX_Grid_WorkFlow | ^customListGrid    |

  Scenario Outline: Form Step - Approver
    Given I click on button contains text "Expand All"
    And I click on "Form Step 1 Testing 54 - Form Testing 54 layout" link
    And I switch to default frame
    And I wait for modal window to open
    And I click on "Check Out" Button
    Then I verify the following fields value on editable page
      | name               | value         |
      | math_TotalAmount_0 | $3,750,000.00 |
      | Issue_IsCritical   | true          |
    And I verify the following values in non frame grid "<CustomList Gird ID>"
      | Modified Date                  | Item Name | Quantity | Price     | Total         |
      | [Today's Date with Hour AM/PM] | Item A    | 1,500    | $2,500.00 | $3,750,000.00 |
    And I click on the "Update & Take Action" button
    Then I verify following options are available in drop down "WorkFlowTemplateStepActionID"
      | Approved |
      | Rejected |
    And I click on the "Close" button
    And I wait for modal window to close
    Then I wait for the Loading text to disappear

#    And I click on "<Check In>" link
#    And I click on button contains text "Expand All"
    And I click on "Form Step 1 Testing 54 - Form Testing 54 layout" link
    And I switch to default frame
    And I click on "Check Out" Button
    And I double click a row from grid "<CustomList Gird ID>" having unique value "Item A" under column header "Item Name"
      | name      | value  |
      | Item Name | Item A |
    And I enter row values in grid "<CustomList Gird ID>" by the following values
      | Modified Date | Item Name | Quantity | Price |
      |               | Item A    | 1500     | 20    |
    And I click "Update" button while adding custom list line item
    Then I verify the following fields value on editable page
      | name               | value      |
      | math_TotalAmount_0 | $30,000.00 |
      | Issue_IsCritical   | true       |
    And I set following radio fields value on editable page
      | name             | value |
      | Issue_IsCritical | false |

    And I click on the "Update & Take Action" button
    Then I verify following options are available in drop down "WorkFlowTemplateStepActionID"
      | Rejected |
    Then I verify following options are not available in drop down "WorkFlowTemplateStepActionID"
      | Approved |
    And I click on the "Close" button
    And I wait for modal window to close
    Then I wait for the Loading text to disappear

#    And I click on "<Check In>" link
#    And I click on button contains text "Expand All"
    And I click on "Form Step 1 Testing 54 - Form Testing 54 layout" link
    And I switch to default frame
    And I click on "Check Out" Button
    And I click '+ Add' button to add line items
    And I enter row values in grid "<CustomList Gird ID>" by the following values
      | Modified Date | Item Name | Quantity | Price |
      |               | Item B    | 2000     | 100   |
    And I click "Update" button while adding custom list line item
    And I set following fields value on editable page
      | name             | value |
      | Issue_IsCritical | true  |
    Then I verify the following fields value on editable page
      | name               | value       |
      | math_TotalAmount_0 | $230,000.00 |

    And I click on the "Update & Take Action" button
    And I set following fields value on editable page
      | name                         | value    |
      | WorkFlowTemplateStepActionID | Approved |
    And I click on the "Update" button
    And I wait for the Loading text to disappear
    Then I verify grid "<WorkFlow Grid ID>" is empty with the following message "No rows to display"
    And I verify message "Form Testing 54 item successfully updated"
    And I set following fields value on editable page
      | name       | value        |
      | statusType | Closed Items |
    And I verify the following values in frame grid "<WorkFlow Grid ID>"
      | Name                    | Title          | Status |
      | Workflow for Testing 54 | [Today's Date] | CLOSED |
    And I click on button contains text "Expand All"
    Then I verify following sub row values of grid "<WorkFlow Grid ID>" and sub-grid ".rowColor1" in frame page
      | Step                                                | Status   |
      | 1 - Form Step 1 Testing 54 - Form Testing 54 layout | Approved |


    Examples:
      | WorkFlow Grid ID       | CustomList Gird ID |
      | BOGridLX_Grid_WorkFlow | ^customListGrid    |