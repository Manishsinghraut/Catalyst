@all
Feature: (Ref : Jira Ticket No : Automation-1477), Testing -10089...Contd..Drop downs should save empty value correctly

  Scenario Outline: I import files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PaymentDetails/"
    And I import following files:
      | PortfolioAndLocation-1477.xml |
      | Contract-1477.xml             |


    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I select option processed flag
    Given I navigate to entity type "Contracts" named "<Contract Name>" through search option
    And I navigate to second level tab "Payment Info" and third level "Payment Details" tab of entity "Contract"
    And I click on the "Edit" action panel button
    And I verify the following values in frame grid "BOGridExpenseSetup"
      | Expense Group | Expense Type | Expense Category | Begin Date | End Date | Frequency | Period Amount | Annual Amount | Tax #1 | Tax #2 | Tax #3 |
      | Base Rent     | Base Rent    | Expense          |            |          | Monthly   |               |               |        |        |        |
      | Rent          | Base Rent    | Rent             |            |          | Monthly   |               |               |        |        |        |

    And I click "edit" row action in the non frame grid "BOGridExpenseSetup" having the following header and cell values
      | name          | value |
      | Expense Group | Rent  |
    And I wait for "Edit Expense Setup  ***Required fields in red" modal window to open in non frame page
    And I verify the following fields value on editable page
      | name                           | value     |
      | ExpenseSetup_CodeExpenseTypeID | Base Rent |
    And I set following fields value on editable page
      | name                           | value    |
      | ExpenseSetup_CodeExpenseTypeID | [SELECT] |
    And I click on the "Update" button
    And I wait for modal window to close
    And I verify the following values in frame grid "BOGridExpenseSetup"
      | Expense Group | Expense Type | Expense Category | Begin Date | End Date | Frequency | Period Amount | Annual Amount | Tax #1 | Tax #2 | Tax #3 |
      | Base Rent     | Base Rent    | Expense          |            |          | Monthly   |               |               |        |        |        |
      | Rent          |              | Rent             |            |          | Monthly   |               |               |        |        |        |

    And I click "edit" row action in the non frame grid "BOGridExpenseSetup" having the following header and cell values
      | name          | value |
      | Expense Group | Rent  |
    And I wait for "Edit Expense Setup  ***Required fields in red" modal window to open in non frame page
    And I set following fields value on editable page
      | name                         | value             |
      | ExpenseSetup_Description     | Expense Setup 2.1 |
      | ExpenseSetup_CodeFrequencyID | Annually          |
    And I click on the "Update" button
    And I wait for modal window to close

    And I verify the following values in frame grid "BOGridExpenseSetup"
      | Expense Group | Expense Type | Expense Category | Begin Date | End Date | Frequency | Period Amount | Annual Amount | Tax #1 | Tax #2 | Tax #3 |
      | Base Rent     | Base Rent    | Expense          |            |          | Monthly   |               |               |        |        |        |
      | Rent          |              | Rent             |            |          | Annually  |               |               |        |        |        |
    And I click on the "View" action panel button
    And I click "view" row action in the frame grid "BOGridExpenseSetup" having the following header and cell values
      | name          | value |
      | Expense Group | Rent  |
    And I wait for "View Expense Setup  ***Required fields in red" modal window to open in non frame page
    And I verify the field "Description" is " Expense Setup 2.1" in a same row in "View Expense Setup"
    And I verify the field "Frequency" is " Annually" in a same row in "View Expense Setup"
    And I click on the "Close" button


    Examples:
      | Contract Name   |
      | DropDownTesting |