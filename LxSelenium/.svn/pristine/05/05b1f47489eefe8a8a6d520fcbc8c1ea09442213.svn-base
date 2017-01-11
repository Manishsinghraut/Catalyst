@all
Feature: [Jira Ref. : AUTOMATION-1398] Create Report with - Custom List on a Form

  Scenario Outline: As a Delete User, I Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/EditableReports/"
    And I import following files:
      | EditableFormsEntity-1398.xml |
      | Forms-1398.xml               |
    And I navigate to entity type "Locations" named "<Entity Name>" through search option
    And I click on the "Documents" tab
    And I switch to visible frame
    And I verify the list of folders Document
      | SeleniumTestRootFolder1 |
    And I switch to visible frame
    And I select the following
      | SeleniumTestRootFolder1 |
    And I click on "Upload to SeleniumTestRootFolder1" tab
    And I see the "Uploading to folder /SeleniumTestRootFolder1" modal window
    And I set fields values on editable page
      | name               | value                |
      | description        | test1                |
      | documentType       | Document             |
      | authoredByPersonID | Delete Access Access |
    And I upload the following document from path "Data/ImportDataFiles/iwms/Reports/EditableReports/":
      | Test1-1398.xlsx |
    When I click on the "Upload" button
    And I wait for modal window to close

    Examples:
      | Login User   | Login full username  | Entity Name           |
      | DeleteAccess | Delete Access Access | Editable forms Entity |

  Scenario Outline: As Delete user, I add form and verify the Data is saved successfully
    When I click on the "Forms" tab
    And I wait for the Loading text to disappear
    And I click "Add Form..." button of frame grid "BOGridLX_Grid_Issue"
    Then I wait for " " modal window to open in non frame page
    And I select form type "Form CL" in modal window
    And I click on the "OK" button
    And I click '+ Add' button to add line items
    And I enter row values in grid "<GRID>" by the following values
      | Number1 | Number2 | Total Math | CheckBox | Currency | Date1          | Date2              | Date Diffrence | Percent | Time1                                     | Time2                                 | Time Diffrence | Text |
      | 5       | 10      |            | true     | 1        | [Today's Date] | [Yesterday's Date] |                | 100     | [Yesterday's Date with Hour, min and sec] | [Today's date with Hour, min and Sec] |                | test |
    And I select following radio by label
      | name |
      | Yes  |
    And I open document upload window in "Form Custom List"
    And I select the following folders
      | SeleniumTestRootFolder1 |
    And I click on file "Test1-1398.xlsx" link
    And I click "Update" button
    And I click 'Add' button to add line items
    And I wait for modal window to close
    And I wait for the Loading text to disappear
    And I see "Forms item successfully added" message in the header

    Examples:
      | GRID            |
      | ^customListGrid |

  Scenario Outline: As Delete user, I import following custom list
    When I used data files from "Data/ImportDataFiles/iwms/Reports/EditableReports/"
    And I import following file name:
      | FormsCustomListReport-1398.xml |
    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "report" child window
    And I expand "<Entity Name>" entity report
    #Edit values
    And I verify the following report values in non frame grid
      | Number1 | Number2 | Total Math | CheckBox | Currency | Date1          | Date2              | Date Diffrence | Percent    | Time1                              | Time2                          | Time Diffrence | Text | RadioButton | Document        |
      | 5       | 10      | 15         | Yes      | $1.00    | [Today's Date] | [Yesterday's Date] | - 2 days       | 100.00000% | [Yesterday's Date with Hour AM/PM] | [Today's Date with Hour AM/PM] | 24.0           | test | Yes         | Test1-1398.xlsx |
    And I click on the Custom List Report to edit custom list
    And I enter row values in grid "^customListGrid" by the following values
      | Number1 | Number2 | Total Math | CheckBox | Currency | Date1              | Date2          | Date Diffrence | Percent | Time1 | Time2 | Time Diffrence | Text      |
      | 15      | 20      |            |          |          | [Yesterday's Date] | [Today's Date] |                |         |       |       |                | test edit |
    And I select following radio by label
      | name |
      | No   |
    And I click "Update" button

    #Add Values
    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Number1 | Number2 | Total Math | CheckBox | Currency | Date1 | Date2 | Date Diffrence | Percent | Time1 | Time2 | Time Diffrence | Text          |
      | 5       | 6       |            |          | 2        |       |       |                |         |       |       |                | adding values |
    And I select following radio by label
      | name |
      | Yes  |
    And I click "Update" button
    And I click on the green check mark
    And I click on "Rerun Report" link
    And I expand "<Entity Name>" entity report
    And I verify the following report values in non frame grid
      | Number1 | Number2 | Total Math | CheckBox | Currency | Date1              | Date2          | Date Diffrence | Percent    | Time1                              | Time2                          | Time Diffrence | Text          | RadioButton | Document              |
      | 15      | 20      | 35         | Yes      | $1.00    | [Yesterday's Date] | [Today's Date] | 2 days         | 100.00000% | [Yesterday's Date with Hour AM/PM] | [Today's Date with Hour AM/PM] | 24.0           | test edit     | No          | Test1-1398.xlsx       |
      | 5       | 6       | 11         | No       | $2.00    |                    |                |                |            |                                    |                                |                | adding values | Yes         | No Document Attached. |


    Examples:
      | Report Name             | Entity Name           |
      | Form Custom List Report | Editable forms Entity |

  Scenario Outline: As Delete user, I download sample Custom List Template and upload Custom spreadsheet
    When I click on the Custom List Report
    And I click "Upload Data" button
    And I see the "Upload Data" modal window
    And I click on "Download Sample CustomList Template" link
    And I verify file name "CustomList" of type ".xls" downloaded successfully
    And I Upload following Custom List Values "Data/ImportDataFiles/iwms/Reports/EditableReports/":
      | CustomSpreadsheet-1398.xlsx |
    And I click on the green check mark
    And I click on "Rerun Report" link
    And I expand "<Entity Name>" entity report
    And I verify the following report values in non frame grid
      | Number1 | Number2 | Total Math | CheckBox | Currency | Date1      | Date2      | Date Diffrence | Percent    | Time1            | Time2            | Time Diffrence | Text        | RadioButton | Document              |
      | 2       | 3       | 5          | Yes      | $10.00   | 12/30/2016 | 12/31/2016 | 2 days         | 100.00000% | 02/28/2016 01 PM | 02/27/2016 01 PM | -24.0          | Upload test | Yes         | No Document Attached. |
    And I close the "report" child window
    And I switch to main window

    Examples:
      | Entity Name           |
      | Editable forms Entity |


  Scenario Outline: As Delete user, Navigate to the Entity> Forms tab Check out the form and view all the data on the form
    When I navigate to entity type "Locations" named "<Entity Name>" through search option
    And I click on the "Forms" tab
    And I wait for the Loading text to disappear
    And I click " Expand All " button
    And I click on "<View>" link
    And I switch to default frame
    And I wait for modal window to open
    And I verify the following values in non frame grid "^customListGrid"
      | Number1 | Number2 | Total Math | CheckBox  | Currency | Date1              | Date2          | Date Diffrence | Percent    | Time1                              | Time2                          | Time Diffrence | Text          | RadioButton | Document        |
      | 15      | 20      | 35         | checked   | $1.00    | [Yesterday's Date] | [Today's Date] | 2 days         | 100.00000% | [Yesterday's Date with Hour AM/PM] | [Today's Date with Hour AM/PM] | 24             | test edit     | No          | Test1-1398.xlsx |
      | 5       | 6       | 11         | unchecked | $2.00    |                    |                | 1 day          |            |                                    |                                | 0              | adding values | Yes         |                 |
      | 2       | 3       | 5          | checked   | $10.00   | 12/30/2016         | 12/31/2016     | 2 days         | 100.00000% | 02/28/2016 01 PM                   | 02/27/2016 01 PM               | -24            | Upload test   | Yes         |                 |

    Examples:
      | Entity Name           |
      | Editable forms Entity |