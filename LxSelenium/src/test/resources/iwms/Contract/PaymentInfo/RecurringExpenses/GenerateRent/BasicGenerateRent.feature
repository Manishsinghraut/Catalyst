@all
Feature: (Jira - Automation- 547, Jira - Automation- 546, Jira - Automation- 544)Contracts Expense Setup - Generate Basic Rent

  Scenario Outline: As a delete user I import basic generate rent xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/GenerateRent/"
    And I import following file name:
      | Basic_Generate_Rent.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: (Jira - Automation- 544) As a delete user I can able to set negative due date
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "<Entity Type>" named "<Contract Name>"
#    And I navigate to "<Second Level Tab>"
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "Base Rent" under column header "Expense Type"
    Then I set following fields value on editable page
      | name                       | value |
      | ExpenseSetup_PaymentDueDay | -3    |
    And I switch to default frame
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear
    And I switch to default frame
    Then I click on the "Generate Rent" action panel button
    Then I set fields values on editable page
      | name         | value      |
      | yrToGenerate | 2015       |
      | postDate     | 02/01/2015 |
      | batchDate    | 03/31/2015 |

    Then I set following list fields values on editable page
      | name         | value    |
      | mnToGenerate | February |
    And I fetch record number while generating rent
    And I click "OK" button
#    Then I verify "1 Contract was processed." message appear after generating rent
#    And I verify "1 Payment Transaction record was generated." message appear after generating rent
    Then I verify "processed." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear
    And I switch to default frame
    And I click on the "Transactions" tab
#    And I verify row from grid "thisDiv" having unique value "02/01/2015" under column header "Effective Date"
#      | name           | value      |
#      | Effective Date | 02/01/2015 |
    #And I verify row count "1" in the grid "<Grid ID>" having value "02/01/2015" under header "Effective Date"
    Then I verify atleast "1" row count in the grid "<Grid ID>" having value "02/01/2015" under header "Effective Date"
    And I click row from grid "<Grid ID>" having unique value "02/01/2015" under column header "Effective Date"
    Then I verify batch ID in transaction page
    And I verify the following fields value on editable page
      | name                       | value      |
      | PaymentTransaction_DueDate | 01/29/2015 |

    Examples:
      | Login User   | Login full username  | Entity Type | Contract Name       | Second Level Tab | Third Level Tab    | Grid ID |
      | DeleteAccess | Delete Access Access | Contract    | Basic Generate Rent | Payment Info     | Recurring Expenses | thisDiv |


  Scenario Outline: (Jira - Automation- 547)As a delete user I can able to generate rent for same month twice
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "<Entity Type>" named "<Contract Name>"
#    And I navigate to "<Second Level Tab>"
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "Base Rent" under column header "Expense Type"
    And I switch to default frame
    Then I click on the "Generate Rent" action panel button
    Then I set fields values on editable page
      | name         | value      |
      | yrToGenerate | 2015       |
      | postDate     | 02/01/2015 |
      | batchDate    | 03/31/2015 |

    Then I set following list fields values on editable page
      | name         | value    |
      | mnToGenerate | February |
    And I click "OK" button
    Then I verify "0 Contract was processed." message appear after generating rent
    And I verify "No Payment Transaction Records generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear

    Examples:
      | Login User   | Login full username  | Entity Type | Contract Name       | Second Level Tab | Third Level Tab    | Grid ID |
      | DeleteAccess | Delete Access Access | Contract    | Basic Generate Rent | Payment Info     | Recurring Expenses | thisDiv |


  Scenario Outline: (Jira - Automation- 546)No transactions shall be generated outside of the Contract Payment Begin Date & End Date
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "<Entity Type>" named "<Contract Name>"
    And I click on the "Summary" tab
    And I verify the summary fields value on non-editable contract summary tab
      | name              | value      |
      | Commencement Date | 01/01/2010 |
      | Possession Begin  | 01/01/2010 |
      | Payments Begin    | 01/01/2010 |
      | Payments End Date | 12/31/2020 |
    And I switch to default frame
#    And I navigate to "<Second Level Tab>"
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "CAM" under column header "Expense Group"
    And I verify grid row "BOGridExpenseVendorAllocation" having unique value "01/01/2009" under column header "Begin Date"
      | name       | value      |
      | Begin Date | 01/01/2009 |
      | End Date   | 12/31/2021 |

    And I verify grid row "BOGridExpenseSchedule" having unique value "01/01/2009" under column header "Begin Date"
      | name       | value      |
      | Begin Date | 01/01/2009 |
      | End Date   | 12/31/2021 |

    And I switch to default frame
    Then I click on the "Generate Rent" action panel button
    Then I set fields values on editable page
      | name         | value          |
      | yrToGenerate | <Year>         |
      | postDate     | <Posting Date> |
      | batchDate    | <Batch Date>   |

    Then I set following list fields values on editable page
      | name         | value           |
      | mnToGenerate | <Month>         |
      | paymntClass  | Single Contract |
    And I click "OK" button
    Then I verify "0 Contract was processed." message appear after generating rent
    And I verify "No Payment Transaction Records generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear
    And I click on the "Transactions" tab
    Then I verify row from grid "<Grid ID>" having unique value "<Posting Date>" not present under column header "Effective Date"

    Examples:
      | Login User   | Login full username  | Entity Type | Contract Name       | Second Level Tab | Third Level Tab    | Grid ID | Month | Year | Posting Date | Batch Date |
      | DeleteAccess | Delete Access Access | Contract    | Basic Generate Rent | Payment Info     | Recurring Expenses | thisDiv | March | 2009 | 03/01/2009   | 03/31/2015 |
      | DeleteAccess | Delete Access Access | Contract    | Basic Generate Rent | Payment Info     | Recurring Expenses | thisDiv | April | 2021 | 04/01/2021   | 03/31/2015 |