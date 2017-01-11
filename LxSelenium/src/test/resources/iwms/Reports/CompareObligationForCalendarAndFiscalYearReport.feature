Feature: Compare Obligation for Calendar and Fiscal year report (Jira Ref. : AUTOMATION-757)

  Scenario: Compare Obligation for Calendar and Fiscal year report
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I see the Dashboard
    And I navigate to import page
#    And I click on "Spreadsheets" tab
#    And I download following file
#    |Sales|
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | CompareObjligationForCalendarVsFiscalC1.xml      |
      | CompareObjligationForCalendarVsFiscalC2.xml      |
      | GenericCompareObjligationForCalendarVsFiscal.xml |
    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value                                        |
      | Report Name | Compare Obligation by Calendar / Fiscal year |

    And I switch to "report" child window
    And I set following fields value on editable page
      | name            | value      |
      | dateRange       | fiscalYear |
      | fiscalStartYear | 2015       |
    And I click on Next button from run report filter
    And I verify the following data in row "CompareObjligationForCalendarVsFiscal C1" on run report
      | name         | value                                    |
      | Name         | CompareObjligationForCalendarVsFiscal C1 |
      | Diff Y1      |                                          |
      | Diff Y2      |                                          |
      | Diff Y3      |                                          |
      | Diff Y4      |                                          |
      | Diff Y5      |                                          |
      | Diff Beyond5 |                                          |
      | Diff Beyond6 |                                          |
      | 2015         | $50,000.00                               |
      | 2015         | $50,000.00                               |
      | 2016         | $50,000.00                               |
      | 2016         | $50,000.00                               |
      | 2017         | $50,000.00                               |
      | 2017         | $50,000.00                               |
      | 2018         | $50,000.00                               |
      | 2018         | $50,000.00                               |
      | 2019         | $50,000.00                               |
      | 2019         | $50,000.00                               |
      | 2020         | $50,000.00                               |
      | 2020         | $50,000.00                               |
      | 2021+        | $0.00                                    |
      | 2021+        | $0.00                                    |

    And I verify the following data in row "CompareObjligationForCalendarVsFiscal C2" on run report
      | name         | value                                    |
      | Name         | CompareObjligationForCalendarVsFiscal C2 |
      | Diff Y1      |                                          |
      | Diff Y2      |                                          |
      | Diff Y3      |                                          |
      | Diff Y4      |                                          |
      | Diff Y5      |                                          |
      | Diff Beyond5 |                                          |
      | Diff Beyond6 |                                          |
      | 2015         | $70,000.00                               |
      | 2015         | $70,000.00                               |
      | 2016         | $70,000.00                               |
      | 2016         | $70,000.00                               |
      | 2017         | $70,000.00                               |
      | 2017         | $70,000.00                               |
      | 2018         | $70,000.00                               |
      | 2018         | $70,000.00                               |
      | 2019         | $70,000.00                               |
      | 2019         | $70,000.00                               |
      | 2020         | $70,000.00                               |
      | 2020         | $70,000.00                               |
      | 2021+        | $0.00                                    |
      | 2021+        | $0.00                                    |
    And I close the "run report" child window
    And I switch to main window