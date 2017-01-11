@all
Feature: (Jira Ref: Automation-1434) Kickoff Workflow via Completion of Form

  Scenario Outline: As a delete user I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/WorkFlowTab/"
    And I import following files:
      | Portfolio_00020AndLocation_00020(2)-1434.xml |
      | WFFormProject_52-1434.xml                    |
      | WfForm-52-1434.xml                           |
      | KickedoffWF-52-1434.xml                      |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Kickoff Workflow via Completion of Form
    Given I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I navigate to "Details"
    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
    And I click "Add Form..." button of frame grid "<Form Grid ID>"
    And I switch to default frame
    And I wait for modal window to open
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I set following fields value on editable page
      | name       | value      |
      | Issue_Body | Testing 52 |
    And I click on the "Add" button
    And I wait for modal window to close
    And I switch to visible frame
    And I verify message "<Form Name> item successfully added"
    Then I verify grid "<Form Grid ID>" is empty with the following message "No rows to display"

    And I click on the "Work Flow" tab
    And I switch to visible frame
    And I click on button contains text "Expand All"
    Then I verify the following values in frame grid "<WorkFlow Grid ID>"
      | Name           | Title          | Status              | Days Open | Begun          | Completed | Active Step | Due Date       | Current Assignee     | Current Approver |
      | KickedoffWF-52 | [Today's Date] | ACTIVE (In-process) | 0         | [Today's Date] |           | 1           | [Today's Date] | Delete Access Access |                  |

    And I verify following sub row values of grid "<WorkFlow Grid ID>" and sub-grid ".rowColor1" in frame page
      | Step       | Status     | Assignee(s)          |
      | 1 - Step 1 | In-process | Delete Access Access |


    Examples:
      | Project Name     | Form Type      | Form Name | WorkFlow Grid ID       | Form Grid ID        |
      | WFFormProject-52 | KickoffForm-52 | WfForm-52 | BOGridLX_Grid_WorkFlow | BOGridLX_Grid_Issue |