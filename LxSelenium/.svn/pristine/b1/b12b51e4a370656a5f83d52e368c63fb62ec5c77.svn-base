@all
Feature: (Jira - Automation- 548)Contracts Expense Setup - Generate Basic Rent

  Scenario Outline: As a delete user I import basic generate rent xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/GenerateRent/"
    And I import following file name:
      | Basic_Generate_Rent.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can able to generate rent for specific month
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
      | yrToGenerate | 2013       |
      | postDate     | 01/01/2013 |
      | batchDate    | 03/31/2015 |

    Then I set following list fields values on editable page
      | name         | value           |
      | mnToGenerate | January         |
      | paymntClass  | Single Contract |
    And I click "OK" button
    #Then I verify "1 Contract was processed." message appear after generating rent
    #And I verify "2 Payment Transaction records were generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear

    And I click on the "Transactions" tab
    And I delete rows in grid "<Grid ID>" having value "01/01/2013" under header "Effective Date"
#    Then I verify row count "2" in the grid "<Grid ID>" having value "01/01/2013" under header "Effective Date"
#    And I click row from grid "<Grid ID>" having unique value "01/01/2013" under column header "Effective Date"
#    And I switch to default frame
#    Then I click on the "Delete Item" action panel button
#    And I click on the "Yes" button in message box
#    And I wait for the Loading text to disappear
#    And I verify row count "1" in the grid "<Grid ID>" having value "01/01/2013" under header "Effective Date"
#
#    And I click row from grid "<Grid ID>" having unique value "01/01/2013" under column header "Effective Date"
#    And I switch to default frame
#    Then I click on the "Delete Item" action panel button
#    And I click on the "Yes" button in message box
#    And I wait for the Loading text to disappear
    Then I verify row count "0" in the grid "<Grid ID>" having value "01/01/2013" under header "Effective Date"

    Examples:
      | Login User   | Login full username  | Entity Type | Contract Name       | Second Level Tab | Third Level Tab    | Grid ID |
      | DeleteAccess | Delete Access Access | Contract    | Basic Generate Rent | Payment Info     | Recurring Expenses | thisDiv |

  Scenario Outline: As a delete user I verify the generated transaction
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "<Entity Type>" named "<Contract Name>"
#    And I navigate to "<Second Level Tab>"
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "Base Rent" under column header "Expense Type"
    And I switch to default frame
    Then I click on the "Generate Rent" action panel button
    Then I set following list fields values on editable page
      | name         | value           |
      | mnToGenerate | January         |
      | paymntClass  | Single Contract |
    Then I set fields values on editable page
      | name         | value      |
      | yrToGenerate | 2013       |
      | postDate     | 01/01/2013 |
      | batchDate    | 03/31/2015 |
    And I click "OK" button
    Then I verify "1 Contract was processed." message appear after generating rent
    And I verify "2 Payment Transaction records were generated." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear
    And I switch to default frame
    And I click on the "Transactions" tab
   And I verify row count "2" in the grid "<Grid ID>" having value "01/01/2013" under header "Effective Date"
#    Then I verify atleast "2" row count in the grid "<Grid ID>" having value "01/01/2013" under header "Effective Date"

    Examples:
      | Login User   | Login full username  | Entity Type | Contract Name       | Second Level Tab | Third Level Tab    | Grid ID |
      | DeleteAccess | Delete Access Access | Contract    | Basic Generate Rent | Payment Info     | Recurring Expenses | thisDiv |