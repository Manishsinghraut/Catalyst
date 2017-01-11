@all
Feature: (Jira Ref: Automation-1470) Ability for non-admins to deactivate workflows

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/WorkFlowTab/"
    And I import following file name:
      | Portfolio_00020AndLocation_00020-1470.xml |
    And I import following files:
      | Employer-15570-1470.xlsx      |
      | Member-MichaelScott-1470.xlsx |
      | NonAdminForm-15570-1470.xml   |
      | NonAdminWF-15570-1470.xml     |
    And I import following file name:
      | NonAdminWFProject-1470.xml |
    And I logout

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Ability for non-admins to deactivate workflows
    Given I Login to IWMS using "<Login User>" access credentials expecting EULA page
    Then Accept Eula and move on
    And I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Work Flow" tab
    And I wait for the Loading text to disappear
    And I click on button contains text "Expand All"
    Then I verify the following values in frame grid "<WorkFlow Grid ID>"
      | Name             | Title      | Status              | Days Open | Begun          | Completed | Active Step | Due Date       | Current Assignee | Current Approver |
      | NonAdminWF-15570 | 11/18/2016 | ACTIVE (In-process) | 0         | [Today's Date] |           | 1           | [Today's Date] | Michael Scott    |                  |
    And I verify following sub row values of grid "<WorkFlow Grid ID>" and sub-grid ".rowColor1" in frame page
      | Step       |
      | 1 - Step 1 |
    And I verify the following text not present
      | WF Status: ACTIVE (In-process)<Deactivate> |


    Examples:
      | Login User | Project Name            | WorkFlow Grid ID       |
      | mscott     | NonAdminWFProject-15570 | BOGridLX_Grid_WorkFlow |

  Scenario Outline: As a delete user I import security xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/WorkFlowTab/"
    And I import following files:
      | SecurityBroker-15570-1470.xml |
    And I logout

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Login as Michel Scott and deactivate work flow
    Given I Login to IWMS using "<Login User>" access credentials expecting EULA page
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Work Flow" tab
    And I wait for the Loading text to disappear
    And I click on button contains text "Expand All"
    And I click on "<Deactivate>" link
    And I switch to "Deactivate workflow" child window
    And I click on "Yes" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window
    And I wait for the Loading text to disappear
    Then I verify grid "<WorkFlow Grid ID>" is empty with the following message "No rows to display"
    And I verify message "Successfully deactivated Work Flow"
    And I set following fields value on editable page
      | name       | value    |
      | statusType | Inactive |
    And I wait for the Loading text to disappear
    And I click on button contains text "Expand All"
    Then I verify the following values in frame grid "<WorkFlow Grid ID>"
      | Name             | Title      | Status   | Days Open | Begun          | Completed | Active Step | Due Date       | Current Assignee | Current Approver |
      | NonAdminWF-15570 | 11/18/2016 | INACTIVE | 0         | [Today's Date] |           | 1           | [Today's Date] | Michael Scott    |                  |
    And I verify following sub row values of grid "<WorkFlow Grid ID>" and sub-grid ".rowColor1" in frame page
      | Step       |
      | 1 - Step 1 |
    And I verify the following text in a page
      | WF Status: INACTIVE<Activate> |
    And I logout


    Examples:
      | Login User | Project Name            | WorkFlow Grid ID       | Login full username |
      | mscott     | NonAdminWFProject-15570 | BOGridLX_Grid_WorkFlow | Michael Scott       |