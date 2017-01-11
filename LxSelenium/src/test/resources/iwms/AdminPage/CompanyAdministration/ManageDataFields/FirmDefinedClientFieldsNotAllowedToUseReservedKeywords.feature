@all
Feature: Firm Defined client fields not allowed to use Reserved Keywords (Jira Ref. AUTOMATION-1341)

  Scenario: As a delete user I verify The Message displayed"Integration Name cannot be Reserved SQL keyword, failed for accessor Name "From"
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I navigate to the admin dashboard
    And I click on the "Manage Data Fields" link
    And I expand the the following data fields group
      | Summary Information         |
      | General Summary Information |
    And I click on the "Add Field" for "General Summary Information"
    And I switch to "Manage data fields" child window
    And I set following fields value on editable page
      | name         | value |
      | DefaultLabel | From  |
      | AccessorName | From  |
    And I select "    Budget Index" from "ReportGroupDataID" dropdown
    And I select "Budget Column" from "CodeSQLTableID" dropdown
    And I select "sTYPE_BUDGET_COLUMN" from "GlobalFormFieldType" dropdown
    And I click on the ADD Button
    And I verify the following message "Integration Name cannot be Reserved SQL keyword, failed for accessorName"
    And I close the "Manage data fields" child window
    And I switch to main window