@all
Feature: (Ref : Jira Ticket No : Automation-664) Percentage Rent Schedule with Min/Max amount

  Scenario Outline: I import file for Percentage Rent Schedule with Min/Max amount
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/ComplicatedSchedules/"
    And I import following file name:
      | PercentageRentScheduleWithMinMaxAmount.xml |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify Max Min cap, Percentage line item, Breakpoint amount and sales items
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "Recurring Expenses" tab
    And I verify a row from grid "thisDiv" having unique value "Expense" under column header "Expense Group"
      | name             | value    |
      | Expense Type     | Interior |
      | Expense Category | Expense  |
      | Begin Date       |          |
      | End Date         |          |
      | Frequency        | None     |
      | Period Amount    |          |
      | Annual Amount    |          |
    And I verify a row from grid "BOGridExpenseVendorAllocation" having unique value "Selenium-Employer" under column header "Vendor"
      | name            | value             |
      | Vendor#         | 1234              |
      | Payment Percent | 100.00000%        |
      | Address         | 5601 Democracy Dr |
      | City            | Plano             |
      | State           | TX                |
      | Begin Date      | 01/01/2010        |
      | End Date        | 12/31/2030        |
      | Notes           |                   |
      | Actions         | edit              |

    And I click on the "Percentage Rent" tab
    And I verify a row from grid "thisDiv" having unique value "01/01/2010" under column header "Begin Date"
      | name                | value      |
      | End Date            | 12/31/2030 |
      | Sales Group         | Sales      |
      | Description         | Min Max    |
      | Calculation Method  | Per Period |
      | Payment Frequency   | Monthly    |
      | Reporting Frequency | Monthly    |
    And I verify the following fields value on editable page
      | name                       | value     |
      | PercentageRent_FloorAmount | $500.00   |
      | PercentageRent_CapAmount   | $1,000.00 |
#    And I click "edit" row action for the row that has "01/01/2010" in column "Begin Date"
    And I click on the "edit" row action of column "01/01/2010" of column "0" from grid "BOGridPercentageRentBreakpoint"
    And I switch to default frame
    And I see the "Edit Percentage Rent Breakpoint  ***Required fields in red" modal window
    And I verify the following fields value on editable page
      | name                                       | value       |
      | PercentageRentBreakpoint_CodeSalesGroupID  | Sales       |
      | PercentageRentBreakpoint_BreakpointAmount1 | $100,000.00 |
      | PercentageRentBreakpoint_BreakpointRate1   | 10.00000%   |
    And I click on the "Cancel" button


    And I click on the "Sales" tab
    And I verify row count "3" in the grid "thisDiv" having value "Sales" under header "Sales Group"
    And I verify a row from grid "thisDiv" having unique value "Sales" under column header "Sales Group"
      | name               | value        |
      | Sales Type         | Retail Sales |
      | Sales Category     | Actual       |
      | Sales Period       | 1            |
      | Sales Year         | 2015         |
      | Gross Sales Amount | $20,000.00   |
      | Net Sales Amount   | $20,000.00   |
      | Currency           | USD          |

    And I verify a row from grid "thisDiv" having unique value "Sales" under column header "Sales Group"
      | name               | value        |
      | Sales Type         | Retail Sales |
      | Sales Category     | Actual       |
      | Sales Period       | 2            |
      | Sales Year         | 2015         |
      | Gross Sales Amount | $10,000.00   |
      | Net Sales Amount   | $10,000.00   |
      | Currency           | USD          |

    And I verify a row from grid "thisDiv" having unique value "Sales" under column header "Sales Group"
      | name               | value        |
      | Sales Type         | Retail Sales |
      | Sales Category     | Actual       |
      | Sales Period       | 3            |
      | Sales Year         | 2015         |
      | Gross Sales Amount | $15,000.00   |
      | Net Sales Amount   | $15,000.00   |
      | Currency           | USD          |

    Examples:
      | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                                  |
      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent Schedule with Min/Max amount |


