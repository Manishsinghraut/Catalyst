@all
Feature: (Jira Ref: AUTOMATION-406) I create and update Complex and verify them in Admin Dashboard > Manage Complex/Center Details page

  Background:
#    Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "LxSelenium" access credentials
    Then I check previous user login "Selenium Tester" and continue if user "LxSelenium" same or logout and login if not

  Scenario Outline: I create and update Complex and verify them in Admin Dashboard > Manage Complex/Center Details page
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/PortfolioAdministration"
    And I import following file name:
      | ComplexSS.xlsx |
    Then I navigate to the admin dashboard
    And I click on the "Manage Complex/Center Details" link
#    Given I click on the "edit" row action of column "<create complex name>" of column "0" from grid "id" "BOGridComplex"
    And I click on "edit" row action in the grid "BOGridComplex" having the following header "Name" and cell value "<create complex name>"
      | name   | value |
      | Format | Mall  |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/PortfolioAdministration/ComplexSS.xlsx"
    Then I verify all fields values on editable page comparing with "7" th row of spreadsheet
      | name                        | value                       |
      | Complex_CodeComplexStatusID | Complex.CodeComplexStatusID |
      | Complex_Notes               | Complex.Notes               |
    And I click on the "Cancel" button
    And I wait for modal window to close
#    Given I click on the "edit" row action of column "<update complex name>" of column "0" from grid "id" "BOGridComplex"
    And I click on "edit" row action in the grid "BOGridComplex" having the following header "Name" and cell value "<update complex name>"
      | name   | value |
      | Format | Mall  |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/PortfolioAdministration/ComplexSS.xlsx"
    Then I verify all fields values on editable page comparing with "6" th row of spreadsheet
      | name                        | value                       |
      | Complex_CodeComplexStatusID | Complex.CodeComplexStatusID |
      | Complex_Notes               | Complex.Notes               |
    And I click on the "Cancel" button
    And I wait for modal window to close

    Examples:
      | create complex name | update complex name |
      | Cielo Vista Mall    | Stonebriar          |
