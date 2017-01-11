@all
Feature: (Jira ticket -Automation-1026) Page Layout - Display Sub-Page Name

  Scenario Outline: I import file for Page Layout - Display Sub-Page Name
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePageLayout/"
    And I import following file name:
      | FranchiseePortfolioSummary.xml |

    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I click "build layout" row action in the non frame grid "BOGridPageLayout" having the following header and cell values
      | name             | value         |
      | Page Layout Name | <Page Layout> |
    And I switch to "build layout" child window
    And I click on the '...' corresponding to field "List of Facilities"
    And I verify the following fields value on editable page
      | name  | value                  |
      | label | Portfolio - Facilities |
    And I click on "Cancel" Button
    And I wait for modal window to close
    And I close the "build layout" child window
    And I switch to main window

    Examples:
      | Page Layout                  | Login User   | Login full username  |
      | Franchisee Portfolio Summary | DeleteAccess | Delete Access Access |