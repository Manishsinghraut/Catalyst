@all
Feature:(JIRA Ref. : AUTOMATION-529) Budget Line Items

  Scenario Outline: As a delete user I import the attached xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/"
    And I import following file name:
#      | Invoiced_budget_column.xml |
      | BudgetColumn.xml |
  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: Adding CL Fields
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/"
    And I import following file name:
      | Report_For_CL.xml |
    And I navigate to the admin dashboard
    And I click on the "Manage Custom Lists" link
#    And I wait for the Loading text to disappear in grid
#    And I click "edit fields" row action for the row that has "<Custom List Name>" in column "Name"
    And I click "edit fields" row action in the non frame grid "BOGridReportGroupDataCustomList" having the following header and cell values
      | name | value              |
      | Name | <Custom List Name> |
    Then I see the "Edit fields" modal window

    And I click on " Add Report/Form Field... " button in grid
    And I set fields values on editable page
      | name               | value       |
      | RGAFID             | Budget      |
#      | BudgetColumnTypeID | Invoiced |
      | BudgetColumnTypeID | InvoicedRST |
    Then I click "Add" button
    And I wait for the Loading text to disappear in grid

    And I click on " Add Report/Form Field... " button in grid
    And I set fields values on editable page
      | name   | value       |
      | RGAFID | Budget Cost |
    Then I click "Add" button

    And I wait for the Loading text to disappear in grid
    And I click "Finished" button
    And I wait for modal window to close

  Examples:
    | Custom List Name        | Login User   | Login full username  |
    | DO NOT CHANGE OR DELETE | DeleteAccess | Delete Access Access |

  Scenario Outline: Adding CL Layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Custom Lists" link
    And I wait for the Loading text to disappear in grid
#    And I click "add layout" row action for the row that has "<Custom List Name>" in column "Name"
    And I click "add layout" row action in the non frame grid "BOGridReportGroupDataCustomList" having the following header and cell values
      | name | value              |
      | Name | <Custom List Name> |
    And I see the "Add Layout for <Custom List Name>  ***Required fields in red" modal window
    And I set fields values on editable page
      | name           | value                          |
      | PageLayoutName | <Custom List page layout name> |
      | Description    | <Custom List page layout name> |
#    Then I click "Add Layout" button
    And I click on the "Add Layout" button
    And I wait for modal window to close
#    And I wait for the Loading text to disappear in grid
    And I click "layout form" action of "<Custom List page layout name>" sub row in the grid "<CL Grid ID>"
    And I switch to "build layout" child window
    And I select the following options
      | <Field1> |
      | <Field2> |
      | <Field3> |
      | <Field4> |
    And I click on "Close" Button
    And I switch to main window

  Examples:
    | Custom List Name        | Login User   | Login full username  | Custom List page layout name | CL Grid ID                      | Field1      | Field2           | Field3            | Field4          |
    | DO NOT CHANGE OR DELETE | DeleteAccess | Delete Access Access | CL-529                       | BOGridReportGroupDataCustomList | Budget(1x1) | Budget Cost(1x1) | Number Field(1x1) | Text Field(1x1) |


  Scenario Outline: As a delete user I can able to add custom list to form layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/"
    And I import following file name:
      | FormForBudgetLineItems.xml |

    And I navigate to the admin dashboard
    And I click on the "Manage Forms" link
    Then I expand the "<Form Name>" row in grid "<Grid ID>"
    And I click "edit fields" row action for the row that has "<Form Name>" in column "Name"
    Then I see the "Edit fields for <Form Name>" modal window
    And I click on " Add Report/Form Field... " button in grid
    And I set following fields value on editable page
      | name                | value               |
      | radioTypeSelection  | Custom              |
      | DefaultLabel        | <Custom list field> |
      | FormFieldTypeDriver | Custom List >>      |
      | ClientListRGDID     | <Custom List Name>  |
      | AccessorName        | Test                |
    And I click "Add" button
    And I click "Finished" button
    And I click "build layout" action of "<Form layout>" sub row in the grid "<Grid ID>"
    And I switch to "build layout" child window
    And I expand the following
      | Available Fields    |
      | Forms               |
      | <Form Name>         |
      | <Custom list field> |
    Then I drag and drop the following
      | <Custom List Page Layout> |
    And I click on "Save Layout" Button
    And I click on the "Yes" button confirmation popup window
    And I click on "Close" Button
    Then I switch to main window


  Examples:
    | Custom List Name        | Custom List Page Layout | Custom list field | Form Name                  | Form layout                       | Login User   | Login full username  | Grid ID             |
    | DO NOT CHANGE OR DELETE | CL-529                  | CL list -529      | Form for budget line items | Form layout for budget line items | DeleteAccess | Delete Access Access | BOGridCodeIssueType |

  Scenario Outline: I add form
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCustomLists/"
    And I import following file name:
      | Portfolio_for_Collapsible_Option.xml  |
      | Create_Project_Collapsible_Option.xls |
      | BudgetTemplate.xml                    |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    And I click on the "Budget" tab
    And I check for complete frame 'loading...'
    And I set following fields value on editable page
      | name                     | value           |
      | budgetTemplateIDToAssign | Selenium-Budget |
    And I click on "Assign Budget Template" Button
    And I click on the "Forms" tab
    Then I verify user is directed to "Forms" tab
    And I wait for the Loading text to disappear
#    And I click "Add Item" form button
    And I switch to visible frame
#    And I click " Add Form... " form button
    And I click " Add Form... " button
    And I switch to default frame
    And I see a modal window
    And I select form type "<Form Layout>" in modal window
    And I click on the "OK" button
   #row 1
    And I click '+ Add' button to add line items
    And I enter row values in grid "<GRID>" by the following values
      | Budget | Budget Cost |
      | Carpet | 1000        |
    And I assert row values in grid "<GRID>" by the following values
      | Budget | Budget Cost |
      | Carpet | 1000        |
    And I click "Update" button
    And I view a unique row in grid "<GRID>" having unique value "Carpet" under column header "Budget"
      | name        | value     |
      | Budget Cost | $1,000.00 |

  Examples:
    | Entity Name                    | Form Layout                       | Login User   | Login full username  | GRID            |
    | Project for Collapsible Option | Form layout for budget line items | DeleteAccess | Delete Access Access | ^customListGrid |