@all
Feature: I Migrating Org Chart - Create new regions upon migration

#  Background:
    #Given I login to IWMS using LxAdmin credentials
#    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/OrgChart/"
    And I import following file name:
      | Migrate Selenium Entity.xml |
      | Migrate Project Regions.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline:(Jira Ref: AUTOMATION-447)  Migrating Org Chart - Create new regions upon migration
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    Given I navigate to "<Item>, <Second Level Tab>" entity
    And I navigate to entity "<Migrate Project Regions>"
    And I click on the "Migrate Org Chart" action panel button
    And I switch to visible frame
    And I verify the following message "Org Chart Migration Page for Portfolio '<Migrate Project Regions>'"
    And I switch to visible frame
    And I set fields values on editable page
      | name           | value         |
      | destProgramID  | <Entity Name> |
      | autoAddRegions | true          |

    And I click on "Start Processing" Button
    Then I verify entity type "Mapped Portfolio '<Migrate Project Regions>' to use Org Chart from Portfolio '<Entity Name>'"

    Examples:
      | Item      | Second Level Tab | Entity Name             | Migrate Project Regions | Login User   | Login full username  |
      | Portfolio | Org Chart        | Migrate Selenium Entity | Migrate Project Regions | DeleteAccess | Delete Access Access |