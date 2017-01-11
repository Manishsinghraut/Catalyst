@all
Feature: Check Payment Spreadsheet - Create/update (Jira Ref: AUTOMATION-1181)

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials

  Scenario Outline: I update check payment through spreadsheet import
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/"
    And I import following file name:
      | VendorA_1181.xlsx                         |
      | CreateUpdatePayment-Testing-8463_1181.xml |

    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on row from grid "thisDiv" having unique value "CAM" under column header "Group"
      | name             | value      |
      | Effective Date   | 01/01/2016 |
      | Group            | CAM        |
      | Type             | CAM        |
      | Category         | Expense    |
      | Vendor           | Vendor A   |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | $500.00    |
      | Primary Tax      |            |
      | Hold Flag        | No         |


    And I wait for the Loading text to disappear
    And I verify the following fields value on editable page
      | name                                   | value    |
      | PaymentTransaction_CodePaymentMethodID | [SELECT] |
      | PaymentTransaction_CheckDate           |          |
      | PaymentTransaction_CheckAmount         |          |
      | PaymentTransaction_CheckNumber         |          |

    And I click on row from grid "thisDiv" having unique value "Base Rent" under column header "Group"
      | name             | value      |
      | Effective Date   | 01/01/2016 |
      | Group            | Base Rent  |
      | Type             | Rent       |
      | Category         | Expense    |
      | Vendor           | Vendor A   |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | $1,000.00  |
      | Primary Tax      |            |
      | Hold Flag        | No         |
    And I wait for the Loading text to disappear
    And I verify the following fields value on editable page
      | name                                   | value    |
      | PaymentTransaction_CodePaymentMethodID | [SELECT] |
      | PaymentTransaction_CheckDate           |          |
      | PaymentTransaction_CheckAmount         |          |
      | PaymentTransaction_CheckNumber         |          |

    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/"
    And I import following file name:
      | CreateCheckPayment_1181.xls |
    And I click on the "<Third Level Tab>" tab
    And I click on row from grid "thisDiv" having unique value "CAM" under column header "Group"
      | name             | value      |
      | Effective Date   | 01/01/2016 |
      | Group            | CAM        |
      | Type             | CAM        |
      | Category         | Expense    |
      | Vendor           | Vendor A   |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | $500.00    |
      | Primary Tax      |            |
      | Hold Flag        | No         |

    And I wait for the Loading text to disappear
    And I verify the following fields value on editable page
      | name                                   | value      |
      | PaymentTransaction_CodePaymentMethodID | [SELECT]   |
      | PaymentTransaction_CheckDate           | 01/05/2016 |
      | PaymentTransaction_CheckAmount         | $500.00    |
      | PaymentTransaction_CheckNumber         | 101        |

    And I click on row from grid "thisDiv" having unique value "Base Rent" under column header "Group"
      | name             | value      |
      | Effective Date   | 01/01/2016 |
      | Group            | Base Rent  |
      | Type             | Rent       |
      | Category         | Expense    |
      | Vendor           | Vendor A   |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | $1,000.00  |
      | Primary Tax      |            |
      | Hold Flag        | No         |

    And I wait for the Loading text to disappear
    And I verify the following fields value on editable page
      | name                                   | value      |
      | PaymentTransaction_CodePaymentMethodID | [SELECT]   |
      | PaymentTransaction_CheckDate           | 01/10/2016 |
      | PaymentTransaction_CheckAmount         | $1,000.00  |
      | PaymentTransaction_CheckNumber         | 102        |


    And I fetch transaction ID
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/UpdateCheckPayment_1181.xls"
    And I set cell value in spread sheet row "2" under header "PaymentTransactionID"
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/"
    And I import following file name:
      | UpdateCheckPayment_1181.xls |
    And I click on the "<Third Level Tab>" tab
    And I click on row from grid "thisDiv" having unique value "Base Rent" under column header "Group"
      | name             | value      |
      | Effective Date   | 01/01/2016 |
      | Group            | Base Rent  |
      | Type             | Rent       |
      | Category         | Expense    |
      | Vendor           | Vendor A   |
      | Vendor#          |            |
      | One-Time Expense | Yes        |
      | Total Amount     | $1,000.00  |
      | Primary Tax      |            |
      | Hold Flag        | No         |

    And I wait for the Loading text to disappear
    And I verify the following fields value on editable page
      | name                                   | value      |
      | PaymentTransaction_CheckDate           | 01/01/2016 |
      | PaymentTransaction_CheckAmount         | $600.00    |
      | PaymentTransaction_CheckNumber         | 102        |
      | PaymentTransaction_CodePaymentMethodID | [SELECT]   |

    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/"
    And I import following file and returns error message "Payment Unable to find any PaymentTransaction or Form records for vendorID":
      | PaymentNegativeTest_1181.xls |


  Examples:
    | Item     | Secondary Tab | Third Level Tab | Entity Name                      |
    | Contract | Payment Info  | Transactions    | CreateUpdatePayment-Testing-8463 |


