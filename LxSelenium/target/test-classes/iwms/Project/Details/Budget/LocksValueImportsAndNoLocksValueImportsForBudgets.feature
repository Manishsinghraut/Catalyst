@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1352), Locks Value Imports and No Locks Value Imports for Budgets

  Scenario Outline: As a delete user I import the following xmls

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/"
    And I import following file name:
      | Portfolio__Sprint_16__1352.xml      |
      | Location_Sprint_16_1352.xml         |
      | BudgetTemplate_1352.xml             |
      | Column_1352.xml                     |
      | BudgetSummaryPage_1352.xml          |
      | 8980_Budget_Values Project_1352.xml |

    When I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Summary Page>" sub row in the grid "main"
    And I switch to "Edit Summary Page" child window
    And I set following fields value on editable page
      | name                      | value |
      | _checkbox_ValidForProject | true  |
    And I click on "Update" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    Examples:
      | Login User   | Login full username  | Summary Page             |
      | DeleteAccess | Delete Access Access | 8980 Budget Summary Page |


  Scenario Outline: As a delete user Click on edit and select option Valid for project and click update
    When I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "<Summary Page>" sub row in the grid "main"
    And I switch to "Edit Summary Page" child window
    And I set following fields value on editable page
      | name                      | value |
      | _checkbox_ValidForProject | true  |
    And I click on "Update" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    When I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I click "status list" row action in the non frame grid "BOGridBudgetColumnType" having the following header and cell values
      | name | value         |
      | Name | <Budget Type> |
    And I switch to "Status List" child window
    And I set following fields value on editable page
      | name                                                       | value   |
      | _CodeBudgetColumnStatus_ShortName_add                      | Awarded |
      | _CodeBudgetColumnStatus_ActualLongName_add                 | Awarded |
      | _checkbox__CodeBudgetColumnStatus_IsBudgetColumnLocked_add | true    |
    And I click on "add" link
    And I click on "Update" Button
    And I switch to main window
    And I see "Successfully updated Budget Type" action message

    And I click "status list" row action in the non frame grid "BOGridBudgetColumnType" having the following header and cell values
      | name | value         |
      | Name | <Budget Type> |
    And I switch to "Status List" child window
    And I verify the following values in non frame grid
      | Name    | Description | Locks Values? |
      | Awarded | Awarded     | checked       |
    And I click on "Update" Button
    And I switch to main window

    Examples:
      | Summary Page             | Budget Type   |
      | 8980 Budget Summary Page | Budget Values |


  Scenario Outline: Testing Continued...Updating Unlocked Status Column Value
    When I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name       | Description | Status         | Contractor | Total     |
      | Budget Values #01 |             | Default Status |            | $4,000.00 |
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/"
    And I import following file name:
      | UNLOCK_Values_1352.xml |

    When I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name       | Description | Status         | Contractor | Total     |
      | Budget Values #01 |             | Default Status |            | $6,000.00 |

    Examples:
      | Summary Page             | Entity Name        |
      | 8980 Budget Summary Page | 8980 Budget Values |

  Scenario Outline: Testing Continued...Updating Locked Status Column Value
    When I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I click "status values" row action in the non frame grid "BOGridBudgetColumnType" having the following header and cell values
      | name | value         |
      | Name | <Budget Type> |
    And I switch to "Status values" child window
    And I set following fields value on editable page
      | name                 | value   |
      | CodeStatusSelectedID | Awarded |
      | CodeStatusDefaultID  | Awarded |
    And I click on "Update" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window
    When I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I wait for the Loading text to disappear
    And I click on "status" link
    And I see a modal window
    And I set following fields value on editable page
      | name                     | value   |
      | CodeBudgetColumnStatusID | Awarded |
    And I click on the "Update" button
    Then I wait for modal window to close
    And I verify the following values in frame grid
      | Budget Name       | Description | Status  | Contractor | Total     |
      | Budget Values #01 |             | Awarded |            | $6,000.00 |

    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Budget/"
    And I import following file and returns error message "BudgetColumnItemValue [LxID: ":
      | LOCKValues_1352.xml |

    And I import following file and returns error message "<font color= 'red'>Failed to add item, you don't have sufficient security access<br> Budget Budget Values #01 [budgetColumnID=":
      | LOCKValues_1352.xml |

    And I import following file and returns error message "is locked and cannot be updated.</font> as defined on row/line 27":
      | LOCKValues_1352.xml |

    When I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Budget" tab
    And I select "<Summary Page>" page layout from dropdown
    And I click on the "Budget Creation" action panel button
    And I verify the following values in frame grid
      | Budget Name       | Description | Status  | Contractor | Total     |
      | Budget Values #01 |             | Awarded |            | $6,000.00 |


    Examples:
      | Summary Page             | Budget Type   | Entity Name        |
      | 8980 Budget Summary Page | Budget Values | 8980 Budget Values |

