@all
Feature: (Jira Ref- AUTOMATION-400, AUTOMATION-1191)I create and update percentage variable Rent Offset and verify them in Contract> Payment Info> Percentage Rent page

  Scenario Outline: I create percentage variable Rent Offset and verify them in Contract> Payment Info> Percentage Rent page
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent"
    And I import following files:
      | VariableOffset-1191.xml        |
      | OffsetRecIDReport-1191.xml     |
      | CreateVariableOffset-1191.xlsx |

    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Report Grid ID>" having the following header and cell values
      | name        | value        |
      | Report Name | Offset RecID |
    And I switch to "Report" child window
    And I fetch Variable Offset ID from report for entity "<Entity Name>"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/UpdateVariableOffset-1191.xlsx"
    And I set cell value in spread sheet row "6" under header "Term RecID" of column index "3"
    And I close the "Report" child window
    And I switch to main window

    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click "edit" row action in the non frame grid "BOGridVariableRentOffset" having the following header and cell values
      | name                | value           |
      | Sales Group         | Internal Sales  |
      | Begin Date          | 01/01/2000      |
      | End Date            | 12/31/2015      |
      | Expense Group       | Expense         |
      | Expense Type        | Interior        |
      | Offset Group        | Presentage Rent |
      | Offset Type         | Ceiling         |
      | Fixed Offset Amount |                 |
      | Cap Percent         | 25.00000%       |
      | Cap Amount          |                 |
    And I wait for "Edit Expense Offset  ***Required fields in red" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name                                  | value             |
      | VariableRentOffset_CodeSalesGroupID   | Internal Sales    |
      | VariableRentOffset_BeginDate          | 01/01/2000        |
      | VariableRentOffset_EndDate            | 12/31/2015        |
      | VariableRentOffset_CodeExpenseGroupID | Expense           |
      | VariableRentOffset_CodeOffsetGroupID  | Presentage Rent   |
      | VariableRentOffset_CapPercent         | 25.00000%         |
      | VariableRentOffset_CodeExpenseTypeID  | Interior          |
      | VariableRentOffset_CodeOffsetTypeID   | Ceiling           |
      | VariableRentOffset_CapAmount          |                   |
      | VariableRentOffset_CodeCurrencyTypeID | USD               |
      | VariableRentOffset_Notes              | This is to create |

    And I verify the following radio by label
      | name                  | value |
      | Calculated Adjustment | true  |
      | Fixed Adjustment      | false |
    And I click on the "Cancel" button

    And I wait for the Loading text to disappear
    And I click "edit" row action in the non frame grid "BOGridVariableRentOffset" having the following header and cell values
      | name                | value                   |
      | Sales Group         | Sales                   |
      | Begin Date          | 01/01/2000              |
      | End Date            | 12/31/2015              |
      | Expense Group       | Lease Expense           |
      | Expense Type        | Building Maintenance    |
      | Offset Group        | Presentage Rent         |
      | Offset Type         | Common Area Maintanance |
      | Fixed Offset Amount |                         |
      | Cap Percent         | 50.00000%               |
      | Cap Amount          |                         |
    And I wait for "Edit Expense Offset  ***Required fields in red" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name                                  | value                   |
      | VariableRentOffset_CodeSalesGroupID   | Sales                   |
      | VariableRentOffset_BeginDate          | 01/01/2000              |
      | VariableRentOffset_EndDate            | 12/31/2015              |
      | VariableRentOffset_CodeExpenseGroupID | Lease Expense           |
      | VariableRentOffset_CodeOffsetGroupID  | Presentage Rent         |
      | VariableRentOffset_CapPercent         | 50.00000%               |
      | VariableRentOffset_CodeExpenseTypeID  | Building Maintenance    |
      | VariableRentOffset_CodeOffsetTypeID   | Common Area Maintanance |
      | VariableRentOffset_CapAmount          |                         |
      | VariableRentOffset_CodeCurrencyTypeID | USD                     |
      | VariableRentOffset_Notes              | This is to create       |
    And I verify the following radio by label
      | name                  | value |
      | Calculated Adjustment | true  |
      | Fixed Adjustment      | false |
    And I click on the "Cancel" button


    Examples:
      | Item     | Secondary Tab | Third Level Tab | Entity Name     | Report Grid ID |
      | Contract | Payment Info  | Percentage Rent | Variable Offset | ^editBOGrid    |

  Scenario Outline: I update percentage variable Rent Offset and verify them in Contract> Payment Info> Percentage Rent page
    Given I Login to IWMS using "EditAccess" access credentials
    And I check previous user login "Edit Access Access" and continue if user "EditAccess" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following files:
      | UpdateVariableOffset-1191.xlsx |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I wait for the Loading text to disappear
    And I click "edit" row action in the non frame grid "BOGridVariableRentOffset" having the following header and cell values
      | name                | value                   |
      | Sales Group         | Internal Sales          |
      | Begin Date          | 01/01/2000              |
      | End Date            | 12/31/2015              |
      | Expense Group       | Expense                 |
      | Expense Type        | Interior                |
      | Offset Group        | Presentage Rent         |
      | Offset Type         | Common Area Maintanance |
      | Fixed Offset Amount |                         |
      | Cap Percent         | 25.00000%               |
      | Cap Amount          |                         |
    And I wait for "Edit Expense Offset  ***Required fields in red" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name                                  | value                   |
      | VariableRentOffset_CodeSalesGroupID   | Internal Sales          |
      | VariableRentOffset_BeginDate          | 01/01/2000              |
      | VariableRentOffset_EndDate            | 12/31/2015              |
      | VariableRentOffset_CodeExpenseGroupID | Expense                 |
      | VariableRentOffset_CodeOffsetGroupID  | Presentage Rent         |
      | VariableRentOffset_CapPercent         | 25.00000%               |
      | VariableRentOffset_CodeExpenseTypeID  | Interior                |
      | VariableRentOffset_CodeOffsetTypeID   | Common Area Maintanance |
      | VariableRentOffset_CapAmount          |                         |
      | VariableRentOffset_CodeCurrencyTypeID | USD                     |
      | VariableRentOffset_Notes              | This is to update       |
    And I verify the following radio by label
      | name                  | value |
      | Calculated Adjustment | true  |
      | Fixed Adjustment      | false |
    And I click on the "Cancel" button

    And I verify the following values in frame grid "BOGridVariableRentOffset"
      | Sales Group    | Begin Date | End Date   | Expense Group | Expense Type | Offset Group    | Offset Type             | Fixed Offset Amount | Cap Percent | Cap Amount |
      | Internal Sales | 01/01/2000 | 12/31/2015 | Expense       | Interior     | Presentage Rent | Common Area Maintanance |                     | 25.00000%   |            |
      | Internal Sales | 01/01/2000 | 12/31/2015 | Expense       | Interior     | Presentage Rent | Ceiling                 |                     | 25.00000%   |            |

    Examples:
      | Item     | Secondary Tab | Third Level Tab | Entity Name     |
      | Contract | Payment Info  | Percentage Rent | Variable Offset |


