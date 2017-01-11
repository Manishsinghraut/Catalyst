@all
Feature: Sales Spreadsheet - Create/update (Ref : Jira Ticket No : AUTOMATION-1183)

  Scenario Outline: I import the  Spreadsheet Import-Contract entity and Sales Layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/"
    And I import following file name:
      | Spreadsheet_Import__Contract.xml |
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Sales/"
    And I import following file name:
      | SalesLayout_1183.xml             |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I Sales Exclusion Spreadsheet - Create and update
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Sales/"
    And I import following file name:
      | CreateSales_1183.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "Internal Sales" under column header "Sales Group"
      | name               | value          |
      | Sales Group        | Internal Sales |
      | Sales Type         | Retail Sales   |
      | Sales Category     | Forecast       |
      | Sales Period       |                |
      | Sales Year         | 2015           |
      | Gross Sales Amount | $8,000.00      |
      | Net Sales Amount   | $12,000.00     |
      | Currency           | USD            |
    And I extract Sales RecID of Sales Group "Internal Sales" from sales adjustments section
    And I verify a row from grid "<grid>" having unique value "Employee Sales" under column header "Sales Type"
      | name               | value          |
      | Sales Group        | Sales          |
      | Sales Type         | Employee Sales |
      | Sales Category     | Actual         |
      | Sales Period       |                |
      | Sales Year         | 2015           |
      | Gross Sales Amount | $6,000.00      |
      | Net Sales Amount   | $10,000.00     |
      | Currency           | USD            |
    And I extract Sales RecID of Sales Group "Sales" from sales adjustments section
    And I switch to default frame
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Sales/UpdateSales_1183.xlsx"
    And I set cell value in spread sheet row "7" under header "lxSalesRecID1" of column index "3"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Sales/UpdateSales_1183.xlsx"
    And I set cell value in spread sheet row "6" under header "lxSalesRecID2" of column index "3"
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Sales/"
    And I import following file name:
      | UpdateSales_1183.xlsx |


    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "Internal Sales -UPDATED" under column header "Sales Group"
      | name               | value                   |
      | Sales Group        | Internal Sales -UPDATED |
      | Sales Type         | Retail Sales- UPDATED   |
      | Sales Category     | Forecast                |
      | Sales Period       |                         |
      | Sales Year         | 2015                    |
      | Gross Sales Amount | $8,000.00               |
      | Net Sales Amount   | $12,000.00              |
      | Currency           | USD                     |
    And I verify a row from grid "<grid>" having unique value "Employee Sales- UPDATED" under column header "Sales Type"
      | name               | value           |
      | Sales Group        | Sales - UPDATED |
      | Sales Type         | Employee Sales  |
      | Sales Category     | Actual          |
      | Sales Period       |                 |
      | Sales Year         | 2015            |
      | Gross Sales Amount | $6,000.00       |
      | Net Sales Amount   | $10,000.00      |
      | Currency           | USD             |

    And I switch to default frame

  Examples:
    | Entity Name                               | Secondary Tab | Third Level Tab | grid    |
    | Spreadsheet Import-Contract-Testing-15278 | Payment Info  | Sales           | thisDiv |

#@all
#Feature: (Jira Ref: AUTOMATION-391) I create and verify them in Contract> Payment Info> Sales page
#
#  Background:
#    Given I Login to IWMS using "DeleteAccess" access credentials
#
#  Scenario Outline: I create sales through spreadsheet import
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Sales/"
#    And I import following file name:
#      | Create_Sales.xls |
##    When I navigate to "<Item>, <Second Level Tab>"
##    And I click on the "<Third Level Tab>" tab
##    And I expand portfolio navigation tab
##    And I click on the "<Entity Name>" on the page button
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Sales/Create_Sales.xls"
#    Then I verify in grid "<Grid ID>" in row "<Grid Row>" by reading data from spreadsheet row "<Spreadsheet Row>"
#      | name          | value       |
#      | Sales Group   | Sales Group |
#      | Currency Type | Currency    |
#
#
#  Examples:
#    | Item     | Second Level Tab | Third Level Tab | Grid Row | Spreadsheet Row | Entity Name       | Grid ID |
#    | Contract | Payment Info     | Sales           | 1        | 5               | Selenium-Contract | thisDiv |
