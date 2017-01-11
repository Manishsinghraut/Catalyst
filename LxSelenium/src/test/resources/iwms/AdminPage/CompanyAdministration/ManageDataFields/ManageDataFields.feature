@all
Feature: To ensure that users can add a custom list data fields to the layout of a page

  Scenario Outline: As a delete user I can able to create custom list data fields to the layout of a page
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/"
    And I import following file name:
      | PageLyoutForCustomList.xml    |
      | AddCustomListToPageLayout.xml |
    And I navigate to the admin dashboard
    And I click on the "Manage Data Fields" link
    And I expand the Summary Information group
    And I click Add Field for the Custom Lists Group
    And I switch to "Custom field" child window
    And I set following fields value on editable page
      | name           | value                |
      | DefaultLabel   | Selenium Test label  |
      | AccessorName   | SeleniumTestAccessor |
      #| IsRequired     | false                |
      | ReadOnly       | false                |
      | CodeSQLTableID | General Entity Info  |
    And I Select Choose Custom List Type
    And I set following fields value on editable page
      | name            | value       |
      | ClientListRGDID | Custom List |
    And I click on the Add button
    And I switch to main window

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can able to add custom list data fields to the layout of a page
    Given I Login to IWMS using "<Login User>" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    When I click "build layout" link of "<Page Layout>" page layout
    And I switch to "build layout" child window
    And I expand the following
      | Available Fields    |
      | Summary Information |
      | Custom Lists        |
      | Selenium Test label |
    And I click on "Clear Layout" Button
    And I click on "Save Layout" Button
    And I click on the "Yes" button confirmation popup window
    Then I drag and drop the following
      | Name                          |
      | Custom List page layout name1 |
      | Custom List page layout name2 |
    And I click on the "..." optional Field Label for the "Selenium Test label" field
    And I set fields values on editable page
      | name                  | value |
      | json.UseOldCustomList | true  |
    And I click on "Set Options" Button
    And I click on "Save Layout" Button
    And I click on the "Yes" button confirmation popup window
    And I click on "Close" Button
    And I switch to main window
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "Edit" action panel button
    And I click on the Add button on grid
    And I click on the update button on grid
    And I click on the "Save Changes" action panel button
    And I verify row from grid "<Grid ID>" having unique value "<value>" under column header "<Column Header>"
      | name      | value |
      | AddNum    | 100   |
      | AddTime   | NaN   |
      | CheckBox  |       |
      | CCheckBox |       |
    And I switch to default frame


    Examples:
      | Page Layout               | Entity Name      | Item    | Second Level Tab | Login User   | Grid ID          | value | Column Header |
      | CustomList For PageLayout | Lucernex-Project | Project | Details          | DeleteAccess | ^customListGrid_ | 100   | AddNum        |