@all @smoke @smoke5
Feature: (Ref: JIRA ticket AUTOMATION-345) As an admin I should be able to create location wizard

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: when I navigate to Tools page I can add new Items from the set up wizard
    When I navigate to "Tools,Setup Wizards"
    Then I see the "Setup Wizard" modal window
    And I delete incomplete setup wizard if exist
    And I select "<Item>" from the list
    And I select "<Portfolio>" from the Program List
    Then I click on the "Next" button
    And I see the "<Grid Header>" modal window
    And I set these field values on editable page
      | name                    | value             |
      #      | Location_CodeLocationGroupID     | Retail                    |
      #      | Location_CodeLocationTypeID      | Retail                    |
      #      | Location_CodeLocationCategoryID  | Active                    |
      | Location_ClientEntityID | 7777              |
      | Location_ProgramID      | Lucernex-Selenium |
      #      | Location_CodeLocationStatusID    | Active                    |
      | Location_LocationName   | <Name>            |
    #      | Location_ProjectDescription      | This is a regression test |
    #      | Location_ComplexID               | Stonebriar                |
    #      | Location_CodeLocationUseID       | Retail                    |
    #      | Location_GrossLeaseArea          | 5000                      |
    #      | Location_LocationParcelArea      | 2000                      |
    #      | Location_CodeBuildingAreaUnitID  | Square Feet               |
    #      | Location_CodeLandAreaUnitID      | Square Feet               |
    #      | Location_StreetAddress1          | 5601 democracy dr         |
    #      | Location_City                    | Plano                     |
    #      | Location_IStateProvinceCountryID | TX                        |
    #      | Location_PostalCode              | 75024                     |
    #      | Location_CountryID               | United States             |
    #      | Location_RegionID                | Central Dallas(Operating) |
    #      | Location_CodeSubRegion1ID        | SubRegion                 |
    #      | Location_CodeSubRegion2ID        | SubRegion                 |
    #      | Location_CodeMarketAreaID        | Legacy Market Area        |
    #      | Location_CodeSubArea1ID          | SubArea                   |
    #      | Location_CodeSubArea2ID          | SubArea                   |
    #      | Location_CodeCurrencyTypeID      | USD                       |
    #      | ProjectEntity_ThirdPartyWarehouse | Mike's Selenium Webdriver Warehouse          |
    #      | Location_ThirdPartyWarehouseArea | 10000                     |
    #      | Location_AccountingNumber        | 1111111                   |
    #      | Location_TaxRate1                | 8.25                      |
    #      | Location_TaxRate2                | 10                        |
    #      | ProjectEntity_Notes               | Selenium webdriver Notes                     |
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
    And I set fields values on editable page
      | name             | value                    |
      | entityTemplateID | Selenium Folder Template |
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
    And I click on Assign Members button
    And I add following members
      | Tester, Selenium |
    And I click on "Update  members to <Name>" Button
    And I click on the "Finish Assigning Members" button
    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Schedule Set-up" modal window
    And I set fields values on editable page
      | name             | value             |
      | entityTemplateID | Selenium Schedule |
      | startDate        | 12/25/2015        |
    And I click on the "Finish" button
    And I navigate to "Summary"
    #    And I verify the Location Summary fields value on non-editable summary tab
    #      | name        | value             |
    #      | Group       | Retail            |
    #      | Type        | Retail            |
    #      | Category    | Active            |
    #      | Location ID | 7777              |
    #      | Portfolio   | Lucernex-Selenium |
    #      | Status      | Active            |
    #    And I verify the Location General Info fields value on non-editable summary tab
    #      | name                | value                     |
    #      | Name                | <Name>                    |
    #      | Description         | This is a regression test |
    #      | Center / Complex    | Stonebriar                |
    #      | Primary Use         | Retail                    |
    #      | Gross Leasable Area | 5,000                     |
    #      | Parcel Area         | 2,000                     |
    #      | Area Measurement    | Square Feet               |
    #      | Area Measurement    | Square Feet               |
    #    And I verify the Location Address fields value on non-editable summary tab
    #      | name    | value         |
    #      | City    | Plano         |
    #      | State   | TX            |
    #      | Zip     | 75024         |
    #      | Country | United States |
    #    And I verify the Location Region / Area Groups fields value on non-editable summary tab
    #      | name        | value                     |
    #      | Region      | Central Dallas(Operating) |
    #      | Sub Region1 | SubRegion                 |
    #      | Sub Region2 | SubRegion                 |
    #      | Market      | Legacy Market Area        |
    #      | Sub Area1   | SubArea                   |
    #      | Sub Area2   | SubArea                   |
    #      | Currency    | U.S. Dollar               |
    #    And I verify the Location Distribution fields value on non-editable summary tab
    #      | name           | value  |
    #      #      | Third-Party Warehouse | Mike's Selenium Webdriver Warehouse |
    #      | Warehouse Size | 10,000 |
    #    And I verify the Location Organization Information fields value on non-editable summary tab
    #      | name      | value   |
    #      | Acct.Ref# | 1111111 |
    #    And I verify the Location Contracts fields value on non-editable summary tab
    #      | name                                         | value |
    #      | Applicable Tax Rates for Generated Payments: | 8.25  |
    #    When I navigate to entity type "<Item>" named "<Name>"
    #    And I navigate to "<Item>, Members/Contacts"
#    And I navigate to "Members/Contacts"
    And I click on the "Members/Contacts" tab
    And I verify the Members/Contacts tab
      | type        | name            |
      | Team Member | Selenium Tester |
    And I click on the "Documents" tab
    And I verify the list of folders Document
      | SeleniumTestRootFolder1 |
    #    And I navigate to link "Facility, Schedule"
    #    And I verify the scheduler already applied
    #      | Pre-Contruction |
    Examples:
      | Item     | Grid Header           | Portfolio         | Name                        | Setup Wizard          |
      | Location | Location Setup Wizard | Lucernex-Selenium | Selenium Webdriver Location | Location Setup Wizard |
