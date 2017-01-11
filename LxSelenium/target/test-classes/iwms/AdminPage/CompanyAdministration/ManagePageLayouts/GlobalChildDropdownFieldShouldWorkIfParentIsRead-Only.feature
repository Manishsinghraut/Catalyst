@all
Feature: (Jira ticket -Automation-1474) Global Child Dropdown field should work if Parent is read-only

  Scenario Outline: I import files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePageLayout/"
    And I import following files:
      | Portfolio_00021AndLocation_00021-1474.xml |
      | GlobalFieldFacility-15321-1474.xml        |
      | SP-15321-1474.xml                         |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: Navigate to facility and update fields
    Given I navigate to entity type "Facilities" named "<Facility Name>" through search option
    And I click on the "Summary" tab
    And I select "<Page Layout>" page layout from dropdown
    And I click on the "Edit" action panel button
    And I set following fields value on editable frame page
      | name                             | value   |
      | Facility_CountryID               | Germany |
      | Facility_IStateProvinceCountryID | Berlin  |
    Then I click on the "Save Changes" action panel button
    And I wait for "Would you like to Geocode?" modal window to open in non frame page
    And I click on the "No" button in "Address has changed.  Would you like to set Latitude and Longitude?" message box
    And I wait for the Loading text to disappear
    Then I verify action message "Successfully updated Facility" in the left top corner
    And I verify the field "Country" is "Germany" in "Summary Page"
    And I verify the field "State" is "Berlin" in "Summary Page"

    Examples:
      | Facility Name             | Page Layout |
      | GlobalFieldFacility-15321 | SP-15321    |


  Scenario Outline: Global Child Dropdown field should work if Parent is read-only
    Given I navigate to the admin dashboard
    And I click on "Manage Page Layouts" link
    And I click "build layout" row action in the non frame grid "BOGridPageLayout" having the following header and cell values
      | name             | value         |
      | Page Layout Name | <Page Layout> |
    And I switch to "Manage Page Layout" child window
    And I click on the '...' corresponding to field label "Country"
    And I wait for modal window to open
    And I set following fields value on editable page
      | name           | value |
      | viewInEditForm | true  |
    And I click on "Set Options" Button
    And I wait for modal window to close
    And I click on "Save Layout" Button
    And I click on the "Yes" button confirmation popup window
    And I click on "Close" Button
    And I switch to main window

    When I navigate to entity type "Facilities" named "<Facility Name>" through search option
    And I click on the "Summary" tab
    And I select "<Page Layout>" page layout from dropdown
    And I click on the "Edit" action panel button
    And I set following fields value on editable frame page
      | name                             | value   |
      | Facility_IStateProvinceCountryID | Hamburg |
    And I verify the field "Country" is "Germany" in "Summary Page"
    Then I click on the "Save Changes" action panel button
    And I wait for "Would you like to Geocode?" modal window to open in non frame page
    And I click on the "No" button in "Address has changed.  Would you like to set Latitude and Longitude?" message box
    And I wait for the Loading text to disappear
    Then I verify action message "Successfully updated Facility" in the left top corner
    And I verify the field "Country" is "Germany" in "Summary Page"
    And I verify the field "State" is "Hamburg" in "Summary Page"

    Examples:
      | Facility Name             | Page Layout |
      | GlobalFieldFacility-15321 | SP-15321    |