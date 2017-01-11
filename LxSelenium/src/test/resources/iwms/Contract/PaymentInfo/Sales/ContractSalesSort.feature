@all
Feature: (Jira - Automation -978) Contract Sales Sort

  Scenario Outline: As a delete user I can sort sales
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/PaymentInfo/Sales/"
    And I import following file name:
      | 978Location.xml           |
      | 978ContractForSorting.xml |

    And I navigate to entity type "Contract" named "<Entity Name>"
    When I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click sort in header "Sales Year" from grid "<Grid ID>" in "Sort Descending"
    And I assert the following values in grid "<Grid ID>"
      | Sales Group    | Sales Type   | Sales Category | Sales Period | Sales Year | Gross Sales Amount | Net Sales Amount | Currency |
      | Internal Sales | Fixed Amount | Actual         | 9            | 2017       | $2,000.00          | $2,000.00        | USD      |
      | Internal Sales | Fixed Amount | Forecast       | 9            | 2017       | $5,000.00          | $5,000.00        | USD      |
      | Sales          | Retail Sales | Actual         | 9            | 2017       | $1,500.00          | $1,500.00        | USD      |
      | Sales Lease    | Add Sales    | Forecast       | 5            | 2017       | $2,500.00          | $2,500.00        | USD      |
      | Internal Sales | Fixed Amount | Actual         | 10           | 2016       | $1,000.00          | $1,000.00        | USD      |

    And I click sort in header "Sales Period" from grid "<Grid ID>" in "Sort Descending"
    And I assert the following values in grid "<Grid ID>"
      | Sales Group    | Sales Type   | Sales Category | Sales Period | Sales Year | Gross Sales Amount | Net Sales Amount | Currency |
      | Internal Sales | Fixed Amount | Actual         | 10           | 2016       | $1,000.00          | $1,000.00        | USD      |
      | Internal Sales | Fixed Amount | Actual         | 9            | 2017       | $2,000.00          | $2,000.00        | USD      |
      | Internal Sales | Fixed Amount | Forecast       | 9            | 2017       | $5,000.00          | $5,000.00        | USD      |
      | Sales          | Retail Sales | Actual         | 9            | 2017       | $1,500.00          | $1,500.00        | USD      |
      | Sales Lease    | Add Sales    | Forecast       | 5            | 2017       | $2,500.00          | $2,500.00        | USD      |

    And I click sort in header "Sales Category" from grid "<Grid ID>" in "Sort Ascending"
#    And I assert the following values in grid "<Grid ID>"
#      | Sales Group    | Sales Type   | Sales Category | Sales Period | Sales Year | Gross Sales Amount | Net Sales Amount | Currency |
#      | Internal Sales | Fixed Amount | Actual         | 10           | 2016       | $1,000.00          | $1,000.00        | USD      |
#      | Internal Sales | Fixed Amount | Actual         | 9            | 2017       | $2,000.00          | $2,000.00        | USD      |
#      | Sales          | Retail Sales | Actual         | 9            | 2017       | $1,500.00          | $1,500.00        | USD      |
#      | Internal Sales | Fixed Amount | Forecast       | 9            | 2017       | $5,000.00          | $5,000.00        | USD      |
#      | Sales Lease    | Add Sales    | Forecast       | 5            | 2017       | $2,500.00          | $2,500.00        | USD      |

    And I assert the following values in grid "<Grid ID>"
      | Sales Group    | Sales Type   | Sales Category | Sales Period | Sales Year | Gross Sales Amount | Net Sales Amount | Currency |
      | Internal Sales | Fixed Amount | Actual         | 9            | 2017       | $2,000.00          | $2,000.00        | USD      |
      | Sales          | Retail Sales | Actual         | 9            | 2017       | $1,500.00          | $1,500.00        | USD      |
      | Internal Sales | Fixed Amount | Actual         | 10           | 2016       | $1,000.00          | $1,000.00        | USD      |
      | Internal Sales | Fixed Amount | Forecast       | 9            | 2017       | $5,000.00          | $5,000.00        | USD      |
      | Sales Lease    | Add Sales    | Forecast       | 5            | 2017       | $2,500.00          | $2,500.00        | USD      |

    And I click sort in header "Sales Group" from grid "<Grid ID>" in "Sort Ascending"
#    And I assert the following values in grid "<Grid ID>"
#      | Sales Group    | Sales Type   | Sales Category | Sales Period | Sales Year | Gross Sales Amount | Net Sales Amount | Currency |
#      | Internal Sales | Fixed Amount | Actual         | 10           | 2016       | $1,000.00          | $1,000.00        | USD      |
#      | Internal Sales | Fixed Amount | Actual         | 9            | 2017       | $2,000.00          | $2,000.00        | USD      |
#      | Internal Sales | Fixed Amount | Forecast       | 9            | 2017       | $5,000.00          | $5,000.00        | USD      |
#      | Sales          | Retail Sales | Actual         | 9            | 2017       | $1,500.00          | $1,500.00        | USD      |
#      | Sales Lease    | Add Sales    | Forecast       | 5            | 2017       | $2,500.00          | $2,500.00        | USD      |
    And I assert the following values in grid "<Grid ID>"
      | Sales Group    | Sales Type   | Sales Category | Sales Period | Sales Year | Gross Sales Amount | Net Sales Amount | Currency |
      | Internal Sales | Fixed Amount | Actual         | 9            | 2017       | $2,000.00          | $2,000.00        | USD      |
      | Internal Sales | Fixed Amount | Forecast       | 9            | 2017       | $5,000.00          | $5,000.00        | USD      |
      | Internal Sales | Fixed Amount | Actual         | 10           | 2016       | $1,000.00          | $1,000.00        | USD      |
      | Sales          | Retail Sales | Actual         | 9            | 2017       | $1,500.00          | $1,500.00        | USD      |
      | Sales Lease    | Add Sales    | Forecast       | 5            | 2017       | $2,500.00          | $2,500.00        | USD      |



    Examples:
      | Second Level Tab | Third Level Tab | Entity Name              | Grid ID | Login User   | Login full username  |
      | Payment Info     | Sales           | Contract for sorting-978 | thisDiv | DeleteAccess | Delete Access Access |