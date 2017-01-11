@all
Feature: (JIRA - Automation-987)Offsets should be calculated properly in Percenatge Rent Accruals

  Scenario Outline: As a delete user I ensure all transactions, recurring expenses and sales item exist

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AccountingInfo/PercentRentAccruals/"
    And I import following file name:
      | PRAccrualContract-987.xml |

    And I navigate to entity type "<Item>" named "<Contract Name>"
    Then I navigate to "Payment Info"
    And I click on the "Recurring Expenses" tab
    And I verify the following values in frame grid "thisDiv"
      | Expense Group | Expense Type    | Expense Category | Begin Date | End Date | Frequency | Period Amount | Annual Amount |
      | Lease Expense | Percentage Rent | Rent             |            |          | None      |               |               |

    And I verify the following values in frame grid "BOGridExpenseVendorAllocation"
      | Vendor            | Vendor# | Payment Percent | Address           | City  | State | Begin Date | End Date   | Notes |
      | Selenium-Employer | 1234    | 100.00000%      | 5601 Democracy Dr | Plano | TX    | 01/01/2010 | 12/31/2020 |       |

    And I click on the "Percentage Rent" tab
    And I verify the following values in frame grid "thisDiv"
      | Begin Date | End Date   | Sales Group | Description | Calculation Method | Payment Frequency | Reporting Frequency |
      | 01/01/2010 | 12/31/2020 | Sales       |             | Per Period         | Monthly           | None                |

    And I verify the following values in frame grid "BOGridPercentageRentBreakpoint"
      | Begin Date | End Date   | Sales Group | Portioned Sales Group | Natural Rate | Breakpoint Amount #1 | Breakpoint Rate #1 | Breakpoint Amount #2 | Breakpoint Rate #2 | Breakpoint Amount #3 | Breakpoint Rate #3 |
      | 01/01/2010 | 12/31/2020 | Sales       |                       |              | $1,200,000.00        | 10.00000%          |                      |                    |                      |                    |

    And I verify the following values in frame grid "BOGridVariableRentOffset"
      | Sales Group | Begin Date | End Date   | Expense Group | Expense Type | Offset Group | Offset Type | Fixed Offset Amount | Cap Percent | Cap Amount |
      | Sales       | 01/01/2010 | 12/31/2020 |               |              |              |             | $200.00             |             |            |

    And I click on the "Sales" tab
    And I verify the following values in frame grid "thisDiv"
      | Sales Group | Sales Type              | Sales Category | Sales Period | Sales Year | Gross Sales Amount | Net Sales Amount | Currency |
      | Sales       | Employee Sales          | Actual         | 12           | 2015       | $4,000.00          | $4,000.00        | USD      |
      | Sales       | Retail Sales            | Actual         | 12           | 2015       | $115,000.00        | $115,000.00      | USD      |
      | Sales       | Returns                 | Actual         | 12           | 2015       | $1,000.00          | $1,000.00        | USD      |
      | Sales       | Credit Card Sales Group | Actual         | 11           | 2015       | $2,000.00          | $2,000.00        | USD      |
      | Sales       | Employee Sales          | Actual         | 11           | 2015       | $4,000.00          | $4,000.00        | USD      |
      | Sales       | Retail Sales            | Actual         | 11           | 2015       | $115,000.00        | $115,000.00      | USD      |

      | Sales       | Returns                 | Actual         | 11           | 2015       | $1,000.00          | $1,000.00        | USD      |
      | Sales       | Employee Sales          | Actual         | 10           | 2015       | $4,000.00          | $4,000.00        | USD      |
      | Sales       | Retail Sales            | Actual         | 10           | 2015       | $115,000.00        | $115,000.00      | USD      |
      | Sales       | Returns                 | Actual         | 10           | 2015       | $1,000.00          | $1,000.00        | USD      |
      | Sales       | Employee Sales          | Actual         | 9            | 2015       | $4,000.00          | $4,000.00        | USD      |
      | Sales       | Retail Sales            | Actual         | 9            | 2015       | $115,000.00        | $115,000.00      | USD      |

      | Sales       | Returns                 | Actual         | 9            | 2015       | $1,000.00          | $1,000.00        | USD      |
      | Sales       | Employee Sales          | Actual         | 8            | 2015       | $4,000.00          | $4,000.00        | USD      |
      | Sales       | Retail Sales            | Actual         | 8            | 2015       | $115,000.00        | $115,000.00      | USD      |
      | Sales       | Returns                 | Actual         | 8            | 2015       | $1,000.00          | $1,000.00        | USD      |
      | Sales       | Employee Sales          | Actual         | 7            | 2015       | $4,000.00          | $4,000.00        | USD      |
      | Sales       | Retail Sales            | Actual         | 7            | 2015       | $115,000.00        | $115,000.00      | USD      |

      | Sales       | Returns                 | Actual         | 7            | 2015       | $1,000.00          | $1,000.00        | USD      |
      | Sales       | Employee Sales          | Actual         | 6            | 2015       | $4,000.00          | $4,000.00        | USD      |
      | Sales       | Retail Sales            | Actual         | 6            | 2015       | $125,000.00        | $125,000.00      | USD      |
      | Sales       | Returns                 | Actual         | 6            | 2015       | $1,000.00          | $1,000.00        | USD      |
      | Sales       | Employee Sales          | Actual         | 5            | 2015       | $4,000.00          | $4,000.00        | USD      |
      | Sales       | Retail Sales            | Actual         | 5            | 2015       | $115,000.00        | $115,000.00      | USD      |

      | Sales       | Returns                 | Actual         | 5            | 2015       | $1,000.00          | $1,000.00        | USD      |
      | Sales       | Employee Sales          | Actual         | 4            | 2015       | $4,000.00          | $4,000.00        | USD      |
      | Sales       | Retail Sales            | Actual         | 4            | 2015       | $100,000.00        | $100,000.00      | USD      |
      | Sales       | Returns                 | Actual         | 4            | 2015       | $1,000.00          | $1,000.00        | USD      |
      | Sales       | Employee Sales          | Actual         | 3            | 2015       | $4,000.00          | $4,000.00        | USD      |
      | Sales       | Retail Sales            | Actual         | 3            | 2015       | $120,000.00        | $120,000.00      | USD      |

      | Sales       | Returns                 | Actual         | 3            | 2015       | $1,000.00          | $1,000.00        | USD      |
      | Sales       | Employee Sales          | Actual         | 2            | 2015       | $4,000.00          | $4,000.00        | USD      |
      | Sales       | Retail Sales            | Actual         | 2            | 2015       | $100,000.00        | $100,000.00      | USD      |
      | Sales       | Returns                 | Actual         | 2            | 2015       | $1,000.00          | $1,000.00        | USD      |
      | Sales       | Employee Sales          | Actual         | 1            | 2015       | $4,000.00          | $4,000.00        | USD      |
      | Sales       | Retail Sales            | Actual         | 1            | 2015       | $105,000.00        | $105,000.00      | USD      |

      | Sales       | Returns                 | Actual         | 1            | 2015       | $1,000.00          | $1,000.00        | USD      |


    Examples:
      | Login User   | Login full username  | Contract Name           | Item     |
      | DeleteAccess | Delete Access Access | PR Accrual Contract-987 | Contract |


  Scenario Outline: As a delete user I ensure Percent rent accrual transctions

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                         | value                                                |
      | PercentRentAccrualTestMethod | Actual Sales with Proration of the Annual Breakpoint |
    And I click on "Update" Button
    And I verify the following message "Successfully updated Company"
    And I navigate to entity type "<Item>" named "<Contract Name>"
    Then I navigate to "Payment Info"
    And I click on the "Percentage Rent" tab
    And I select "Percentage Rent (Single BP) Schedule" from Page dropdown
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name                      | value    |
      | CurrentSelectorDate_month | February |
      | CurrentSelectorDate_year  | 2015     |
    And I click on "Refresh" Button

    And I verify the values at the bottom of the page
      | name          | value   |
      | Offset Amount | $200.00 |

    And I navigate to entity type "<Item>" named "<Contract Name>"
    Then I navigate to "Accounting Info"
    And I click on the "Percentage Rent Accruals" tab
    And I select "Percentage Rent Accrual Schedule" page layout from dropdown
    And I wait for the Loading text to disappear
    And I set following fields value on editable page
      | name                  | value |
      | CurrentSelectorPeriod | 1     |
      | CurrentSelectorYear   | 2015  |
    And I click on "Refresh" Button
    And I verify the following values in frame grid "BOGridVirtualPRAccrualPeriod"
      | Accrual Amount This Period |
      | $66.67                     |
      | $116.66                    |
      | $666.67                    |
      | $383.33                    |
      | $1,058.34                  |
      | $1,858.33                  |
      | $1,741.67                  |
      | $2,041.66                  |
      | $2,341.67                  |
      | $2,641.67                  |
      | $3,125.00                  |
      | $3,258.33                  |


    Examples:
      | Login User   | Login full username  | Contract Name           | Item     |
      | DeleteAccess | Delete Access Access | PR Accrual Contract-987 | Contract |