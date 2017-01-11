@all
Feature: I migrate org chart to reference another org chart

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/OrgChart/"
    And I import following file name:
      | Portfolio with empty org chart.xml |
      | Portfolio with org chart.xml       |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: (Jira Ref : AUTOMATION-445) I migrate org chart to reference another org chart
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to "<Item>" entity
    And I navigate to "<Second Level Tab>"
    Then I navigate to entity "<Portfolio with empty org chart>"
    And I click on the "Migrate Org Chart" action panel button
    Then I verify I'm at Move Org chart page
    And I set fields values on editable page
      | name          | value                      |
      | destProgramID | <Portfolio with org chart> |
    And I click on "Start Processing" Button
    And I wait for the Loading text to disappear
    And I wait for the Loading text to disappear in grid
    And I switch to visible frame
    #Then I verify 'Org Chart Migration Success' message after referencing portfolio "<Portfolio with org chart>"'s org chart to "<Portfolio with empty org chart>" portfolio
    Then I verify Org Chart Migration Success message after referencing portfolio "<Portfolio with org chart>"'s org chart to "<Portfolio with empty org chart>" portfolio

    Examples:
      | Item      | Second Level Tab | Portfolio with empty org chart | Portfolio with org chart | Login User   | Login full username  |
      | Portfolio | Org Chart        | Portfolio with empty org chart | Portfolio with org chart | DeleteAccess | Delete Access Access |


  Scenario Outline: (Jira Ref : AUTOMATION-448) I migrate org chart to restore original org chart
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to "<Item>" entity
    And I navigate to "<Second Level Tab>"
    Then I navigate to entity "<Portfolio with empty org chart>"
    And I navigate to "<Second Level Tab>"
    And I click on the "Migrate Org Chart" action panel button
    And I switch to visible frame
    And I click on "Reset" Button
    And I switch to visible frame
    And I set fields values on editable page
      | name           | value   |
      | autoAddRegions | true    |
      | orgOp          | restore |
    And I click on "Start Processing" Button
    And I wait for the Loading text to disappear
    And I wait for the Loading text to disappear in grid
    And I switch to visible frame
    Then I verify 'Org Chart Migration Success' message after restoring portfolio "<Portfolio with empty org chart>"'s org chart to original

    Examples:
      | Item      | Second Level Tab | Portfolio with empty org chart | Region Name            | Login User   | Login full username  |
      | Portfolio | Org Chart        | Portfolio with empty org chart | Migrate This Org Chart | DeleteAccess | Delete Access Access |