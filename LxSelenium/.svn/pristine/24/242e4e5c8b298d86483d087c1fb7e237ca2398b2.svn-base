@all
Feature: Pre condition

  Scenario Outline: As a delete user I clean entity banner values
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Entity Banners" link
    And I wait for the Loading text to disappear in grid

    And I set following fields value on editable page
      | name                            | value |
      | json_EntityBanner               |       |
      | json_PortfolioEntityBanner      |       |
      | json_ProgramEntityBanner        |       |
      | json_PrototypeEntityBanner      |       |
      | json_SiteEntityBanner           |       |
      | json_FacilityEntityBanner       |       |
      | json_ProjectEntityBanner        |       |
      | json_CapitalProjectEntityBanner |       |
      | json_LocationEntityBanner       |       |
      | json_ContractEntityBanner       |       |
      | json_ParcelEntityBanner         |       |
      | json_FirmSearchFields           |       |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |