@all
Feature: Generate the payments without selecting Vendor (Ref : Jira Ticket No : AUTOMATION-937)

  Scenario Outline: I import following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Parcel/PropertyTax/"
    And I import following file name:
      | 9818Location.xml            |
      | PT-008.xml                  |
      | PTWithoutVendorVontract.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Generate the payments without selecting Vendor
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Property Taxes"
    And I switch to visible frame
    And I click on the "edit" row action of column "01/01/2015" of column "0" from grid "BOGridPropertyTaxAssessment"
    And I switch to default frame
    And I verify the "Edit Property Tax Assessment" popup window title
    And I click on "edit" link
    And I verify the "Edit Property Tax Bill" popup window title
    And I click on the "Generate Payment" button "from Edit property Tax Bill pop window"
    And I verify the "Tax Payments" popup window title
    And I set following fields value on editable page
      | name                                   | value      |
      | PropertyTaxBill_TransactionPostingDate | 01/23/2015 |
      | EffectiveDate1                         | 01/23/2015 |
      | DueDate1                               | 01/23/2015 |
      | PaymentAmount1                         | 200        |
      | RemitMessage1                          | Payment    |
    And I click on the "Process" button "from Edit Tax payments pop window"
    And I verify the following message "Vendor allocation is not found for a given Expense Group/Expense Type. Please select a vendor."

  Examples:
    | Login User   | Login full username  | Entity Name |
    | DeleteAccess | Delete Access Access | PT-008      |