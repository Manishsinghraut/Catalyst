@all
Feature:(Jira Ref:AUTOMATION-1381) Test Decimal display for Foreign Currency on Dash Board module

  Scenario Outline: As a delete user I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID | JPY   |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header

    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CompanyAdministration/ManageCompany/FinancialSettings/ForeignCurrenciesDecimalPlaceValueTesting/"
    And I import following file name:
      | Sprint 17-PortfolioAndLocation(1)-1381.xml |
    And I import following files:
      | 13627_Contract(2)-1381.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user Navigate to 13627 Contract Summary page and view the value for Aggregate Total Amount
    When I navigate to entity type "Contracts" named "<Entity Name>" through search option
    And I click on "Summary" tab
    And I wait for the Loading text to disappear
    Then I verify the field "Aggregate Total Amount" is "¥21,571,200" in a same row in "summary page"
    And I navigate to dashboard page
    And I expand portfolio navigation tab
    And I Drag and Drop module "Chart-Line"
    And I select following checkboxes by label
      | name         |
      | RE Contracts |
    And I select radio 'Total:'
    And I enter 'Line Field' value as "Aggregate Total Rent"
    And I select portfolio "<Portfolio Name>"
    And I set following fields value on editable page
      | name      | value          |
      | title     | 13268 Currency |
      | startDate | 2000           |
      | endDate   | 2020           |
    And I click on the "Submit" button
    And I wait for modal window to close


    Examples:
      | Portfolio Name      | Entity Name    |
      | Portfolio Sprint 17 | 13627 Contract |

  Scenario: As a delete user I import the following files
    When I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID | JPY   |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header