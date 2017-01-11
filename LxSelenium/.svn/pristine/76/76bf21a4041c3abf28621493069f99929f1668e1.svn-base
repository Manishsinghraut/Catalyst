@all
Feature: (Jira Ref: Automation-1439) Edit Assignees, Approvers, Notifees

  Scenario Outline: As a delete user I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/WorkFlowTab/"
    And I import following files:
      | Portfolio_00020AndLocation_00020(1)-1439.xml |
      | Project_57-1439.xml                          |
      | Form57-1439.xml                              |
      | Workflow57-1439.xml                          |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Edit Assignees, Approvers, Notifees
    Given I navigate to the admin dashboard
    And I click on "Manage Work Flows" link
    And I click "edit" row action in the non frame grid "<WF Grid>" having the following header and cell values
      | name           | value            |
      | Work Flow name | <Work Flow name> |
    And I wait for "Edit Work Flow  ***Required fields in red" modal window to open in non frame page
    Then I verify the following fields value on editable page
      | name         | value            |
      | PageLayoutID | Form 57 A layout |
    And I verify the following radio by value
      | name      | value |
      | Formradio | true  |
    And I click on the "Cancel" button
    And I wait for modal window to close
    And I click "edit" action of "Form Step 1" sub row in the grid "<WF Grid>"
    And I wait for "Edit Step  ***Required fields in red" modal window to open in non frame page
    Then I verify the following fields value on editable page
      | name                        | value                 |
      | _checkbox_RequiresAssignees | true                  |
      | AssigneeTypeList            | Delete Access         |
      | PageLayoutAssigneesID       | Form 57 B layout      |
      | ApproverTypeList            | Access, Edit Access   |
      | PageLayoutApproversID       | Form 57 B layout      |
      | NotifieeTypeList            | Access, Delete Access |
    And I verify the following radio under section "AssigneeType"
      | name         | value |
      | by Job Title | true  |
    And I verify the following radio under section "ApproverType"
      | name      | value |
      | by Member | true  |

    And I verify the following radio under section "NotifieeType"
      | name      | value |
      | by Member | true  |
    And I click on the "Cancel" button
    And I wait for modal window to close

    And I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Members/Contacts" tab
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name                 | Title         | Phone        | Email              | Employer | Job Function         | User Class    |
      | Broker | Delete Access Access | Delete Access | 456.236.3698 | svcQA@lucernex.com | Lucernex | System Administrator | Delete Access |
      | Broker | Edit Access Access   | Delete Access | 702-799-123  | svcQA@lucernex.com | Lucernex | System Administrator | Edit Access   |

    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
    And I click "Add Form..." button of frame grid "<Form Grid ID>"
    And I switch to default frame
    And I wait for modal window to open
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I set following fields value on editable page
      | name          | value       |
      | Issue_Subject | <Form Name> |
      | Issue_Body    | Testing 57  |
      | Issue_A       | 57          |
    And I click on the "Add" button
    And I wait for modal window to close
    And I switch to visible frame
    Then I verify grid "<Form Grid ID>" is empty with the following message "No rows to display"

    And I click on the "Work Flow" tab
    And I switch to visible frame
    And I click on button contains text "Expand All"
    Then I verify the following values in frame grid "<WorkFlow Grid ID>"
      | Name        | Title       | Status              | Days Open | Begun          | Completed | Active Step | Due Date     | Current Assignee                         | Current Approver   |
      | Workflow 57 | <Form Name> | ACTIVE (In-process) | 0         | [Today's Date] |           | 1           | [Duration 1] | Delete Access Access\nEdit Access Access | Edit Access Access |

    And I verify following sub row values of grid "<WorkFlow Grid ID>" and sub-grid ".rowColor1" in frame page
      | Step   | Status     | Assignee(s)                              | Approver(s)        | Notifiees(s)         |
      | <Step> | In-process | Delete Access Access\nEdit Access Access | Edit Access Access | Delete Access Access |

    And I click on "edit" link of step "<Step>" in work flow
    And I switch to default frame
    And I wait for modal window to open
    Then I verify multiple selected values on editable page
      | name                 | value                 |
      | AssigneeMemberIDList | Access, Delete Access |
      | NotifieeMemberIDList | Access, Delete Access |
      | AssigneeMemberIDList | Access, Edit Access   |
      | ApproverMemberIDList | Access, Edit Access   |
    And I click on the "Close" button
    And I wait for modal window to close

    Examples:
      | Step            | Work Flow name | WF Grid                | Project Name | Form Grid ID        | Form Type        | Form Name | WorkFlow Grid ID       |
      | 1 - Form Step 1 | Workflow 57    | BOGridWorkFlowTemplate | Project 57   | BOGridLX_Grid_Issue | Form 57 A layout | Test 57   | BOGridLX_Grid_WorkFlow |