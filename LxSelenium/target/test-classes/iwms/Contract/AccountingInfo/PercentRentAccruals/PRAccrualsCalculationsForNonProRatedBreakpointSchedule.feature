@all
Feature: (JIRA - Automation-988)PR Accruals calculations for non pro-rated breakpoint schedule

  Scenario Outline: As a delete user I ensure all transactions, recurring expenses and sales item exist

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/PercentRentAccruals/"
    And I import following file name:
      | PRAccrualNonPro-RatedBPContract-988.xml |

    And I navigate to entity type "<Item>" named "<Contract Name>"
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify the following values in frame grid "thisDiv"
      | Expense Group | Expense Type    | Expense Category | Begin Date | End Date   | Frequency | Period Amount | Annual Amount |
      | Lease Expense | Percentage Rent | Expense          |            |            | Monthly   |               |               |
      | Base Rent     | Base Rent       | Rent             | 08/01/2014 | 07/31/2019 | Monthly   | $7,493.40     | $89,920.80    |

    And I click on row from grid "thisDiv" having unique value "Base Rent" under column header "Expense Group"
      | name             | value      |
      | Expense Type     | Base Rent  |
      | Expense Category | Rent       |
      | Begin Date       | 08/01/2014 |
      | End Date         | 07/31/2019 |

    And I verify the following values in frame grid "BOGridExpenseVendorAllocation"
      | Vendor            | Vendor# | Payment Percent | Address           | City  | State | Begin Date | End Date   | Notes |
      | Selenium-Employer | 1234    | 100.00000%      | 5601 Democracy Dr | Plano | TX    | 01/01/1994 | 07/31/2019 |       |

    And I verify the following values in frame grid "BOGridExpenseSchedule"
      | Begin Date | End Date   | Approval Status | Payment Amount | Annual Amount | Rate | First Payment | Last Payment | Notes |
      | 08/01/2014 | 07/31/2019 | Review          | $7,493.40      | $89,920.80    |      | $7,493.40     | $7,493.40    |       |

    And I click on the "Transactions" tab
    And I verify the following values in frame grid "thisDiv"
      | Effective Date | Group     | Type      | Category | Vendor            | Vendor# | One-Time Expense | Total Amount | Primary Tax | Hold Flag |
      | 07/01/2016     | Base Rent | Base Rent | Rent     | Selenium-Employer | 1234    | No               | $7,493.40    | $0.00       | No        |
      | 06/01/2016     | Base Rent | Base Rent | Rent     | Selenium-Employer | 1234    | No               | $7,493.40    | $0.00       | No        |
      | 05/01/2016     | Base Rent | Base Rent | Rent     | Selenium-Employer | 1234    | No               | $7,493.40    | $0.00       | No        |
      | 04/01/2016     | Base Rent | Base Rent | Rent     | Selenium-Employer | 1234    | No               | $7,493.40    | $0.00       | No        |
      | 03/01/2016     | Base Rent | Base Rent | Rent     | Selenium-Employer | 1234    | No               | $7,493.40    | $0.00       | No        |
      | 02/01/2016     | Base Rent | Base Rent | Rent     | Selenium-Employer | 1234    | No               | $7,493.40    | $0.00       | No        |
      | 01/01/2016     | Base Rent | Base Rent | Rent     | Selenium-Employer | 1234    | No               | $7,493.40    | $0.00       | No        |
      | 12/01/2015     | Base Rent | Base Rent | Rent     | Selenium-Employer | 1234    | No               | $7,493.40    | $0.00       | No        |
      | 11/01/2015     | Base Rent | Base Rent | Rent     | Selenium-Employer | 1234    | No               | $7,493.40    | $0.00       | No        |
      | 10/01/2015     | Base Rent | Base Rent | Rent     | Selenium-Employer | 1234    | No               | $7,493.40    | $0.00       | No        |
      | 09/01/2015     | Base Rent | Base Rent | Rent     | Selenium-Employer | 1234    | No               | $7,493.40    | $0.00       | No        |
      | 08/01/2015     | Base Rent | Base Rent | Rent     | Selenium-Employer | 1234    | No               | $7,493.40    | $0.00       | No        |


    And I click on the "Percentage Rent" tab
    And I verify the following values in frame grid "thisDiv"
      | Begin Date | End Date   | Sales Group | Description | Calculation Method | Payment Frequency | Reporting Frequency |
      | 08/01/2001 | 07/31/2019 | Sales       |             | Cumulative         | Monthly           | Monthly             |

    And I verify the following values in frame grid "BOGridPercentageRentBreakpoint"
      | Begin Date | End Date   | Sales Group | Portioned Sales Group | Natural Rate | Breakpoint Amount #1 | Breakpoint Rate #1 | Breakpoint Amount #2 | Breakpoint Rate #2 | Breakpoint Amount #3 | Breakpoint Rate #3 |
      | 08/01/1994 | 07/31/2019 | Sales       |                       |              | $0.00                | 8.50000%           | $1,053,000.00        | 7.00000%           |                      |                    |

    And I verify the following values in frame grid "BOGridVariableRentOffset"
      | Sales Group | Begin Date | End Date   | Expense Group | Expense Type | Offset Group | Offset Type | Fixed Offset Amount | Cap Percent | Cap Amount |
      | Sales       | 08/01/1994 | 07/31/2019 | Base Rent     | Base Rent    |              |             |                     | 100.00000%  |            |

    And I click on the "Sales" tab
    And I verify the following values in frame grid "thisDiv"
      | Sales Group | Sales Type   | Sales Category | Sales Period | Sales Year | Gross Sales Amount | Net Sales Amount | Currency |
      | Sales       | Retail Sales | Actual         | 7            | 2016       | $111,636.00        | $111,636.00      | USD      |
      | Sales       | Retail Sales | Actual         | 6            | 2016       | $108,115.00        | $108,115.00      | USD      |
      | Sales       | Retail Sales | Actual         | 5            | 2016       | $111,172.00        | $111,172.00      | USD      |
      | Sales       | Retail Sales | Actual         | 4            | 2016       | $105,520.00        | $105,520.00      | USD      |
      | Sales       | Retail Sales | Actual         | 3            | 2016       | $100,832.00        | $100,832.00      | USD      |
      | Sales       | Retail Sales | Actual         | 2            | 2016       | $84,229.00         | $84,229.00       | USD      |
      | Sales       | Retail Sales | Actual         | 1            | 2016       | $89,954.00         | $89,954.00       | USD      |
      | Sales       | Retail Sales | Actual         | 12           | 2015       | $94,885.00         | $94,885.00       | USD      |
      | Sales       | Retail Sales | Actual         | 11           | 2015       | $100,491.00        | $100,491.00      | USD      |
      | Sales       | Retail Sales | Actual         | 10           | 2015       | $106,367.00        | $106,367.00      | USD      |
      | Sales       | Retail Sales | Actual         | 9            | 2015       | $104,088.00        | $104,088.00      | USD      |
      | Sales       | Retail Sales | Actual         | 8            | 2015       | $110,298.00        | $110,298.00      | USD      |


    Examples:
      | Login User   | Login full username  | Contract Name                            | Item     |
      | DeleteAccess | Delete Access Access | PR Accrual Non Pro-Rated BP Contract-988 | Contract |


  Scenario Outline: As a delete user I ensure Percent rent accrual transctions

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                                         | value                                        |
      | PercentRentAccrualTestMethod                 | Forecast/Actual Sales with Annual Breakpoint |
      | Forecast/Actual Sales with Annual Breakpoint | Constant Accrue Amount with Catchup          |
    And I click on "Update" Button
    And I verify the following message "Successfully updated Company"


    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I ensure Percent rent accrual transctions

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I navigate to entity type "<Item>" named "<Contract Name>"
    Then I navigate to "Payment Info"
    And I click on the "Percentage Rent" tab
    And I select "Percentage Rent (Multi BP) Schedule" from Page dropdown
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name                      | value |
      | CurrentSelectorDate_month | July  |
      | CurrentSelectorDate_year  | 2016  |
    And I click on "Refresh" Button

    And I verify the following Percentage Rent (Multi BP) Schedule values at the bottom of the page
      | name           | value      |
      | Offset Amount  | $89,920.80 |
      | Net Amount Due | $11,805.29 |

    And I switch to default frame
    Then I navigate to "Accounting Info"
    And I click on the "Percentage Rent Accruals" tab
    And I select "Percentage Rent Accrual Schedule" page layout from dropdown
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name                  | value |
      | CurrentSelectorPeriod | 7     |
      | CurrentSelectorYear   | 2016  |
    And I click on "Refresh" Button
    And I verify the following values in frame grid "BOGridVirtualPRAccrualPeriod"
      | Total      |
      | $983.77    |
      | $1,967.55  |
      | $2,951.32  |
      | $3,935.10  |
      | $4,918.87  |
      | $5,902.65  |
      | $6,886.42  |
      | $7,870.19  |
      | $8,853.97  |
      | $9,837.74  |
      | $10,821.52 |
      | $11,805.29 |


    Examples:
      | Login User   | Login full username  | Contract Name                            | Item     |
      | DeleteAccess | Delete Access Access | PR Accrual Non Pro-Rated BP Contract-988 | Contract |