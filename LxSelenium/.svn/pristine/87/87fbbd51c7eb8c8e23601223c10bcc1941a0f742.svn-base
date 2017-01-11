@all @smoke @smoke5
Feature: (Jira Ref - AUTOMATION-343) As an admin I should be able to create facility wizard

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
      | name                            | value                             |
      | Facility_ClientEntityID         | 77777                             |
      | Facility_FacilityName           | <Name>                            |
      | Facility_LocationID             | <Location>                        |
      | Facility_ParcelID               | <Parcel>                          |
#      | Facility_RegionID               | Central Dallas(Operating)         |
      #Selenium issue in entering '(' value in combobox
      | Facility_RegionID               | Central Dallas                    |
      | Facility_CodeMarketAreaID       | Legacy Market Area                |
      | Facility_CodeFacilityGroupID    | Retail                            |
      | Facility_CodeFacilityTypeID     | 000098                            |
      | Facility_CodeFacilityCategoryID | Retail                            |
      | Facility_CodeFacilityUseID      | Retail                            |
      | Facility_CodeFacilityStatusID   | Active                            |
      | Facility_Notes                  | This is a selenium webdriver test |
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
    And I set fields values on editable page
      | name             | value             |
      | entityTemplateID | <Folder Template> |
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
    And I verify the General Information fields value on facility non-editable summary tab
      | name         | value                     |
      | Name         | <Name>                    |
      | Store Number | 7777                      |
      #| Region       | Central Dallas(Operating) |
      | Market Area  | Legacy Market Area        |
    And I verify the Facility Summary fields value on non-editable summary tab
      | name     | value  |
      | Group    | Retail |
      | Type     | 000098 |
      | Category | Retail |
      | Use      | Retail |
      | Status   | Active |
    And I verify the Property Organization fields value on non-editable summary tab
      | name     | value      |
      | Location | <Location> |
#      | Parcel   | <Parcel>   |   http://jira.lucernex.com/browse/IWMS-22293

    And I click on the "Members/Contacts" tab
    And I verify the Members/Contacts tab
      | type        | name            |
    # | Team Member | Lx Administrator |
      | Team Member | Selenium Tester |
    And I click on the "Documents" tab
    And I verify the list of folders Document
      | SeleniumTestRootFolder1 |
    #    And I navigate to link "Facility, Schedule"
    #    And I verify the scheduler already applied
    #      | Pre-Contruction |
    Examples:
      | Item     | Grid Header           | Portfolio         | Name                        | Setup Wizard          | Location | Parcel          | Folder Template          |
      | Facility | Facility Setup Wizard | Lucernex-Selenium | Selenium Webdriver Facility | Facility Setup Wizard | 000056   | Lucernex-Parcel | Selenium Folder Template |
