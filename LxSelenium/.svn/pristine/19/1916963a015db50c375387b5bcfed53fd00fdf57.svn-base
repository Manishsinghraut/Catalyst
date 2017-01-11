@all
Feature: (Jira Ref : AUTOMATION-1422) I update the County Field On Location Summary Page

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Summary/"
    And I import following file name:
      | PortfolioAndLocation-1422.xml |
      | Location-1422.xml             |
      | SummaryPage-1422.xml          |
    And I navigate to the admin dashboard
    And I click on "Manage Data Fields" link
    And I click on "Import Data Fields" Button
    And I switch to "Import Field" child window
    And I import following Data field Values "Data/ImportDataFiles/iwms/Location/Details/Summary/":
      | DataFields-1422.xls |
    And I click on "Close" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As Delete user, I navigate to Summary and verify country field Blank
    Given I navigate to entity type "Locations" named "<Entity Name>" through search option
    And I select "<Summary Page>" page layout from dropdown
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I verify the field "County" does not have value in a same column

    Examples:
      | Entity Name    | Third Level Tab | Summary Page   |
      | Location 15688 | Summary         | Location 15688 |

  Scenario Outline: As Delete user, I edit Location
    Given I click on the "Edit" action panel button
    And I set following fields value on editable frame page
      | name                             | value  |
      | Location_IStateProvinceCountryID | TX     |
      | ProjectEntity_strCounty          | Collin |
    And I click on the "Save Changes" action panel button
    And I click on Yes button
    Then I wait for "Geo Location Candidates" modal window to open in non frame page
    And I click on the "Texas, USA" button in modal window "Geo Location Candidates"
    And I click on "Yes" button on modal window popup
    And I wait for the Loading text to disappear
    And I verify action message "Successfully updated Location" in the left top corner
    And I verify the field "County" is "Collin" in "Address Summary"
    And I verify the field "State" is "TX" in "Address Summary"

    Examples:
      | Entity Name    | Third Level Tab |
      | Location 15688 | Summary         |

