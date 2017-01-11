@all
Feature: (Jira Ref- AUTOMATION-400)I create and update percentage variable Rent Offset and verify them in Contract> Payment Info> Percentage Rent page

  Scenario Outline: I create percentage variable Rent Offset and verify them in Contract> Payment Info> Percentage Rent page
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent"
    And I import following file name:
      | Create_VariableRentOffset.xlsx |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab

    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Create_VariableRentOffset.xlsx"
    Then I verify in grid "BOGridVariableRentOffset" in row "1" by reading data from spread sheet row "6"
      | name          | value                                 |
      | Expense Group | VariableRentOffset.CodeExpenseGroupID |
      | Sales Group   | VariableRentOffset.CodeSalesGroupID   |
      | Expense Type  | VariableRentOffset.CodeExpenseTypeID  |
      | Cap Amount    | VariableRentOffset.CapAmount          |
      | Offset Group  | VariableRentOffset.CodeOffsetGroupID  |
      | Offset Type   | VariableRentOffset.CodeOffsetTypeID   |
    Then I verify date values in grid "BOGridVariableRentOffset" in row "1" by reading data from spread sheet row "6"
      | name       | value                        |
      | Begin Date | VariableRentOffset.BeginDate |
      | End Date   | VariableRentOffset.EndDate   |
    And I logout

  Examples:
    | Item     | Secondary Tab | Third Level Tab | Entity Name       |
    | Contract | Payment Info  | Percentage Rent | Selenium-Contract |

  Scenario Outline: I update percentage variable Rent Offset and verify them in Contract> Payment Info> Percentage Rent page
    Given I Login to IWMS using "EditAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
      | Update_VariableRentOffset.xlsx |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Update_VariableRentOffset.xlsx"
    Then I verify in grid "BOGridVariableRentOffset" in row "2" by reading data from spread sheet row "6"
      | name          | value                                 |
      | Expense Group | VariableRentOffset.CodeExpenseGroupID |
      | Sales Group   | VariableRentOffset.CodeSalesGroupID   |
      | Expense Type  | VariableRentOffset.CodeExpenseTypeID  |
      | Cap Amount    | VariableRentOffset.CapAmount          |
      | Offset Group  | VariableRentOffset.CodeOffsetGroupID  |
      | Offset Type   | VariableRentOffset.CodeOffsetTypeID   |
    Then I verify date values in grid "BOGridVariableRentOffset" in row "2" by reading data from spread sheet row "6"
      | name       | value                        |
      | Begin Date | VariableRentOffset.BeginDate |
      | End Date   | VariableRentOffset.EndDate   |
    And I logout

  Examples:
    | Item     | Secondary Tab | Third Level Tab | Entity Name       |
    | Contract | Payment Info  | Percentage Rent | Selenium-Contract |
