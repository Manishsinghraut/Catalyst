@all
Feature: Test Decimal display for Foreing Currency on Contract Wizard Expense set up [JIRA Ref: AUTOMATION-1376]

  Scenario Outline: As a delete user I Navigate to  Admin Dashboard > Manage Company > Financial Settings > and select JOD as the 'Home Currency' and click 'Update'
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID | JOD   |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/"
    And I import following file name:
      | Sprint17PortfolioAndLocation_1376.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As Delete User, I Created Contract Summary page
    When I navigate to "Tools,Setup Wizards"
    Then I see the "Setup Wizard" modal window
    And I delete incomplete setup wizard if exist
    And I select "<Item>" from the list
    And I select "<Portfolio>" from the Program List
    Then I click on the "Next" button
#    And I see the "<Grid Header>" modal window

    And I set these field values on editable page
      | name                    | value          |
      | Contract_ClientEntityID | <ContractName> |
      | Contract_ContractName   | <ContractName> |
      |                         |                |
      | Contract_LocationID     | <Location>     |
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <ContractName> -> Folder Set-up" modal window
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <ContractName>" modal window
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <ContractName>" modal window
    And I click on the "Next" button

    And I click on the "Add Responsibility..." button
    And I set following fields value on editable page
      | name                                        | value |
      | Responsibility_CapAmount                    | 100   |
      | Responsibility_ContractResponsibilityAmount | 500   |
    And I click "Add" button
    Then I see the "<Setup Wizard> -> <ContractName>" modal window
    And I click on the "Next" button
    And I verify these field values on editable page
      | name                            | value |
      | ExpenseSetup_CodeCurrencyTypeID | JOD   |

    And I set following fields value on editable page
      | name                                          | value       |
      | ExpenseSetup_CodeExpenseGroupID               | CAM         |
      | ExpenseSetup_CodeExpenseTypeID                | CAM         |
      | ExpenseSetup_CodeExpenseCategoryID            | Expense     |
      | ExpenseSetup_CodeFrequencyID                  | Monthly     |
      | Contract_PaymentsBeginDate                    | 01/01/2010  |
      | Contract_PaymentsEndDate                      | 12/31/2020  |
      | Contract_CodeBuildingAreaUnitID               | Square Feet |
      | ExpenseSetup_ExpenseSetupWizard_StartingAmout | 1000        |
      |                                               |             |

    And I click on "Generate Expense Setup Records" Button
    And I see "Successfully added Expense Setup" message in the grid
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <ContractName> -> Assign Members" modal window
    And I click on the "Finish" button

  Examples:
    | Item     | Portfolio           | ContractName  | Setup Wizard             | Location           |
    | Contract | Portfolio Sprint 17 | TESTING-13623 | RE Contract Setup Wizard | Location Sprint 17 |


  Scenario Outline: As a delete user I Navigate to "CurrencyContract-13622" and verify the currency type
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify the field "Annual Total Amount" is "$12,000.000"
    And I verify the field "Aggregate Total Amount" is "$0.000"
    And I verify the field "Monthly Total Rent" is "$1,000.000"
    And I verify the field "Aggregate Base Rent" is "$0.000"
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name   | Third Level Tab |
    | DeleteAccess | Delete Access Access | TESTING-13623 | Summary         |

