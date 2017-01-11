@all @smoke1Dot1
Feature: Property Tax - Generate Recovery (Ref : Jira Ticket No : AUTOMATION-936)

  Scenario Outline: I import following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Parcel/PropertyTax/"
    And I import following file name:
      | GR-001-Location.xml |
      | PTForGR.xml         |
      | PTForGRContract.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Property Tax - Generate Recovery
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "PT for GR contract" that was created
    And Click on the name of the "PT for GR contract" in the results pop-up
    Then I see "PT for GR contract" name on the header
    And I verify following pair of values on non editable page
      | name              | value      |
      | Payments Begin    | 01/01/2000 |
      | Payments End Date | 12/31/2020 |
    And I switch to default frame
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Property Taxes"
    And I verify a row from grid "thisDiv" having unique value "Resale tax" under column header "Property Tax Type"
      | name               | value      |
      | Property Tax Type  | Resale tax |
      | Description        | Resale tax |
      | Tax Authority      |            |
      | Tax Account Number |            |
    And I verify the following fields value on editable page
      | name                                  | value    |
      | PropertyTaxSummary_CodeExpenseGroupID | CAM      |
      | PropertyTaxSummary                    | CAM      |
      | PropertyTaxSummary_CodeExpenseTypeID  | Interior |
      | PropertyTaxSummary_CodeRecoveryTypeID | Interior |
    And I click on the "edit" row action of column "01/01/2015" of column "0" from grid "BOGridPropertyTaxAssessment"
    And I switch to default frame
    And I verify the "Edit Property Tax Assessment" popup window title
    And I click on "edit" link
    And I verify the "Edit Property Tax Bill" popup window title
    And I click on the "Generate Recovery" button "from Edit property Tax Bill pop window"
    And I verify the "Tax Recovery" popup window title
    And I verify the following fields value on editable page
      | name                              | value      |
      | PropertyTaxBill_RecoveryBeginDate | 01/01/2000 |
      | ropertyTaxBill_RecoveryEndDate    | 12/31/2020 |
    And I click on the "Process" button "from Edit Tax payments pop window"
    And I verify the following message "Expense Recovery Summary was successfully created"
    And I verify the following message "Expense Recovery Item was successfully created for amount $200.00"
    And I click on "Click here to view recovery" link

    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
      | name            | value      |
      | Recovery Type   | Interior   |
      | Begin Date      | 01/01/2000 |
      | End Date        | 01/01/2000 |
      | Recovery Period |            |
      | Reported Amount | $100.00    |
      | Percent Change  | 0.0000%    |
      | Approved Amount | $100.00    |
      | Pre-Paid Amount |            |
      | Amount Due      | $100.00    |

  Examples:
    | Login User   | Login full username  | Entity Name |
    | DeleteAccess | Delete Access Access | PT for GR   |