@all
Feature: (Ref : Jira Ticket - AUTOMATION-974) Retro payment pays once to the vendor in case of change mid-month

  Scenario Outline:  Retro payment pays once to the vendor in case of change mid-month
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/RetroPayment/"
    And I import following file name:
      | RetroLocation.xml |
      | Vendors.xls       |
      | RVF1.xml          |

    And I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to second level tab "Payment Info" and third level "Recurring Expenses" tab of entity "Contract"
    And I verify a row from grid "thisDiv" having unique value "Lease" under column header "Expense Group"
      | name             | value              |
      | Expense Type     | Water and Sewer    |
      | Expense Category | Recurring Expenses |
      | Begin Date       | 01/01/2013         |
      | End Date         | 12/31/2020         |
      | Frequency        | Monthly            |
      | Period Amount    | $65.00             |
      | Annual Amount    | $780.00            |
    And I verify the following values in frame grid "BOGridExpenseVendorAllocation"
      | Vendor       | Vendor# | Payment Percent | Address           | City  | State | Begin Date | End Date   |
      | Vendor A-974 |         | 100.00000%      | 8025 Ohio Dr      | Plano | TX    | 01/01/2013 | 03/15/2015 |
      | Vendor B-974 |         | 100.00000%      | 5601 Democracy Dr | Plano | TX    | 03/16/2015 | 12/31/2020 |
    And I click on the "Retro Payment" action panel button
    And I see the "Retro-Payment Setup" modal window
    And I set following fields value on editable page
      | name          | value      |
      | retroDate     | 01/01/2015 |
      | effectiveDate | 08/01/2015 |
      | endDate       | 12/31/2020 |
      | newAmount     | 75         |
    And I deselect 'Use posting date for vendor allocation?:' checkbox
    And I deselect 'Mark Retro Payments as One-Time Payments?:' checkbox
    #    And I click "OK" button in modal window "Retro-Payment Setup"
    And I click "Create Payment" button in modal window "Retro-Payment Setup"
    Then I verify "An existing Expense Schedule record End Date has been changed from 12/31/2020 to 07/31/2015" message
    And I verify "A new Expense Schedule record was created with Start Date 01/01/2015, End Date 07/31/2015 and Payment Amount $10.00" message
    And I verify "A new Expense Schedule record was created with Start Date 08/01/2015, End Date 12/31/2020 and Payment Amount $75.00" message
    And I verify "7 Payment Transaction records were generated." message
    And I click "OK" button in modal window "Success"
    And I click on "Transactions" tab
    And I verify the following values in frame grid "thisDiv"
      | Effective Date | Group | Type            | Category           | Vendor       | Vendor# | One-Time Expense | Total Amount | Primary Tax | Hold Flag |
      | 07/01/2015     | Lease | Water and Sewer | Recurring Expenses | Vendor B-974 |         | No               | $10.00       | $0.00       | No        |
      | 06/01/2015     | Lease | Water and Sewer | Recurring Expenses | Vendor B-974 |         | No               | $10.00       | $0.00       | No        |
      | 05/01/2015     | Lease | Water and Sewer | Recurring Expenses | Vendor B-974 |         | No               | $10.00       | $0.00       | No        |
      | 04/01/2015     | Lease | Water and Sewer | Recurring Expenses | Vendor B-974 |         | No               | $10.00       | $0.00       | No        |
      | 03/01/2015     | Lease | Water and Sewer | Recurring Expenses | Vendor A-974 |         | No               | $10.00       | $0.00       | No        |
      | 02/01/2015     | Lease | Water and Sewer | Recurring Expenses | Vendor A-974 |         | No               | $10.00       | $0.00       | No        |
      | 01/01/2015     | Lease | Water and Sewer | Recurring Expenses | Vendor A-974 |         | No               | $10.00       | $0.00       | No        |


    Examples:
      | Login User   | Login full username  | Entity Name |
      | DeleteAccess | Delete Access Access | RV 1-974    |