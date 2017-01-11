@all
Feature: (Jira Ref: Automation-1432) Kickoff Workflow via Workflow Action

  Scenario Outline: As a delete user I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/WorkFlowTab/"
    And I import following files:
      | FormForWorkflowTesting50-1432.xml           |
      | FormToKickoffTesting50-1432.xml             |
      | Portfolio_0020AndLocation_00020(1)-1432.xml |
      | Project_to_Kickoff_Workflow-1432.xml        |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Add workflow and form step -1
    Given I navigate to the admin dashboard
    And I click on "Manage Work Flows" link
    And I click "Add Work Flow..." button of non frame grid "<WF Template Grid ID>"
    Then I wait for "Add Work Flow  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                                 | value         |
      | WorkFlowTemplateName                 | <WF Name>     |
      | Description                          | <Description> |
      | _checkbox_NotifyInitiatorComplete    | true          |
      | _checkbox_NotifyAllAssigneesComplete | true          |
      | _checkbox_NotifyAllApproversComplete | true          |
      | DefaultWFCodePriorityID              | 1 - Urgent    |
      | completionradio                      | true          |
    And I click on the "Add" button
    Then I wait for modal window to close
    And I see "Successfully added Work Flow" in the grid header
    And I verify the following values in non frame grid "<WF Template Grid ID>"
      | Work Flow name | Description   |
      | <WF Name>      | <Description> |

    When I click "add form step" row action in the non frame grid "<WF Template Grid ID>" having the following header and cell values
      | name           | value     |
      | Work Flow name | <WF Name> |
    And I wait for "Edit Step  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                                 | value                         |
      | _checkbox_RequiresAssignees          | true                          |
      | WorkFlowTemplateStepName             | <Step Name>                   |
      | StepNumber                           | 1                             |
      | Priority                             | Critical                      |
      | PageLayoutAssigneesID                | Form for WF Testing 50 layout |
      | DurationDaysAssignees                | 1                             |
      | DaysUntilWarnAssignees               | 1                             |
      | DaysUntilAlertAssignees              | 1                             |
      | _checkbox_EMailAlertAssignees        | true                          |
      | _checkbox_NotifyStepAssigneesStarted | true                          |
    And I select the following radio under section "AssigneeType"
      | name          | value |
      | by User Class | true  |
    And I set following fields value on editable page
      | name                       | value         |
      | AssigneeTypeList_available | Delete Access |
    And I click on visible ">>" Button
    And I click on the "Update" button
    Then I see "Successfully added Step" in the grid header
    And I verify following sub row values of grid "<WF Template Grid ID>" and sub-grid ".rowColor1" in non frame page
      | Step Name   |
      | <Step Name> |


    Examples:
      | WF Template Grid ID    | WF Name              | Description      | Step Name   |
      | BOGridWorkFlowTemplate | Work Flow Testing 50 | KickOff Workflow | Form Step 1 |


  Scenario Outline: Add workflow and form step - 2
    Given I navigate to the admin dashboard
    And I click on "Manage Work Flows" link
    And I click "Add Work Flow..." button of non frame grid "<WF Template Grid ID>"
    Then I wait for "Add Work Flow  ***Required fields in red" modal window to open in non frame page
    And I select the following radio by value
      | name      | value |
      | Formradio | true  |
    And I set following fields value on editable page
      | name                                 | value                         |
      | WorkFlowTemplateName                 | <WF Name>                     |
      | Description                          | <Description>                 |
      | _checkbox_NotifyInitiatorComplete    | false                         |
      | _checkbox_NotifyAllAssigneesComplete | false                         |
      | _checkbox_NotifyAllApproversComplete | false                         |
      | DefaultWFCodePriorityID              | 1 - Urgent                    |
      | PageLayoutID                         | Form to Kickoff Testing 50 WF |

    And I click on the "Add" button
    Then I wait for modal window to close
    And I see "Successfully added Work Flow" in the grid header
    And I verify the following values in non frame grid "<WF Template Grid ID>"
      | Work Flow name | Description   |
      | <WF Name>      | <Description> |

    When I click "add form step" row action in the non frame grid "<WF Template Grid ID>" having the following header and cell values
      | name           | value     |
      | Work Flow name | <WF Name> |
    And I wait for "Edit Step  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                        | value                         |
      | _checkbox_RequiresApprovers | true                          |
      | WorkFlowTemplateStepName    | <Step Name>                   |
      | StepNumber                  | 1                             |
      | Priority                    | High                          |
      | PageLayoutApproversID       | Form to Kickoff Testing 50 WF |
      | DurationDaysApprovers       | 1                             |
      | DaysUntilWarnApprovers      | 1                             |
      | DaysUntilAlertApprovers     | 1                             |
    And I select the following radio under section "ApproverType"
      | name   | value |
      | Ad hoc | true  |
    And I click on "<<Add Action>>" link
    And I switch to "Manage Work Flow Step Action" child window
    And I set following fields value on editable page
      | name                           | value                |
      | WorkFlowTemplateStepActionName | Approved             |
      | TheStepAction                  | true                 |
      | KickOffWorkFlowTemplateID      | Work Flow Testing 50 |
    And I click on "Add" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window
    Then I verify the following values in non frame grid "^lxmodalwindow"
      | Action Name | Disable further editing on status of Complete or Denied |
      | Approved    | unchecked                                               |

    And I click on the "Update" button
    Then I see "Successfully added Step" in the grid header
    And I verify following sub row values of grid "<WF Template Grid ID>" and sub-grid ".rowColor1" in non frame page
      | Step Name   |
      | <Step Name> |


    Examples:
      | WF Template Grid ID    | WF Name                      | Description      | Step Name           |
      | BOGridWorkFlowTemplate | Kickoff Work Flow Testing 50 | KickOff Workflow | Kickoff Form Step 1 |

  Scenario Outline: Add workflow and form step - 2
    Given I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    Then I click on the "Work Flow" tab
    And I wait for the Loading text to disappear
    And I click "Add Workflow..." button of frame grid "<WorkFlow Grid ID>"
    And I switch to default frame
    And I wait for modal window to open
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I set following fields value on editable page
      | name       | value         |
      | Issue_Body | WF Testing 50 |
      | Issue_I102 | Carpet        |
      | Issue_N01  | 500           |
      | Issue_ID11 | true          |
    And I click on the "Add" button
    Then I wait for modal window to close
    And I verify the following values in frame grid "<WorkFlow Grid ID>"
      | Name                         |
      | Kickoff Work Flow Testing 50 |
    And I verify message "Form to Kickoff Testing 50 item successfully added"
    And I click on button contains text "Expand All"
    And I click on "edit" link
    And I switch to default frame
    And I wait for modal window to open
    And I set following fields value on editable page
      | name                          | value                 |
      | availableApproverMemberIDList | Access, Delete Access |
    And I click on > button to add "approvers"
    And I click on the "Update" button
    And I wait for the Loading text to disappear

    And I click on "Kickoff Form Step 1 - Form to Kickoff Testing 50 WF" link
    And I switch to default frame
    And I click on "Check Out" Button
    And I click on the "Update & Take Action" button
    And I set following fields value on editable page
      | name                         | value    |
      | WorkFlowTemplateStepActionID | Approved |
    And I click on the "Update" button

    And I verify the following values in frame grid "<WorkFlow Grid ID>"
      | Name                 | Current Assignee     |
      | Work Flow Testing 50 | Delete Access Access |
    And I verify message "Form to Kickoff Testing 50 item successfully updated"

    And I click on button contains text "Expand All"
    And I click on "Form Step 1" link
    And I switch to default frame
    And I click on "Check Out" Button
    And I set following fields value on editable page
      | name          | value      |
      | Issue_Body    | WF2        |
      | Issue_Subject | KickOff WF |
    And I click on the "Complete" button
    And I wait for the Loading text to disappear
    Then I verify grid "<WorkFlow Grid ID>" is empty with the following message "No rows to display"
    And I verify message "Successfully submitted Work Flow Step for approval."
    And I set following fields value on editable page
      | name       | value        |
      | statusType | Closed Items |
    And I verify the following values in frame grid "<WorkFlow Grid ID>"
      | Name                         | Title          | Status | Begun          | Completed      | Active Step | Due Date | Current Assignee | Current Approver |
      | Kickoff Work Flow Testing 50 | [Today's Date] | CLOSED | [Today's Date] | [Today's Date] |             |          |                  |                  |
      | Work Flow Testing 50         | KickOff WF     | CLOSED | [Today's Date] | [Today's Date] |             |          |                  |                  |


    Examples:
      | Project Name                | Form Type                     | WorkFlow Grid ID       |
      | Project to Kickoff Workflow | Form to Kickoff Testing 50 WF | BOGridLX_Grid_WorkFlow |