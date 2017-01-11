@all
Feature: Convert Site to Project successfully when the Site is Assigned to TargetSlot [Jira Ticket No : AUTOMATION-1407]

  Scenario Outline: I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Site/Details/Summary/"
    And I import following file name:
      | Portfolio2177_1407.xml |
      | Site_2177_1407.xml     |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Delete user , I verify the On Clicking refresh 2177 Target shall appear Successfully
    Given I navigate to entity type "Portfolios" named "<Portfolio Name>" through search option
    And I navigate to second level tab "<Secondary Tab>" and third level "<Third Level Tab>" tab of entity "Program"
    And I wait for the Loading text to disappear
    Then I verify unique link text on non editable page "Site 2177"
    And I set following fields value on editable page
      | name      | value |
      | startYear | 2000  |
    And I click on "Refresh" Button
    Then I verify unique link text on non editable page "2177 Target"
    And I click on "<Associate Site with Target>" link
    And I switch to default frame
    And I click on "<Associate Site>" link
    And I wait for the Loading text to disappear in grid
    And I verify "Site 2177, TX United States" name on the header

    When I navigate to entity type "Portfolios" named "<Portfolio Name>" through search option
    Then I see "<Portfolio Name>" name on the header
    And I navigate to second level tab "<Secondary Tab>" and third level "<Third Level Tab>" tab of entity "Program"
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name      | value |
      | startYear | 2000  |
    And I click on "Refresh" Button
    And I click on "<See the target>" link
    And I switch to default frame
    And I switch to "Target" child window
    And I wait for the Loading text to disappear in grid
    And I set following fields value on editable page
      | name                | value              |
      | DevelopmentSlotName | 2177 Target        |
      | RegionID            | 2177 Parent        |
      | CodeMarketAreaID    | Legacy Market Area |
      | CodeMarketTypeID    |                    |
      | TradeArea           |                    |
      | CodeSlotTypeID      |                    |
      | BrokerMemberID      |                    |
      | BrokerMessage       |                    |
      | PrototypeID         |                    |
      | TaskTemplatePEID    |                    |
      | Duration            | 250                |
      | ProjectPEID         | Site: Site 2177    |
      | EndDate             | 01/01/2000         |
      | OriginalEndDate     |                    |
      | PlannedPackageDate  |                    |
    And I close the "Target" child window
    And I switch to main window

    Examples:
      | Portfolio Name | Secondary Tab | Third Level Tab |
      | Portfolio2177  | RE Planner    | RE Planner      |

  Scenario Outline: I Delete user , I verify the Site associated with a Target is successfully converted to a Project.
    Given I navigate to entity type "Sites" named "<Site Name>" through search option
    And I navigate to second level tab "Details" and third level "Summary" tab of entity "PotentialProject"
    And I click on the "Convert to Project" action panel button
    And I click on the "Convert Site to Project" button
    And I wait for modal window to close
    And I wait for the loading text to be disappear
    And I verify "Project: Site 2177, TX United States" name on the header

    Examples:
      | Site Name |
      | Site 2177 |