@all
Feature: (Jira Ref: AUTOMATION-1175) Exchange Rate Spreadsheet

  Scenario Outline:As a delete user I create Exchange Rate Spreadsheet through Spreadsheet import
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageExchangeRates/"
    And I import following files:
      | CreateExchangeRates.xlsx |
    And I navigate to the admin dashboard
    And I click on the "Manage Exchange Rates" link
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageExchangeRates/CreateExchangeRates.xlsx"
    Then I verify a row from grid "<Grid ID>" by reading data from excel sheet row "6" in non frame page
      | name           | value                               |
      | Effective Date | ExchangeRate.EffectiveDate          |
      | Exchange Rate  | ExchangeRate.ConversionRate         |
      | From Currency  | ExchangeRate.CodeFromCurrencyTypeID |
      | To Currency    | ExchangeRate.CodeToCurrencyTypeID   |

    And I verify a row from grid "<Grid ID>" by reading data from excel sheet row "7" in non frame page
      | name           | value                               |
      | Effective Date | ExchangeRate.EffectiveDate          |
      | Exchange Rate  | ExchangeRate.ConversionRate         |
      | From Currency  | ExchangeRate.CodeFromCurrencyTypeID |
      | To Currency    | ExchangeRate.CodeToCurrencyTypeID   |

    Examples:
      | Grid ID            |
      | BOGridExchangeRate |