@all
Feature: Retro Payment and verify them in Contract> Payment Info> Recurring Expenses page (Ref : Jira Ticket - AUTOMATION-549)

  Scenario Outline: Retro Payment and verify them
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo"
    And I import following file name:
      | RetroPaymentContract.xml |
    And I navigate to entity type "Contract" named "<Entity Name>"
    And I navigate to second level tab "Payment Info" and third level "Recurring Expenses" tab of entity "Contract"
    Then I verify page title "<Grid title>" after navigation
    And I click row from grid "<Grid ID>" having unique value "<Field>" under column header "Expense Group"
    And I switch to default frame
    And I click on the "Retro Payment" action panel button
    And I set following fields value on editable page
      | name          | value      |
      | retroDate     | 02/01/2015 |
      | effectiveDate | 04/01/2015 |
      | endDate       | 12/31/2015 |
      | postDate      | 03/25/2015 |
      | dueDate       | 03/25/2015 |
      | newAmount     | 200        |
    And I deselect 'Mark Retro Payments as One-Time Payments?:' checkbox
    #    And I click "OK" button in modal window "Retro-Payment Setup"
    And I click "Create Payment" button in modal window "Retro-Payment Setup"
    And I verify Success Message Pop up should be displayed
    And I click "OK" button in modal window "Success"
    And I click on the "Transactions" tab
    And I verify grid row "<Grid ID>" having unique value "02/01/2015" under column header "Effective Date"
      | name             | value      |
      | Effective Date   | 02/01/2015 |
      | Group            | <Field>    |
      | Type             | Interior   |
      | Category         | Expense    |
      | Vendor           | Vendor B   |
      | Vendor#          |            |
      | One-Time Expense | No         |
      | Total Amount     | $150.00    |
      | Primary Tax      | $0.00      |
      | Hold Flag        |            |
    And I verify grid row "<Grid ID>" having unique value "03/01/2015" under column header "Effective Date"
      | name             | value      |
      | Effective Date   | 03/01/2015 |
      | Group            | <Field>    |
      | Type             | Interior   |
      | Category         | Expense    |
      | Vendor           | Vendor B   |
      | Vendor#          |            |
      | One-Time Expense | No         |
      | Total Amount     | $150.00    |
      | Primary Tax      | $0.00      |
      | Hold Flag        |            |
    And I click on the "<Third Level Tab>" tab
    #And I verify grid row "BOGridExpenseSchedule" having unique value "$150.00" under column header "Last Payment Amount"
    And I verify grid row "BOGridExpenseSchedule" having unique value "$150.00" under column header "Last Payment"
      | name            | value      |
      | Begin Date      | 02/01/2015 |
      | End Date        | 03/31/2015 |
      | Approval Status | Review     |
      | Payment Amount  | $150.00    |
      | Annual Amount   | $1,800.00  |
      | Rate            | $0.36      |
#      | First Payment Amount | $150.00    |
#      | Last Payment Amount  | $150.00    |
#      Header changed from 'Last Payment Amount' to 'Last Payment'
#      Header changed from 'First Payment Amount' to 'First Payment'
      | First Payment   | $150.00    |
      | Last Payment    | $150.00    |

    And I switch to default frame
    #And I verify grid row "BOGridExpenseSchedule" having unique value "$200.00" under column header "Last Payment Amount"
    And I verify grid row "BOGridExpenseSchedule" having unique value "$200.00" under column header "Last Payment"
      | name            | value      |
      | Begin Date      | 04/01/2015 |
      | End Date        | 12/31/2015 |
      | Approval Status | Review     |
      | Payment Amount  | $200.00    |
      | Annual Amount   | $2,400.00  |
      | Rate            | $0.48      |
#      | First Payment Amount | $200.00    |
#      | Last Payment Amount  | $200.00    |
      | First Payment   | $200.00    |
      | Last Payment    | $200.00    |
    And I switch to default frame

    Examples:
      | Field | Second Level Tab | Third Level Tab    | Entity Name            | Grid title                  | Grid ID |
      | CAM   | Payment Info     | Recurring Expenses | Retro Payment Contract | Contract Expense Setup List | thisDiv |