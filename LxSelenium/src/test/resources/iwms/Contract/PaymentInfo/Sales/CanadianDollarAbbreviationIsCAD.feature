@all
Feature: Canadian Dollar Abbreviation is CAD (Ref : Jira Ticket No : Automation-762)

  Scenario Outline: Import the following spreadsheet
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Sales/"
    And I import following file name:
      | CanadianDollarAbbreviationIsCAD.xls |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete I verify sales record. Should show Canadian Dollar for the currency type

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "Payment Info"
    And I click on the "Sales" tab
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Sales/CanadianDollarAbbreviationIsCAD.xls"
    Then I verify a row from "thisDiv" grid by reading data from excel sheet row "<Spreadsheet Row>"
      | name           | value          |
      | Sales Group    | Sales Group    |
      | Sales Type     | Sales Type     |
      | Sales Category | Sales Category |
      | Currency       | Currency Type  |

    And I verify the following fields value on editable page
      | name                     | value |
      | Sales_CodeCurrencyTypeID | CAD   |


    Examples:
      | Login User   | Login full username  | Item     | Entity Name       | Spreadsheet Row |
      | DeleteAccess | Delete Access Access | Contract | Selenium-Contract | 5               |

  Scenario Outline: As a delete user I download the file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Import Data" link
    And I click on the "Spreadsheets"
    And I download following file
      | Sales |

    Examples:s
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

