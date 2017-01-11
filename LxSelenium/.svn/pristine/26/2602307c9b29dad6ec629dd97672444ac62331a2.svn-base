@all
Feature: Test Decimal display for Foreign Currency on Reports [Jira Ref : AUTOMATION-1378]

  Scenario Outline: As a delete user, Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | Sprint17PortfolioAndLocation_1378.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Navigate to  Admin Dashboard > Manage Company > Financial Settings > and select JPY as the 'Home Currency' and click 'Update'
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID | JPY   |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user, Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | Report-13625_1378.xml                 |
      | ReportCurrencyContract_13625_1378.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I verify There will be one line item populated under the "contract expense setup list" as well as under "vendor allocations" and "expense schedule". The currency symbol will be of the Japanese Yen
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame

    And I verify a row from grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name             | value       |
      | Expense Type     | CAM         |
      | Expense Category | Expense     |
      | Begin Date       | 01/01/2000  |
      | End Date         | 12/31/2030  |
      | Frequency        | Monthly     |
      | Period Amount    | ¥2,500,000  |
      | Annual Amount    | ¥30,000,000 |
      | Tax #1           | ¥15,000     |
      | Tax #2           | ¥10,000     |
      | Tax #3           | ¥50,000     |

    And I verify a row from grid "BOGridExpenseSchedule" having unique value "12/31/2030" under column header "End Date"
      | name            | value       |
      | Begin Date      | 01/01/2000  |
      | End Date        | 12/31/2030  |
      | Approval Status | Review      |
      | Payment Amount  | ¥2,500,000  |
      | Annual Amount   | ¥30,000,000 |
      | Rate            |             |
      | First Payment   | ¥2,500,000  |
      | Last Payment    | ¥2,500,000  |

    And I switch to default frame


    Then I navigate to the reports dashboard
#    And I click on the "run" row action of column "<Report Name>" of column "0" from grid "<Grid>"

    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value            |
      | Report Name | <Report Name> |

    And I switch to "report" child window

    And I verify the following values in non frame grid
      | Name                         | Annual Amount | First Payment Amount | Last Payment Amount | Period Amount | Tax Amount #1 | Tax Amount #2 | Tax Amount #3 | Payment Amount |
      | ReportCurrencyContract-13625 | ¥30,000,000   | ¥2,500,000           | ¥2,500,000          | ¥208,333      | ¥15,000       | ¥10,000       | ¥50,000       | ¥2,500,000     |

    And I close the "Report" child window
    And I switch to main window


  Examples:
    | Login User   | Login full username  | Entity Name                  | Second Level Tab | Third Level Tab    | Report Name  | Grid        |
    | DeleteAccess | Delete Access Access | ReportCurrencyContract-13625 | Payment Info     | Recurring Expenses | Report-13625 | pageContent |


  Scenario Outline: As a delete user I Navigate back to "manage company" and change the currency back to null post testing
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Company" link
    And I click on the "Financial Settings" link
    And I set following fields value on editable page
      | name                      | value |
      | DefaultCodeCurrencyTypeID |       |
    And I click on "Update" Button
    And I see "Successfully updated Company" message in the header

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |