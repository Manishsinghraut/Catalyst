@all
Feature: As an IWMS user I need to be able to manage firm drop downs.

  Background:
    Given I login to IWMS using LxAdmin credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Firm Drop Downs" link

  Scenario: I want to add manage firm drop downs
    Given I set the values "Key Date Type Code" in search text field and hit the enter key
    And I click on the "edit" row action of column "Key Date Type Code" of column "0" from grid "id" "BOGridCustomCodeTable"
    Then I see the "Key Date Type Code" modal window
    When I click on the "Add Key Date Type Code..." button
    Then I set these field values on editable page
      | name           | value                               |
      | ShortName      | Option                              |
      | ActualLongName | Selenium Webdriver test description |
      | ParentID       | Lease                               |
    And I click on the "Add" button ""
