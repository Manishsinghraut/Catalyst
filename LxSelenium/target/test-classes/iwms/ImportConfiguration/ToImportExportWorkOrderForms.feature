@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1351), To Import/Export Work Order Forms

  Scenario Outline: As a delete user I import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/ExportConfiguration/target/DownloadFiles/" for export configuration
    And I import the following files:
      | forms.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Verify that folder, Schedule and budget template created successfully
    When I navigate to the admin dashboard
    And I click on "Manage Forms" link
    Then I click "edit" row action in the non frame grid "BOGridCodeIssueType" having the following header and cell values
      | name        | value       |
      | Name        | <Form Name> |
      | Description |             |
    And I wait for "Edit Form Type  ***Required fields in red" modal window to open in non frame page
    Then I verify following radio fields exist
      | Work Order |
    And I click on the "Cancel" button
    Then I wait for modal window to close

    Examples:
      | Form Name |
      | WOForm    |