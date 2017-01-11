@all
Feature: (Jira - AUTOMATION-1479) Convert Site to Project Entity name include the apostrophe

  Scenario Outline: I import files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/SetupWizards/"
    And I import following files:
      | Portfolio0019AndLocation0019-1479.xml |
      | Testing-1563Page-1479.xml             |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Convert Site to Project Entity name include the apostrophe
    When I navigate to "Tools,Setup Wizards"
    Then I see the "Setup Wizard" modal window
    And I delete incomplete setup wizard if exist
    And I select "<Item>" from the list
    And I select "<Portfolio>" from the Program List
    Then I click on the "Next" button
    And I see the "<Grid Header>" modal window
    And I set following fields value on editable page
      | name                                  | value              |
      | ProjectEntity_ProjectEntityName       | <Name>             |
      | ProjectEntity_RegionID                | Parent0019(test)   |
      | ProjectEntity_CodeMarketAreaID        | Legacy Market Area |
      | ProjectEntity_ComplexID               | Stonebriar         |
      | ProjectEntity_CrossStreet1            | WindDr             |
      | ProjectEntity_StreetAddress1          | 100                |
      | ProjectEntity_City                    | <City>             |
      | ProjectEntity_IStateProvinceCountryID | <State>            |
      | ProjectEntity_PostalCode              | <PIN>              |
      | ProjectEntity_CountryID               | <Country>          |
      | ProjectEntity_RentableArea            | 1500               |
      | SiteSurvey_CodeLandAreaUnitID         | Square Feet        |
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Schedule Set-up" modal window
    And I click on the "Finish" button

    Then I see "Site: <Name>, <City>, <State> <PIN> <Country>" name on the header
    And I select "<Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I verify the field "Name" is "<Name>" in a same row in "General Information"

    And I click on the "Convert to Project" action panel button
    And I switch to default frame
    And I wait for modal window to open
    And I set following fields value on editable page
      | name        | value         |
      | locationSel | true          |
      | locationID  | Location 0019 |
    And I click on the "Convert Site to Project" button
    Then I wait for modal window to close
    Then I see "Project: <Name>, <City>, <State> <PIN> <Country>" name on the header
    And I select "<Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I verify the field "Name" is "<Name>" in a same row in "General Information"
    And I verify the following action panel buttons are in sequence
      | Edit                |
      | Printable View      |
      | Setup Facility      |
      | Add Opening Project |
      | Audit Log           |
      | Save to Documents   |
      | Link                |


    Examples:
      | Summary Page      | Item | Grid Header       | Portfolio      | Name          | Setup Wizard      | City  | State | PIN   | Country       |
      | Testing-1563-Page | Site | Site Setup Wizard | Portfolio 0019 | Coeur D'Alene | Site Setup Wizard | Plano | TX    | 75035 | United States |
