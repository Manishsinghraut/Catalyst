@all
Feature: [Jira Ref. : AUTOMATION-1399] Individual Custom List fields on an editable report

  Scenario Outline: As Delete User, I Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/EditableReports/"
    And I import following file name:
      | ProjectEntityForCLPageLayout(2)-1399.xml  |
      | ProjectEntityForCLPageLayout(2)-1399.xml  |
      | Editable_Report_Project_entity-1399.xml   |
      | EditableReportIndividualCLFields-1399.xml |
    And I navigate to the admin dashboard
    And I click on "Manage Page Layouts" link
    Then I verify the following values in non frame grid "BOGridPageLayout"
      | Page Layout Name |
      | <Page Layout>    |

    Examples:
      | Login User   | Login full username  | Page Layout        |
      | DeleteAccess | Delete Access Access | ProjectEntityForCL |


  Scenario Outline: As Delete user, I verify the Data should be saved successfully
    Given I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I select "<Page Layout>" page layout from dropdown
    And I click on the "Edit" action panel button
    And I wait for the Loading text to disappear
    And I click '+ Add' button to add line items
    And I enter row values in grid "<GRID>" by the following values
      | Modified Date | Item Description   | Quantity | Price |
      |               | Building Equipment | 100      | 250   |
    And I select following radio by label
      | name |
      | No   |
    And I click "Update" button

    And I click '+ Add' button to add line items
    And I enter row values in grid "<GRID>" by the following values
      | Modified Date | Item Description | Quantity | Price |
      |               | Soft Cost        | 50       | 100   |
    And I select following radio by label
      | name |
      | Yes  |
    And I click "Update" button
    And I click on the "Save Changes" action panel button
    Then I verify the following values within frame grid "<GRID>"
      | Modified Date                  | Item Description   | Quantity | Price   | Tax     | Total      | Completed |
      | [Today's Date with Hour AM/PM] | Building Equipment | 100      | $250.00 | $500.00 | $25,500.00 | No        |
      | [Today's Date with Hour AM/PM] | Soft Cost          | 50       | $100.00 | $200.00 | $5,200.00  | Yes       |


    Examples:
      | Entity Name                    | Page Layout        | GRID            |
      | Editable Report-Project entity | ProjectEntityForCL | ^customListGrid |


  Scenario Outline: As Edit user, I verify the Error Pop-up should be displayed
    When I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "report" child window
    And I verify the following values are "non-editable"
      | [Today's Date] |
    And I verify the following values are "editable"
      | Building Equipment |
      | Soft Cost          |
    And I click on the "100"
    And I set following fields value on editable page
      | name      | value |
      | Quantity1 | 200   |
    And I click on the green check mark

    And I click on the "$250.00"
    And I set following fields value on editable page
      | name   | value |
      | Price1 | 300   |
    And I click on the green check mark

    And I click on the "Yes"
    And I select "No" radio option in custom list field
    And I click on the green check mark

    And I click on "Rerun Report" link
    And I click on "Rerun Report" link
    And I verify the following values in non frame grid
      | Name          | Modified Date                  | Item Description   | Quantity | Price   | Tax     | Total      | Completed |
      | <Entity Name> | [Today's Date with Hour AM/PM] | Building Equipment | 200      | $300.00 | $600.00 | $60,600.00 | No        |
      | <Entity Name> | [Today's Date with Hour AM/PM] | Soft Cost          | 50       | $100.00 | $200.00 | $5,200.00  | No        |

    And I click on "<Entity Name>" link
    And I close the "Report" child window
    And I switch to main window
    Then I verify the following values within frame grid "<GRID>"
      | Modified Date                  | Item Description   | Quantity | Price   | Tax     | Total      | Completed |
      | [Today's Date with Hour AM/PM] | Building Equipment | 200      | $300.00 | $600.00 | $60,600.00 | No        |
      | [Today's Date with Hour AM/PM] | Soft Cost          | 50       | $100.00 | $200.00 | $5,200.00  | No        |


    Examples:
      | Report Name                          | Entity Name                    | GRID            |
      | Editable Report-Individual CL fields | Editable Report-Project entity | ^customListGrid |