#@all
#Feature: (Jira Ref- AUTOMATION-400)I create and update percentage variable Rent Offset and verify them in Contract> Payment Info> Percentage Rent page
#
#  Scenario Outline: I create percentage variable Rent Offset and verify them in Contract> Payment Info> Percentage Rent page
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent"
#    And I import following file name:
#      | Create_VariableRentOffset.xlsx |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Third Level Tab>" tab
#
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Create_VariableRentOffset.xlsx"
#    Then I verify in grid "BOGridVariableRentOffset" in row "1" by reading data from spread sheet row "6"
#      | name          | value                                 |
#      | Expense Group | VariableRentOffset.CodeExpenseGroupID |
#      | Sales Group   | VariableRentOffset.CodeSalesGroupID   |
#      | Expense Type  | VariableRentOffset.CodeExpenseTypeID  |
#      | Cap Amount    | VariableRentOffset.CapAmount          |
#      | Offset Group  | VariableRentOffset.CodeOffsetGroupID  |
#      | Offset Type   | VariableRentOffset.CodeOffsetTypeID   |
#    Then I verify date values in grid "BOGridVariableRentOffset" in row "1" by reading data from spread sheet row "6"
#      | name       | value                        |
#      | Begin Date | VariableRentOffset.BeginDate |
#      | End Date   | VariableRentOffset.EndDate   |
#    And I logout
#
#  Examples:
#    | Item     | Secondary Tab | Third Level Tab | Entity Name       |
#    | Contract | Payment Info  | Percentage Rent | Selenium-Contract |
#
#  Scenario Outline: I update percentage variable Rent Offset and verify them in Contract> Payment Info> Percentage Rent page
#    Given I Login to IWMS using "EditAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
#    And I import following file name:
#      | Update_VariableRentOffset.xlsx |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Update_VariableRentOffset.xlsx"
#    Then I verify in grid "BOGridVariableRentOffset" in row "2" by reading data from spread sheet row "6"
#      | name          | value                                 |
#      | Expense Group | VariableRentOffset.CodeExpenseGroupID |
#      | Sales Group   | VariableRentOffset.CodeSalesGroupID   |
#      | Expense Type  | VariableRentOffset.CodeExpenseTypeID  |
#      | Cap Amount    | VariableRentOffset.CapAmount          |
#      | Offset Group  | VariableRentOffset.CodeOffsetGroupID  |
#      | Offset Type   | VariableRentOffset.CodeOffsetTypeID   |
#    Then I verify date values in grid "BOGridVariableRentOffset" in row "2" by reading data from spread sheet row "6"
#      | name       | value                        |
#      | Begin Date | VariableRentOffset.BeginDate |
#      | End Date   | VariableRentOffset.EndDate   |
#    And I logout
#
#  Examples:
#    | Item     | Secondary Tab | Third Level Tab | Entity Name       |
#    | Contract | Payment Info  | Percentage Rent | Selenium-Contract |
