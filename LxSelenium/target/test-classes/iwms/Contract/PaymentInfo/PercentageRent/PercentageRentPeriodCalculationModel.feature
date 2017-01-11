@all
Feature: I verify the Percentage Rent - Period Calculation Model (Jira Ref : AUTOMATION-639)

  Scenario Outline: As a delete user I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
      | PRCalculationMethods.xml |

    Examples:
      | Login User   |
      | DeleteAccess |

  Scenario Outline: I Percentage Rent - Period Calculation Model: Payment Frequency : Annual, Calculation Method : Annual
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I set list fields values on editable page
      | name                                    | value    |
      | PercentageRent_CodeBillingFrequencyID_  | Annually |
      | PercentageRent_CodePercentageRentTypeID | Annual   |
    And I click on the "Save Changes" action panel button
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "January" month and "2012" year from dropdown in schedule details to view the details
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/CalculationModelExamples.xlsx"
    And I verify the grid "<Grid ID>" values with the corresponding values in the "<Spreadsheet Name>" excel <Spreadsheet No>
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name            | Percentage Rent page                | Grid ID                  | Spreadsheet Name | Spreadsheet No | Grid title                    |
      | Contract | Payment Info     | Percentage Rent | PR Calculation methods | Percentage Rent (Multi BP) Schedule | BOGridVirtualSalesPeriod | Annual           | 0              | Contract Percentage Rent List |


  Scenario Outline: I Percentage Rent - Period Calculation Model: Payment Frequency :  Monthly, Calculation Method : Per Period
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I set list fields values on editable page
      | name                                    | value      |
      | PercentageRent_CodeBillingFrequencyID_  | Monthly    |
      | PercentageRent_CodePercentageRentTypeID | Per Period |
    And I click on the "Save Changes" action panel button
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "January" month and "2012" year from dropdown in schedule details to view the details
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/CalculationModelExamples.xlsx"
    And I verify the grid "<Grid ID>" values with the corresponding values in the "<Spreadsheet Name>" excel <Spreadsheet No>
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name            | Percentage Rent page                | Grid ID                  | Spreadsheet Name    | Spreadsheet No | Grid title                    |
      | Contract | Payment Info     | Percentage Rent | PR Calculation methods | Percentage Rent (Multi BP) Schedule | BOGridVirtualSalesPeriod | Period - Paid Mthly | 1              | Contract Percentage Rent List |


  Scenario Outline: I Percentage Rent - Period Calculation Model: Payment Frequency :  Quarterly, Calculation Method : Per Period
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I set list fields values on editable page
      | name                                    | value      |
      | PercentageRent_CodeBillingFrequencyID_  | Quarterly  |
      | PercentageRent_CodePercentageRentTypeID | Per Period |
    And I click on the "Save Changes" action panel button
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "January" month and "2012" year from dropdown in schedule details to view the details
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/CalculationModelExamples.xlsx"
    And I verify the grid "<Grid ID>" values with the corresponding values in the "<Spreadsheet Name>" excel <Spreadsheet No>
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name            | Percentage Rent page                | Grid ID                  | Spreadsheet Name    | Spreadsheet No | Grid title                    |
      | Contract | Payment Info     | Percentage Rent | PR Calculation methods | Percentage Rent (Multi BP) Schedule | BOGridVirtualSalesPeriod | Period - Paid Qtrly | 2              | Contract Percentage Rent List |


  Scenario Outline: I Percentage Rent - Period Calculation Model: Payment Frequency :  Monthly, Calculation Method : Period Gross Up
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I set list fields values on editable page
      | name                                    | value           |
      | PercentageRent_CodeBillingFrequencyID_  | Monthly         |
      | PercentageRent_CodePercentageRentTypeID | Period Gross-up |
    And I click on the "Save Changes" action panel button
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "<month>" month and "<year>" year from dropdown in schedule details to view the details
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/CalculationModelExamples.xlsx"
    And I verify the grid "<Grid ID>" values with the corresponding values in the "<Spreadsheet Name>" excel <Spreadsheet No>
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name            | Percentage Rent page                | Grid ID                  | Spreadsheet Name          | Spreadsheet No | Grid title                    | month   | year |
      | Contract | Payment Info     | Percentage Rent | PR Calculation methods | Percentage Rent (Multi BP) Schedule | BOGridVirtualSalesPeriod | Per Gross-up - Paid Mthly | 3              | Contract Percentage Rent List | January | 2012 |


  Scenario Outline: I Percentage Rent - Period Calculation Model: Payment Frequency :  Quarterly, Calculation Method : Period Gross Up
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I set list fields values on editable page
      | name                                    | value           |
      | PercentageRent_CodeBillingFrequencyID_  | Quarterly       |
      | PercentageRent_CodePercentageRentTypeID | Period Gross-up |
    And I click on the "Save Changes" action panel button
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "<month>" month and "<year>" year from dropdown in schedule details to view the details
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/CalculationModelExamples.xlsx"
    And I verify the grid "<Grid ID>" values with the corresponding values in the "<Spreadsheet Name>" excel <Spreadsheet No>
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name            | Percentage Rent page                | Grid ID                  | Spreadsheet Name          | Spreadsheet No | Grid title                    | month   | year |
      | Contract | Payment Info     | Percentage Rent | PR Calculation methods | Percentage Rent (Multi BP) Schedule | BOGridVirtualSalesPeriod | Per Gross-up - Paid Qtrly | 4              | Contract Percentage Rent List | January | 2012 |

  Scenario Outline: I Percentage Rent - Period Calculation Model: Payment Frequency :  Monthly, Calculation Method : Annual Gross Up
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I set list fields values on editable page
      | name                                    | value           |
      | PercentageRent_CodeBillingFrequencyID_  | Monthly         |
