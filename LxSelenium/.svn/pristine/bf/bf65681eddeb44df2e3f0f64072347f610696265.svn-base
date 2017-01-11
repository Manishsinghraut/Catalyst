Feature: Reconcile-Selecting a different Vendor and Catch up payment (Jira Ref : AUTOMATION-740)

  Scenario Outline: I import file for Recoveries_Different Vendor and catch up payment entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/Net/"
    And I import following file name:
      | VendorImport_740.xml                           |
      | RecoveriesDifferentVendorAndCatchUpPayment.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I Reconcile-Selecting a different Vendor and Catch up payment
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I see the Dashboard
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select an option "Contract Expense Recovery (Net)"
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "CAM" under column header "Recovery Group"
    And I click on the "Reconcile" action panel button
    And I verify the populated field values in the Reconcile Pop-up
      | value                                     |
      | CAM                                       |
      | Lease                                     |
      | 01/01/2014                                |
      | $43,600.00                                |
      | Interior                                  |
      | CAM                                       |
      | 12/31/2014                                |
      | Selenium-Employer , Vendor # - 100.00000% |
    And I verify the following fields value on editable page
      | name               | value                             |
      | effectiveDate      | 12/31/2014                        |
#      | paymentDescription | 01/01/2014 - 12/31/2014 |
      | paymentDescription | 01/01/2014 - 12/31/2014, Interior |
    And I set following fields value on editable page
      | name             | value      |
      | invoiceNumber    | 1234       |
      | invoiceDate      | 09/18/2015 |
      | allocateByVendor | true       |
      | VendorID         | Vendor B   |
    And I check the send email check box
#    And I verify the following message "This recovery record was already reconciled."
    And I click on the "OK"
    And I click on the "Yes" button in "Please confirm" message box
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "2 Payment Transaction records were generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear
    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "$43,600.00" under column header "Total Amount"
      | name             | value      |
      | Effective Date   | 12/31/2014 |
      | Group            | Lease      |
      | Type             | CAM        |
      | Category         | Expense    |
      | Vendor           | Vendor B   |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | $43,600.00 |
      | Primary Tax      | $0.00      |
      | Hold Flag        | No         |
    And I verify a row from grid "thisDiv" having unique value "$1,000.00" under column header "Total Amount"
      | name             | value      |
      | Effective Date   | 12/31/2014 |
      | Group            | Lease      |
      | Type             | CAM        |
      | Category         | Expense    |
      | Vendor           | Vendor B   |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | $1,000.00  |
      | Primary Tax      | $0.00      |
      | Hold Flag        | No         |
    And I verify the following fields value on editable page
      | name                            | value                             |
#      | PaymentTransaction_Description  | 01/01/2014 - 12/31/2014 |
#      | PaymentTransaction_RemitMessage | 01/01/2014 - 12/31/2014 |
      | PaymentTransaction_Description  | 01/01/2014 - 12/31/2014, Interior |
      | PaymentTransaction_RemitMessage | 01/01/2014 - 12/31/2014, Interior |


    And I switch to default frame
    And I click on the "<Third Level Tab>" tab
    And I select an option "Contract Expense Recovery (Net)"
    Then I verify page title "<Grid title>" after navigation
    And I verify the following fields value on editable page
      | name                                     | value |
      | _checkbox_ExpenseRecovery_ReconciledFlag | true  |

  Examples:
    | Entity Name                                      | Second Level Tab | Third Level Tab | Grid title                           | Grid ID |
    | Recoveries_Different Vendor and catch up payment | Payment Info     | Recoveries      | Contract Expense Recovery (Net) List | thisDiv |
