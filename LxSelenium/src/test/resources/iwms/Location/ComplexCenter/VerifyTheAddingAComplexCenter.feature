@all
Feature: (Jira Ref : AUTOMATION-1478) Verify the Adding a Complex/Center

  Scenario Outline: Verify the Adding a Complex/Center
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/ComplexCenter/"
    And I import following file name:
      | Portfolio_0019AndLocation_0019-1478.xml |

    When I navigate to entity type "Locations" named "<Location Name>" through search option
    And I click on the "Summary" tab
    And I click on the "Edit" action panel button
    And I wait for the Loading text to disappear
    And I click on the ... of "Center / Complex" Field
    Then I wait for "Select Complex" modal window to open in non frame page
    And I click "Add Complex..." button of non frame grid "<Grid ID>"
    And I wait for "Add Complex  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                                  | value                |
      | Complex_ComplexName                   | <Complex Name>       |
      | Complex_CodeComplexTypeID             | Mall                 |
      | Complex_CodeComplexStatusID           | Newly Opened         |
      | Complex_StreetAddress1                | 5604 Early Bird      |
      | Complex_CodeComplexClassID            | Class                |
      | Complex_ClientNumber                  | 345672ED             |
      | Complex_StreetAddress2                | North Wing 23        |
      | Complex_YearBuilt                     | 1999                 |
      | Complex_NumberLevels                  | 5                    |
      | _checkbox_Complex_HasFoodCourt        | true                 |
      | _checkbox_Complex_IsEnclosed          | true                 |
      | Complex_NearestCompetition            | San Store            |
      | Complex_City                          | Plano                |
      | Complex_IStateProvinceCountryID       | TX                   |
      | Complex_JurisdictionID                | Collin               |
      | Complex_PostalCode                    | 75024                |
      | Complex_CountryID                     | United States        |
      | Complex_NumberParkingSpaces           | 45                   |
      | Complex_DeveloperID                   | Delete Access Access |
      | Complex_LandlordID                    | Delete Access Access |
      | Complex_PropertyManagerID             | Delete Access Access |
      | Complex_NotableTenants                | Hudson Bay Company   |
      | Complex_NumberStores                  | 12                   |
      | Complex_NumberOutparcels              | 10                   |
      | _checkbox_Complex_IsExpansionPlanned  | true                 |
      | _checkbox_Complex_IsRenovationPlanned | true                 |
      | Complex_ExpansionPlanDate             | 10/18/2020           |
      | Complex_RenovationPlanDate            | 10/18/2020           |
      | Complex_LastRenovated                 | 10/18/2016           |
      | Complex_GrossLeaseArea                | 670000               |
      | Complex_GLAExcludingAnchors           | 45                   |
      | Complex_CodeBuildingAreaUnitID        | Square Feet          |
      | _checkbox_Complex_IsSpaceAvailable    | true                 |
      | Complex_OccupancyPercentage           | 10                   |
      | Complex_SalesPerArea                  | 20000                |
      | Complex_Notes                         | Test Case Sprint 19  |

    And I click on the "Add" button
    Then I wait for modal window to close
    And I wait for the Loading text to disappear
    Then I verify the following fields value on editable page
      | name               | value          |
      | Location_ComplexID | <Complex Name> |
    And I click on the "Save Changes" action panel button
    And I switch to visible frame
    And I verify the field "Center / Complex" is "8383 Complex" in a same row in "Location General Info"
    And I navigate to the admin dashboard
    And I click on "Manage Complex/Center Details" link
    Then I verify the following values in non frame grid "<Grid ID>"
      | Name           | Format | Scheme | Gross Lease Area | Number Stores | Number Outparcels | Number of Levels | Occupancy Percentage | Landlord             | Year Built | Status       | Actions        |
      | <Complex Name> | Mall   | Class  | 670,000.00       | 12            | 10                | 5                | 10.00000%            | Delete Access Access | 1999       | Newly Opened | edit \| delete |
    And I click "edit" row action in the non frame grid "<Grid ID>" having the following header and cell values
      | name | value          |
      | Name | <Complex Name> |
    And I wait for "Edit Complex  ***Required fields in red" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name                                  | value                |
      | Complex_ComplexName                   | <Complex Name>       |
      | Complex_CodeComplexTypeID             | Mall                 |
      | Complex_CodeComplexStatusID           | Newly Opened         |
      | Complex_StreetAddress1                | 5604 Early Bird      |
      | Complex_CodeComplexClassID            | Class                |
      | Complex_ClientNumber                  | 345672ED             |
      | Complex_StreetAddress2                | North Wing 23        |
      | Complex_YearBuilt                     | 1999                 |
      | Complex_NumberLevels                  | 5                    |
      | _checkbox_Complex_HasFoodCourt        | true                 |
      | _checkbox_Complex_IsEnclosed          | true                 |
      | Complex_NearestCompetition            | San Store            |
      | Complex_City                          | Plano                |
      | Complex_IStateProvinceCountryID       | TX                   |
      | Complex_JurisdictionID                | Collin               |
      | Complex_PostalCode                    | 75024                |
      | Complex_CountryID                     | United States        |
      | Complex_NumberParkingSpaces           | 45                   |
      | Complex_DeveloperID                   | Delete Access Access |
      | Complex_LandlordID                    | Delete Access Access |
      | Complex_PropertyManagerID             | Delete Access Access |
      | Complex_NotableTenants                | Hudson Bay Company   |
      | Complex_NumberStores                  | 12                   |
      | Complex_NumberOutparcels              | 10                   |
      | _checkbox_Complex_IsExpansionPlanned  | true                 |
      | _checkbox_Complex_IsRenovationPlanned | true                 |
      | Complex_ExpansionPlanDate             | 10/18/2020           |
      | Complex_RenovationPlanDate            | 10/18/2020           |
      | Complex_LastRenovated                 | 10/18/2016           |
      | Complex_GrossLeaseArea                | 670,000              |
      | Complex_GLAExcludingAnchors           | 45                   |
      | Complex_CodeBuildingAreaUnitID        | Square Feet          |
      | _checkbox_Complex_IsSpaceAvailable    | true                 |
      | Complex_OccupancyPercentage           | 10.00000%            |
      | Complex_SalesPerArea                  | $20,000.00           |
      | Complex_Notes                         | Test Case Sprint 19  |
    And I click on the "Cancel" button
    And I wait for modal window to close


    Examples:
      | Login User   | Login full username  | Location Name | Complex Name | Grid ID       |
      | DeleteAccess | Delete Access Access | Location 0019 | 8383 Complex | BOGridComplex |