@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1469), Verify auditing and drilldown to show budget impacting forms data for budget line items

  Scenario Outline: As a delete user I import the following xmls and add status list
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following files:
      | Portfolio_00020AandLocation_00020-1469.xml |
      | BudgetTemplate-1469.xml                    |
      | BudgetColumn-1469.xml                      |

    When I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I click "status list" row action in the non frame grid "BOGridBudgetColumnType" having the following header and cell values
      | name | value         |
      | Name | <Budget Type> |
    And I switch to "Status List" child window
    And I set following fields value on editable page
      | name                                       | value     |
      | _CodeBudgetColumnStatus_ShortName_add      | Inprocess |
      | _CodeBudgetColumnStatus_ActualLongName_add | Inprocess |
    And I click on "add" link
    And I click on "Update" Button
    Then I wait for browser windows count to be equal to "1"
    And I switch to main window


    Examples:
      | Login User   | Login full username  | Budget Type |
      | DeleteAccess | Delete Access Access | Column11354 |

  Scenario Outline: As a delete user I import summary page and edit budget summary page
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following files:
      | BudgetSummaryPage-1469.xml |
    Given I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Summary Page>" sub row in the grid "main"
    And I switch to "Edit Summary Page" child window
    And I set following fields value on editable page
      | name                      | value |
      | _checkbox_ValidForProject | true  |
    And I click on "Update" Button
    Then I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Summary Page  |
      | 11354 Summary |

  Scenario Outline: As a delete user I import project entity , add field to form layout
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following files:
      | 11354_Project-1469.xml |
      | Forms-1469 .xml        |
    Given I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    And I search for record "<Form Name>"
    Then I expand the "<Form Name>" row in grid "<Grid ID>"
    And I click "build layout" action of "<Form Name>" sub row in the grid "<Grid ID>"
    And I switch to "Build layout" child window
    And I expand the following
      | Budget Fields        |
      | Column11354 (fields) |

    Then I drag and drop the following
      | Budget Column Status |
    And I click on the save layout button on page layout
    And I click on the "Yes" button in confirmation pop up
    And I click on the close button on page layout
    And I switch to main window

    Examples:
      | Form Name | Grid ID             |
      | Form11354 | BOGridCodeIssueType |

  Scenario Outline: As a delete user add form to entity
    When I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
    And I click "Add Form..." button of frame grid "BOGridLX_Grid_Issue"
    And I switch to default frame
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I set following fields value on editable page
      | name          | value  |
      | Issue_Subject | Form 1 |
    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Budget | Budget Cost |
      | Carpet | 300         |
    And I click "Update" button
    Then I verify the following text in a page
      | Column11354 |
      | Submitted   |
    And I click 'Add' button to add line items
    And I wait for modal window to close

    And I wait for the Loading text to disappear
    And I click "Add Form..." button of frame grid "BOGridLX_Grid_Issue"
    And I switch to default frame
    And I select form type "<Form Type>" in modal window
    And I click on the "OK" button
    And I set following fields value on editable page
      | name          | value  |
      | Issue_Subject | Form 2 |
    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Budget | Budget Cost |
      | Carpet | 450         |
    And I click "Update" button
    And I click 'Add' button to add line items
    And I wait for modal window to close

    And I click on the "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I wait for the Loading text to disappear
    And I click on "<Expand All>" link
    And I click on "$750.00" link
    And I wait for "Carpet : $750.00" modal window to open in non frame page
    Then I verify the following values in non frame grid "Grid_BudgetIssueList"
      | Work Flow Name | Form Title | Date           | Created By           | Budget Amount |
      |                | Form 1     | [Today's Date] | Delete Access Access | $300.00       |
      |                | Form 2     | [Today's Date] | Delete Access Access | $450.00       |
    And I click on the "Close" button


    Examples:
      | Project Name | Form Type | Summary Page  |
      | 1354 Project | Form11354 | 11354 Summary |