@all
Feature: As an Delete user I need to be able to delete page layout.(Jira Ref. AUTOMATION-464)

  Scenario Outline: I import file for delete page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePageLayout/"
    And I import following file name:
      | Delete-Page-Layout.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I want to delete page layout from manage page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I wait for the Loading text to disappear in grid
    When I click "delete" link of "<Page Layout>" page layout
    Then I see the "Delete item" modal window
    And I click on the "Yes" button
#    Then I see "Successfully deleted item" in the grid header
    And I verify page layout "<Page Layout>" present is "false"

    Examples:
      | Page Layout        | Login User   | Login full username  |
      | Delete-Page-Layout | DeleteAccess | Delete Access Access |