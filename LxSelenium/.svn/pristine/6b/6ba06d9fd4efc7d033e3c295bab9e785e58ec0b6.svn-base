@all
Feature: (Automation - AUTOMATION-522)To ensure that users can add a custom list data fields to the layout of a page

  Scenario Outline: As a delete user I can able to create custom list data fields to the layout of a page
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/"
    And I import following file name:
      | PageLyoutForCustomList.xml |

    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageDataFields/"
    And I import following file name:
      | Manage Data Fields.xml |
#    And I logout
    
    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can able to create custom list data fields to the layout of a page
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Data Fields" link
    And I expand the Summary Information group
    And I click Add Field for the Custom Lists Group
    And I switch to "Custom field" child window
    And I set following fields value on editable page
      | name           | value                |
      | DefaultLabel   | Selenium Test label  |
      | AccessorName   | SeleniumTestAccessor |
#      | IsRequired     | false                |
      | ReadOnly       | false                |
      | CodeSQLTableID | General Entity Info  |
    And I verify the following fields value on editable page
      | name           | value                |
      | IsRequired     | false                |


    And I Select Choose Custom List Type
#    And I set following fields value on editable page
#      | name            | value              |
#      | ClientListRGDID | Manage Data Fields |
    And I click on the Add button
    And I switch to main window

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can able to add custom list data fields to the layout of a page
    Given I Login to IWMS using "<Login User>" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Page Layouts" link
    And I wait for the Loading text to disappear in grid
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
      | Name         |
      | Build Layout |

    And I click on the "..." optional Field Label for the "Selenium Test label" field
    And I set fields values on editable page
      | name                  | value |
      | json.UseOldCustomList | true  |
    And I click on "Set Options" Button
    And I click on "Save Layout" Button
    And I click on the "Yes" button confirmation popup window
    And I click on "Close" Button
    And I switch to main window

    Examples:
      | Page Layout               | Login User   |
      | CustomList For PageLayout | DeleteAccess |


  Scenario Outline: As a delete user I can verify the data in project > Details > Summary page
    Given I Login to IWMS using "<Login User>" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I select "<Page Layout>" page layout from dropdown
    And I click on the "Edit" action panel button
    And I switch to visible frame
    And I click on "add" link
    And I click on the "Save Changes" action panel button
    And I verify text value in a page
      | value   |
      | <value> |

    Examples:
      | Page Layout               | Entity Name      | Item    | Second Level Tab | Login User   | Grid ID          | value | Column Header   |
      | CustomList For PageLayout | Lucernex-Project | Project | Details          | DeleteAccess | ^customListGrid_ | 200   | Add Two Numbers |