@all
Feature: Percentage Rent Spreadsheet - Create/Update (Ref : Jira Ticket No : AUTOMATION-1187)

  Scenario Outline: I import the  Spreadsheet Import-Contract entity and  Percentage Rent Layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/"
    And I import following file name:
      | Spreadsheet_Import__Contract.xml |
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
      | PercentageRentLayout_1187.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I Percentage Rent Breakpoint - Create/Update
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
      | CreatePercentageRent_1187.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "02/21/2015" under column header "Begin Date"
      | name                | value                               |
      | Begin Date          | 02/21/2015                          |
      | End Date            | 07/01/2016                          |
      | Sales Group         | Internal Sales                      |
      | Description         | This is to create a Percentage Rate |
      | Calculation Method  |                                     |
      | Payment Frequency   | Monthly                             |
      | Reporting Frequency | Annually                            |

    And I verify the following fields value on editable page
      | name                                    | value                               |
      | PercentageRent_CodeSalesGroupID         | Internal Sales                      |
      | PercentageRent_Description              | This is to create a Percentage Rate |
      | PercentageRent_RentYearStartMonth       | <Month>                             |
      | PercentageRent_BeginDate                | 02/21/2015                          |
      | PercentageRent_EndDate                  | 07/01/2016                          |
      | _checkbox_PercentageRent_IsPartialTerm  | false                               |
      | _checkbox_PercentageRent_AuditRightFlag | false                               |
      | PercentageRent_CodeBillingFrequencyID   | Monthly                             |
      | PercentageRent_PeriodPaymentDueDays     | 1                                   |
      | PercentageRent_AnnualPaymentDueDays     | 1                                   |
      | PercentageRent_CodeReportingFrequencyID | Annually                            |
      | PercentageRent_PeriodReportDueDays      | 2                                   |
      | PercentageRent_AnnualReportDueDay       | 1                                   |
      | PercentageRent_CodeExpenseGroupID       | Base Rent                           |
      | PercentageRent_CodeExpenseTypeID        | Base Rent                           |
      | PercentageRent_CodeCurrencyTypeID       | USD                                 |
      | PercentageRent_CodeCapFrequencyID       | Monthly                             |
      | PercentageRent_FloorAmount              | $100.00                             |
      | PercentageRent_CapAmount                | $6,500.00                           |
      | PercentageRent_CodePercentageRentTypeID | [SELECT]                            |
      | PercentageRent_Notes                    | Create                              |
      | PercentageRent_CovenantID               | <SELECT>                            |
      | PercentageRent_Section                  | Test                                |
      | PercentageRent_AmendmentID              | [SELECT]                            |
    And I verify the Natural Breakpoint is false
    And I verify the Artificial Breakpoint is true

    And I verify a row from grid "<grid>" having unique value "02/01/2015" under column header "Begin Date"
      | name                | value                               |
      | Begin Date          | 02/01/2015                          |
      | End Date            | 07/01/2016                          |
      | Sales Group         | Sales                               |
      | Description         | This is to create a Percentage Rate |
      | Calculation Method  |                                     |
      | Payment Frequency   | Monthly                             |
      | Reporting Frequency | Monthly                             |

    And I verify the following fields value on editable page
      | name                                    | value                               |
      | PercentageRent_CodeSalesGroupID         | Sales                               |
      | PercentageRent_Description              | This is to create a Percentage Rate |
      | PercentageRent_RentYearStartMonth       | <Month>                             |
      | PercentageRent_BeginDate                | 02/01/2015                          |
      | PercentageRent_EndDate                  | 07/01/2016                          |
      | _checkbox_PercentageRent_IsPartialTerm  | false                               |
      | _checkbox_PercentageRent_AuditRightFlag | false                               |
      | PercentageRent_CodeBillingFrequencyID   | Monthly                             |
      | PercentageRent_PeriodPaymentDueDays     | 1                                   |
      | PercentageRent_AnnualPaymentDueDays     | 1                                   |
      | PercentageRent_CodeReportingFrequencyID | Monthly                             |
      | PercentageRent_PeriodReportDueDays      | 2                                   |
      | PercentageRent_AnnualReportDueDay       | 1                                   |
      | PercentageRent_CodeExpenseGroupID       | CAM                                 |
      | PercentageRent_CodeExpenseTypeID        | CAM                                 |
      | PercentageRent_CodeCurrencyTypeID       | USD                                 |
      | PercentageRent_CodeCapFrequencyID       | Monthly                             |
      | PercentageRent_FloorAmount              | $100.00                             |
      | PercentageRent_CapAmount                | $6,500.00                           |
      | PercentageRent_CodePercentageRentTypeID | [SELECT]                            |
      | PercentageRent_Notes                    | Create                              |
      | PercentageRent_CovenantID               | <SELECT>                            |
      | PercentageRent_Section                  | Test                                |
      | PercentageRent_AmendmentID              | [SELECT]                            |
    And I verify the Natural Breakpoint is false
    And I verify the Artificial Breakpoint is true
    And I verify a row from grid "<grid>" having unique value "02/21/2015" under column header "Begin Date" and extract value "Percentage Rent RecID"
    And I switch to default frame

    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/UpdatePercentageRent_1187.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"

    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
      | UpdatePercentageRent_1187.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "03/03/2015" under column header "Begin Date"
      | name                | value                               |
      | Begin Date          | 03/03/2015                          |
      | End Date            | 08/01/2016                          |
      | Sales Group         | Internal Sales                      |
      | Description         | This is to Update a Percentage Rate |
      | Calculation Method  |                                     |
      | Payment Frequency   | None                                |
      | Reporting Frequency | Monthly                             |

    And I verify the following fields value on editable page
      | name                                    | value                               |
      | PercentageRent_CodeSalesGroupID         | Internal Sales                      |
      | PercentageRent_Description              | This is to Update a Percentage Rate |
      | PercentageRent_RentYearStartMonth       | <Month>                             |
      | PercentageRent_BeginDate                | 03/03/2015                          |
      | PercentageRent_EndDate                  | 08/01/2016                          |
      | _checkbox_PercentageRent_IsPartialTerm  | false                               |
      | _checkbox_PercentageRent_AuditRightFlag | false                               |
      | PercentageRent_CodeBillingFrequencyID   | None                                |
      | PercentageRent_PeriodPaymentDueDays     | 1                                   |
      | PercentageRent_AnnualPaymentDueDays     | 100                                 |
      | PercentageRent_CodeReportingFrequencyID | Monthly                             |
      | PercentageRent_PeriodReportDueDays      | 2                                   |
      | PercentageRent_AnnualReportDueDay       | 100                                 |
      | PercentageRent_CodeExpenseGroupID       | Rent                                |
      | PercentageRent_CodeExpenseTypeID        | Base Rent                           |
      | PercentageRent_CodeCurrencyTypeID       | AUD                                 |
      | PercentageRent_CodeCapFrequencyID       | None                                |
      | PercentageRent_FloorAmount              | $210,000.00                         |
      | PercentageRent_CapAmount                | $100,000.00                         |
      | PercentageRent_CodePercentageRentTypeID | [SELECT]                            |
      | PercentageRent_Notes                    | Update                              |
      | PercentageRent_CovenantID               | <SELECT>                            |
      | PercentageRent_Section                  | Update                              |
      | PercentageRent_AmendmentID              | [SELECT]                            |
    And I verify the Natural Breakpoint is false
    And I verify the Artificial Breakpoint is true

    And I verify a row from grid "<grid>" having unique value "02/01/2015" under column header "Begin Date"
      | name                | value                               |
      | Begin Date          | 02/01/2015                          |
      | End Date            | 07/01/2016                          |
      | Sales Group         | Sales                               |
      | Description         | This is to create a Percentage Rate |
      | Calculation Method  |                                     |
      | Payment Frequency   | Monthly                             |
      | Reporting Frequency | Monthly                             |

    And I verify the following fields value on editable page
      | name                                    | value                               |
      | PercentageRent_CodeSalesGroupID         | Sales                               |
      | PercentageRent_Description              | This is to create a Percentage Rate |
      | PercentageRent_RentYearStartMonth       | <Month>                             |
      | PercentageRent_BeginDate                | 02/01/2015                          |
      | PercentageRent_EndDate                  | 07/01/2016                          |
      | _checkbox_PercentageRent_IsPartialTerm  | false                               |
      | _checkbox_PercentageRent_AuditRightFlag | false                               |
      | PercentageRent_CodeBillingFrequencyID   | Monthly                             |
      | PercentageRent_PeriodPaymentDueDays     | 1                                   |
      | PercentageRent_AnnualPaymentDueDays     | 1                                   |
      | PercentageRent_CodeReportingFrequencyID | Monthly                             |
      | PercentageRent_PeriodReportDueDays      | 2                                   |
      | PercentageRent_AnnualReportDueDay       | 1                                   |
      | PercentageRent_CodeExpenseGroupID       | CAM                                 |
      | PercentageRent_CodeExpenseTypeID        | CAM                                 |
      | PercentageRent_CodeCurrencyTypeID       | USD                                 |
      | PercentageRent_CodeCapFrequencyID       | Monthly                             |
      | PercentageRent_FloorAmount              | $100.00                             |
      | PercentageRent_CapAmount                | $6,500.00                           |
      | PercentageRent_CodePercentageRentTypeID | [SELECT]                            |
      | PercentageRent_Notes                    | Create                              |
      | PercentageRent_CovenantID               | <SELECT>                            |
      | PercentageRent_Section                  | Test                                |
      | PercentageRent_AmendmentID              | [SELECT]                            |
    And I switch to default frame

  Examples:
    | Entity Name                               | Secondary Tab | Third Level Tab | grid    |
    | Spreadsheet Import-Contract-Testing-15278 | Payment Info  | Percentage Rent | thisDiv |

