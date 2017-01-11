@all
Feature: (Automation - AUTOMATION-1338) Default Values - Setup Wizards

  Scenario Outline: As a delete user I import the following xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageDataFields/"
    And I import following file name:
      | Portfolio_Sprint_1388.xml          |
      | ProjectWizardDefaultField-1388.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Default Values - Setup Wizards
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I click "build layout" row action in the non frame grid "BOGridPageLayout" having the following header and cell values
      | name             | value         |
      | Page Layout Name | <Page layout> |
    And I switch to "build layout" child window
    And I click on the '...' for the following field label "Country"
    Then I wait for modal window to open
    And I verify the following fields value on editable page
      | name                      | value     |
      | json.EditModeDefaultValue | <Country> |
    And I click on "Set Options" Button
    Then I wait for modal window to close
    And I click on "Close" Button
    Then I wait for browser windows count to be equal to "1"
    And I switch to main window
    And I click on the "Setup Pages" link
    And I set following fields value on editable page
      | name                         | value                        |
      | openProjectSetupPageLayoutID | Project Wizard Default field |
    And I click on "Update" Button
    Then I see "Successfully updated Company" message in the header

    Examples:
      | Page layout                  | Country |
      | Project Wizard Default field | Japan   |

  Scenario Outline: Create Project
    Given I navigate to dashboard page
    When I navigate to "Tools,Setup Wizards"
    Then I see the "Setup Wizard" modal window
    And I delete incomplete setup wizard if exist
    And I select "Project" from the list
    And I select "<Portfolio>" from the Program List
    Then I click on the "Next" button
    And I see the "Opening Project Setup Wizard" modal window
    Then I verify the following fields value on editable page
      | name                    | value     |
      | ProjectEntity_CountryID | <Country> |
    And I set these field values on editable page
      | name                                  | value              |
      | ProjectEntity_ProjectEntityName       | <Name>             |
      | ProjectEntity_RegionID                | Central Market     |
      | ProjectEntity_CodeMarketAreaID        | Legacy Market Area |
      | ProjectEntity_City                    | Tokyo              |
      | ProjectEntity_PostalCode              | 75024              |
      | ProjectEntity_IStateProvinceCountryID | Aomori-ken         |
      | ProjectEntity_CodeProjectTypeID       | Retail Project     |


    And I click on the "Next" button
    Then I see the "Opening Project Setup Wizard -> <Name> -> Folder Set-up" modal window
    And I click on the "Next" button
    Then I see the "Opening Project Setup Wizard -> <Name> -> Assign Budget Template" modal window
    And I click on the "Next" button
    Then I see the "Opening Project Setup Wizard -> <Name> -> Assign Members" modal window
    And I click on the "Next" button
    Then I see the "Opening Project Setup Wizard -> <Name> -> Schedule Set-up" modal window
    And I click on the "Finish" button
#    And I select "<Page layout>" page layout from dropdown
    And I verify the General Information fields value on project entity non-editable summary tab
      | name    | value     |
      | Name    | <Name>    |
      | Country | <Country> |
    And I click on the "Edit" action panel button
    And I wait for the Loading text to disappear
    Then I verify the following fields value on editable page
      | name                    | value     |
      | ProjectEntity_CountryID | <Country> |


    Examples:
      | Portfolio           | Name                | Country | Page layout                  |
      | Portfolio Sprint 16 | Test Project Values | Japan   | Project Wizard Default field |
