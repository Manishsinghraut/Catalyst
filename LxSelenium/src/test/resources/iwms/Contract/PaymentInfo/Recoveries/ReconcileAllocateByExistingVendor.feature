Feature: Reconcile-Allocate by Existing Vendor (Jira Ref : AUTOMATION-726)

  Scenario Outline: I import file for Recoveries Reconcile Contract entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/"
    And I import following file name:
      | Recoveries_ReconcileContract_726.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I Reconcile-Allocate by Existing Vendor
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I see the Dashboard
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
#    And I navigate to second level "<Second Level Tab>" and third level "<Third Level Tab>" tabs
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "CAM" under column header "Recovery Group"
    And I click on the "Reconcile" action panel button
    And I verify the populated field values in the Reconcile Pop-up
      | value                                     |
      | CAM                                       |
      | Lease                                     |
      | 01/01/2014                                |
      | $71,055.00                                |
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
      |                  |            |
    And I check the send email check box
#    And I verify the following message "This recovery record was already reconciled."
    And I click on the "OK"
    And I click on the "Yes" button in "Please confirm" message box
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear
    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "12/31/2014" under column header "Effective Date"
      | name             | value             |
      | Group            | Lease             |
      | Type             | CAM               |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | $71,055.00        |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |
    And I switch to default frame
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I verify the following fields value on editable page
      | name                                     | value |
      | _checkbox_ExpenseRecovery_ReconciledFlag | true  |

  Examples:
    | Entity Name                       | Second Level Tab | Third Level Tab | Grid title                     | Grid ID |
    | Recoveries_Reconcile Contract-726 | Payment Info     | Recoveries      | Contract Expense Recovery List | thisDiv |
