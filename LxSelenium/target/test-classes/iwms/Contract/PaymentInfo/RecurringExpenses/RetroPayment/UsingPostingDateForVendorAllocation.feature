@all
Feature: (Ref : Jira Ticket - AUTOMATION-977)Using posting date for vendor allocation

  Scenario Outline: Using posting date for vendor allocation
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/RetroPayment/"
    And I import following file name:
      | Vendors-977.xls                      |
      | RetroPaymentPosting-Location-977.xml |
      | RetroPaymentExample2-977.xml         |

    And I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to second level tab "Payment Info" and third level "Recurring Expenses" tab of entity "Contract"
    And I verify a row from grid "thisDiv" having unique value "Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Rent       |
      | Expense Category | Rent       |
      | Begin Date       | 01/01/2016 |
      | End Date         | 12/31/2016 |
      | Frequency        | Monthly    |
      | Period Amount    | $1,500.00  |
      | Annual Amount    | $18,000.00 |
    And I verify the following values in frame grid "BOGridExpenseVendorAllocation"
      | Vendor       | Vendor# | Payment Percent | Address           | City  | State | Begin Date | End Date   |
      | Vendor A-977 |         | 100.00000%      | 8025 Ohio Dr      | Plano | TX    | 01/01/2016 | 03/31/2016 |
      | Vendor B-977 |         | 100.00000%      | 5601 Democracy Dr | Plano | TX    | 04/01/2016 | 12/31/2016 |

    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount | Annual Amount | Rate | First Payment | Last Payment |
      | 01/01/2016 | 12/31/2016 | Review          | $1,500.00      | $18,000.00    |      | $1,500.00     | $1,500.00    |
    And I click on the "Retro Payment" action panel button
    And I see the "Retro-Payment Setup" modal window
    And I set following fields value on editable page
      | name          | value      |
      | retroDate     | 01/01/2016 |
      | effectiveDate | 08/01/2016 |
      | endDate       | 12/31/2016 |
      | postDate      | 05/01/2016 |
      | newAmount     | 2000       |
    And I deselect 'Mark Retro Payments as One-Time Payments?:' checkbox
    #    And I click "OK" button in modal window "Retro-Payment Setup"
    And I click "Create Payment" button in modal window "Retro-Payment Setup"
    Then I verify "An existing Expense Schedule record End Date has been changed from 12/31/2016 to 07/31/2016" message
    And I verify "A new Expense Schedule record was created with Start Date 01/01/2016, End Date 07/31/2016 and Payment Amount $500.00" message
    And I verify "A new Expense Schedule record was created with Start Date 08/01/2016, End Date 12/31/2016 and Payment Amount $2,000.00" message
    And I verify "7 Payment Transaction records were generated." message
    And I click "OK" button in modal window "Success"
    And I click on "Transactions" tab
    And I verify the following values in frame grid "thisDiv"
      | Effective Date | Group | Type | Category | Vendor       | Vendor# | One-Time Expense | Total Amount | Primary Tax | Hold Flag |
      | 07/01/2016     | Rent  | Rent | Rent     | Vendor B-977 |         | No               | $500.00      | $0.00       | No        |
      | 06/01/2016     | Rent  | Rent | Rent     | Vendor B-977 |         | No               | $500.00      | $0.00       | No        |
      | 05/01/2016     | Rent  | Rent | Rent     | Vendor B-977 |         | No               | $500.00      | $0.00       | No        |
      | 04/01/2016     | Rent  | Rent | Rent     | Vendor B-977 |         | No               | $500.00      | $0.00       | No        |
      | 03/01/2016     | Rent  | Rent | Rent     | Vendor B-977 |         | No               | $500.00      | $0.00       | No        |
      | 02/01/2016     | Rent  | Rent | Rent     | Vendor B-977 |         | No               | $500.00      | $0.00       | No        |
      | 01/01/2016     | Rent  | Rent | Rent     | Vendor B-977 |         | No               | $500.00      | $0.00       | No        |

    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Rent       |
      | Expense Category | Rent       |
      | Begin Date       | 01/01/2016 |
      | End Date         | 12/31/2016 |
      | Frequency        | Monthly    |
      | Period Amount    | $2,000.00  |
      | Annual Amount    | $24,000.00 |
    And I verify the following values in frame grid "BOGridExpenseVendorAllocation"
      | Vendor       | Vendor# | Payment Percent | Address           | City  | State | Begin Date | End Date   |
      | Vendor A-977 |         | 100.00000%      | 8025 Ohio Dr      | Plano | TX    | 01/01/2016 | 03/31/2016 |
      | Vendor B-977 |         | 100.00000%      | 5601 Democracy Dr | Plano | TX    | 04/01/2016 | 12/31/2016 |

    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount | Annual Amount | Rate | First Payment | Last Payment |
      | 01/01/2016 | 07/31/2016 | Review          | $1,500.00      | $18,000.00    |      | $1,500.00     | $1,500.00    |
      | 01/01/2016 | 07/31/2016 | Review          | $500.00        | $6,000.00     |      | $500.00       | $500.00      |
      | 08/01/2016 | 12/31/2016 | Review          | $2,000.00      | $24,000.00    |      | $2,000.00     | $2,000.00    |


    Examples:
      | Login User   | Login full username  | Entity Name              |
      | DeleteAccess | Delete Access Access | RetroPaymentExample2-977 |