#@all
#Feature: (Jira Ref: AUTOMATION-396) I create and update percentage rent breakpoint and verify them in Contract> Payment Info> Percentage Rent page
#
#  Scenario Outline: I create percentage rent breakpoint through spreadsheet import
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
#    And I import following file name:
#      | SalesGroup-396.xml             |
#      | Create_Percentage_Rent-396.xls |
#      | Create_PRBreakpoint.xls        |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Create_Percentage_Rent-396.xls"
#    And I click on line item from grid "thisDiv" exist in frame by reading data from excel sheet row "<Spreadsheet Row>"
#      | name                | value                                   |
#      | Sales Group         | PercentageRent.CodeSalesGroupID         |
#      | Description         | PercentageRent.Description              |
#      | Calculation Method  | PercentageRent.CodePercentageRentTypeID |
#      | Payment Frequency   | PercentageRent.CodeBillingFrequencyID   |
#      | Reporting Frequency | PercentageRent.CodeReportingFrequencyID |
#      | Begin Date          | PercentageRent.BeginDate                |
#      | End Date            | PercentageRent.EndDate                  |
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Create_PRBreakpoint.xls"
#    And I click "edit" row action in the grid "<Grid ID>" having the following header and cell values by reading data from spreadsheet row "<Spreadsheet Row>"
#      | name        | value                                     |
#      | Begin Date  | PercentageRentBreakpoint.BeginDate        |
#      | End Date    | PercentageRentBreakpoint.EndDate          |
#      | Sales Group | PercentageRentBreakpoint.CodeSalesGroupID |
#      | Notes       | PercentageRentBreakpoint.Notes            |
#    And I switch to default frame
#    And I see the "Edit Percentage Rent Breakpoint  ***Required fields in red" modal window
#    Then I compare value on popup editable page by reading data from spread sheet row "<Spreadsheet Row>"
#      | name                                       | value                                      |
#      | PercentageRentBreakpoint_BreakpointAmount1 | PercentageRentBreakpoint.BreakpointAmount1 |
#      | PercentageRentBreakpoint_BreakpointRate1   | PercentageRentBreakpoint.BreakpointRate1   |
#
#    And I click on the "Cancel" button
#
#    Examples:
#      | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name       | Spreadsheet Row | Grid ID                        |
#      | DeleteAccess | Delete Access Access | Contract | Payment Info     | Percentage Rent | Selenium-Contract | 6               | BOGridPercentageRentBreakpoint |
#
#  Scenario Outline: I update percentage rent breakpoint through spreadsheet import
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
#    And I import following file name:
#      | Update_PRBreakpoint.xls |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Create_Percentage_Rent-396.xls"
#    And I click on line item from grid "thisDiv" exist in frame by reading data from excel sheet row "<Spreadsheet Row>"
#      | name                | value                                   |
#      | Sales Group         | PercentageRent.CodeSalesGroupID         |
#      | Description         | PercentageRent.Description              |
#      | Calculation Method  | PercentageRent.CodePercentageRentTypeID |
#      | Payment Frequency   | PercentageRent.CodeBillingFrequencyID   |
#      | Reporting Frequency | PercentageRent.CodeReportingFrequencyID |
#      | Begin Date          | PercentageRent.BeginDate                |
#      | End Date            | PercentageRent.EndDate                  |
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Update_PRBreakpoint.xls"
#    And I click "edit" row action in the grid "<Grid ID>" having the following header and cell values by reading data from spreadsheet row "<Spreadsheet Row>"
#      | name        | value                                     |
#      | Begin Date  | PercentageRentBreakpoint.BeginDate        |
#      | End Date    | PercentageRentBreakpoint.EndDate          |
#      | Sales Group | PercentageRentBreakpoint.CodeSalesGroupID |
#      | Notes       | PercentageRentBreakpoint.Notes            |
#    And I switch to default frame
#    And I see the "Edit Percentage Rent Breakpoint  ***Required fields in red" modal window
#    Then I compare value on popup editable page by reading data from spread sheet row "<Spreadsheet Row>"
#      | name                                       | value                                      |
#      | PercentageRentBreakpoint_BreakpointAmount1 | PercentageRentBreakpoint.BreakpointAmount1 |
#      | PercentageRentBreakpoint_BreakpointRate1   | PercentageRentBreakpoint.BreakpointRate1   |
#      | PercentageRentBreakpoint_BreakpointAmount2 | PercentageRentBreakpoint.BreakpointAmount2 |
#      | PercentageRentBreakpoint_BreakpointRate2   | PercentageRentBreakpoint.BreakpointRate2   |
#      | PercentageRentBreakpoint_Description       | PercentageRentBreakpoint.Description       |
#    And I click on the "Cancel" button
#    And I logout
#
#    Examples:
#      | Login User | Login full username | Item     | Second Level Tab | Third Level Tab | Entity Name       | Spreadsheet Row | Grid ID                        | Grid Row |
#      | EditAccess | Edit Access Access  | Contract | Payment Info     | Percentage Rent | Selenium-Contract | 6               | BOGridPercentageRentBreakpoint | 2        |
