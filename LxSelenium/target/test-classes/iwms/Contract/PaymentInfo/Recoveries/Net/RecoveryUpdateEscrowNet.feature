@all
Feature:Net Page Recoveries-Update Escrow (Ref : Jira Ticket No : Automation-746)
  # Received Email verification is pending in this ticket

  Scenario Outline: As a delete user I Import the NET_Recoveries_Escrow Contract entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Recoveries/Net/"
    And I import following file name:
      | NET_Recoveries Contract_Escrow.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Ensure that the Recovery line item exist for 2014
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I see the Dashboard
    When I Search for the "<Entity Name>" that was created
    Then Click on the name of the "<Entity Name>" in the results pop-up
    And I see "<Entity Name>" name on the header
    And I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "Contract Expense Recovery (Net)" from Page dropdown
    Then I verify page title "<Grid title>" after navigation
    And I verify row from grid "gridPanel" having unique value "CAM"
      | name            | value       |
      | Recovery Group  | CAM         |
      | Recovery Type   | Interior    |
      | Begin Date      | 01/01/2014  |
      | End Date        | 12/31/2014  |
      | Recovery Period |             |
      | Reported Amount | $142,000.00 |
      | Variance %      | 0.00%       |
      | Approved Amount | $170,250.00 |
      | Pre-Paid Amount | $6,000.00   |
      | Net Amount Due  | $164,250.00 |

    And I verify the following fields value on editable page
      | name                                 | value     |
      | ExpenseRecovery_NewEscalationPayment | $3,000.00 |
    And I click row from grid "<Grid ID>" having unique value "Interior" under column header "Recovery Type"
    And I Scroll down and click on the Grouped Expenses	-Reported Net
    And I switch to default frame
#    And I click on the "edit" row action of column "Landscape" of column "1" from grid "BOGridExpenseRecoveryItem"
#    And I click on the "edit" row action of column "Landscape" of column "1" from grid "BOGridExpenseRecoveryItem"
    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Type" and cell value "Landscape"
      | name   | value  |
      | Status | Review |
    And I click on the "Close" button
#    And I click on the "edit" row action of column "Parking Lot Maintenance" of column "1" from grid "BOGridExpenseRecoveryItem"
#    And I click on the "edit" row action of column "Parking Lot Maintenance" of column "1" from grid "BOGridExpenseRecoveryItem"

    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Type" and cell value "Parking Lot Maintenance"
      | name   | value  |
      | Status | Review |
    And I click on the "Close" button
#    And I click on the "edit" row action of column "Cleaning" of column "1" from grid "BOGridExpenseRecoveryItem"
#    And I click on the "edit" row action of column "Cleaning" of column "1" from grid "BOGridExpenseRecoveryItem"
    And I click on "edit" row action in the grid "BOGridExpenseRecoveryItem" having the following header "Recovery Item Type" and cell value "Cleaning"
      | name   | value  |
      | Status | Review |
    And I click on the "Close" button
    And I click on the "Finish" button "on Controllable Expenses pop-up"
    Then I verify page title "<Grid title>" after navigation
    And I click on the "Update Escrow" action panel button
    And I see the "Update Escrow" modal window
    Then I set fields values on editable page
      | name         | value |
      | yrToGenerate | 2014  |

    Then I set following list fields values on editable page
      | name         | value     |
      | mnToGenerate | September |
    And I click "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "No Payment Transaction Records generated." message appear after generating rent
    And I verify "1 Escrow record was updated." message appear after generating rent
    And I click "OK" button

    And I click on the "Recurring Expenses" tab
    And I verify row from grid "BOGridExpenseSchedule" having unique value "01/01/2000"
      | name            | value      |
      | Begin Date      | 01/01/2000 |
      | End Date        | 08/31/2014 |
      | Approval Status | Review     |
      | Payment Amount  | $2,000.00  |
      | Annual Amount   | $2,000.00  |
      | Rate            |            |
      | First Payment   | $2,000.00  |
      | Last Payment    | $2,000.00  |
      | Notes           |            |
    And I verify row from grid "BOGridExpenseSchedule" having unique value "09/01/2014"
      | name            | value      |
      | Begin Date      | 09/01/2014 |
      | End Date        | 12/31/2020 |
      | Approval Status | Review     |
      | Payment Amount  | $3,000.00  |
      | Annual Amount   | $36,000.00 |
      | Rate            |            |
      | First Payment   | $3,000.00  |
      | Last Payment    | $3,000.00  |
      | Notes           |            |
    And I click on the "<Third Level Tab>" tab
    And I select "Contract Expense Recovery (Net)" from Page dropdown
    And I click row from grid "thisDiv" having unique value "CAM" under column header "Recovery Group"
    And I verify the following fields value on editable page
      | name                                     | value |
      | _checkbox_ExpenseRecovery_ReconciledFlag | true  |
    And I set following fields value on editable page
      | name                                     | value |
      | _checkbox_ExpenseRecovery_ReconciledFlag | false |
    And I click on the "Save Changes" action panel button
    And I verify success message "Successfully updated Expense Recovery"
    And I click on the "Reconcile" action panel button
    And I set fields values on editable page
      | name             | value             |
      | invoiceDate      | 08/09/2015        |
      | invoiceNumber    | 100               |
      | allocateByVendor | true              |
      | VendorID         | Selenium-Employer |
    And I check Send Mail checkbox in Reconcile modal window
    And I click on OK button in Reconcile pop up
    And I click "Yes" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I click on the "Transactions" tab
    And I verify row from grid "thisDiv" having unique value "$164,250.00"
      | name             | value             |
      | Effective Date   | 12/31/2014        |
      | Group            | Lease             |
      | Type             | CAM               |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | $164,250.00       |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |
    And I verify the following fields value on editable page
      | name                                     | value             |
      | PaymentTransaction_VendorID              | Selenium-Employer |
      | _checkbox_PaymentTransaction_OneTimeFlag | true              |

  Examples:
    | Login User   | Login full username  | Entity Name                    | Grid title                           | Grid ID | Second Level Tab | Third Level Tab |
    | DeleteAccess | Delete Access Access | NET_Recoveries_Escrow Contract | Contract Expense Recovery (Net) List | thisDiv | Payment Info     | Recoveries      |

  Scenario: I verify Email should be received for members in the "Attention Email to" column
    Given I login to web mail on existing window
    And I search the mail using subject "[LxRetail] NET_Recoveries_Escrow Contract Reconcile 12/31/2014"
    And I verify attachment exist "LxReconcileEXP" of type "html"

    And I search the mail using subject "[LxRetail] NET_Recoveries_Escrow Contract Update Escrow 09/01/2014"
    And I verify attachment exist "LxUpdateEscrowESC" of type "html"
