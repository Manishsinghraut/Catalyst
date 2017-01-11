@all
Feature: (Jira ticket -Automation-1471) Smoke Test for rearranging fields on list layout and viewing changes on page

  Scenario Outline: I import files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePageLayout/"
    And I import following files:
      | Portfolio_00020andLocation_00020-1471.xml |
      | LLProject_15713-1471.xml                  |
      | LL-15713-1471.xml                         |
      | SP-15713-1471.xml                         |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: To make sure a summary page layout and a list layout can share a field and both display as expected.
    Given I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Summary" tab
    And I select "<Page Layout>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I verify the field "City, State" is "GA United States" in "Summary Page"
    And I verify the field "Country" is "United States" in "Summary Page"
    And I verify the field "Building Area Unit" is "Square Feet" in "Summary Page"
    And I verify the field "Deal Type" is "Leasing" in "Summary Page"
    And I verify the field "Created Date" is "[Today's Date with Hour AM/PM]" in "Summary Page"
    And I verify the field "Created By" is "Delete Access Access" in "Summary Page"
    And I select "<List Layout>" page layout from dropdown
    Then I verify page title "<List Layout> List" after navigation
    And I verify the following values in frame grid "gridPanel"
      | Region        | Rev Number | Store Number | Time Zone                          |
      | PR020 Sub 020 | 0          |              | Central Standard Time (US/Central) |


    Examples:
      | Project Name    | Page Layout      | List Layout |
      | LLProject-15713 | SP-Project-15713 | LL-15713    |


  Scenario Outline: To make sure a summary page layout and a list layout can share a field and both display as expected.
    Given I navigate to the admin dashboard
    And I click on "Manage Page Layouts" link
    And I click on "Manage List Layouts" link
    And I click "build layout" row action in the non frame grid "BOGridPageLayout" having the following header and cell values
      | name             | value         |
      | Page Layout Name | <List Layout> |
    And I switch to "build layout" child window
    And I expand the following
      | Available Fields            |
      | Summary Information         |
      | General Summary Information |
    Then I drag and drop the following
      | Created Date |
    And I click on "Save Layout" Button
    And I click on the "Yes" button confirmation popup window
    And I click on "Close" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    When I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Summary" tab
    And I select "<Page Layout>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I verify the field "City, State" is "GA United States" in "Summary Page"
    And I verify the field "Country" is "United States" in "Summary Page"
    And I verify the field "Building Area Unit" is "Square Feet" in "Summary Page"
    And I verify the field "Deal Type" is "Leasing" in "Summary Page"
    And I verify the field "Created Date" is "[Today's Date with Hour AM/PM]" in "Summary Page"
    And I verify the field "Created By" is "Delete Access Access" in "Summary Page"
    And I select "<List Layout>" page layout from dropdown
    Then I verify page title "<List Layout> List" after navigation
    And I verify the following values in frame grid "gridPanel"
      | Region        | Rev Number | Store Number | Time Zone                          | Created Date                |
      | PR020 Sub 020 | 0          |              | Central Standard Time (US/Central) | [Day Month Date Year Hour:] |

    Examples:
      | Project Name    | Page Layout      | List Layout |
      | LLProject-15713 | SP-Project-15713 | LL-15713    |