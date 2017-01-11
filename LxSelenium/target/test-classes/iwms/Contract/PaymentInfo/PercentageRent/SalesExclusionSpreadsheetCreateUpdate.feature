@all @smoke @smoke4Dot1
Feature: Sales Exclusion Spreadsheet - Create/update (Ref : Jira Ticket No : AUTOMATION-1182)

  Scenario Outline: I import the Sales Exclusion Contract entity and Sales Exclusion Rec ID report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
      | Sales_Exclusion_Contract_1182.xml  |
      | SalesExclusionRecIDReport_1182.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I Sales Exclusion Spreadsheet - Create and update
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
    And I import following file name:
      | CreateSalesExclusion_1182.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "Internal Sales" under column header "Sales Group"
      | name            | value                  |
      | Sales Group     | Internal Sales         |
      | Sales Type      | Retail Sales           |
      | Exclusion Group |                        |
      | Begin Date      | 01/01/2000             |
      | End Date        | 12/31/2015             |
      | Cap Percent     |                        |
      | Cap Amount      | $50,000.00             |
      | Notes           | Create Sales Exclusion |

    And I verify a row from grid "<grid>" having unique value "12/31/2016" under column header "End Date"
      | name            | value                  |
      | Sales Group     | Sales                  |
      | Sales Type      |                        |
      | Exclusion Group |                        |
      | Begin Date      | 01/01/2016             |
      | End Date        | 12/31/2030             |
      | Cap Percent     | 20.00000%              |
      | Cap Amount      |                        |
      | Notes           | Create Sales Exclusion |

    And I switch to default frame

    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Reports Grid ID>" having the following header and cell values
      | name        | value                         |
      | Report Name | Sales Exclusion Rec ID report |
    And I switch to "build layout" child window
    And I verify the Name "Sales Exclusion Contract",Sales Group "Internal Sales",Sales Type "Retail Sales" and extract Exclusion RecID from report window
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/UpdateSalesExclusion_1182.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"
    And I switch to main window
    And I close report window
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent"
    And I import following file name:
      | UpdateSalesExclusion_1182.xlsx |


    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "Retail Sales" under column header "Sales Type"
      | name            | value                  |
      | Sales Group     | Sales                  |
      | Sales Type      | Retail Sales           |
      | Exclusion Group |                        |
      | Begin Date      | 01/01/2002             |
      | End Date        | 12/31/2020             |
      | Cap Percent     |                        |
      | Cap Amount      | $90,000.00             |
      | Notes           | Update Sales Exclusion |

    And I verify a row from grid "<grid>" having unique value "End Date" under column header "12/31/2030"
      | name            | value                  |
      | Sales Group     | Sales                  |
      | Sales Type      |                        |
      | Exclusion Group |                        |
      | Begin Date      | 01/01/2016             |
      | End Date        | 12/31/2030             |
      | Cap Percent     | 20.00000%              |
      | Cap Amount      |                        |
      | Notes           | Create Sales Exclusion |
    And I switch to default frame

    Examples:
      | Entity Name              | Secondary Tab | Third Level Tab | grid                 | Reports Grid ID |
      | Sales Exclusion Contract | Payment Info  | Percentage Rent | BOGridSalesExclusion | ^editBOGrid     |


#@all
#Feature: (Jira Ref: AUTOMATION-390) I create and update sales exclusion and verify them in Contract> Payment Info> Percentage page
#
#  Scenario Outline: I create/update sales exclusion through spreadsheet import
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
#    And I import following file name:
#      | Create_Sales_exclusion_record.xls |
#    When I navigate to entity type "<Item>" named "<Contract>"
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Tertiary Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Create_Sales_exclusion_record.xls"
#    Then I verify in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#      | name        | value                           |
#      | Sales Group | SalesExclusion.CodeSalesGroupID |
#      | Sales Type  | SalesExclusion.CodeSalesTypeID  |
#      | Cap Amount  | SalesExclusion.CapAmount        |
#      | Notes       | SalesExclusion.Notes            |
#    Then I verify date values in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#      | name       | value                    |
#      | Begin Date | SalesExclusion.BeginDate |
#      | End Date   | SalesExclusion.EndDate   |
#    And I logout
#
#  Examples:
#    | Item     | Secondary Tab | Tertiary Tab    | Contract          | Grid ID              | Grid Row | Spreadsheet Row |
#    | Contract | Payment Info  | Percentage Rent | Selenium-Contract | BOGridSalesExclusion | 4        | 6               |
#
#  Scenario Outline: I update sales exclusion through spreadsheet import
#    Given I Login to IWMS using "EditAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/"
#    And I import following file name:
#      | Update_Sales_exclusion_record.xls |
#    When I navigate to entity type "<Item>" named "<Contract>"
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Tertiary Tab>" tab
#    And I collapse portfolio navigation tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/PercentageRent/Update_Sales_exclusion_record.xls"
#    Then I verify in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#      | name        | value                           |
#      | Sales Group | SalesExclusion.CodeSalesGroupID |
#      | Sales Type  | SalesExclusion.CodeSalesTypeID  |
#      | Cap Amount  | SalesExclusion.CapAmount        |
#      | Notes       | SalesExclusion.Notes            |
#
#    Then I verify date values in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#      | name       | value                    |
#      | Begin Date | SalesExclusion.BeginDate |
#      | End Date   | SalesExclusion.EndDate   |
#    And I logout
#
#  Examples:
#    | Item     | Secondary Tab | Tertiary Tab    | Contract          | Grid ID              | Grid Row | Spreadsheet Row |
#    | Contract | Payment Info  | Percentage Rent | Selenium-Contract | BOGridSalesExclusion | 4        | 6               |
#
