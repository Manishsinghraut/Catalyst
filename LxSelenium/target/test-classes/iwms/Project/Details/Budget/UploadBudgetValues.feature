@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1018), Upload Budget Values

  Scenario Outline: As a delete user I import the following xmls in the following order
  1. Import the attached budget template "Selenium-budget" xml successfully.
  2. Import the attached project "BudgetValuesUploadProject (2)" xml successfully.
  3. Import the attached "ActualBudgetType(1)" xml successfully.

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/"
    And I import following file name:
      | Selenium-budget-1018.xml         |
      | ActualBudgetType(1).xml          |
      | BudgetValuesUploadProject(2).xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I make sure budget column "actual" has a true value for "are budget values editable?"

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    Then I click on the "edit" row action of column "<Budget Type>" of column "1" from grid "BOGridBudgetColumnType"
#    And I click "edit" row action in the non frame grid "BOGridBudgetColumnType" having the following header and cell values
#      | name | value         |
#      | Name | <Budget Type> |
    And I wait for "Edit Budget Type  ***Required fields in red" modal window to open in non frame page
#    And I set following fields value on editable page
    And I verify the following fields value on editable page
      | name                                 | value |
      | _checkbox_AllowUIEditForBudgetColumn | true  |
#    And I click on the "Update" button
    And I click on the "Cancel" button
    And I wait for modal window to close

  Examples:
    | Login User   | Login full username  | Budget Type |
    | DeleteAccess | Delete Access Access | Actual      |


  Scenario Outline: As a delete user I create budget summary page

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click on "Add" Button
    And I switch to "Budget Summary Page Creation" child window
    And I set following fields value on editable page
      | name                      | value              |
      | PageLayoutName            | <Page Layout Name> |
      | Description               | upload budget      |
      | _checkbox_ValidForProject | true               |
    And I click on "Add" Button
    And I switch to main window
    And I see "Successfully added item" message in the grid
    And I verify a row from reports grid "main" having the following header and cell value pair
      | name             | value              |
      | Page Layout Name | <Page Layout Name> |

    And I click "build layout" action of "<Page Layout Name>" sub row in the grid "main"
    And I switch to "Build Layout" child window
    And I wait for the Loading text to disappear in grid
    And I expand the following
      | Available Fields |
      | Budget Types     |
      | Budget Comments  |

    Then I drag and drop the following
      | Actual            |
      | Actual (Comments) |
    And I click on "Save Layout" Button
    And I click on "Close" Button
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Page Layout Name |
    | DeleteAccess | Delete Access Access | BudgetA-1018     |


  Scenario Outline: As a delete user I download and upload budget summary values

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Budget" tab
    And I switch to visible frame
    And I verify the "Selenium-Budget" "Template on budget tab"
    And I switch to default frame
    And I click on the "Budget Creation" action panel button
    And I switch to visible frame
    And I click on "download spreadsheet" link
    And I switch to default frame
    And I switch to "download window" child window
    And I verify the following text in a page
      | Include dollar amounts in spreadsheet? |
    And I click on "Yes" Button
    And I download file
    And I switch to main window
    And I switch to visible frame
    And I click on "Upload" Button
    And I switch to default frame
    And I switch to "Upload Budget Summary" child window
    And I set following fields value on editable page
      | name               | value              |
      | BudgetColumnTypeID | Actual             |
      | description        | Upload values-1018 |
#    And I upload the following document "Budget_Spreadsheet_1018.xls" from path "Data/ImportDataFiles/iwms/Project/Details/Budget"
    And I upload the following document from path "Data/ImportDataFiles/iwms/Project/Details/Budget":
      | Budget_Spreadsheet_1018.xls |
    And I click on "Upload Budget" Button
    And I switch to main window
    And I switch to visible frame
    And I verify file "Upload values-1018" uploaded successfully
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name               | Budget Type | Page Layout Name |
    | DeleteAccess | Delete Access Access | BudgetValuesUploadProject | Actual      | BudgetA-1018     |