@all
Feature:(Jira Ref:AUTOMATION-1380) est Decimal display for Foreign Currency on Math fields on Forms

  Scenario Outline: As a delete user I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCompany/FinancialSettings/ForeignCurrenciesDecimalPlaceValueTesting/"
    And I import following file name:
      | Sprint 17-PortfolioAndLocation-1379.xml |
      | Forms(4)-1380.xml                       |
      | 13627_Project(2)-1380.xml               |

    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID | EUR   |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify currency type fields are correctly reflected on the Form when set to EUR
    When I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on "Forms" tab
    And I wait for the Loading text to disappear
    And I click " Expand All " button
    And I click on "<Check Out>" link
    And I wait for " " modal window to open in non frame page
    And I set following fields value on editable page
      | name            | value |
      | Issue_Subject   | 13627 |
      | Issue_Currencya | 900.5 |
      | Issue_Currencyb | 700.7 |
    And I click on the "Update" button
    And I verify the following fields in "modal window"
      | Add Currencies    | €1,601.20 |
      | Subtract Currency | €199.80   |
    And I click "Update & Check in" button
    And I wait for modal window to close

    And I wait for the Loading text to disappear
    And I click on "<View>" link
    And I wait for " " modal window to open in non frame page
    And I verify the following fields in "modal window"
      | Add Currencies    | €1,601.20 |
      | Subtract Currency | €199.80   |
      | Title             | 13627     |
      | Currencya         | €900.50   |
      | Currencyb         | €700.70   |

    And I click on the "Close" button
    And I wait for modal window to close

    Examples:
      | Entity Name   |
      | 13627 Project |


  Scenario Outline: As a delete user I verify Home currency shall be successfully be updated when set to null
    Given I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID |       |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header

    When I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on "Forms" tab
    And I wait for the Loading text to disappear
    And I click " Expand All " button
    And I click on "<Check Out>" link
    And I wait for " " modal window to open in non frame page
    And I verify the following fields value on editable page
      | name            | value   |
      | Issue_Subject   | 13627   |
      | Issue_Currencya | $900.50 |
      | Issue_Currencyb | $700.70 |
    And I click on the "Update" button
    And I verify the following fields in "modal window"
      | Add Currencies    | $1,601.20 |
      | Subtract Currency | $199.80   |
    And I click "Update & Check in" button
    And I wait for modal window to close

    And I wait for the Loading text to disappear
    And I click on "<View>" link
    And I wait for " " modal window to open in non frame page
    And I verify the following fields in "modal window"
      | Add Currencies    | $1,601.20 |
      | Subtract Currency | $199.80   |
      | Title             | 13627     |
      | Currencya         | $900.50   |
      | Currencyb         | $700.70   |
    And I click on the "Close" button
    And I wait for modal window to close

    Examples:
      | Entity Name   |
      | 13627 Project |