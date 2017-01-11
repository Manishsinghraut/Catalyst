@all @smoke5Dot111
Feature: (Jira - AUTOMATION-136) Site to Project Conversion - Location Details (Jira Ref.:AUTOMATION-136)

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: Use Existing Location - Create a new site via the site wizard
    When I used data files from "Data/ImportDataFiles/iwms/SetupWizards/"
    And I import following file name:
      | Site-LocationConversion-1.xml     |
      | Location-LocationConversion-1.xml |

    When I navigate to entity type "Sites" named "<Entity Name>" through search option
    Then I see "<Entity Name>" name on the header
    And I click on the "Convert to Project" action panel button
    And I verify the following fields value on editable page
      | name       | value                        |
      | locationID | Site - Location Conversion-1 |
    And I set following fields value on editable page
      | name        | value               |
      | locationSel | useExistingLocation |
    And I click on the "Convert Site to Project" button
#    Then I see that I am on the entity page "Project: <Entity Name>"
    Then I see that I am on the entity page "<Entity Name>"

    And I wait for the Loading text to disappear
    And I verify the field "Prototype" is "Selenium Webdriver Prototype" in a same row in "General Information"
    And I verify the field "Market Type" is "Retail Mall" in a same row in "General Information"
    And I verify the field "Construction Type" is "Brick" in a same row in "General Information"
    And I verify the field "Portfolio" is "Lucernex-Selenium" in a same row in "General Information"
#    And I verify the field "Trade Area" is "Test" in a same row in "General Information"
#    And I verify the field "Deal Type" is "Leasing" in a same row in "General Information"

    Then I verify the field "Center Name" is "Stonebriar" in a same row in "Location"
    And I verify the field "Cross Street 1" is "" in a same row in "Location"
    And I verify the field "Street Address" is "5601 democracy dr" in a same row in "Location"
    And I verify the field "City" is "Plano" in a same row in "Location"
    And I verify the field "Zip / Postal Cd" is "75024" in a same row in "Location"
    And I verify the field "County" is "" in a same row in "Location"
    And I verify the field "Latitude" is "" in a same row in "Location"
    And I verify the field "Cross Street 2" is "" in a same row in "Location"
    And I verify the field "State / Province" is "TX" in a same row in "Location"
    And I verify the field "Country" is "United States" in a same row in "Location"
    And I verify the field "Longitude" is "" in a same row in "Location"
    And I verify the following details in non editable summary page in frame grid
      | General Information |                                                     |
      | Name                | <Entity Name>                                       |
      | Region              | Central (Central region - preOpen) Frisco(Pre-Open) |
    And I verify the field "Market Area" is "Legacy Market Area" in a same row in "General Information"

    Examples:
      | Entity Name                  |
      | Site - Location Conversion-1 |


  Scenario Outline: Use new Location - convert site to project
    When I used data files from "Data/ImportDataFiles/iwms/SetupWizards/"
    And I import following file name:
      | Site-LocationConversion-2.xml     |
      | Location-LocationConversion-2.xml |

    When I navigate to entity type "Sites" named "<Entity Name>" through search option
    Then I see "<Entity Name>" name on the header
    And I click on the "Convert to Project" action panel button
    And I set following fields value on editable page
      | name         | value             |
      | locationSel  | createNewLocation |
      | locationName | <Location Name>   |
    And I click on the "Convert Site to Project" button
#    Then I see that I am on the entity page "Project: <Entity Name>"
    Then I see that I am on the entity page "<Entity Name>"
    And I wait for the Loading text to disappear
    And I verify the following details in non editable summary page in frame grid
      | General Information |                                                     |
      | Name                | <Entity Name>                                       |
      | Region              | Central (Central region - preOpen) Frisco(Pre-Open) |

    And I verify the field "Market Area" is "Legacy Market Area" in a same row in "General Information"
    And I verify the field "Prototype" is "Selenium Webdriver Prototype" in a same row in "General Information"
    And I verify the field "Market Type" is "Retail Mall" in a same row in "General Information"
    And I verify the field "Construction Type" is "Brick" in a same row in "General Information"
    And I verify the field "Portfolio" is "Lucernex-Selenium" in a same row in "General Information"
