@all
Feature: (Jira Ref: AUTOMATION-395) I create and update percentage rent and verify them in Contract> Payment Info> Percentage Rent page

  Scenario Outline: I create percentage rent through spreadsheet import
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
      | Create_Percentage_Rent.xls |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Create_Percentage_Rent.xls"
    Then I verify a row from grid "<Grid ID>" by reading data from excel sheet row "<Spreadsheet Row>"
      | name                | value                                   |
      | Sales Group         | PercentageRent.CodeSalesGroupID         |
      | Description         | PercentageRent.Description              |
      | Calculation Method  | PercentageRent.CodePercentageRentTypeID |
      | Payment Frequency   | PercentageRent.CodeBillingFrequencyID   |
      | Reporting Frequency | PercentageRent.CodeReportingFrequencyID |
      | Begin Date          | PercentageRent.BeginDate                |
      | End Date            | PercentageRent.EndDate                  |
    And I click on line item from grid "<Grid ID>" exist in frame by reading data from excel sheet row "<Spreadsheet Row>"
      | name                | value                                   |
      | Sales Group         | PercentageRent.CodeSalesGroupID         |
      | Description         | PercentageRent.Description              |
      | Calculation Method  | PercentageRent.CodePercentageRentTypeID |
      | Payment Frequency   | PercentageRent.CodeBillingFrequencyID   |
      | Reporting Frequency | PercentageRent.CodeReportingFrequencyID |
      | Begin Date          | PercentageRent.BeginDate                |
      | End Date            | PercentageRent.EndDate                  |
    Then I compare attribute value on editable page by reading data from spread sheet row "<Spreadsheet Row>"
      | name                                | value                               |
      | PercentageRent_Notes                | PercentageRent.Notes                |
      | PercentageRent_AnnualPaymentDueDays | PercentageRent.AnnualPaymentDueDays |
      | PercentageRent_AnnualReportDueDays  | PercentageRent.AnnualReportDueDays  |

    Examples:
      | Item     | Second Level Tab | Third Level Tab | Entity Name       | Spreadsheet Row | Grid ID | Login User   | Login full username  |
      | Contract | Payment Info     | Percentage Rent | Selenium-Contract | 6               | thisDiv | DeleteAccess | Delete Access Access |

  Scenario Outline: I update percentage rent through spreadsheet import
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
      | Update_Precentage_Rent.xls |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Update_Precentage_Rent.xls"
    Then I verify a row from grid "<Grid ID>" by reading data from excel sheet row "<Spreadsheet Row>"
      | name                | value                                   |
      | Sales Group         | PercentageRent.CodeSalesGroupID         |
      | Description         | PercentageRent.Description              |
      | Calculation Method  | PercentageRent.CodePercentageRentTypeID |
      | Payment Frequency   | PercentageRent.CodeBillingFrequencyID   |
      | Reporting Frequency | PercentageRent.CodeReportingFrequencyID |
      | Begin Date          | PercentageRent.BeginDate                |
      | End Date            | PercentageRent.EndDate                  |
    And I click on line item from grid "<Grid ID>" exist in frame by reading data from excel sheet row "<Spreadsheet Row>"
      | name                | value                                   |
      | Sales Group         | PercentageRent.CodeSalesGroupID         |
      | Description         | PercentageRent.Description              |
      | Calculation Method  | PercentageRent.CodePercentageRentTypeID |
      | Payment Frequency   | PercentageRent.CodeBillingFrequencyID   |
      | Reporting Frequency | PercentageRent.CodeReportingFrequencyID |
      | Begin Date          | PercentageRent.BeginDate                |
      | End Date            | PercentageRent.EndDate                  |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Update_Precentage_Rent.xls"
    Then I compare attribute value on editable page by reading data from spread sheet row "<Spreadsheet Row>"
      | name                                | value                               |
      | PercentageRent_Notes                | PercentageRent.Notes                |
      | PercentageRent_AnnualPaymentDueDays | PercentageRent.AnnualPaymentDueDays |
      | PercentageRent_AnnualReportDueDays  | PercentageRent.AnnualReportDueDays  |
    And I logout

    Examples:
      | Login User | Login full username | Item     | Second Level Tab | Third Level Tab | Entity Name       | Spreadsheet Row | Grid ID |
      | EditAccess | Edit Access Access  | Contract | Payment Info     | Percentage Rent | Selenium-Contract | 6               | thisDiv |
