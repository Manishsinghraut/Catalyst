@all
Feature: As an Delete user I need to be able to create new page layouts.(Jira Ref. AUTOMATION-465)

  Scenario Outline: I import file for create sub page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePageLayout/"
    And I import following file name:
      | PL-For-Sub-Page-Layout.xml   |
      | PortfolioUsingInManagePL.xml |
      | ProjectUsingInManagePL.xls   |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I want to create new sub page layout from manage page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    Given I click on the "Manage Sub-pages" link
    And I wait for the Loading text to disappear in grid
    Then I click "Add item..." button
    Then I see the "Add item  ***Required fields in red" modal window
    And I set these field values on editable page
      | name                  | value             |
      | PageLayoutName        | <Sub Page Layout> |
      | PrimaryCodeSQLTableID | Project           |
      | Description           | Description       |
    And I select Allow Edit 'Yes' radio button on modal window
    And I click on the "Add" button
#    Then I see "Successfully added item" in the grid header
    When I click "build layout" link of "<Sub Page Layout>" page layout
    And I switch to "build layout" child window
    And I expand the following
      | Available Fields            |
      | Summary Information         |
      | General Summary Information |
    Then I drag and drop the following
      | City, State |
      | Notes       |
      | Phone       |
    And I click the "..." for the "City, State" field for edit
    And I set fields values on editable page
      | name           | value |
      | viewInEditForm | true  |
    And I click on "Set Options" Button
    And I click on "Save Layout" Button
    And I click on "Yes" Button
    And I click on + button to add new fields
    And I select the following
      | Math Field |
    And I set fields values on editable page
      | name              | value                |
      | defaultLabel      | Usable Area plus 200 |
      | reportGroupDataID | General Information  |
      | formFieldType     | Number               |
      | NumericConstant   | 200                  |
    And I expand the following math operation tree
      | Available Fields            |
      | Summary Information         |
      | General Summary Information |
    And I select the following math operation fields
      | Usable Area |
    And I click on >> button to move field
    And I click on + button
    And I set fields values on editable page
      | name            | value |
      | NumericConstant | 200   |
    And I click on >> button to move constants
    And I click on "Submit" Button
    And I click on "Save Layout" Button
    And I click on "Yes" Button
    And I click on "Close" Button
    And I switch to main window

    Examples:
      | Sub Page Layout  | Login User   | Login full username  |
      | Add to main page | DeleteAccess | Delete Access Access |

  Scenario Outline: I want to create new sub page layout from manage page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I wait for the Loading text to disappear in grid
    When I click "build layout" link of "<Page Layout>" page layout
    And I switch to "build layout" child window
    And I expand the following
      | Sub Layouts |
    Then I drag and drop the following
      | <Sub Page layout> |
    And I click on "Save Layout" Button
    And I click on the "Yes" button confirmation popup window
    And I click on "Close" Button
    And I switch to main window
    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I select an option "<Page Layout>"
    And I click on the "Edit" action panel button
    Then I verify the City, State fields are not editable
    And I set fields values on editable page
      | name                | value                |
      | ProjectEntity_Notes | Project Entity Notes |
      | ProjectEntity_Phone | 1234567890           |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    Then I verify the City, State fields are not editable
    And I verify text value in a page
      | value                |
      | 1234567890           |
      | Project Entity Notes |

    Examples:
      | Page Layout            | Entity Name                       | Item    | Second Level Tab | Sub Page layout  | Login User   | Login full username  |
#      | PL-For-Sub-Page-Layout | Lucernex-Project | Project | Details          | Add to main page | DeleteAccess | Delete Access Access |
      | PL-For-Sub-Page-Layout | Project –UsingIn ManagePageLayout | Project | Details          | Add to main page | DeleteAccess | Delete Access Access |