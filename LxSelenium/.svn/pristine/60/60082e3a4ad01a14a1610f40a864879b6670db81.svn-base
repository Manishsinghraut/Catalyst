@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1069), CSI Codes - List Check

  Scenario Outline: As a delete user I import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/"
    And I import following file name:
      | BudgetTemplate1069.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Apply Budget Template and verify I can able to apply template

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Templates" link
    And I click "layout" row action in the non frame grid "BOGridBudgetTemplate" having the following header and cell values
      | name                 | value           |
      | Budget Template Name | <Template Name> |
    And I click on the "<Add Root Group>" link
    And I switch to "Modifying this template" child window
    And I verify the following text in a page
      | Modifying this template will modify all budgets using it as well. Are you sure? |

    And I click on "Yes" Button
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Project/Details/Budget/BudgetsGeneric/CSI_Codes_2014_As_Input.xls"
    And I check the CSI Division and CSI Code against the spreadsheet
      | CodeCSIIDMaster | Division 01 - General Requirements | 1000 - Summary                   |
      | CodeCSIIDMaster | Division 02 - Existing Conditions  | 2100 - Surveys                   |
      | CodeCSIIDMaster | Division 03 - Concrete             | 1113.19 - Falsework              |
      | CodeCSIIDMaster | Division 04 - Masonry              | 0140.52 - Stone Cleaning         |
      | CodeCSIIDMaster | Division 05 - Metals               | 0100 - Maintenance of Metals     |
      | CodeCSIIDMaster | Division 08 - Openings             | 0152.61 - Wood Window Repairs    |
      | CodeCSIIDMaster | Division 09 - Finishes             | 0100 - Maintenance of Finishes   |
      | CodeCSIIDMaster | Division 10 - Specialties          | 0600 - Schedules for Specialties |
      | CodeCSIIDMaster | Division 11 - Equipment            | 1233 - Parking Gates             |
    And I close the "Add Root Group" child window
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Template Name   |
      | DeleteAccess | Delete Access Access | Selenium-Budget |