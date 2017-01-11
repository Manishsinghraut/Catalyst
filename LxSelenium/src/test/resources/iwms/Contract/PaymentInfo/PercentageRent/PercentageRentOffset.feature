@all
Feature: Verify Percentage Rent offset fixed adjustment and calculated adjustment

  Scenario: Import contract xml data file from import data folder with no error
#     Given I login to IWMS using LxAdmin credentials
    Given I Login to IWMS using "DeleteAccess" access credentials
      And I navigate to import page
     When I used data files from "Data/ImportDataFiles/"
      And I import following file name:
      | 32 PercentageRentOffset.xml                  |

  Scenario: Navigation to Contract/Payment Info/Percentage Rent and verify info on first Offset line
#    When I navigate to entity type "Contract" named "Annual (PRPOffset7)"
    When I navigate to "Contract, Payment Info"
    And I click on the "Percentage Rent" tab
    Then I see that I am on the "Contract" entity tab
    And I see that I am on the second level tab "Payment Info"
    And I see that I am on the third level tab "Percentage Rent"
    When I edit the "First" row in "BOGridVariableRentOffset" grid
   Then I see "CalculatedAdjustment" radio button checked
    Then I verify these field values on editable page
      |name                                                   |value               |
      |VariableRentOffset_CodeSalesGroupID                    |Sales               |
      |VariableRentOffset_BeginDate                           |02/01/2011          |
      |VariableRentOffset_EndDate                             |01/31/2013          |
      |VariableRentOffset_CodeExpenseGroupID                  |Expense             |
      |VariableRentOffset_CodeExpenseTypeID                   |Trash               |
      |VariableRentOffset_CapPercent                          |10.00000%          |
    Then I see "CalculatedAdjustment" radio button checked
     And I click on the "Cancel" button

  Scenario: Click on second offset line and verify information
    When I edit the "Second" row in "BOGridVariableRentOffset" grid
    Then I see "CalculatedAdjustment" radio button checked
    Then I verify these field values on editable page
      |name                                     |value               |
      |VariableRentOffset_CodeSalesGroupID      |Sales               |
      |VariableRentOffset_BeginDate             |02/01/2011          |
      |VariableRentOffset_EndDate               |01/31/2013          |
      |VariableRentOffset_CodeExpenseGroupID    |Expense             |
      |VariableRentOffset_CodeExpenseTypeID     |Trash               |
      |VariableRentOffset_CapAmount             |$150.00             |
    And I click on the "Cancel" button

  Scenario: Click on third offset line and verify information
    When I edit the "Third" row in "BOGridVariableRentOffset" grid
    Then I see "FixedAdjustment" radio button checked
    Then I verify these field values on editable page
      |name                                     |value               |
      |VariableRentOffset_CodeSalesGroupID      |Sales               |
      |VariableRentOffset_BeginDate             |02/01/2011          |
      |VariableRentOffset_EndDate               |01/31/2013          |
      |VariableRentOffset_FixedOffsetAmount     |$190.00             |
    And I click on the "Cancel" button