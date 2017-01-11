@all @smoke
Feature: (JIRA - AUTOMATION-510) To ensure that users can add, edit, delete a Transactions.

  Scenario Outline: As delete user, I import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Transactions/"
    And I import following file name:
      | ContractTransactions.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |



  Scenario Outline: I can add Transactions
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

#    And I navigate to entity type "<Item>" named "<Entity Name>"
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Payments List" after navigation
    And I switch to default frame
    And I click on the "Add item" action panel button
    Then I verify page title "Contract Payments List" after navigation
    And I set following fields value on editable page
      | name                                     | value                     |
      | PaymentTransaction_CodeExpenseGroupID    | Rent                      |
      | PaymentTransaction_CodeExpenseTypeID     | Base Rent                 |
      | PaymentTransaction_CodeExpenseCategoryID | Rent                      |
      | PaymentTransaction_CodePaymentMethodID   | Check                     |
      | PaymentTransaction_OrganizationID        | Selenium-Organization     |
      | PaymentTransaction_VendorID              | Selenium-Employer         |
      | PaymentTransaction_EffectiveDate         | <Effective Date>          |
      | PaymentTransaction_PostingDate           | 05/30/2018                |
      | PaymentTransaction_DueDate               | 05/30/2018                |
      | PaymentTransaction_InvoiceAmount         | 200                       |
      | PaymentTransaction_InvoiceDate           | 05/30/2018                |
      | PaymentTransaction_Description           | Created Transactions      |
      | PaymentTransaction_Notes                 | Create transactions notes |

    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear
    And I click on the "No"
    And I verify a row from grid "<Grid ID>" having unique value "<Effective Date>" under column header "Effective Date"
      | name             | value             |
      | Effective Date   | <Effective Date>  |
      | Group            | Rent              |
      | Type             | Base Rent         |
#      | Category         | Rent              |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     |                   |
      #Till number format is set for user. This will not be verified
      #| Total Amount     | $200,00           |
      | Primary Tax      |                   |
      | Hold Flag        | No                |

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name           | Grid ID | Login User   | Login full username  | Effective Date |
      | Contract | Payment Info     | Transactions    | Contract Transactions | thisDiv | DeleteAccess | Delete Access Access | 05/28/2015     |
      | Contract | Payment Info     | Transactions    | Contract Transactions | thisDiv | DeleteAccess | Delete Access Access | 05/29/2015     |

  Scenario Outline: As a edit user,
  1. I cannot edit processed Transactions base amount
  2. I can edit processed Transactions comment
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
#    And I navigate to entity type "<Item>" named "<Entity Name>"

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "<Grid ID>" having unique value "<Effective Date>" under column header "Effective Date"
      | name           | value            |
      | Effective Date | <Effective Date> |
      | Group          | Rent             |
    And I set following fields value on editable page
      | name                                       | value |
      | _checkbox_PaymentTransaction_ProcessedFlag | true  |
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear
    And I click on the "Yes"
    And I verify a row from grid "<Grid ID>" having unique value "<Effective Date>" under column header "Effective Date"
      | name             | value             |
      | Effective Date   | <Effective Date>  |
      | Group            | Rent              |
      | Type             | Base Rent         |
      | Vendor           | Selenium-Employer |
      | Vendor#          | 1234              |
      | One-Time Expense | Yes               |
      | Total Amount     |                   |
      | Primary Tax      |                   |
      | Hold Flag        | No                |
    And I click on the "<Third Level Tab>" tab
    And I verify a row from grid "<Grid ID>" having unique value "<Effective Date>" under column header "Effective Date"
      | name           | value            |
      | Effective Date | <Effective Date> |
      | Group          | Rent             |
    And I set following fields value on editable page
      | name                             | value |
      | PaymentTransaction_InvoiceAmount | 400   |
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear
    And I click on the "Yes"
    Then I verify "Unable to change Payment value(s) as the Payment has already been processed" error message appear in top left corner of page
    And I close error message pop up
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I click row from grid "<Grid ID>" having unique value "<Effective Date>" under column header "Effective Date"
    And I set following fields value on editable page
      | name                     | value                      |
      | PaymentTransaction_Notes | Updated transactions notes |

    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear
    And I click on the "No"
    And I click row from grid "<Grid ID>" having unique value "<Effective Date>" under column header "Effective Date"
    Then I verify the following fields value on editable page
      | name                     | value                      |
      | PaymentTransaction_Notes | Updated transactions notes |

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name           | Grid ID | Login User | Login full username | Effective Date |
      | Contract | Payment Info     | Transactions    | Contract Transactions | thisDiv | EditAccess | Edit Access Access  | 05/28/2015     |

  Scenario Outline: As a delete user,
      1. I can delete unprocessed Transactions
      2. I cannot delete processed Transactions

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I see the Dashboard
#    And I navigate to entity type "<Item>" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    Then I see "<Entity Name>" name on the header
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "<Effective Date 1>" under column header "Effective Date"
    And I switch to default frame
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    Then I verify "Transactions which have been marked as processed cannot be deleted." error message appear in top left corner of page
    And I close error message pop up

    And I click row from grid "<Grid ID>" having unique value "<Effective Date 2>" under column header "Effective Date"
    And I switch to default frame
    And I click on the "Delete Item" action panel button
    And I click on the "Yes" button in message box
    And I verify success message "Successfully deleted Payment Transaction"
    Then I verify row from grid "<Grid ID>" having unique value "<Effective Date 2>" not present

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name           | Grid ID | Login User   | Login full username  | Effective Date 1 | Effective Date 2 |
      | Contract | Payment Info     | Transactions    | Contract Transactions | thisDiv | DeleteAccess | Delete Access Access | 05/28/2015       | 05/29/2015       |