#      | PercentageRent_CodePercentageRentTypeID | Annual Gross Up |
      | PercentageRent_CodePercentageRentTypeID | Annual Gross-up |
    And I click on the "Save Changes" action panel button
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "<month>" month and "<year>" year from dropdown in schedule details to view the details
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/CalculationModelExamples.xlsx"
    And I verify the grid "<Grid ID>" values with the corresponding values in the "<Spreadsheet Name>" excel <Spreadsheet No>
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name            | Percentage Rent page                | Grid ID                  | Spreadsheet Name          | Spreadsheet No | Grid title                    | month   | year |
      | Contract | Payment Info     | Percentage Rent | PR Calculation methods | Percentage Rent (Multi BP) Schedule | BOGridVirtualSalesPeriod | Ann Gross-up - Paid Mthly | 5              | Contract Percentage Rent List | January | 2012 |

  Scenario Outline: I Percentage Rent - Period Calculation Model: Payment Frequency :  Quarterly, Calculation Method : Annual Gross Up
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I set list fields values on editable page
      | name                                    | value           |
      | PercentageRent_CodeBillingFrequencyID_  | Quarterly       |
#      | PercentageRent_CodePercentageRentTypeID | Annual Gross Up |
      | PercentageRent_CodePercentageRentTypeID | Annual Gross-up |
    And I click on the "Save Changes" action panel button
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "<month>" month and "<year>" year from dropdown in schedule details to view the details
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/CalculationModelExamples.xlsx"
    And I verify the grid "<Grid ID>" values with the corresponding values in the "<Spreadsheet Name>" excel <Spreadsheet No>
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name            | Percentage Rent page                | Grid ID                  | Spreadsheet Name          | Spreadsheet No | Grid title                    | month   | year |
      | Contract | Payment Info     | Percentage Rent | PR Calculation methods | Percentage Rent (Multi BP) Schedule | BOGridVirtualSalesPeriod | Ann Gross-up - Paid Qtrly | 6              | Contract Percentage Rent List | January | 2012 |

  Scenario Outline: I Percentage Rent - Period Calculation Model: Payment Frequency :  Monthly, Calculation Method : Cumulative
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I set list fields values on editable page
      | name                                    | value      |
      | PercentageRent_CodeBillingFrequencyID_  | Monthly    |
      | PercentageRent_CodePercentageRentTypeID | Cumulative |
    And I click on the "Save Changes" action panel button
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "<month>" month and "<year>" year from dropdown in schedule details to view the details
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/CalculationModelExamples.xlsx"
    And I verify the grid "<Grid ID>" values with the corresponding values in the "<Spreadsheet Name>" excel <Spreadsheet No>
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name            | Percentage Rent page                | Grid ID                  | Spreadsheet Name        | Spreadsheet No | Grid title                    | month   | year |
      | Contract | Payment Info     | Percentage Rent | PR Calculation methods | Percentage Rent (Multi BP) Schedule | BOGridVirtualSalesPeriod | Cumulative - Paid Mthly | 7              | Contract Percentage Rent List | January | 2012 |


  Scenario Outline: I Percentage Rent - Period Calculation Model: Payment Frequency :  Quarterly, Calculation Method : Cumulative
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "<Grid title>" after navigation
    And I set list fields values on editable page
      | name                                    | value      |
      | PercentageRent_CodeBillingFrequencyID_  | Quarterly  |
      | PercentageRent_CodePercentageRentTypeID | Cumulative |
    And I click on the "Save Changes" action panel button
    And I select "<Percentage Rent page>" from Page dropdown
    And I select "<month>" month and "<year>" year from dropdown in schedule details to view the details
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/CalculationModelExamples.xlsx"
    And I verify the grid "<Grid ID>" values with the corresponding values in the "<Spreadsheet Name>" excel <Spreadsheet No>
    And I switch to default frame

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name            | Percentage Rent page                | Grid ID                  | Spreadsheet Name        | Spreadsheet No | Grid title                    | month   | year |
      | Contract | Payment Info     | Percentage Rent | PR Calculation methods | Percentage Rent (Multi BP) Schedule | BOGridVirtualSalesPeriod | Cumulative - Paid Qtrly | 8              | Contract Percentage Rent List | January | 2012 |