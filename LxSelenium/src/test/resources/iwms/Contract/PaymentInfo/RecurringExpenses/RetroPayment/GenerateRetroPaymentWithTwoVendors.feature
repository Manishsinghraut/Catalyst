@all
Feature: (Ref : Jira Ticket - AUTOMATION-976) Generate Retro Payment with 2 Vendor

  Scenario Outline: Generate Retro Payment with 2 Vendor
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/RetroPayment/"
    And I import following file name:
      | VendorImport-976.xml                 |
      | RetroPaymentContract2Vendors-976.xml |

    And I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to second level tab "Payment Info" and third level "Recurring Expenses" tab of entity "Contract"
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Interior   |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $50.00     |
      | Annual Amount    | $600.00    |
    And I verify the following values in frame grid "BOGridExpenseVendorAllocation"
      | Vendor       | Vendor# | Payment Percent | Address              | City  | State | Begin Date | End Date   |
      | Vendor A-976 |         | 100.00000%      | 8025 Ohio Dr         | Plano | TX    | 01/01/2010 | 12/31/2010 |
      | Vendor B-976 |         | 100.00000%      | 5601 Democracy Drive | Plano | TX    | 01/01/2011 | 12/31/2020 |

    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount | Annual Amount | Rate  | First Payment | Last Payment |
      | 01/01/2010 | 12/31/2020 | Review          | $50.00         | $600.00       | $0.12 | $50.00        | $50.00       |
    And I click on the "Retro Payment" action panel button
    And I see the "Retro-Payment Setup" modal window
    And I set following fields value on editable page
      | name          | value      |
      | retroDate     | 11/01/2010 |
      | effectiveDate | 01/31/2011 |
      | endDate       | 12/31/2020 |
      | newAmount     | 75         |
    And I deselect 'Use posting date for vendor allocation?:' checkbox
    And I deselect 'Mark Retro Payments as One-Time Payments?:' checkbox
#    And I click "OK" button in modal window "Retro-Payment Setup"
    And I click "Create Payment" button in modal window "Retro-Payment Setup"
    Then I verify "An existing Expense Schedule record End Date has been changed from 12/31/2020 to 01/30/2011" message
    And I verify "A new Expense Schedule record was created with Start Date 11/01/2010, End Date 01/30/2011 and Payment Amount $25.00" message
    And I verify "A new Expense Schedule record was created with Start Date 01/31/2011, End Date 12/31/2020 and Payment Amount $75.00" message
    And I verify "3 Payment Transaction records were generated." message
    And I click "OK" button in modal window "Success"
    And I click on "Transactions" tab
    And I verify the following values in frame grid "thisDiv"
      | Effective Date | Group | Type     | Category | Vendor       | Vendor# | One-Time Expense | Total Amount | Primary Tax | Hold Flag |
      | 01/01/2011     | CAM   | Interior | Expense  | Vendor B-976 |         | No               | $24.19       | $0.00       | No        |
      | 12/01/2010     | CAM   | Interior | Expense  | Vendor A-976 |         | No               | $25.00       | $0.00       | No        |
      | 11/01/2010     | CAM   | Interior | Expense  | Vendor A-976 |         | No               | $25.00       | $0.00       | No        |

    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Interior   |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2020 |
      | Frequency        | Monthly    |
      | Period Amount    | $75.00     |
      | Annual Amount    | $900.00    |

    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount | Annual Amount | Rate  | First Payment | Last Payment |
      | 01/01/2010 | 01/30/2011 | Review          | $50.00         | $600.00       | $0.12 | $50.00        | $48.39       |
      | 11/01/2010 | 01/30/2011 | Review          | $25.00         | $300.00       | $0.06 | $25.00        | $24.19       |
      | 01/31/2011 | 12/31/2020 | Review          | $75.00         | $900.00       | $0.18 | $2.42         | $75.00       |

    Examples:
      | Login User   | Login full username  | Entity Name                      |
      | DeleteAccess | Delete Access Access | Retro Payment Contract 2 Vendors |