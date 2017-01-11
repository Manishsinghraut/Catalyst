@all
Feature: As an IWMS user I need to be able to manage schedule templates records.(for Ref : Jira ticket No : AUTOMATION-587)

  Background:
    Given I login to IWMS using LxAdmin credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Schedule Templates" link "in the admin dashboard"

  Scenario: I want to create folder template from manage folder templates
#    Given I click on the " Add Schedule Template... " on the page button
    Given I click on " Add Schedule Template... " button in grid
    And I see the "Add Schedule Template  ***Required fields in red" modal window
    And I set these field values on editable page
      | name         | value                   |
      | TemplateName | Selenium Admin Schedule |
      | Description  | Test Description        |
    And I select following entities checkbox from model window
      | locator | element          |
      | name    | Portfolio        |
      | name    | Prototype        |
      | name    | Parcel           |
      | name    | OpenProject      |
      | name    | CapProject       |
      | name    | CapProgram       |
      | name    | Location         |
      | name    | PotentialProject |
      | name    | Facility         |
      | name    | Contract         |
    Then I click on the "Add" button
    And I see "Successfully added Schedule Template" in the grid header
    Given I see these grid columns:
      | Template Name |
      | Description   |
      | Actions       |
    And I see some rows with data in the grid
    And I see these row actions:
      | edit   |
      | delete |
    And I see page "1" in the grid's pagination controls
    And I see the number of pages in the grid's pagination controls
