@all
Feature: (Jira Ref. AUTOMATION-1406) Attaching document to the Facility Expense Page

  Scenario Outline: I import file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Facility/FacilityExpense/"
    And I import following file name:
      | 00018_PortfolioAndLocation-1406.xml |
    And I import following files:
      | DocumentFacility-15291-1406.xml |
      | Documents-15291-1406.zip        |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Attaching document to the Facility Expense Page
    When I navigate to entity type "Facilities" named "<Entity Name>" through search option
    And I navigate to "Facility Expense"
    And I click on the "Facility Expense" tab
    Then I verify the following values in frame grid "<Grid ID>"
      | Expense Group | Expense Type | Effective Date | Planned Amount | Revised Amount | Actual Amount | Budgeted Amount | Notes                                                                                                                                                                              |
      | CAM           | Interior     | 10/04/2016     | $10,000.00     | $8,000.00      | $9,000.00     | $8,000.00       | Depreciation and use allowances, interest on debt associated with certain buildings, equipment and capital improvements, operation and maintenance expenses, and library expenses. |
    And I verify the following fields value on editable page
      | name                               | value                                                                                                                                                                              |
      | FacilityExpense_EffectiveDate      | 10/04/2016                                                                                                                                                                         |
      | FacilityExpense_CodeExpenseGroupID | CAM                                                                                                                                                                                |
      | FacilityExpense_CodeExpenseTypeID  | Interior                                                                                                                                                                           |
      | FacilityExpense_Description        | For fiscal year 2016                                                                                                                                                               |
      | FacilityExpense_PlannedAmount      | $10,000.00                                                                                                                                                                         |
      | FacilityExpense_BudgetedAmount     | $8,000.00                                                                                                                                                                          |
      | FacilityExpense_RevisedAmount      | $8,000.00                                                                                                                                                                          |
      | FacilityExpense_ActualAmount       | $9,000.00                                                                                                                                                                          |
      | FacilityExpense_Notes              | Depreciation and use allowances, interest on debt associated with certain buildings, equipment and capital improvements, operation and maintenance expenses, and library expenses. |
    And I click on folder icon
    And I click on the "a(1)" link
    And I click on the "FE.pdf" link
    And I click on the "Save Changes" action panel button
    Then I verify success message "Successfully updated Facility Expense"
    And I verify the following fields value on editable page
      | name     | value  |
      | BaseName | FE.pdf |
    And I click on magnify icon
    Then I switch to default frame
    And I wait for modal window to open
    And I click on magnify download icon
    Then I verify file name "FE(Version=1)" of type ".pdf" downloaded successfully
    And I click on download icon
    Then I verify file name "FE(Version=1)(1)" of type ".pdf" downloaded successfully

    Examples:
      | Grid ID | Entity Name            |
      | thisDiv | DocumentFacility-15291 |