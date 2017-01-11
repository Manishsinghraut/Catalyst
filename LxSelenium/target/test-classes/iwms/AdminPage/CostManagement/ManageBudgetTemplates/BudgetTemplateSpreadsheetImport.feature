@all
Feature: Budget template Spreadsheet import (JIRA Ref. : AUTOMATION-1077)

  Scenario Outline: I Download the Budget template Spreadsheet
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Import Data" link
    And I click on the "Spreadsheets" link
    And I set following fields value on editable page
      | name        | value           |
      | handlerType | Budget Template |
    And I click on download button to download budget template Spreadsheet

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I upload the Budget template Spreadsheet
    Given I Login to IWMS using "<Login User>" access credentials
    And I navigate to the admin dashboard
    And I click on the "Import Data" link
#    And I verify the following message "Note: When Facility records get imported the Location data will be automatically created/updated"
#    And I import following files from "Data/ImportDataFiles/iwms/AdminPage/CostManagement/ManageBudgetTemplates/":
#      | BudgetTemplateExcel.xlsx |
#    And I verify a loading bar will appear "Finished" and after it has processed to 100%
#    And I verify that "5" "BudgetLineItem" were created,"1" "BudgetTemplate" was created and creates "Totals" "6"
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CostManagement/ManageBudgetTemplates/"
    And I import following file name:
      | BudgetTemplateExcel.xlsx |

  Examples:
    | Login User   |
    | DeleteAccess |


  Scenario Outline: I import the Manage Budget Templates
    Given I Login to IWMS using "<Login User>" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I click on the "layout" row action of column "BudgetExcelImport" of column "1" from grid "<Grid>"
    And I click on "<Expand All>" link
    And I verify the "Construction" of the line item code "1" and Default Amount "$100.00" will be displayed
    And I verify the "Building" of the line item code "11" and Default Amount "$100.00" will be displayed
    And I verify the "Building-Construction" of the line item code "12" and Default Amount "$100.00" will be displayed
    And I verify the "GC Supplied" of the line item code "2" and Default Amount "$0.00" will be displayed
    And I verify the "Electrical Installation" of the line item code "3" and Default Amount "$0.00" will be displayed

  Examples:
    | Login User   | Grid                 |
    | DeleteAccess | BOGridBudgetTemplate |
