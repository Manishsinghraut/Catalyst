Feature: To make sure users can customize their dashboards with certain modules and save it as the default view. (Jira Ref : AUTOMATION-1113)

  Scenario Outline: As Delete user, I create new tab on dashboard
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to dashboard page
    And I see the Dashboard
    Then I click on "+" tab
    And I enter a name "<tab>" for the tab in dashboard
    And I click "OK" button
    Then I verify "<tab>" tab
    And I expand portfolio navigation tab
    Then I click on "<tab>" tab
    And I Drag and Drop module "My Activities" on dashboard "<tab>" in X coordinate 150 and Y coordinate 10 order
    And I Drag and Drop module "My Alerts" on dashboard "<tab>" in X coordinate 350 and Y coordinate 10 order
    And I Drag and Drop module "My Approvals" on dashboard "<tab>" in X coordinate 450 and Y coordinate 10 order
    And I Drag and Drop module "My Form Assignments" on dashboard "<tab>" in X coordinate 550 and Y coordinate 10 order
    And I Drag and Drop module "My Work Queue" on dashboard "<tab>" in X coordinate 650 and Y coordinate 10 order
    And I click "Make Default" button
    And I click "OK" button
    And I navigate to the admin dashboard
    Then I click on "Dashboard" tab
    And I click on "<tab>" tab
    And I expand portfolio navigation tab
    And I wait for the loading text to be disappear
    And I verify the dashboard modules made as default should appear in the same alphabetical order
      | My Activities       |
      | My Alerts           |
      | My Approvals        |
      | My Form Assignments |
      | My Work Queue       |

  Examples:
    | Login User   | Login full username  | tab               |
    | DeleteAccess | Delete Access Access | DEFAULT DASHBOARD |

