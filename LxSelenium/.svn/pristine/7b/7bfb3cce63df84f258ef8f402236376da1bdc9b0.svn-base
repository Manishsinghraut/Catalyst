@all @smoke @smoke5Dot111
Feature: (JIRA Ref: AUTOMATION-346) As an admin I should be able to create Contract Wizard

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: when I navigate to Tools page I can add new Items from the set up wizard
    When I navigate to "Tools,Setup Wizards"
    Then I see the "Setup Wizard" modal window
    And I delete incomplete setup wizard if exist
    And I select "<Item>" from the list
    And I select "<Portfolio>" from the Program List
    Then I click on the "Next" button
    And I see the "<Grid Header>" modal window
    And I set these field values on editable page
      | name                            | value                    |
      | Contract_ClientEntityID         | 7777                     |
      | Contract_CodeContractStatusID   | Active                   |
      | Contract_ContractName           | <Name>                   |
      | Contract_LocationID             | <Location>               |
      | Contract_MasterContractID       | <Contract>               |
      | Contract_ParcelID               | <Parcel>                 |
      | Contract_FacilityID             | <Facility>               |
      | Contract_CodeContractGroupID    | Store                    |
      | Contract_CodeContractTypeID     | Mall Based               |
      | Contract_CodeContractCategoryID | Retail Lease             |
      | Contract_Notes                  | Selenium webdriver Notes |
      | Contract_CommenceDate           | 07/27/2015               |
      | Contract_ExpireDate             | 07/27/2016               |
      | Contract_PossessionBeginDate    | 08/27/2015               |
      | Contract_ExecuteDate            | 08/27/2015               |
      | Contract_PaymentsBeginDate      | 08/27/2015               |
      | Contract_PaymentsEndDate        | 08/27/2016               |
      | Contract_RentableArea           | 2000                     |
      | Contract_CodeBuildingAreaUnitID | Square Feet              |
      | Contract_CodeContractUseID      | Retail                   |
    And I click on the "Next" button
    #    Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
    And I set these field values on editable page
      | name                                         | value       |
      | ContractTerm_ContractTermWizard_OptionNumber | 2           |
      | ContractTerm_CodeTermTypeID                  | Original    |
      | ContractTerm_ContractTermWizard_TermLength   | 2           |
      | NoticePeriod                                 | 30          |
      | KeyDate_CodeNoticePeriodUnitID               | Days        |
      | Contract_RentableArea                        | 1000        |
      | Contract_CodeBuildingAreaUnitID              | Square Feet |
#    And I click on "Submit" button
#      | locator | element |
#      | name    | submit  |
    And I click on "submit" Button
#    And I see the message on the page
#      | locator | element                  | value                            |
#      | xpath   | //span[@class='frmNote'] | Successfully added Contract Term |
    And I see "Successfully added Expense Setup" message in the grid
    And I click on the "Next" button
    #    Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
    And I click on the "Add Covenant..." button
    And I set following fields value on editable page
      | name                                    | value       |
      | Covenant_CodeCovenantGroupID            | Lease       |
      | Covenant_CodeCovenantTypeID             | Notices     |
      | Covenant_CodeCovenantStatusID           | Review      |
      | _checkbox_Covenant_StandardLanguageFlag | true        |
      | Covenant_StandardLanguageVersion        | 1           |
      | Covenant_CodeBuildingAreaUnitID         | Square Feet |
#    And I click on "Add" button
#      | locator | element                |
#      | xpath   | //span[./text()='Add'] |
    And I click "Add" button
    And I click on the "Next" button
    And I click on the "Add Responsibility..." button
    And I set following fields value on editable page
      | name                                           | value        |
      | Responsibility_CodeResponsibilityGroupID       | Electrical   |
      | Responsibility_CodeResponsibilityTypeID        | Electrical   |
      | Responsibility_CodeAssetCategoryID             | Electrical   |
      | Responsibility_CodeMaintenanceResponsibilityID | Landlord     |
      | Responsibility_CodeExecutionResponsibilityID   | Landlord     |
      | Responsibility_CodeFinancialResponsibilityID   | Landlord     |
      | Responsibility_CodePassThroughTypeID           | Pass Through |
      #      | type   | cssselector | input[name^=Responsibility_CapAmount]                       | 2000 |
      | Responsibility_CapPercent                      | 2            |
      | Responsibility_ServiceLevel                    | 2            |
      | Responsibility_CodeResponseTimeID              | 1 Week       |
      | Responsibility_EffectiveDate                   | 05/27/2015   |
