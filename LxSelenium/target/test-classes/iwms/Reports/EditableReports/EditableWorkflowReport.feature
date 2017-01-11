@all
Feature: (Jira Ref. : AUTOMATION-1394) Editable Workflow Report

  Scenario Outline: Import xmls as delete user
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/EditableReports/"
    And I import following files:
      | EntityForEditableReport-1394.xml |
      | FormsforWF-1394.xml              |
      | EditableWorkflow-1394.xml        |
      | EditableWorkflowReport-1394.xml  |
    And I navigate to the admin dashboard
    And I click on "Manage Forms" link
    Then I verify the following values in non frame grid "BOGridCodeIssueType"
      | Name                      |
      | Form For WF step          |
      | Form to Kick-off Workflow |

    And I navigate to the admin dashboard
    And I click on "Manage Work Flows" link
    Then I verify the following values in non frame grid "BOGridWorkFlowTemplate"
      | Work Flow name    |
      | Editable Workflow |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Editable Workflow should be displayed successfully
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on "Forms" tab
    And I switch to visible frame
    And I click "Add Form..." button of frame grid "BOGridLX_Grid_Issue"
    Then I wait for " " modal window to open in non frame page
    And I select form type "Form to Kick-off the WF" in modal window
    And I click on the "OK" button
    And I set following fields value on editable page
      | name          | value         |
      | Issue_Subject | <Title>       |
      | Issue_Body    | Workflow form |
    And I click on the "Add" button
    And I wait for modal window to close
    And I click on "Work Flow" tab
    And I switch to visible frame
    And I click " Expand All " button
    And I verify the following values in frame grid "issueMainDiv"
      | Name              | Title   | Status           |
      | Editable Workflow | <Title> | ACTIVE (Invalid) |
    And I click on "edit" link of step "Form to Kick-off the WF" in work flow
    Then I wait for " " modal window to open in non frame page
    And I add following project members
      | Access, Delete Access |
    And I click on the "Update" button
    And I verify the following values in frame grid "issueMainDiv"
      | Name              | Title   | Status              |
      | Editable Workflow | <Title> | ACTIVE (In-process) |
    Then I verify non editable reply data in row having unique value "1 - Form Step" in form grid
      | name   | value         |
      | Step   | 1 - Form Step |
      | Status | In-process    |
    And I click on "Form Step" link
    And I wait for " " modal window to open in non frame page
    And I click on "Check Out" Button
    And I set following fields value on editable page
      | name                       | value     |
      | Issue_Body                 | Work flow |
      | Issue_Subject              | Report    |
      | Issue_CltExtIssue__Values1 | 500       |
      | Issue_CltExtIssue__Values2 | 250       |
    And I click on the "Update & Check in" button
    And I wait for modal window to close

    Examples:
      | Entity Name                | Title                   |
      | Entity for Editable report | Form to Kick-off the WF |

  Scenario Outline: Form step should be updated successfully
    When I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "Reports" child window
    And I click on the "Report"
    And I set following fields value on editable page
      | name          | value        |
      | Issue_Subject | Report Title |
    And I click on the green check mark

    And I click on the "Work flow"
    And I set following fields value on editable page
      | name       | value                 |
      | Issue_Body | Work flow description |
    And I click on the green check mark

    And I click on the "$500.00"
    And I set following fields value on editable page
      | name                       | value |
      | Issue_CltExtIssue__Values1 | 1000  |
    And I click on the green check mark

    And I click on the "$250.00"
    And I set following fields value on editable page
      | name                       | value |
      | Issue_CltExtIssue__Values2 | 200   |
    And I click on the green check mark
    And I click on "Rerun Report" link
    And I verify the following values in non frame grid
      | Title        | Description           | Field1    | Field2  |
      | Report Title | Work flow description | $1,000.00 | $200.00 |
    And I click on "Entity for Editable report" link
    And I close the "Reports" child window
    Then I switch to main window

    And I click on "Work Flow" tab
    And I switch to visible frame
    And I click " Expand All " button
    And I click on "Form Step" link
    And I wait for " " modal window to open in non frame page
    And I click on "Check Out" Button
    And I verify the following fields value on editable page
      | name                       | value                 |
      | Issue_Body                 | Work flow description |
      | Issue_Subject              | Report Title          |
      | Issue_CltExtIssue__Values1 | $1,000.00             |
      | Issue_CltExtIssue__Values2 | $200.00               |
    And I click on the "Complete" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear
    Then I verify grid "issueMainDiv" is empty with the following message "No rows to display"

    Examples:
      | Report Name              |
      | Editable Workflow Report |