#    And I verify the field "Trade Area" is "Test" in a same row in "General Information"
#    And I verify the field "Deal Type" is "Leasing" in a same row in "General Information"

    Then I verify the field "Center Name" is "" in a same row in "Location"
    And I verify the field "Cross Street 1" is "Democracy" in a same row in "Location"
    And I verify the field "Street Address" is "5601 democracy dr" in a same row in "Location"
    And I verify the field "City" is "Plano" in a same row in "Location"
    And I verify the field "Zip / Postal Cd" is "75024" in a same row in "Location"
    And I verify the field "County" is "" in a same row in "Location"
    And I verify the field "Latitude" is "" in a same row in "Location"
    And I verify the field "Cross Street 2" is "Parkwood" in a same row in "Location"
    And I verify the field "State / Province" is "TX" in a same row in "Location"
    And I verify the field "Country" is "United States" in a same row in "Location"
    And I verify the field "Longitude" is "" in a same row in "Location"

    And I navigate to entity type "Location" named "<Location Name>" through search option
#    Then I see that I am on the entity page "Location: <Location Name>"
    Then I see that I am on the entity page "<Location Name>"

    Examples:
      | Entity Name                  | Location Name                      |
      | Site - Location Conversion-2 | New Site - Location Conversion New |




#@all
#Feature: (Jira - AUTOMATION-136)Site to Project Conversion - Location Details (Jira Ref.:AUTOMATION-136)
#
#  Background:
#    Given I Login to IWMS using "DeleteAccess" access credentials
#
#  Scenario Outline: Use Existing Location - Create a new site via the site wizard
#    When I navigate to "Tools,Setup Wizards"
#    Then I see the "Setup Wizard" modal window
#    And I select "<Item>" from the list
#    And I select "<Portfolio>" from the Program List
#    Then I click on the "Next" button
#    And I see the "<Grid Header>" modal window
#    And I set these field values on editable page
#      | name                                  | value                                               |
#      | ProjectEntity_ProjectEntityName       | <Name>                                              |
#      | ProjectEntity_RegionID                | Central (Central region - preOpen) Frisco(Pre-Open) |
#      | ProjectEntity_CodeMarketAreaID        | Legacy Market Area                                  |
#      | ProjectEntity_PrototypeID             | <Prototype>                                         |
#      | ProjectEntity_CodeProjectTypeID       | Retail Project                                      |
#      | ProjectEntity_CodeMarketTypeID        | Retail Mall                                         |
#      | ProjectEntity_TradeArea               | Test                                                |
#      | ProjectEntity_CodeConstructionTypeID  | Brick                                               |
#      | ProjectEntity_CodeDealTypeID          | Leasing                                             |
#      | ProjectEntity_ProjectDescription      | Selenium Test Description                           |
#      | _ManagerIDList_MemberID_add           | Administrator, Lx                                   |
#      | ProjectEntity_ComplexID               | Stonebriar                                          |
#      | ProjectEntity_CrossStreet1            | Democracy                                           |
#      | ProjectEntity_CrossStreet2            | Parkwood                                            |
#      | ProjectEntity_StreetAddress1          | 5601 democracy dr                                   |
#      | ProjectEntity_City                    | Plano                                               |
#      | ProjectEntity_IStateProvinceCountryID | TX                                                  |
#      | ProjectEntity_PostalCode              | 75024                                               |
#      | ProjectEntity_CountryID               | United States                                       |
#      | ProjectEntity_LatitudeDegrees         |                                                     |
#      | ProjectEntity_ActualEndDate           | 12/31/2015                                          |
#      | ProjectEntity_RentableArea            | 100                                                 |
#      | ProjectEntity_UsableArea              | 80                                                  |
#      | ProjectEntity_Depth                   | 10                                                  |
#      | ProjectEntity_GrossArea               | 100                                                 |
#      | ProjectEntity_Frontage                | 20                                                  |
#      | SiteSurvey_CodeLandAreaUnitID         | Square Feet                                         |
#    And I click on the "Next" button
#    Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
#    And I set fields values on editable page
#      | name             | value             |
#      | entityTemplateID | <Folder Template> |
#    And I click on the "Next" button
#    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
#    And I click on Assign Members button
#    And I add following members
#      | Tester, Selenium |
#    And I click on "Update  members to <Name>" Button
#    And I click on the "Finish Assigning Members" button
#    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
#    And I click on the "Next" button
#    Then I see the "<Setup Wizard> -> <Name> -> Schedule Set-up" modal window
#    And I set fields values on editable page
#      | name             | value             |
#      | entityTemplateID | Selenium Schedule |
#    Then I select "Start on" from the list
#    And I set fields values on editable page
#      | name      | value      |
#      | startDate | 12/25/2015 |
#    And I click on the "Finish" button
#    And I navigate to "Summary"
#    And I verify the General Information fields value on site entity non-editable summary tab
#      | name              | value                                               |
#      | Name              | <Name>                                              |
#      | Region            | Central (Central region - preOpen) Frisco(Pre-Open) |
#      | Market Area       | Legacy Market Area                                  |
#      | Prototype         | <Prototype>                                         |
#      | Project Type      | Retail Project                                      |
#      | Market Type       | Retail Mall                                         |
#      | Trade Area        | Test                                                |
#      | Construction Type | Brick                                               |
#      | Deal Type         | Leasing                                             |
#      | Description       | Selenium Test Description                           |
#
#  Examples:
#    | Item | Grid Header       | Portfolio         | Name                       | Setup Wizard      | Prototype                    | Folder Template          |
#    | Site | Site Setup Wizard | Lucernex-Selenium | Site - Location Conversion | Site Setup Wizard | Selenium Webdriver Prototype | Selenium Folder Template |
#
#
#  Scenario Outline: Use Existing Location - Create a new location via the site wizard
#    When I navigate to "Tools,Setup Wizards"
#    Then I see the "Setup Wizard" modal window
#    And I select "<Item>" from the list
#    And I select "<Portfolio>" from the Program List
#    Then I click on the "Next" button
#    And I see the "<Grid Header>" modal window
#    And I set these field values on editable page
#      | name                            | value                            |
#      | Location_ClientEntityID         | 7777                             |
#      | Location_ProgramID              | Lucernex-Selenium                |
#      | Location_LocationName           | <Name>                           |
#      | Location_CodeLocationGroupID    | Retail                           |
#      | Location_CodeLocationTypeID     | Regional Center                  |
#      | Location_CodeLocationCategoryID | Leased                           |
#      | Location_CodeLocationUseID      | Retail                           |
#      | Location_CodeLocationStatusID   | Active                           |
#      | Location_RegionID               | Central Dallas(Operating)        |
#      | Location_CodeMarketAreaID       | Legacy Market Area               |
#      | ProjectEntity_Notes             | Site - location conversion Notes |
#
#    And I click on the "Next" button
#    Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
#    And I set fields values on editable page
#      | name             | value                    |
#      | entityTemplateID | Selenium Folder Template |
#    And I click on the "Next" button
#    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
#    And I click on Assign Members button
#    And I add following members
#      | Tester, Selenium |
#    And I click on "Update  members to <Name>" Button
#    And I click on the "Finish Assigning Members" button
#    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
#    And I click on the "Next" button
#    Then I see the "<Setup Wizard> -> <Name> -> Schedule Set-up" modal window
#    And I set fields values on editable page
#      | name             | value             |
#      | entityTemplateID | Selenium Schedule |
#      | startDate        | 12/25/2015        |
#    And I click on the "Finish" button
#    And I navigate to "Summary"
#
#  Examples:
#    | Item     | Grid Header           | Portfolio         | Name                       | Setup Wizard          |
#    | Location | Location Setup Wizard | Lucernex-Selenium | Site - Location Conversion | Location Setup Wizard |
#
#
#  Scenario Outline: Use Existing Location - Navigate to the summary page of the site created
#    When I Search for the "<Entity Name>" that was created
#    And Click on the name of the "Site - Location Conversion, Plano, TX 75024 United States" in the results pop-up
#    And I navigate to "<Second Level Tab>"
#    Then I see "<Entity Name>" name on the header
#    And I click on the "Convert to Project" action panel button
#    And I set following fields value on editable page
#      | name        | value                      |
#      | locationSel | useExistingLocation        |
#      | locationID  | Site - Location Conversion |
#    And I click on the "Convert Site to Project" button "on pop up window"
#    And I verify the General Information fields value on project entity non-editable summary tab
#      | name | value         |
#      | Name | <Entity Name> |
#    And I verify the Location fields value on site entity non-editable summary tab
#      | name             | value             |
#      | Center Name      | Stonebriar        |
#      | Cross Street 2   |                   |
#      | Cross Street 1   |                   |
#      | Street Address   | 5601 democracy dr |
#      | City             | Plano             |
#      | State / Province | TX                |
#      | Zip / Postal Cd  | 75024             |
#      | Country          | United States     |
#
#  Examples:
#    | Entity Name                | Second Level Tab |
#    | Site - Location Conversion | Details          |
#
#  Scenario Outline: Create a New Location - Create a new site via the site wizard
#    When I navigate to "Tools,Setup Wizards"
#    Then I see the "Setup Wizard" modal window
#    And I select "<Item>" from the list
#    And I select "<Portfolio>" from the Program List
#    Then I click on the "Next" button
#    And I see the "<Grid Header>" modal window
#    And I set these field values on editable page
#      | name                                  | value                                               |
#      | ProjectEntity_ProjectEntityName       | <Name>                                              |
#      | ProjectEntity_RegionID                | Central (Central region - preOpen) Frisco(Pre-Open) |
#      | ProjectEntity_CodeMarketAreaID        | Legacy Market Area                                  |
#      | ProjectEntity_PrototypeID             | <Prototype>                                         |
#      | ProjectEntity_CodeProjectTypeID       | Retail Project                                      |
#      | ProjectEntity_CodeMarketTypeID        | Retail Mall                                         |
#      | ProjectEntity_TradeArea               | Test                                                |
#      | ProjectEntity_CodeConstructionTypeID  | Brick                                               |
#      | ProjectEntity_CodeDealTypeID          | Leasing                                             |
#      | ProjectEntity_ProjectDescription      | Selenium Test Description                           |
#      | _ManagerIDList_MemberID_add           | Administrator, Lx                                   |
#      | ProjectEntity_ComplexID               | Stonebriar                                          |
#      | ProjectEntity_CrossStreet1            | Democracy                                           |
#      | ProjectEntity_CrossStreet2            | Parkwood                                            |
#      | ProjectEntity_StreetAddress1          | 5601 democracy dr                                   |
#      | ProjectEntity_City                    | Plano                                               |
#      | ProjectEntity_IStateProvinceCountryID | TX                                                  |
#      | ProjectEntity_PostalCode              | 75024                                               |
#      | ProjectEntity_CountryID               | United States                                       |
#      | ProjectEntity_LatitudeDegrees         |                                                     |
#      | ProjectEntity_ActualEndDate           | 12/31/2015                                          |
#      | ProjectEntity_RentableArea            | 100                                                 |
#      | ProjectEntity_UsableArea              | 80                                                  |
#      | ProjectEntity_Depth                   | 10                                                  |
#      | ProjectEntity_GrossArea               | 100                                                 |
#      | ProjectEntity_Frontage                | 20                                                  |
#      | SiteSurvey_CodeLandAreaUnitID         | Square Feet                                         |
#    And I click on the "Next" button
#    Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
#    And I set fields values on editable page
#      | name             | value             |
#      | entityTemplateID | <Folder Template> |
#    And I click on the "Next" button
#    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
#    And I click on Assign Members button
#    And I add following members
#      | Tester, Selenium |
#    And I click on "Update  members to <Name>" Button
#    And I click on the "Finish Assigning Members" button
#    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
#    And I click on the "Next" button
#    Then I see the "<Setup Wizard> -> <Name> -> Schedule Set-up" modal window
#    And I set fields values on editable page
#      | name             | value             |
#      | entityTemplateID | Selenium Schedule |
#    Then I select "Start on" from the list
#    And I set fields values on editable page
#      | name      | value      |
#      | startDate | 12/25/2015 |
#    And I click on the "Finish" button
#    And I navigate to "Summary"
#    And I verify the General Information fields value on site entity non-editable summary tab
#      | name              | value                                               |
#      | Name              | <Name>                                              |
#      | Region            | Central (Central region - preOpen) Frisco(Pre-Open) |
#      | Market Area       | Legacy Market Area                                  |
#      | Prototype         | <Prototype>                                         |
#      | Project Type      | Retail Project                                      |
#      | Market Type       | Retail Mall                                         |
#      | Trade Area        | Test                                                |
#      | Construction Type | Brick                                               |
#      | Deal Type         | Leasing                                             |
#      | Description       | Selenium Test Description                           |
#
#  Examples:
#    | Item | Grid Header       | Portfolio         | Name                           | Setup Wizard      | Prototype                    | Folder Template          |
#    | Site | Site Setup Wizard | Lucernex-Selenium | New Site - Location Conversion | Site Setup Wizard | Selenium Webdriver Prototype | Selenium Folder Template |
#
#
#  Scenario Outline: Create a New Location - Create a new location via the site wizard
#    When I navigate to "Tools,Setup Wizards"
#    Then I see the "Setup Wizard" modal window
#    And I select "<Item>" from the list
#    And I select "<Portfolio>" from the Program List
#    Then I click on the "Next" button
#    And I see the "<Grid Header>" modal window
#    And I set these field values on editable page
#      | name                    | value             |
#      | Location_ClientEntityID | 7777              |
#      | Location_ProgramID      | Lucernex-Selenium |
#      | Location_LocationName   | <Name>            |
#    And I click on the "Next" button
#    Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
#    And I set fields values on editable page
#      | name             | value                    |
#      | entityTemplateID | Selenium Folder Template |
#    And I click on the "Next" button
#    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
#    And I click on Assign Members button
#    And I add following members
#      | Tester, Selenium |
#    And I click on "Update  members to <Name>" Button
#    And I click on the "Finish Assigning Members" button
#    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
#    And I click on the "Next" button
#    Then I see the "<Setup Wizard> -> <Name> -> Schedule Set-up" modal window
#    And I set fields values on editable page
#      | name             | value             |
#      | entityTemplateID | Selenium Schedule |
#      | startDate        | 12/25/2015        |
#    And I click on the "Finish" button
#    And I navigate to "Summary"
#
#  Examples:
#    | Item     | Grid Header           | Portfolio         | Name                           | Setup Wizard          |
#    | Location | Location Setup Wizard | Lucernex-Selenium | New Site - Location Conversion | Location Setup Wizard |
#
#
#  Scenario Outline: Create a New Location - Navigate to the summary page of the site created
#    When I Search for the "<Entity Name>" that was created
#    And Click on the name of the "Site - Location Conversion, Plano, TX 75024 United States" in the results pop-up
#    And I navigate to "<Second Level Tab>"
#    Then I see "<Entity Name>" name on the header
#    And I click on the "Convert to Project" action panel button
#    And I set following fields value on editable page
#      | name         | value                              |
#      | locationSel  | createNewLocation                  |
#      | locationName | New Site - Location Conversion New |
#    And I click on the "Convert Site to Project" button "on pop up window"
#    And I verify the General Information fields value on project entity non-editable summary tab
#      | name | value         |
#      | Name | <Entity Name> |
#    And I verify the Location fields value on site entity non-editable summary tab
#      | name             | value             |
#      | Center Name      | Stonebriar        |
#      | Cross Street 2   |                   |
#      | Cross Street 1   |                   |
#      | Street Address   | 5601 democracy dr |
#      | City             | Plano             |
#      | State / Province | TX                |
#      | Zip / Postal Cd  | 75024             |
#      | Country          | United States     |
#
#  Examples:
#    | Entity Name                    | Second Level Tab |
#    | New Site - Location Conversion | Details          |