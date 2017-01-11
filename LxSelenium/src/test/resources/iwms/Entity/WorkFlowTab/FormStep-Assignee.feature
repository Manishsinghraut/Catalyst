@all
Feature: (Jira Ref: Automation-1435) Form Step - Assignee

  Scenario Outline: As a delete user I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/WorkFlowTab/"
    And I import following files:
      | Portfolio_00020AndLocation_00020-1435.xml |
      | Project-1435.xml                          |
      | Form-1435.xml                             |
      | WorkflowTemplate-1435.xml                 |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I verify add member to project and add work flow
    Given I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I navigate to "Details"

    And I click on the "Work Flow" tab
    And I wait for the Loading text to disappear
    And I click "Add Workflow..." button of frame grid "<WorkFlow Grid ID>"
    And I switch to default frame
    And I wait for modal window to open
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I set following fields value on editable page
      | name          | value         |
      | Issue_Subject | <Form Name>   |
      | Issue_Body    | Testing WF 53 |
    And I click on the "Add" button
    Then I wait for modal window to close
    And I verify the following values in frame grid "<WorkFlow Grid ID>"
      | Name  | Title       | Status           | Days Open | Begun          | Completed | Active Step | Due Date       | Current Assignee | Current Approver |
      | 53-WF | <Form Name> | ACTIVE (Invalid) | 0         | [Today's Date] |           | 1           | [Today's Date] |                  |                  |
#    And I verify message "<Form Type> item successfully added"

    And I click on the "Members/Contacts" tab
    And I wait for the Loading text to disappear
    Then I verify grid "BOGridMember" is empty with the following message "No rows to display"
    And I click on the "Edit Members" action panel button
    And I wait for the Loading text to disappear
    And I add following members
      | Access, Delete Access |
    And  I click on "Update  members to <Project Name>" Button
    Then I verify the following values in frame grid "BOGridMember"
      | Type   | Name                 | Title         | Phone        | Email              | Employer | Job Function         | User Class    |
      | Broker | Delete Access Access | Delete Access | 456.236.3698 | svcQA@lucernex.com | Lucernex | System Administrator | Delete Access |


    And I click on the "Work Flow" tab
    And I switch to visible frame
    And I click on button contains text "Expand All"
    Then I verify following sub row values of grid "<WorkFlow Grid ID>" and sub-grid ".rowColor1" in frame page
      | Step                        | Assignee(s)          |
      | KickOff Step (<Form Type> ) | Delete Access Access |
    And I verify following sub row values of grid "<WorkFlow Grid ID>" and sub-grid ".rowColor1" in frame page
      | Step  | Status  | Assignee(s) |
      | 1 - 1 | Invalid |             |

    And I click on "edit" link of step "<Step>" in work flow
    And I switch to default frame
    And I add following project members
      | Access, Delete Access |
    And I click on the "Update" button
    Then I wait for modal window to close
    And I verify following sub row values of grid "<WorkFlow Grid ID>" and sub-grid ".rowColor1" in frame page
      | Step                        | Assignee(s)          |
      | KickOff Step (<Form Type> ) | Delete Access Access |
    And I verify following sub row values of grid "<WorkFlow Grid ID>" and sub-grid ".rowColor1" in frame page
      | Step  | Status     | Assignee(s)          |
      | 1 - 1 | In-process | Delete Access Access |

    Examples:
      | Project Name | Form Type | Form Name | WorkFlow Grid ID       | Step                    |
      | Testing-53   | 53-Form   | WF 53     | BOGridLX_Grid_WorkFlow | KickOff Step (<53-Form> |