#    And I click on "Add" button
#      | locator | element                |
#      | xpath   | //span[./text()='Add'] |
    And I click "Add" button
    # Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
    And I click on the "Next" button
    And I set following fields value on editable page
      | name                                               | value             |
      | ExpenseSetup_CodeExpenseGroupID                    | Rent              |
      | ExpenseSetup_CodeExpenseTypeID                     | Base Rent         |
      | ExpenseSetup_CodeExpenseCategoryID                 | Rent              |
      | ExpenseSetup_VendorID                              | Selenium-Employer |
      | ExpenseSetup_ExpenseSetupWizard_StartingAmout      | 2000              |
      | ExpenseSetup_ExpenseSetupWizard_TypeOfEscalation   | Percent           |
      | ExpenseSetup_CodeFrequencyID                       | Monthly           |
      | ExpenseSetup_CodeCurrencyTypeID                    | USD               |
      | ExpenseSetup_ExpenseSetupWizard_EscalateAmountRate | 2000              |
#    And I click on "Submit" button
#      | locator | element |
#      | name    | submit  |
    And I click on "submit" Button
#    And I see the message on the page
#      | locator | element                  | value                            |
#      | xpath   | //span[@class='frmNote'] | Successfully added Expense Setup |
    And I see "Successfully added Expense Setup" message in the grid
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Folder Set-up" modal window
    And I select an option "Selenium Folder Template" from the "Folder Template" list
      | locator | element          |
      | name    | entityTemplateID |
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Upload Lease document" modal window
    And I set following fields value on editable page
      | name     | value                   |
      | folderID | SeleniumTestRootFolder1 |
    And I click on the "Next" button
    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
    And I click on Assign Members button
    And I add following members
      | Tester, Selenium |
    And I click on "Update  members to <Name>" Button
    And I click on the "Finish Assigning Members" button
    Then I see the "<Setup Wizard> -> <Name> -> Assign Members" modal window
    And I click on the "Finish" button
    And I navigate to link "Summary"
    And I verify the summary fields value on non-editable contract summary tab
      | name                | value             |
      | Contract ID         | 7777              |
      | Status              | Active            |
      | Group               | Store             |
      | Type                | Mall Based        |
      | Contract Name       | <Name>            |
      | Category            | Retail Lease      |
      | Commencement Date   | 07/27/2015        |
      | Expiration Date     | 07/27/2016        |
      | Possession Begin    | 08/27/2015        |
      | Execution Date      | 08/27/2015        |
      | Possession End Date | 08/27/2015        |
      | Payments End Date   | 08/27/2016        |
      | Rentable Area       | 2000              |
      | Area Unit           | Square Feet       |
      | Primary Use         | Retail            |
      | Master Contract     | Selenium-Contract |
    And I verify the location fields value on non-editable contract summary tab
      | name        | value      |
      | Location ID | <Location> |
    And I verify the parcel fields value on non-editable contract summary tab
      | name      | value    |
      | Parcel ID | <Parcel> |
    And I verify the facility fields value on non-editable contract summary tab
      | name        | value      |
      | Facility ID | <Facility> |
    And I verify the notes fields value on non-editable contract summary tab
      | name  | value                    |
      | Notes | Selenium webdriver Notes |
    And I click on the "Members/Contacts" tab
    And I verify the Members/Contacts tab
      | type        | name            |
      | Team Member | Selenium Tester |
    And I click on the "Documents" tab
    And I verify the list of folders Document
      | SeleniumTestRootFolder1 |
    #    And I navigate to link "Facility, Schedule"
    #    And I verify the scheduler already applied
    #      | Pre-Contruction |
    Examples:
      | Item     | Grid Header           | Portfolio         | Name                        | Setup Wizard          | Location | Contract          | Parcel          | Facility          |
      | Contract | Contract Setup Wizard | Lucernex-Selenium | Selenium Webdriver Contract | Contract Setup Wizard | 000056   | Selenium-Contract | Lucernex-Parcel | Lucernex-Facility |
