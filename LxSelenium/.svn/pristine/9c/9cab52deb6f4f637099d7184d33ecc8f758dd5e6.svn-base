@all @smoke1Dot1
Feature: Property Tax - Generate Payment (Ref : Jira Ticket No : AUTOMATION-935)

  Scenario Outline: I import following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Parcel/PropertyTax/"
    And I import following file name:
      | PTLocation.xml |
      | PT001.xml      |
      | PTContract.xml |
      | VendorA.xlsx   |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Generate Payment and Process it
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Property Taxes"
    And I switch to visible frame
    And I click on the "edit" row action of column "03/31/2015" of column "0" from grid "BOGridPropertyTaxAssessment"
    And I switch to default frame
    And I verify the "Edit Property Tax Assessment" popup window title
    And I click on "edit" link
    And I verify the "Edit Property Tax Bill" popup window title
    And I click on the "Generate Payment" button "from Edit property Tax Bill pop window"
    And I verify the "Tax Payments" popup window title
    And I set following fields value on editable page
      | name                                   | value      |
      | PropertyTaxBill_TransactionPostingDate | 01/23/2015 |
      | VendorID                               | Vendor A   |
      | EffectiveDate1                         | 01/23/2015 |
      | DueDate1                               | 01/23/2015 |
      | PaymentAmount1                         | 2000       |
      | RemitMessage1                          | Payment    |
    And I click on the "Process" button "from Edit Tax payments pop window"
    And I verify the following message "Tax Payment for amount $2,000.00 was successfully created."
    And I click on "Click here to view payment" link
    And I verify a row from grid "thisDiv" having unique value "Lease Expense" under column header "Group"
      | name             | value         |
      | Effective Date   | 01/23/2015    |
      | Group            | Lease Expense |
      | Type             | Fixed Amount  |
      | Category         |               |
      | Vendor           | Vendor A      |
      | Vendor#          |               |
      | One-Time Expense | Yes           |
      | Total Amount     | $2,000.00     |
      | Primary Tax      |               |
      | Hold Flag        | No            |
    And I verify the following fields value on editable page
      | name                             | value     |
      | PaymentTransaction_InvoiceAmount | $2,000.00 |
      | PaymentTransaction_RemitMessage  | Payment   |

  Examples:
    | Login User   | Login full username  | Entity Name |
    | DeleteAccess | Delete Access Access | PT-001      |