@all @smoke @smoke5
Feature: (Ref: JIRA ticket AUTOMATION-344) As an admin I should be able to create parcel wizard

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
#    And I set these field values on editable page
    And I set following fields value on editable page
      | name                        | value      |
      | Parcel_ParcelNumber         | 77777      |
      | Parcel_LocationID           | <Location> |
      | Parcel_ParcelName           | <Name>     |
      | Parcel_CodeParcelGroupID    | Retail     |
      | Parcel_CodeParcelTypeID     | Commercial |
      | Parcel_CodeParcelCategoryID | Leased     |
      | Parcel_CodeParcelStatusID   | Active     |
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
    When I select an option "Selenium Folder Template" from the "Folder Template" list
      | locator | element          |
      | name    | entityTemplateID |
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
    And I set following fields value on editable page
      | name             | value             |
      | entityTemplateID | Selenium Schedule |
      | startDate        | 12/25/2015        |
    And I click on the "Finish" button
    And I navigate to link "Summary"
    And I verify the General Information fields value on parcel non-editable summary tab
      | name        | value      |
      | Parcel ID   | 77777      |
      | Location ID | <Location> |
      | Name        | <Name>     |
      | Group       | Retail     |
      | Type        | Commercial |
      | Category    | Leased     |
      | Status      | Active     |
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
      | Item   | Grid Header         | Portfolio         | Name                      | Setup Wizard        | Location |
      | Parcel | Parcel Setup Wizard | Lucernex-Selenium | Selenium Webdriver Parcel | Parcel Setup Wizard | 000056   |
