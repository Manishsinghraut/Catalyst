@all
Feature: Sales Validator Report (Jira Ref. : AUTOMATION-758)

  Scenario Outline: Sales Validator Report
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | SalesContract.xml        |
      | SalesValidatorReport.xml |
    And I navigate to the reports dashboard
#    And I click on the "run" row action of column "Sales Record Validator" of column "0" from grid "BOGridPageLayout"
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value                  |
      | Report Name | Sales Record Validator |

    And I switch to "report" child window
    And I click on the "<Entity Name>" link "Entity name on the Report"
    And I close the "report" child window
    And I switch to main window
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    Then I verify page title "Contract Sales History List" after navigation
    And I verify row from grid "<Grid ID>" having unique value "2019" under column header "Sales Year"
      | name               | value        |
      | Sales Group        | Sales        |
      | Sales Type         | Retail Sales |
      | Sales Category     | Actual       |
      | Sales Period       | 6            |
      | Sales Year         | 2019         |
      | Gross Sales Amount | $200,000.00  |
      | Net Sales Amount   | $200,000.00  |
      | Currency           |              |
    And I verify row from grid "<Grid ID>" having unique value "2015" under column header "Sales Year"
      | name               | value        |
      | Sales Group        | Sales        |
      | Sales Type         | Retail Sales |
      | Sales Category     | Actual       |
      | Sales Period       | 8            |
      | Sales Year         | 2015         |
      | Gross Sales Amount | $5,000.00    |
      | Net Sales Amount   | $3,500.00    |
      | Currency           |              |

    Examples:
      | Entity Name    | Second Level Tab | Third Level Tab | Grid ID |
      | Sales Contract | Payment Info     | Sales           | thisDiv |