@smoke2Dot1
Feature: Testing User can Create and Configure a new tab successfully (Jira Ref : AUTOMATION-1112)

  Scenario Outline: As Delete user, I create new tab on dashboard
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I see the Dashboard
    Then I click on "+" tab
    And I enter a name "Create New Dashboard" for the tab in dashboard
    And I click "OK" button
    Then I verify "Create New Dashboard" tab
    And I expand portfolio navigation tab
    Then I click on "Create New Dashboard" tab
    And I Drag and Drop module "Project Administration" on dashboard "Create New Dashboard"
    And I Drag and Drop module "Program Administration" on dashboard "Create New Dashboard"
    And I Drag and Drop module "Project Updating" on dashboard "Create New Dashboard"
    Then I click on "Dashboard" tab
    Then I click on "Create New Dashboard" tab
    And I verify the module item "Project Administration" displayed on the created dashboard
    And I verify the module item "Program Administration" displayed on the created dashboard
    And I verify the module item "Project Updating" displayed on the created dashboard

    Then I click on "+" tab
    And I enter a name "zz" for the tab in dashboard
    And I click "OK" button
    Then I verify "zz" tab
    Then I click on "+" tab
    And I enter a name "aa" for the tab in dashboard
    And I click "OK" button
    Then I verify "aa" tab
    And I verify Newly Created Dashboards shall added in descending alphabetical order between Map and Dashboard
      | Map                  |
      | zz                   |
      | Create New Dashboard |
      | aa                   |
      | Dashboard            |
      | +                    |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |