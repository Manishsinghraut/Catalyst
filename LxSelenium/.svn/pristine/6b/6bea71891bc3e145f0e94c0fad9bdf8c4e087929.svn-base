@all
Feature: I verify organization chart display

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/OrgChart/"
    And I import following file name:
      | OrgChartDisplay.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: (Jira Ref: AUTOMATION-444) I verify organization chart display
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    Then I verify I'm at Org chart page
    And I set following fields value on editable page
      | name            | value              |
      | OperatingStatus | <Operating Status> |
    And I wait for the Loading text to disappear
    And I set fields values on editable page
      | name      | value      |
      | RgnLayout | Vertically |
    Then I verify vertically organized regions "<Parent Region 1>,<Parent Region 2>"
    Then I verify vertically organized regions "<Sub Region Name>,<Market>"
    And I set fields values on editable page
      | name      | value        |
      | RgnLayout | Horizontally |
    Then I verify horizontally organized regions "<Parent Region 1>,<Parent Region 2>"
    Then I verify vertically organized regions "<Sub Region Name>,<Market>"


    Examples:
      | Operating Status | Second Level Tab | Sub Region Name     | Market             | Entity Name           | Parent Region 1     | Parent Region 2     | Login User   | Login full username  |
      | Pre-open         | Org Chart        | Selenium Sub Region | Legacy Market Area | For Org Chart Feature | Org-Chart-Display-1 | Org-Chart-Display-2 | DeleteAccess | Delete Access Access |
      | Operating        | Org Chart        | Selenium Sub Region | Legacy Market Area | For Org Chart Feature | Org-Chart-Display-1 | Org-Chart-Display-2 | DeleteAccess | Delete Access Access |