@all
Feature: (Ref : Jira Ticket - AUTOMATION-975) Retro Payment Functionality

  Scenario Outline:  Retro Payment Functionality
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/RetroPayment/"
    And I import following file name:
      | VendorBImport-975.xml        |
      | RetroPaymentContract-975.xml |
    And I navigate to entity type "Contracts" named "<Entity Name>" through search option
    And I navigate to second level tab "Payment Info" and third level "Transactions" tab of entity "Contract"
    And I assert the following values in grid "thisDiv"
      | Effective Date | Group | Type     | Category | Vendor       | Vendor# | One-Time Expense | Total Amount | Primary Tax | Hold Flag |
      | 03/01/2015     | CAM   | Interior | Expense  | Vendor B-975 |         | No               | $50.00       | $0.00       | No        |
      | 02/01/2015     | CAM   | Interior | Expense  | Vendor B-975 |         | No               | $50.00       | $0.00       | No        |
      | 01/01/2015     | CAM   | Interior | Expense  | Vendor B-975 |         | No               | $50.00       | $0.00       | No        |

    And I click on the "Recurring Expenses" tab
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
      | Vendor B-975 |         | 100.00000%      | 5601 Democracy Drive | Plano | TX    | 01/01/2010 | 12/31/2030 |

    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount | Annual Amount | Rate  | First Payment | Last Payment |
      | 01/01/2010 | 12/31/2020 | Review          | $50.00         | $600.00       | $0.12 | $50.00        | $50.00       |

    And I click on the "Retro Payment" action panel button
    And I see the "Retro-Payment Setup" modal window
    And I set following fields value on editable page
      | name          | value      |
      | retroDate     | 02/01/2015 |
      | effectiveDate | 04/01/2015 |
      | endDate       | 12/31/2015 |
      | newAmount     | 100        |
    And I deselect 'Mark Retro Payments as One-Time Payments?:' checkbox
    And I select 'Send Email?:' checkbox
    #    And I click "OK" button in modal window "Retro-Payment Setup"
    And I click "Create Payment" button in modal window "Retro-Payment Setup"
    Then I verify "An existing Expense Schedule record End Date has been changed from 12/31/2020 to 03/31/2015" message
    And I verify "A new Expense Schedule record was created with Start Date 02/01/2015, End Date 03/31/2015 and Payment Amount $50.00" message
    And I verify "A new Expense Schedule record was created with Start Date 04/01/2015, End Date 12/31/2015 and Payment Amount $100.00" message
    And I verify "2 Payment Transaction records were generated." message
    And I click "OK" button in modal window "Success"
    And I click on "Transactions" tab
    And I verify the following values in frame grid "thisDiv"
      | Effective Date | Group | Type     | Category | Vendor       | Vendor# | One-Time Expense | Total Amount | Primary Tax | Hold Flag |
      | 03/01/2015     | CAM   | Interior | Expense  | Vendor B-975 |         | No               | $50.00       | $0.00       | No        |
      | 03/01/2015     | CAM   | Interior | Expense  | Vendor B-975 |         | No               | $50.00       | $0.00       | No        |
      | 02/01/2015     | CAM   | Interior | Expense  | Vendor B-975 |         | No               | $50.00       | $0.00       | No        |
      | 02/01/2015     | CAM   | Interior | Expense  | Vendor B-975 |         | No               | $50.00       | $0.00       | No        |
      | 01/01/2015     | CAM   | Interior | Expense  | Vendor B-975 |         | No               | $50.00       | $0.00       | No        |

    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Interior   |
      | Expense Category | Expense    |
      | Begin Date       | 01/01/2010 |
      | End Date         | 12/31/2015 |
      | Frequency        | Monthly    |
      | Period Amount    |            |
      | Annual Amount    |            |

    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount | Annual Amount | Rate  | First Payment | Last Payment |
      | 01/01/2010 | 03/31/2015 | Review          | $50.00         | $600.00       | $0.12 | $50.00        | $50.00       |
      | 02/01/2015 | 03/31/2015 | Review          | $50.00         | $600.00       | $0.12 | $50.00        | $50.00       |
      | 04/01/2015 | 12/31/2015 | Review          | $100.00        | $1,200.00     | $0.24 | $100.00       | $100.00      |

    Examples:
      | Login User   | Login full username  | Entity Name                |
      | DeleteAccess | Delete Access Access | Retro Payment Contract-975 |

  Scenario: I verify Email should be received for members in the "Attention Email to" column
    Given I login to web mail on existing window
    And I search the mail using subject "[LxRetail] Retro Payment Contract-975 Generate Retro Payment 04/01/2015"
    And I verify attachment exist "LxRetroPayment" of type "html"