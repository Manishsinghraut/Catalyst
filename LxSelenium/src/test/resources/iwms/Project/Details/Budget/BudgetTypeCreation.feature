@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1016), Budget Type Creation

  Scenario Outline: As a delete user I create budget Type

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Budget Types" link
    And I click on "Add Budget Type..." button in grid
    And I wait for "Add Budget Type  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                                 | value         |
      | BudgetColumnTypeName                 | <Budget Type> |
      | _checkbox_AllowUIEditForBudgetColumn | true          |
      | _checkbox_IsValidForPortfolio        | true          |
      | _checkbox_IsValidForLocation         | true          |
      | _checkbox_IsValidForOpenProject      | true          |
      | _checkbox_IsValidForContract         | true          |
      | _checkbox_IsValidForCapProgram       | true          |
      | _checkbox_IsValidForParcel           | true          |
      | _checkbox_IsValidForFacility         | true          |
      | _checkbox_IsValidForPrototype        | true          |
      | _checkbox_IsValidForPotentialProject | true          |
      | _checkbox_IsValidForCapProject       | true          |

    And I click on the "Add" button
    And I verify the following values in non frame grid "BOGridBudgetColumnType"
      | Name          | Selected Status | Are Budget Values Editable? | Use this Budget View | Allow one instance of this type per project | Allow multiple instances with Selected Status | Used For Bidding | Used For Bid Conditioning |
      | <Budget Type> | Submitted       | checked                     |                      | unchecked                                   | unchecked                                     | unchecked        | unchecked                 |
#      | <Budget Type> | Default Status  | checked                     |                      | unchecked                                   | unchecked                                     | unchecked        | unchecked                 |

    And I click "status list" row action in the non frame grid "BOGridBudgetColumnType" having the following header and cell values
      | name | value         |
      | Name | <Budget Type> |
    And I switch to "Status List" child window
    And I set following fields value on editable page
      | name                                                       | value           |
      | _CodeBudgetColumnStatus_ShortName_add                      | Approved        |
      | _CodeBudgetColumnStatus_ActualLongName_add                 | Approved Status |
      | _checkbox__CodeBudgetColumnStatus_IsBudgetColumnLocked_add | true            |
    And I click on "add" link
    And I click on "Update" Button
    And I switch to main window

    And I click "status values" row action in the non frame grid "BOGridBudgetColumnType" having the following header and cell values
      | name | value         |
      | Name | <Budget Type> |
    And I switch to "Status Values" child window
    And I set following fields value on editable page
      | name                 | value          |
      | CodeStatusSelectedID | Approved       |
      | CodeStatusDefaultID  | Default Status |
    And I click on "Update" Button
    And I switch to main window
    And I see "Successfully updated Budget Type" action message
    And I verify the following values in non frame grid "BOGridBudgetColumnType"
      | Name          | Selected Status | Are Budget Values Editable? | Use this Budget View | Allow one instance of this type per project | Allow multiple instances with Selected Status | Used For Bidding | Used For Bid Conditioning |
      | <Budget Type> | Approved        | checked                     |                      | unchecked                                   | unchecked                                     | unchecked        | unchecked                 |


    Examples:
      | Login User   | Login full username  | Budget Type          |
      | DeleteAccess | Delete Access Access | Selenium Budget Type |