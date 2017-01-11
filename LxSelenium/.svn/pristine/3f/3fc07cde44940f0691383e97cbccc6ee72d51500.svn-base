@all
Feature: (Jira Ref : AUTOMATION-470) As an Delete user I need to be able to delete forms.

  Scenario Outline: I import file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageForms/"
    And I import following file name:
      | Delete-Form-Layout.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I want to delete form type
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    And I click on "delete" row action in the grid "BOGridCodeIssueType" having the following header "Name" and cell value "<Form Layout>"
      | name        | value |
      | Description |       |
    Then I see the "Delete Form Type" modal window
    And I click on the "Yes" button
    Then I verify success message "Successfully deleted Form Type" in non frame page
#    Then I see "Successfully deleted Form Type" in the grid header
    Then I verify form "<Form Layout>" present is "false"

    Examples:
      | Form Layout | Login User   | Login full username  |
      | Delete form | DeleteAccess | Delete Access Access |

     #issue reported iwms-20036
  Scenario Outline: I import file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageForms/"
    And I import following file name:
      | DeleteFormLayoutFromGroup.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: (Jira Ref :IWMS-20036) As an Delete user I need to be able to delete forms layout.
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    Then I expand the "<Form Group>" row in grid "<Grid>"
    And I click "delete" action of "<Form Layout>" sub row in the grid "<Grid>"
    And I see the "Delete Layout" modal window
    And I click on the "Yes" button
    And I wait for the Loading text to disappear in grid
    And I wait for modal window to close
    Then I verify page layout in grid "<Grid>" having value "<Form Layout>" under column header "Layout Name" not present


    Examples:
      | Form Layout   | Login User   | Login full username  | Form Group                | Grid                |
      | Delete Layout | DeleteAccess | Delete Access Access | DeleteFormLayoutFromGroup | BOGridCodeIssueType |