@all
Feature: (Jira Ref: Automation-1470) Status should be same in Manage Entity and Entity Summary page

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ManageEntity/"
    And I import following files:
      | Entities_15715-1475.xml         |
      | InactiveEntitiesReport-1475.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Navigate to Admin > Manage Facilities and ensure that Facility 15715 is Active
  Navigate to Admin > Manage Location and ensure that Location 15715 is Active
  Navigate to Admin > Manage Contract and ensure that Contract 15715 is Active

    Given I navigate to the admin dashboard
    And I click on "<Manage Entities>" link
    And I set following fields value on editable page
      | name           | value |
      | showActiveMode | true  |
    Then I verify the following values in non frame grid "entitySelect"
      | Type          | Name          | Current Status | Planned Status              |
      | <Entity Type> | <Entity Name> | Active         | Active <Change to Inactive> |


    Examples:
      | Manage Entities   | Entity Type | Entity Name    |
      | Manage Facilities | Facility    | Facility 15715 |
      | Manage Locations  | Location    | Location 15715 |
      | Manage Contracts  | RE Contract | Contract 15715 |

  Scenario Outline: As a delete user I deactivate facility
    Given I navigate to entity type "<Entity Type>" named "<Entity Name>" through search option
    And I click on the "Summary" tab
    And I wait for the Loading text to disappear
    And I click on "Deactivate" Button
    And I switch to "Deactivate entity" child window
    And I click on "Yes" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window
    And I wait for the Loading text to disappear
    And I click on "Activate" Button
    And I switch to "Activate" child window
    And I close the "Activate" child window
    Then I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Entity Type | Entity Name    |
      | Facilities  | Facility 15715 |

  Scenario Outline: As a delete user I import security xmls
    Given I navigate to the admin dashboard
    And I click on "<Manage Entities>" link
    And I click "<Change to Inactive>" row action in the non frame grid "entitySelect" having the following header and cell values
      | name | value         |
      | Name | <Entity Name> |
      | Type | <Entity Type> |
    Then I verify the following values in non frame grid "entitySelect"
      | Type          | Name          | Current Status | Planned Status    |
      | <Entity Type> | <Entity Name> | Active         | Inactive <Cancel> |
    And I click on "Apply Changes" Button
    Then I verify success message appear in top left corner of page
      | Finished processing        |
      | Total Entities Modified: 1 |
      | No Errors encountered      |
    And I click on "Reset" Button
    And I set following radio fields value on editable page
      | name           | value |
      | showActiveMode | false |
    Then I verify the following values in non frame grid "entitySelect"
      | Type          | Name          | Current Status | Planned Status              |
      | <Entity Type> | <Entity Name> | Inactive       | Inactive <Change to Active> |

    Examples:
      | Entity Type | Entity Name    | Manage Entities  |
      | RE Contract | Contract 15715 | Manage Contracts |
      | Location    | Location 15715 | Manage Locations |


  Scenario Outline: Navigate to Admin > Manage Facilities and ensure that Facility 15715 is inactive
  Navigate to Admin > Manage Location and ensure that Location 15715 is inactive
  Navigate to Admin > Manage Contract and ensure that Contract 15715 is inactive

    Given I navigate to the admin dashboard
    And I click on "<Manage Entities>" link
    And I set following radio fields value on editable page
      | name           | value |
      | showActiveMode | false |
    Then I verify the following values in non frame grid "entitySelect"
      | Type          | Name          | Current Status | Planned Status              |
      | <Entity Type> | <Entity Name> | Inactive       | Inactive <Change to Active> |


    Examples:
      | Manage Entities   | Entity Type | Entity Name    |
      | Manage Facilities | Facility    | Facility 15715 |
      | Manage Locations  | Location    | Location 15715 |
      | Manage Contracts  | RE Contract | Contract 15715 |

  Scenario Outline: Run report
    Given I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "Report" child window
    Then I verify the following values in non frame grid
      | Name           | Is Inactive? |
      | Facility 15715 | Yes          |
      | Location 15715 | Yes          |
      | Contract 15715 | Yes          |
    And I close the "Report" child window
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Report Name              |
      | Inactive Entities Report |