@all @smoke @smoke5
Feature: (Jira - Automation-341) As an admin I should be able to create project wizard

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario: I import test data files
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/ManageSecurity/"
    And I import following file name:
      | BuudgetTemplate.xml |

  Scenario Outline: when I navigate to Tools page I can add new Items from the set up wizard
    When I navigate to "Tools,Setup Wizards"
    Then I see the "Setup Wizard" modal window
    And I delete incomplete setup wizard if exist
    And I select "<Item>" from the list
    And I select "<Portfolio>" from the Program List
    Then I click on the "Next" button
    And I see the "<Grid Header>" modal window
    And I set these field values on editable page
      | name                                  | value                                               |
      | ProjectEntity_ProjectEntityName       | <Name>                                              |
      #      | ProjectEntity_ClientEntityID          | 7777                                                |
      | ProjectEntity_RegionID                | Central (Central region - preOpen) Frisco(Pre-Open) |
      | ProjectEntity_CodeMarketAreaID        | Legacy Market Area                                  |
      | ProjectEntity_PrototypeID             | <Prototype>                                         |
      | ProjectEntity_CodeProjectTypeID       | Retail Project                                      |
      | ProjectEntity_CodeMarketTypeID        | Retail Mall                                         |
      | ProjectEntity_TradeArea               | Test                                                |
      | ProjectEntity_CodeConstructionTypeID  | Brick                                               |
      | ProjectEntity_CodeDealTypeID          | Leasing                                             |
      #      | ProjectEntity_MapClientRecordID       | client-34554                                        |
      | ProjectEntity_ProjectDescription      | Selenium Test Description                           |
      | _ManagerIDList_MemberID_add           | Administrator, Lx                                   |
      | ProjectEntity_ComplexID               | Stonebriar                                          |
      | ProjectEntity_CrossStreet1            | Democracy                                           |
      | ProjectEntity_CrossStreet2            | Parkwood                                            |
      | ProjectEntity_StreetAddress1          | 5601 democracy dr                                   |
      | ProjectEntity_City                    | Plano                                               |
      | ProjectEntity_IStateProvinceCountryID | TX                                                  |
      | ProjectEntity_PostalCode              | 75024                                               |
      | ProjectEntity_CountryID               | United States                                       |
      | ProjectEntity_LatitudeDegrees         |                                                     |
      | ProjectEntity_ActualEndDate           | 12/31/2015                                          |
      | ProjectEntity_RentableArea            | 100                                                 |
      | ProjectEntity_UsableArea              | 80                                                  |
      | ProjectEntity_Depth                   | 10                                                  |
      | ProjectEntity_GrossArea               | 100                                                 |
      | ProjectEntity_Frontage                | 20                                                  |
      | SiteSurvey_CodeLandAreaUnitID         | Square Feet                                         |
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
    And I set fields values on editable page
      | name             | value                    |
      | entityTemplateID | Selenium Folder Template |
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Assign Budget Template" modal window
    And I set following fields value on editable page
      | name                   | value             |
      | entityBudgetTemplateID | <Budget Template> |
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
#    And I navigate to link "Summary"
    And I verify the General Information fields value on project entity non-editable summary tab
      | name              | value                                               |
      | Name              | <Name>                                              |
      #      | Store Number      | 7777                                                |
      | Region            | Central (Central region - preOpen) Frisco(Pre-Open) |
      | Market Area       | Legacy Market Area                                  |
      | Prototype         | <Prototype>                                         |
      | Project Type      | Retail Project                                      |
      | Market Type       | Retail Mall                                         |
      | Trade Area        | Test                                                |
      | Construction Type | Brick                                               |
      | Deal Type         | Leasing                                             |
      #      | Client ID         | client-34554                                        |
      | Description       | Selenium Test Description                           |
    And I verify the Location fields value on project entity non-editable summary tab
      | name             | value             |
      | Center Name      | Stonebriar        |
      | Cross Street 2   | Democracy         |
      | Cross Street 1   | Parkwood          |
      | Street Address   | 5601 democracy dr |
      | City             | Plano             |
      | State / Province | TX                |
      | Zip / Postal Cd  | 75024             |
      | Country          | United States     |
#    And I verify the Milestone Timeline fields value on non-editable summary tab
#      | name                           | value      |
#      | Actual/Projected Delivery Date | 12/31/2015 |
    And I verify the Site Survey Summary fields value on non-editable summary tab
      | name          | value       |
      | Rentable Area | 100         |
      | Sales Area    | 80          |
      | Depth         | 10          |
      | Parcel Area   | 100         |
      | Frontage      | 20          |
      | Area Unit     | Square Feet |
    And I verify the Management fields value on non-editable summary tab
      | name             | value            |
      | Lx Administrator | Lx Administrator |
    And I click on the "Members/Contacts" tab
    And I verify the Members/Contacts tab
      | type        | name             |
      | Team Member | Lx Administrator |
      | Team Member | Selenium Tester  |
    And I click on the "Documents" tab
    And I verify the list of folders Document
      | SeleniumTestRootFolder1 |
    #    And I navigate to link "Facility, Schedule"
    #    And I verify the scheduler already applied
    #      | Pre-Contruction |
    Examples:
      | Item    | Grid Header                  | Portfolio         | Name                         | Setup Wizard                 | Prototype                    | Budget Template |
      | Project | Opening Project Setup Wizard | Lucernex-Selenium | Selenium Webdriver Project p | Opening Project Setup Wizard | Selenium Webdriver Prototype | Selenium-Budget |