#@all
#Feature: (Jira Ref: AUTOMATION-389) I update check payment and verify it in Contract> Payment Info> Transaction page
#
#  Background:
#    Given I Login to IWMS using "DeleteAccess" access credentials
#
#  Scenario Outline: I update check payment through spreadsheet import
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/"
#    And I import following file name:
#      | Check_Payment.xls |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I click on row from grid "thisDiv" having unique value "$15,280.00" under column header "Total Amount"
#      | name           | value      |
#      | Group          | Rent       |
#      | Effective Date | 01/01/2010 |
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/Check_Payment.xls"
#    Then I verify field value on editable page by reading data from spread sheet row "3"
#      | name                           | value       |
#      | PaymentTransaction_CheckAmount | CheckAmount |
#      | PaymentTransaction_CheckNumber | CheckNumber |
#    Then I verify date field value on editable page by reading data from spread sheet row "3"
#      | name                         | value     |
#      | PaymentTransaction_CheckDate | CheckDate |
#
#    And I click on row from grid "thisDiv" having unique value "$12,000.00" under column header "Total Amount"
#      | name           | value      |
#      | Group          | Rent       |
#      | Effective Date | 01/01/2005 |
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/Check_Payment.xls"
#    Then I verify field value on editable page by reading data from spread sheet row "2"
#      | name                           | value       |
#      | PaymentTransaction_CheckAmount | CheckAmount |
#      | PaymentTransaction_CheckNumber | CheckNumber |
#    Then I verify date field value on editable page by reading data from spread sheet row "2"
#      | name                         | value     |
#      | PaymentTransaction_CheckDate | CheckDate |
#
#    Examples:
#      | Item     | Secondary Tab | Third Level Tab | Entity Name       |
#      | Contract | Payment Info  | Transactions    | Selenium-Contract |


#@all
#Feature: (Jira Ref: AUTOMATION-389) I update check payment and verify it in Contract> Payment Info> Transaction page
#
#  Background:
#    Given I Login to IWMS using "DeleteAccess" access credentials
#
#  Scenario Outline: I update check payment through spreadsheet import
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/"
#    And I import following file name:
#      | Check Payment Transaction-389.xml |
#      | Check_Payment.xls                 |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Third Level Tab>" tab
#
#    And I click on row from grid "thisDiv" having unique value "$13,000.00" under column header "Total Amount"
#      | name           | value      |
#      | Group          | Rent       |
#      | Effective Date | 01/01/2005 |
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/Check_Payment.xls"
#    Then I verify field value on editable page by reading data from spread sheet row "2"
#      | name                           | value       |
#      | PaymentTransaction_CheckAmount | CheckAmount |
#      | PaymentTransaction_CheckNumber | CheckNumber |
#    Then I verify date field value on editable page by reading data from spread sheet row "2"
#      | name                         | value     |
#      | PaymentTransaction_CheckDate | CheckDate |
#
#    And I click on row from grid "thisDiv" having unique value "$15,300.00" under column header "Total Amount"
#      | name           | value      |
#      | Group          | Rent       |
#      | Effective Date | 01/01/2010 |
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/Check_Payment.xls"
#    Then I verify field value on editable page by reading data from spread sheet row "3"
#      | name                           | value       |
#      | PaymentTransaction_CheckAmount | CheckAmount |
#      | PaymentTransaction_CheckNumber | CheckNumber |
#    Then I verify date field value on editable page by reading data from spread sheet row "3"
#      | name                         | value     |
#      | PaymentTransaction_CheckDate | CheckDate |
#
#    Examples:
#      | Item     | Secondary Tab | Third Level Tab | Entity Name                   |
#      | Contract | Payment Info  | Transactions    | Check Payment Transaction-389 |
#
#
##@all
##Feature: (Jira Ref: AUTOMATION-389) I update check payment and verify it in Contract> Payment Info> Transaction page
##
##  Background:
##    Given I Login to IWMS using "DeleteAccess" access credentials
##
##  Scenario Outline: I update check payment through spreadsheet import
##    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/"
##    And I import following file name:
##      | Check_Payment.xls |
##    When I navigate to entity type "<Item>" named "<Entity Name>"
##    Then I navigate to "<Secondary Tab>"
##    And I click on the "<Third Level Tab>" tab
##    And I click on row from grid "thisDiv" having unique value "$15,280.00" under column header "Total Amount"
##      | name           | value      |
##      | Group          | Rent       |
##      | Effective Date | 01/01/2010 |
##    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/Check_Payment.xls"
##    Then I verify field value on editable page by reading data from spread sheet row "3"
##      | name                           | value       |
##      | PaymentTransaction_CheckAmount | CheckAmount |
##      | PaymentTransaction_CheckNumber | CheckNumber |
##    Then I verify date field value on editable page by reading data from spread sheet row "3"
##      | name                         | value     |
##      | PaymentTransaction_CheckDate | CheckDate |
##
##    And I click on row from grid "thisDiv" having unique value "$12,000.00" under column header "Total Amount"
##      | name           | value      |
##      | Group          | Rent       |
##      | Effective Date | 01/01/2005 |
##    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/Check_Payment.xls"
##    Then I verify field value on editable page by reading data from spread sheet row "2"
##      | name                           | value       |
##      | PaymentTransaction_CheckAmount | CheckAmount |
##      | PaymentTransaction_CheckNumber | CheckNumber |
##    Then I verify date field value on editable page by reading data from spread sheet row "2"
##      | name                         | value     |
##      | PaymentTransaction_CheckDate | CheckDate |
##
##    Examples:
##      | Item     | Secondary Tab | Third Level Tab | Entity Name       |
##      | Contract | Payment Info  | Transactions    | Selenium-Contract |
