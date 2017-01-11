@all
Feature: Allowances Spreadsheet - Create/Update (Ref : Jira Ticket No : AUTOMATION-1185)

  Scenario Outline: I import the  Spreadsheet Import-Contract entity and AllowancesLL
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/"
    And I import following file name:
      | Spreadsheet_Import__Contract.xml |
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Allowances/"
    And I import following file name:
      | AllowancesLL_1185.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I Allowances Spreadsheet - Create/Update
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Allowances/"
    And I import following file name:
      | CreateAllowances_1185.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "Allowance" under column header "Group"
      | name          | value      |
      | Group         | Allowance  |
      | Type          | Cash       |
      | Begin Date    | 01/01/2016 |
      | End Date      | 12/31/2016 |
      | Total Amount  | $1,000.00  |
      | Currency Type | USD        |
    And I verify the following fields value on editable page
      | name            | value                         |
      | Allowance_Notes | This is to create Allowance A |
    And I extract Allowance RecID
    And I verify a row from grid "<grid>" having unique value "Allownace Group" under column header "Group"
      | name          | value           |
      | Group         | Allownace Group |
      | Type          | LL Contribution |
      | Begin Date    | 03/01/2016      |
      | End Date      | 08/31/2016      |
      | Total Amount  | $2,000.00       |
      | Currency Type | USD             |
    And I verify the following fields value on editable page
      | name            | value                         |
      | Allowance_Notes | This is to create Allowance B |
    And I switch to default frame

    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Allowances/UpdateAllowance_1185.xlsx"
    And I set cell value in spread sheet row "6" under header "Allowance RecID" of column index "3"
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Allowances/"
    And I import following file name:
      | UpdateAllowance_1185.xlsx |


    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "Allowance B" under column header "Group"
      | name          | value       |
      | Group         | Allowance B |
      | Type          | Credit      |
      | Begin Date    | 01/01/2015  |
      | End Date      | 12/31/2015  |
      | Total Amount  | $9,000.00   |
      | Currency Type | USD         |
    And I verify the following fields value on editable page
      | name                             | value                         |
      | Allowance_Notes                  | This is to update Allowance A |
      | Allowance_CodeAllowanceGroupID   | Allowance B                   |
      | Allowance_CodeAllowanceTypeID    | Credit                        |
      | Allowance_TotalAmount            | $9,000.00                     |
      | Allowance_BeginDate              | 01/01/2015                    |
      | Allowance_EndDate                | 12/31/2015                    |
      | Allowance_CodeCurrencyTypeID     | USD                           |
      | Allowance_RentableArea           | 500                           |
      | Allowance_CodeBuildingAreaUnitID | Square Feet                   |
      | Allowance_CovenantID             | <SELECT>                      |
      | Allowance_AmendmentID            | [SELECT]                      |
      | Allowance_Section                | Section A- Updated            |
    And I verify a row from grid "<grid>" having unique value "Allownace Group" under column header "Group"
      | name          | value           |
      | Group         | Allownace Group |
      | Type          | LL Contribution |
      | Begin Date    | 03/01/2016      |
      | End Date      | 08/31/2016      |
      | Total Amount  | $2,000.00       |
      | Currency Type | USD             |
    And I verify the following fields value on editable page
      | name            | value                         |
      | Allowance_Notes | This is to create Allowance B |
    And I switch to default frame

  Examples:
    | Entity Name                               | Secondary Tab | Third Level Tab | grid    |
    | Spreadsheet Import-Contract-Testing-15278 | Payment Info  | Allowances      | thisDiv |

#@all
#Feature: (Jira Ref: AUTOMATION-393) I create and update allowances and verify them in Contract> Payment Info> Allowances page
#
##  Background:
###    Given I login to IWMS using LxAdmin credentials
##    Given I Login to IWMS using "DeleteAccess" access credentials
#
#  Scenario Outline: I create allowances through spreadsheet import
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Allowances/"
#    And I import following file name:
#      | Create_Allowance.xls |
#
##    When I navigate to "<Item>, <Secondary Tab>"
##    And I click on the "Allowances" tab
##    And I expand portfolio navigation tab
##    And I click on the "<Contract>" on the page button
#
##    When I navigate to "<Item>, <Second Level Tab>"
##    And I navigate to entity "<Entity Name>"
##    And I click on the "<Third Level Tab>" tab
#
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I select last row from the grid "<Grid ID>"
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Allowances/Create_Allowance.xls"
#    Then I verify in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#      | name  | value                          |
#      | Group | Allowance.CodeAllowanceGroupID |
#
#  Examples:
#    | Item     | Second Level Tab | Third Level Tab | Entity Name       | Grid ID | Spreadsheet Row | Grid Row |
#    | Contract | Payment Info          | Allowances         | Selenium-Contract | thisDiv | 6               | 3        |
#
#  Scenario Outline: I update allowances through spreadsheet import
#    Given I Login to IWMS using "EditAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Allowances/"
#    And I import following file name:
#      | Update_Allowance.xls |
#
##    When I navigate to "<Item>, <Secondary Tab>"
##    And I click on the "<Third Level Tab>" tab
##    And I click on the "<Contract>" on the page button
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I collapse portfolio navigation tab
#    And I select last row from the grid "<Grid ID>"
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Allowances/Update_Allowance.xls"
#    And I click in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#      | name  | value                          |
#      | Group | Allowance.CodeAllowanceGroupID |
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Allowances/Update_Allowance.xls"
#    Then I compare attribute value on editable page by reading data from spread sheet row "<Spreadsheet Row>"
#      | name                  | value                 |
#      | Allowance_TotalAmount | Allowance.TotalAmount |
#      | Allowance_Notes       | Allowance.Notes       |
#
#
##  Examples:
##    | Item     | Secondary Tab |Third Level Tab| Contract          | Grid ID | Spreadsheet Row | Grid Row |
##    | Contract | Payment Info  | Allowances|Selenium-Contract | thisDiv | 6               | 3        |
#  Examples:
#    | Item     | Second Level Tab | Third Level Tab | Entity Name       | Grid ID | Spreadsheet Row | Grid Row |
#    | Contract | Payment Info          | Allowances         | Selenium-Contract | thisDiv | 6               | 3        |
#
#
