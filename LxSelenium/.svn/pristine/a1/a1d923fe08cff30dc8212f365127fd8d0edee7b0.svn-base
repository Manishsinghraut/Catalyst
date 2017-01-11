@all
Feature: As an Delete user I need to be able to setup pages on page layouts.

  Background: 
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I click on the "Setup Pages" link

  Scenario Outline: I want to create new page layout from manage page layout
    And I set fields values on editable page
      | name                         | value                             |
      | siteSetupPageLayoutID        | Details (Site) [Global Layout]    |
      | openProjectSetupPageLayoutID | Details (Project) [Global Layout] |
      | capProjectSetupPageLayoutID  | Details (Project) [Global Layout] |
      | facilitySetupPageLayoutID    | Facility Wizard [Global Layout]   |
      | contractSetupPageLayoutID    | Contract Wizard [Global Layout]   |
      | locationSetupPageLayoutID    | Location Wizard [Global Layout]   |
      | parcelSetupPageLayoutID      | Parcel Wizard [Global Layout]     |
    And I click on "<button>" Button

    Examples: 
      | button |
      | Update |
