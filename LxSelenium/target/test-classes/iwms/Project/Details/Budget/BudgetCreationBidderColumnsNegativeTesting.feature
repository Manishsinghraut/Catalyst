@all
Feature: Budget Creation - Bidder Columns Negative Testing (Ref : Jira Ticket No : AUTOMATION-1074)

  Scenario Outline: As a delete user - import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/"
    And I import following file name:
      | BudgetTemplate.xml   |
      | GCSetupForBudget.xml |
      | VendorImport.xml     |
      | GC1ColumnType.xml    |
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I wait for the Loading text to disappear in grid
    And I verify a row from non frame grid "<Grid>" having unique value "GC1" under column header "Name"
      | name            | value          |
      | Selected Status | Default Status |

  Examples:
    | Grid                   | Login User   | Login full username  |
    | BOGridBudgetColumnType | DeleteAccess | Delete Access Access |


  Scenario Outline: To ensure that users cannot have two different GC's setup for the same bidding column
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Budget" tab
    And I switch to visible frame
    And I set following fields value on editable page
      | name                     | value           |
      | budgetTemplateIDToAssign | Selenium-Budget |
    And I click on "Assign Budget Template" Button
    And I see "Successfully assigned Budget Template" message in the header
    And I click on the "Budget Creation" action panel button
    And I wait for the Loading text to disappear
    And I click on "Add" Button
    And I wait for "Select Item To Add" modal window to open in non frame page
    And I set following fields value on editable page
      | name         | value |
      | PageLayoutID | GC1   |
    And I click on "Submit" Button
    And I click on the "..." of Contractor Field
    And I set following fields value on editable page
      | name                  | value             |
      | selectedPrimaryOwners | Selenium-Employer |
    And I click OK button
    And I click on "Add" Button

  Examples:
    | Login User   | Login full username  | Entity Name         |
    | DeleteAccess | Delete Access Access | GC Setup for Budget |