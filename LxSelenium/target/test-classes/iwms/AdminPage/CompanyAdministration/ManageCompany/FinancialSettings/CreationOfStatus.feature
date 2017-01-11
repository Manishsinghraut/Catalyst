@all
Feature:(JIRA:AUTOMATION-852) Manage Company -Financial Settings -Creation of Status (Updated)

  Scenario Outline: As a delete user I can able to update payment approvals level
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I click on "Enabled" link
    And I set spin fields values on editable page
      | name                             | value |
#      | numberOfApproversFld | 2     |
      | Firm_NumberOfPTApprovalLevelsFld | 2     |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header
    And I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I click "edit" button of the member "<Contact Name>"
    And I verify following options are available in the list field "CodeApprovalStatusID"
      | Approved           |
      | Approved - Level 1 |
    And I click on the "Cancel" button

    Examples:
      | Login User   | Login full username  | Contact Name         |
      | DeleteAccess | Delete Access Access | Delete Access Access |