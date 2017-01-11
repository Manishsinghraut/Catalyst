@all
Feature: (Jira ref - Automation-550) Generate rent for expense schedule with taxes from location applied

  Scenario Outline: As a delete user I import Generating Rent with Taxes Contract xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "/Data/ImportDataFiles/iwms/Contract/PaymentInfo/RecurringExpenses/GenerateRent/"
    And I import following file name:
      | Generating Rent with Taxes Contract (1).xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I can able to set tax for the location
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "<Entity Type>" named "<Contract Name>"
    And I switch to visible frame
    And I click on "000056" link
    When I switch to default frame
    And I see "000056" name on the header
    And I click on the "Edit" action panel button
    And I wait for the Loading text to disappear
    Then I set following fields value on editable page
      | name              | value    |
      | Location_TaxRate1 | 3.00000% |
      | Location_TaxRate2 | 5.00000% |
    And I switch to default frame
    Then I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear
    And I switch to default frame
    And I navigate to entity type "<Entity Type>" named "<Contract Name>"
#    And I navigate to "<Second Level Tab>"
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "Base Rent" under column header "Expense Group"
    Then I verify tax values from the location will be populated in this section
      | name          | value |
      | Primary Tax   | 3000  |
      | Secondary Tax | 5000  |

    Examples:
      | Login User   | Login full username  | Entity Type | Contract Name                       | Second Level Tab | Third Level Tab    | Grid ID |
      | DeleteAccess | Delete Access Access | Contract    | Generating Rent with Taxes Contract | Payment Info     | Recurring Expenses | thisDiv |

  Scenario Outline: As a delete user I can able to apply taxes
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "<Entity Type>" named "<Contract Name>"
#    And I navigate to "<Second Level Tab>"
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "Utilities" under column header "Expense Group"
    And I set following fields value on editable page
      | name                                 | value |
      | _checkbox_ExpenseSetup_ApplyTax1Flag | true  |
      | _checkbox_ExpenseSetup_ApplyTax2Flag | true  |
    And I switch to default frame
    Then I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear

    Examples:
      | Login User   | Login full username  | Entity Type | Contract Name                       | Second Level Tab | Third Level Tab    | Grid ID |
      | DeleteAccess | Delete Access Access | Contract    | Generating Rent with Taxes Contract | Payment Info     | Recurring Expenses | thisDiv |


  Scenario Outline: As a delete user I can able to apply taxes
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "<Entity Type>" named "<Contract Name>"
#    And I navigate to "<Second Level Tab>"
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I click row from grid "<Grid ID>" having unique value "Utilities" under column header "Expense Group"
    And I switch to default frame
    Then I click on the "Generate Rent" action panel button
    Then I set fields values on editable page
      | name         | value      |
      | yrToGenerate | 2014       |
      | batchDate    | 03/31/2015 |

    And I set following list fields values on editable page
      | name         | value           |
      | paymntClass  | Single Contract |
      | mnToGenerate | January         |
    And I click "OK" button
    #Transaction count varies
    #Then I verify "1 Contract was processed." message appear after generating rent
    And I click "OK" button
    And I wait for the Loading text to disappear


    Examples:
      | Login User   | Login full username  | Entity Type | Contract Name                       | Second Level Tab | Third Level Tab    | Grid ID |
      | DeleteAccess | Delete Access Access | Contract    | Generating Rent with Taxes Contract | Payment Info     | Recurring Expenses | thisDiv |


  Scenario Outline: As a delete user I verify Transactions generated for specified Month and Year
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "<Entity Type>" named "<Contract Name>"
#    And I navigate to "<Second Level Tab>"
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    Then I verify atleast "2" row count in the grid "<Grid ID>" having value "03/01/2015" under header "Effective Date"

    Examples:
      | Login User   | Login full username  | Entity Type | Contract Name                       | Second Level Tab | Third Level Tab | Grid ID |
      | DeleteAccess | Delete Access Access | Contract    | Generating Rent with Taxes Contract | Payment Info     | Transactions    | thisDiv |