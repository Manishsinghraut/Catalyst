@all
Feature: As a Delete user I need to be able to create new page layouts. (Jira ticket -Automation-462)

  Scenario Outline: I import file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManagePageLayout/"
    And I import following file name:
      | PortfolioUsingInManagePL.xml |
      | ProjectUsingInManagePL.xls   |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: I want to create new page layout from manage page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I click on " Add item... " button in grid
    Then I see the "Add item  ***Required fields in red" modal window
    And I set these field values on editable page
      | name                  | value         |
      | PageLayoutName        | <Page Layout> |
      | PrimaryCodeSQLTableID | Project       |
      | Description           | Description   |
    And I select Allow Edit 'Yes' radio button on modal window
    And I expand the following
      | Project |
      | Details |
    And I select the following
      | Summary |
    And I click on the "Add" button
    And I wait for modal window to close
    Then I see "Successfully added item" in the grid header
    Then I verify row in grid "BOGridPageLayout" having unique value "<Page Layout>" under column header "Page Layout Name"
      | name          | value                       |
      | Top Menu      | Project : Details : Summary |
      | Primary Table | Project                     |
      | Actions       | edit                        |

#    When I click "build layout" link of "<Page Layout>" page layout
    And I click "build layout" row action in the non frame grid "BOGridPageLayout" having the following header and cell values
      | name             | value         |
      | Page Layout Name | <Page Layout> |
    And I switch to "build layout" child window
    And I expand the following
      | Available Fields            |
      | Summary Information         |
      | General Summary Information |
    Then I drag and drop the following
      | City  |
      | Depth |
      | Notes |
      #| Name  |

    And I click on "Save Layout" Button
    And I see the "Save Changes?" modal window
    And I click on the "Yes" button
#    And I click on the "Yes" button confirmation popup window
    And I click edit option for the "City" field
    And I see a modal window
    And I set fields values on editable page
      | name           | value |
      | required       | true  |
      | viewInEditForm | true  |
    And I click on "Set Options" Button
    And I wait for modal window to close

    And I click on + button to add new fields
    And I select the following
      | Math Field |
    And I see a modal window
    And I set fields values on editable page
      | name          | value          |
      | defaultLabel  | Depth plus 100 |
     # | NumericConstant | 100            |
      | formFieldType | Number         |
    And I expand the following math operation tree
      | Available Fields            |
      | Summary Information         |
      | General Summary Information |

#    And I select the following math operation fields
#      | Depth |
    And I drag and drop the following report fields
      | Depth |
#    And I click on >> button to move field
    And I click on + button
    And I set fields values on editable page
      | name            | value |
      | NumericConstant | 100   |
    And I click on >> button to move constants
    And I click on "Submit" Button
    And I wait for modal window to close
    And I click on "Save Layout" Button
#    And I click on the "Yes" button confirmation popup window
    And I see the "Save Changes?" modal window
    And I click on the "Yes" button
    And I click on "Close" Button
    And I switch to main window

    Examples:
      | Page Layout          | Login User   | Login full username  |
      | Selenium-Page-Layout | DeleteAccess | Delete Access Access |


  Scenario Outline: As a Delete user I verify the created page
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "<Item>" named "<Entity Name>"
    And I select an option "<Page Layout>"
    And I verify pair of values on non editable summary page
      | name           | value |
      | Notes          |       |
      | Depth          |       |
      | Depth plus 100 | 100   |
      | City           | Plano |
    And I click on the "Edit" action panel button
    Then I switch to visible frame
    Then I verify the following fields are not editable
      | name       | value              |
      | Depth Plus | math_Depthplus100  |
      | City       | ProjectEntity_City |
    And I set fields values on editable page
      | name                | value                |
      | ProjectEntity_Notes | Project Entity Notes |
      | ProjectEntity_Depth | 100                  |
    And I click on the "Save Changes" action panel button
    And I verify pair of values on non editable summary page
      | name           | value                |
      | Notes          | Project Entity Notes |
      | Depth          | 100                  |
      | Depth plus 100 | 200                  |
      | City           | Plano                |

    Examples:
      | Page Layout          | Entity Name                       | Item    | Login User   | Login full username  |
      #| Selenium-Page-Layout | Lucernex-Project | Project | DeleteAccess | Delete Access Access |
      | Selenium-Page-Layout | Project –UsingIn ManagePageLayout | Project | DeleteAccess | Delete Access Access |