@all
Feature: (Jira Ref: AUTOMATION-419) I create and update forms and verify them in Capital Project> Details> Forms page

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario: Import xml file to create custom list from ImportData folder
    When I used data files from "Data/ImportDataFiles/xml/"
    And I import following file name:
      | Selenium_Form.xml |
      | Selenium_Form.xml |

  Scenario Outline: Scenario-1: Downloading a blank form template.

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Import Data" link
    And I wait for the Loading text to disappear in grid
    And I click on the "Spreadsheets"
    And I wait for the Loading text to disappear in grid
    And I set following fields value on editable page
      | name        | value                     |
      | handlerType | Forms                     |
      | formLayout  | Selenium_Form[To Do List] |
#    And I click on "Download" Button
    And I click on download button to download "Forms" template Spreadsheet
    And I click on download button to download "Forms" template Spreadsheet
    And I download file
    And I wait for the Loading text to disappear in grid
    And I verify file name "LxERPDataImport" of type ".xlsx" downloaded successfully

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I create/update forms through spreadsheet import
    When I used data files from "Data/ImportDataFiles/iwms/CapitalProject/Details/Forms/"
    And I import following file name:
      | Add_Form_Empty_Custom_List.xls |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click "Add Form Empty Custom list" link "under Form list"
    And I click "<View>" link "under form 'Add Form Empty Custom list'"
    And I switch to default frame
    And I wait for modal window to open
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/CapitalProject/Details/Forms/Add_Form_Empty_Custom_List.xls"
    Then I verify values on non editable summary page by reading data from spreadsheet row "<Spreadsheet Row>"
      | name                                         | value                     |
      | Title                                        | FRM_Selenium_Form.Subject |
      | This is a test to Add Form Empty Custom list | FRM_Selenium_Form.Body    |
    And I verify grid "^customListGrid_" is empty with the following message "No rows to display"
    And I click on the "Close"

    When I used data files from "Data/ImportDataFiles/iwms/CapitalProject/Details/Forms/"
    And I import following file name:
      | Add_Form_Custom_List.xls |
    And I click on the "<Third Level Tab>" sub tab
    And I switch to visible frame
    And I click "Add Form and Custom list" link "under Form list"
    And I click "<View>" link "under form 'Add Form and Custom list'"
    And I switch to default frame
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/CapitalProject/Details/Forms/Add_Form_Custom_List.xls"
    Then I verify values on non editable summary page by reading data from spreadsheet row "<Spreadsheet Row>"
      | name                                       | value                     |
      | Title                                      | FRM_Selenium_Form.Subject |
      | This is a test to add form and custom list | FRM_Selenium_Form.Body    |

    And I verify the following values in non frame grid "^customListGrid_"
      | Priority | Assigned To:  | Task Budget | Percentage Complete | Assigned | Complete | Modified By           |
      |          | Delete Access | $2,000.00   | 25.00000%           | Yes      | checked  | <Login full username> |
    And I click on the "Close"

    When I used data files from "Data/ImportDataFiles/iwms/CapitalProject/Details/Forms/"
    And I import following file name:
      | Update_Existing_Form.xls |
    And I click on the "<Third Level Tab>" sub tab
    And I switch to visible frame
    And I click "Only Update existing form" link "under Form list"
    And I click "<View>" link "under form 'Only Update existing form'"
    And I switch to default frame
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/CapitalProject/Details/Forms/Update_Existing_Form.xls"
    Then I verify values on non editable summary page by reading data from spreadsheet row "<Spreadsheet Row>"
      | name            | value                     |
      | Title           | FRM_Selenium_Form.Subject |
      | Update existing | FRM_Selenium_Form.Body    |
    And I click on the "Close"

    When I used data files from "Data/ImportDataFiles/iwms/CapitalProject/Details/Forms/"
    And I import following file name:
      | Populate_Custom_List_Only.xls |
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click "Selenium Empty Custom list" link "under Form list"
    And I click "<View>" link "under form 'Selenium Empty Custom list'"
    And I switch to default frame
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/CapitalProject/Details/Forms/Populate_Custom_List_Only.xls"
    Then I verify values on non editable summary page by reading data from spreadsheet row "<Spreadsheet Row>"
      | name                                        | value                     |
      | Title                                       | FRM_Selenium_Form.Subject |
      | Selenium Empty Custom list-Only form filled | FRM_Selenium_Form.Body    |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/CapitalProject/Details/Forms/Populate_Custom_List_Only.xls"
    Then I verify data in grid "WF^customListGrid" in row "1" by reading data from spread sheet row "7"
      | name                | value                                            |
      | To Do Item          | CL_Selenium_Basic_Custom_List.ToDoItem           |
      | Assigned To:        | CL_Selenium_Basic_Custom_List.AssignedTo_        |
      | Task Budget         | CL_Selenium_Basic_Custom_List.TaskBudget         |
      | Percentage Complete | CL_Selenium_Basic_Custom_List.PercentageComplete |
      | Assigned            | CL_Selenium_Basic_Custom_List.Assigned           |

    Examples:
      | Login full username  | Second Level Tab | Third Level Tab | Entity Name              | Spreadsheet Row | View   |
      | Delete Access Access | Details          | Forms           | Lucernex-Capital_Project | 6               | <View> |