#  Scenario Outline: As a delete user I ensure the following
#                  a) Percentage rent owed shall not be less that Min Cap (floor) .
#                  b) Percentage rent owed shall not be greater that Max Cap (ceiling)
#                  c) Percentage rent owed can range in between Min Cap (floor) and Max Cap (ceiling)
#
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "Percentage Rent" tab
#    And I wait for the Loading text to disappear
#    And I select an option "Percentage Rent (Single BP) Schedule"
#    And I wait for the Loading text to disappear
#    And I click on the "Process Payment" action panel button
#    And I see the "Process Payment" modal window
#    And I set following list fields values on editable page
#      | name         | value   |
#      | mnToGenerate | <Month> |
#    Then I set fields values on editable page
#      | name         | value  |
#      | yrToGenerate | <Year> |
#    And I click on the "OK" button
#    Then I verify "1 Contract was processed." message appear after generating rent
#    And I verify "1 Payment Transaction record was generated." message appear after generating rent
#    And I click "OK" button
#    And I wait for the Loading text to disappear
#    And I click on the "Transactions" tab
#    And I verify a row from grid "thisDiv" having unique value "<Effective Date>" under column header "Effective Date"
#      | name             | value             |
#      | Group            | Expense           |
#      | Type             | Interior          |
#      | Category         | Expense           |
#      | Vendor           | Selenium-Employer |
#      | Vendor#          | 1234              |
#      | One-Time Expense | Yes               |
#      | Total Amount     | <Total Amount>    |
#      | Primary Tax      | $0.00             |
#      | Hold Flag        | No                |
#    And I verify the following fields value on editable page
#      | name                             | value             |
#      | PaymentTransaction_InvoiceAmount | <Total Amount>    |
#      | PaymentTransaction_VendorID      | Selenium-Employer |
#
#    Examples:
#      | Total Amount | Effective Date | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                                  | Month    | Year |
#      | $1,000.00    | 01/31/2015     | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent Schedule with Min/Max amount | January  | 2015 |
#      | $500.00      | 02/28/2015     | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent Schedule with Min/Max amount | February | 2015 |
#      | $666.67      | 03/31/2015     | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent Schedule with Min/Max amount | March    | 2015 |

  Scenario Outline: As a delete user I ensure the following
  a) Percentage rent owed shall not be less that Min Cap (floor) .
  b) Percentage rent owed shall not be greater that Max Cap (ceiling)
  c) Percentage rent owed can range in between Min Cap (floor) and Max Cap (ceiling)

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "Percentage Rent" tab
    And I wait for the Loading text to disappear
    And I select an option "Percentage Rent (Single BP) Schedule"
    And I wait for the Loading text to disappear
    #Procees payment for January month
    And I click on the "Process Payment" action panel button
    And I see the "Process Payment" modal window
    And I set following list fields values on editable page
      | name         | value   |
      | mnToGenerate | January |
    Then I set fields values on editable page
      | name         | value |
      | yrToGenerate | 2015  |
    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear

    #Procees payment for February month
    And I click on the "Process Payment" action panel button
    And I set following list fields values on editable page
      | name         | value    |
      | mnToGenerate | February |
    Then I set fields values on editable page
      | name         | value |
      | yrToGenerate | 2015  |
    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear

    #Procees payment for March month
    And I click on the "Process Payment" action panel button
    And I set following list fields values on editable page
      | name         | value |
      | mnToGenerate | March |
    Then I set fields values on editable page
      | name         | value |
      | yrToGenerate | 2015  |
    And I click on the "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear

    And I click on the "Transactions" tab
    And I verify a row from grid "thisDiv" having unique value "01/31/2015" under column header "Effective Date"
      | name             | value             |
      | Group            | Expense           |
      | Type             | Interior          |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | $1,000.00         |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |
    And I verify the following fields value on editable page
      | name                             | value             |
      | PaymentTransaction_InvoiceAmount | $1,000.00         |
      | PaymentTransaction_VendorID      | Selenium-Employer |

    And I verify a row from grid "thisDiv" having unique value " 02/28/2015" under column header "Effective Date"
      | name             | value             |
      | Group            | Expense           |
      | Type             | Interior          |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | $500.00           |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |
    And I verify the following fields value on editable page
      | name                             | value             |
      | PaymentTransaction_InvoiceAmount | $500.00           |
      | PaymentTransaction_VendorID      | Selenium-Employer |

    And I verify a row from grid "thisDiv" having unique value "03/31/2015 " under column header "Effective Date"
      | name             | value             |
      | Group            | Expense           |
      | Type             | Interior          |
      | Category         | Expense           |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     | $666.67           |
      | Primary Tax      | $0.00             |
      | Hold Flag        | No                |
    And I verify the following fields value on editable page
      | name                             | value             |
      | PaymentTransaction_InvoiceAmount | $666.67           |
      | PaymentTransaction_VendorID      | Selenium-Employer |


    Examples:
      | Login User   | Login full username  | Item     | Second Level Tab | Entity Name                                  |
      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent Schedule with Min/Max amount |