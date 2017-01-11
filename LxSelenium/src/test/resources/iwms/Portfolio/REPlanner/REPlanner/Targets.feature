@all
Feature:  (Jira Ref :AUTOMATION-1427) Targets

  Scenario Outline: I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/REPlanner/REPlanner/"
    And I import following files:
      | 00018_PortfolioAndLocation-1427.xml |
      | Target2208_Sites-1427.xml           |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I create targets through spreadsheet import
    When I navigate to entity type "Portfolios" named "<Entity Name>" through search option
    And I navigate to second level tab "RE Planner" and third level "RE Planner" tab of entity "Program"
    And I switch to visible frame
    And I verify the following text in a page
      | Target2208-Site B |
      | Target2208-Site A |
    And I click on "Add Targets" Button
    And I switch to "Add Targets" child window
    And I set following fields value on editable page
      | name                | value       |
      | DevelopmentSlotName | Target0001  |
      | DNumOfSlots         | 2           |
      | RegionID            | 00018Region |
      | CodeMarketAreaID    | Central     |
      | Duration            | 10          |
      | EndDate             | 10/05/2016  |
    And I click on "Add" Button
    And I switch to main window
    And I wait for the Loading text to disappear
    Then I see "Successfully added Development Target" message in the grid
    And I see "Successfully added 2 Targets" message in the grid
    Then I verify the following text in a a same row
      | Region: 00018Region 38.0                               |
      | Market: Central\n38.0                                  |
      | Target2208-Site B\n12.9                                |
      | Target0001-0\n12.6\n\n\n\n<Associate Site with Target> |
      | Target0001-1\n12.6\n\n\n\n<Associate Site with Target> |

    And I click on "<Associate Site with Target>" link
    And I verify the following values in non frame grid "^panel"
      | Site Name         | Address | Type | Status | Est. Open  |
      | Target2208-Site B |         | null | -      | 10/03/2016 |
    And I click on "<Associate Site>" link
    And I verify "Target2208-Site B, TX United States" name on the header

    When I navigate to entity type "Portfolios" named "<Entity Name>" through search option
    And I navigate to second level tab "RE Planner" and third level "RE Planner" tab of entity "Program"
    And I wait for the Loading text to disappear
    Then I verify the following text in a a same row
      | Target2208-Site B\n12.9\n\n\n\n<See the target> |


    Examples:
      | Entity Name                     |
      | 00018 Portfolio-AUTOMATION-1427 |