@all
Feature: Verify Ability to "move" asset to another facility

  Background:
    Given I login to IWMS using LxAdmin credentials
    And I navigate to the admin dashboard

  Scenario: Delete "MoveFacilityAssetFrom" and "MoveFacilityAssetTo" facilities
    And I delete "Contract" entity by name "AK001-A sample contract for moving assets"
    And I delete "Facility" entity by name "MoveFacilityAssetFrom"
    And I delete "Facility" entity by name "MoveFacilityAssetTo"

  Scenario: Import contract xml data file from import data folder with no error
    When I navigate to import page
    And I used data files from "Data/ImportDataFiles/"
    And I import following file name:
      | 33 MoveAsset.xml                  |

  Scenario: Navigation to Facility/Asset Management/Equipment and navigate to "MoveFacilityAssetFrom" entity
    When I navigate to "Facility, Asset Management, Equipment (FF&E)"
    Then I see that I am on the "Facility" entity tab
    And I see that I am on the second level tab "Asset Management"
    And I see that I am on the third level tab "Equipment (FF&E)"
    When I navigate to folders "United States,AK" and portfolio "MoveFacilityAssetFrom"

    Scenario: Validate default "Move In Date", populate destination facility and move it
      When I navigate to "Facility, Asset Management, Equipment (FF&E)"
      Then I see that I am on the "Facility" entity tab
      And I see that I am on the second level tab "Asset Management"
      And I see that I am on the third level tab "Equipment (FF&E)"
      When I click on the "Move Asset" action panel button
      Then I verify these field values on editable page
        |name                                |value                                   |
        |Asset_MoveInDate                    |FN_CURRENT_DATE_MDY                     |
      And I set these field values on editable page
        |name                                |value                                   |
        |Asset_ProjectEntityID               |MoveFacilityAssetTo                     |
        |AssetHistory_Notes                  |Company relocating                      |
      And I click on the "Move Asset" button

  Scenario: Navigation to Facility/Asset Management/Equipment and navigate to "MoveFacilityAssetTo" entity
    When I navigate to "Facility, Asset Management, Equipment (FF&E)"
    Then I see that I am on the "Facility" entity tab
    And I see that I am on the second level tab "Asset Management"
    And I see that I am on the third level tab "Equipment (FF&E)"
    When I navigate to folders "United States,AK" and portfolio "MoveFacilityAssetTo"

  Scenario: Change "Move In Date", populate destination facility and move it back
    When I navigate to "Facility, Asset Management, Equipment (FF&E)"
    Then I see that I am on the "Facility" entity tab
    And I see that I am on the second level tab "Asset Management"
    And I see that I am on the third level tab "Equipment (FF&E)"
    When I click on the "Move Asset" action panel button
    And I set these field values on editable page
      |name                                |value                                   |
      |Asset_MoveInDate                    |10/19/2034                              |
      |Asset_ProjectEntityID               |MoveFacilityAssetFrom                   |
      |AssetHistory_Notes                  |Company relocating  to North Dallas     |
    And I click on the "Move Asset" button


