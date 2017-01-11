@all
Feature: Percentage Rent Breakpoint - Create/Update (Ref : Jira Ticket No : AUTOMATION-1188)

  Scenario Outline: I import the  PercentageRentBP_Testing_8470 entity and  Percentage Rent Layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following files:
      | PercentageRentBP_Testing_8470_1188.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I Percentage Rent Breakpoint - Create
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following files:
      | PercentageRentBreakpointCreateSS_1188.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "01/01/2050" under column header "End Date"
      | name                | value      |
      | Begin Date          | 01/01/2010 |
      | End Date            | 01/01/2050 |
      | Sales Group         | Sales      |
      | Description         | Sales      |
      | Calculation Method  |            |
      | Payment Frequency   | Annually   |
      | Reporting Frequency | Annually   |
    And I click on "edit" row action in the grid "BOGridPercentageRentBreakpoint" having the following header "Begin Date" and cell value "01/01/2010"
      | name                  | value              |
      | Begin Date            | 01/01/2010         |
      | End Date              | 12/31/2019         |
      | Sales Group           | Sales              |
      | Portioned Sales Group |                    |
      | Natural Rate          |                    |
      | Breakpoint Amount #1  | $200,000.00        |
      | Breakpoint Rate #1    | 10.00000%          |
      | Breakpoint Amount #2  | $250,000.00        |
      | Breakpoint Rate #2    | 8.00000%           |
      | Breakpoint Amount #3  | $300,000.00        |
      | Breakpoint Rate #3    | 6.00000%           |
      | Notes                 | Created via Import |
    And I switch to default frame
    And I verify the following fields value on editable page
      | name                                       | value              |
      | PercentageRentBreakpoint_BreakpointAmount1 | $200,000.00        |
      | PercentageRentBreakpoint_BreakpointRate1   | 10.00000%          |
      | PercentageRentBreakpoint_BreakpointAmount2 | $250,000.00        |
      | PercentageRentBreakpoint_BreakpointRate2   | 8.00000%           |
      | PercentageRentBreakpoint_BreakpointAmount3 | $300,000.00        |
      | PercentageRentBreakpoint_BreakpointRate3   | 6.00000%           |
      | PercentageRentBreakpoint_BreakpointAmount4 | $350,000.00        |
      | PercentageRentBreakpoint_BreakpointRate4   | 5.00000%           |
      | PercentageRentBreakpoint_BreakpointAmount5 | $400,000.00        |
      | PercentageRentBreakpoint_BreakpointRate5   | 4.00000%           |
      | PercentageRentBreakpoint_BreakpointAmount6 | $450,000.00        |
      | PercentageRentBreakpoint_BreakpointRate6   | 3.00000%           |
      | PercentageRentBreakpoint_BreakpointAmount7 | $500,000.00        |
      | PercentageRentBreakpoint_BreakpointRate7   | 2.00000%           |
      | PercentageRentBreakpoint_BreakpointAmount8 | $550,000.00        |
      | PercentageRentBreakpoint_BreakpointRate8   | 1.00000%           |
      | PercentageRentBreakpoint_Notes             | Created via Import |
    And I click "Cancel" button
    And I switch to visible frame
    And I click on "edit" row action in the grid "BOGridPercentageRentBreakpoint" having the following header "Begin Date" and cell value "01/01/2020"
      | name                  | value              |
      | Begin Date            | 01/01/2020         |
      | End Date              | 12/31/2040         |
      | Sales Group           | Internal Sales     |
      | Portioned Sales Group | Sales              |
      | Natural Rate          |                    |
      | Breakpoint Amount #1  | $50,000.00         |
      | Breakpoint Rate #1    | 20.00000%          |
      | Breakpoint Amount #2  | $70,000.00         |
      | Breakpoint Rate #2    | 15.00000%          |
      | Breakpoint Amount #3  | $90,000.00         |
      | Breakpoint Rate #3    | 10.00000%          |
      | Notes                 | Created via Import |
    And I switch to default frame
    And I verify the following fields value on editable page
      | name                                     | value              |
      | PercentageRentBreakpoint_BreakpointRate1 | 20.00000%          |
      | PercentageRentBreakpoint_BreakpointRate2 | 15.00000%          |
      | PercentageRentBreakpoint_BreakpointRate3 | 10.00000%          |
      | PercentageRentBreakpoint_Notes           | Created via Import |

    And I click "Cancel" button
    And I wait for modal window to close

    Examples:
      | Entity Name                   | Secondary Tab | Third Level Tab | grid    |
      | PercentageRentBP-Testing-8470 | Payment Info  | Percentage Rent | thisDiv |

  Scenario Outline: I Percentage Rent Breakpoint - Update
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following files:
      | BPRecID_1188.xml |

    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Reports Grid ID>" having the following header and cell values
      | name        | value    |
      | Report Name | BP RecID |
    And I switch to "build layout" child window
    And I verify Name "PercentageRentBP-Testing-8470" and extract Percentage Rent Breakpoint RecID on report window
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/PercentageRentBreakpointUpdateSS_1188.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"
    And I switch to main window
    And I close report window
    And I wait for browser windows count to be equal to "1"
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following files:
      | PercentageRentBreakpointUpdateSS_1188.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "01/01/2050" under column header "End Date"
      | name                | value      |
      | Begin Date          | 01/01/2010 |
      | End Date            | 01/01/2050 |
      | Sales Group         | Sales      |
      | Description         | Sales      |
      | Calculation Method  |            |
      | Payment Frequency   | Annually   |
      | Reporting Frequency | Annually   |
    And I click on "edit" row action in the grid "BOGridPercentageRentBreakpoint" having the following header "Begin Date" and cell value "01/01/2011"
      | name                  | value              |
      | Begin Date            | 01/01/2011         |
      | End Date              | 12/15/2019         |
      | Sales Group           | Sales              |
      | Portioned Sales Group |                    |
      | Natural Rate          |                    |
      | Breakpoint Amount #1  | $100,000.00        |
      | Breakpoint Rate #1    | 12.00000%          |
      | Breakpoint Amount #2  | $150,000.00        |
      | Breakpoint Rate #2    | 11.00000%          |
      | Breakpoint Amount #3  | $200,000.00        |
      | Breakpoint Rate #3    | 10.00000%          |
      | Notes                 | Updated via Import |
    And I switch to default frame
    And I verify the following fields value on editable page
      | name                                               | value              |
      | PercentageRentBreakpoint_BreakpointAmount1         | $100,000.00        |
      | PercentageRentBreakpoint_BreakpointRate1           | 12.00000%          |
      | PercentageRentBreakpoint_BreakpointAmount2         | $150,000.00        |
      | PercentageRentBreakpoint_BreakpointRate2           | 11.00000%          |
      | PercentageRentBreakpoint_BreakpointAmount3         | $200,000.00        |
      | PercentageRentBreakpoint_BreakpointRate3           | 10.00000%          |
      | PercentageRentBreakpoint_BreakpointAmount4         | $250,000.00        |
      | PercentageRentBreakpoint_BreakpointRate4           | 9.00000%           |
      | PercentageRentBreakpoint_BreakpointAmount5         | $300,000.00        |
      | PercentageRentBreakpoint_BreakpointRate5           | 8.00000%           |
      | PercentageRentBreakpoint_BreakpointAmount6         | $350,000.00        |
      | PercentageRentBreakpoint_BreakpointRate6           | 7.00000%           |
      | PercentageRentBreakpoint_BreakpointAmount7         | $400,000.00        |
      | PercentageRentBreakpoint_BreakpointRate7           | 6.00000%           |
      | PercentageRentBreakpoint_BreakpointAmount8         | $450,000.00        |
      | PercentageRentBreakpoint_BreakpointRate8           | 5.00000%           |
      | PercentageRentBreakpoint_Notes                     | Updated via Import |
      | PercentageRentBreakpoint_CodeSalesGroupID          | Sales              |
      | PercentageRentBreakpoint_BeginDate                 | 01/01/2011         |
      | PercentageRentBreakpoint_EndDate                   | 12/15/2019         |
      | PercentageRentBreakpoint_CodePortionedSalesGroupID |                    |
      | PercentageRentBreakpoint_Description               | Update BP1         |
      | PercentageRentBreakpoint_NaturalBreakpointRate     |                    |

    And I click "Cancel" button
    And I switch to visible frame
    And I click on "edit" row action in the grid "BOGridPercentageRentBreakpoint" having the following header "Begin Date" and cell value "01/01/2020"
      | name                  | value              |
      | Begin Date            | 01/01/2020         |
      | End Date              | 12/31/2040         |
      | Sales Group           | Internal Sales     |
      | Portioned Sales Group | Sales              |
      | Natural Rate          |                    |
      | Breakpoint Amount #1  | $50,000.00         |
      | Breakpoint Rate #1    | 20.00000%          |
      | Breakpoint Amount #2  | $70,000.00         |
      | Breakpoint Rate #2    | 15.00000%          |
      | Breakpoint Amount #3  | $90,000.00         |
      | Breakpoint Rate #3    | 10.00000%          |
      | Notes                 | Created via Import |
    And I switch to default frame
    And I verify the following fields value on editable page
      | name                                     | value              |
      | PercentageRentBreakpoint_BreakpointRate1 | 20.00000%          |
      | PercentageRentBreakpoint_BreakpointRate2 | 15.00000%          |
      | PercentageRentBreakpoint_BreakpointRate3 | 10.00000%          |
      | PercentageRentBreakpoint_Notes           | Created via Import |

    And I click "Cancel" button
    And I switch to default frame

    Examples:
      | Entity Name                   | Secondary Tab | Third Level Tab | grid    | Reports Grid ID |
      | PercentageRentBP-Testing-8470 | Payment Info  | Percentage Rent | thisDiv | ^editBOGrid     |

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
