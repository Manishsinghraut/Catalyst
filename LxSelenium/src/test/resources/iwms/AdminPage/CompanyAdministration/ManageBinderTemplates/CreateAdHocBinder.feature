@all @smoke5Dot1
Feature: (Jira Ref: AUTOMATION-1453)I Create Ad Hoc Binder Template and verify in  Admin -> Manage Binder Templates

  Scenario Outline: I create Ad Hoc Binder Template and verify them in  Admin -> Manage Binder Template
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Then I navigate to the admin dashboard
    And I click on "Manage Binder Templates" link
    And I click "Add Binder Template..." button of non frame grid "<Grid ID>"
    And I wait for "Add Binder Template  ***Required fields in red" modal window to open in non frame page
    When I set these field values on editable page
      | name                         | value  |
      | CommitteePackageTemplateName | Ad Hoc |
    And I click on the "Add" button
    And I wait for modal window to close
    And I wait for the Loading text to disappear in grid
    Then I verify grid item "<Binder Template>" present is "true" in grid "<Grid ID>"
    And I see "Successfully added Binder Template" message in the header
    And I click "edit documents" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name          | value  |
      | Template Name | Ad Hoc |
    Then I verify grid "main" is empty with the following message "No rows to display"
    And I verify tab "Binder Documents" is selected by default

    Examples:
      | Login User   | Login full username  | Binder Template | Grid ID                        |
      | DeleteAccess | Delete Access Access | Ad Hoc          | BOGridCommitteePackageTemplate |