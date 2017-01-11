@all
Feature: (Jira Ref. : AUTOMATION-1404) Custom List on Report

  Scenario Outline: As a delete user, Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/"
    And I import following file name:
      | 00018_Portfolio and Location (2)-1404.xml |
      | Site_CLPagelayout-1404.xml                |
      | Site_CLPagelayout-1404.xml                |
      | CL_Site_for_Report-1404.xml               |
      | ReportonCLSite-1404.xml                   |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Custom List on Report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "Sites" named "<Entity Name>" through search option
    And I click on "Summary" tab
    And I select "CL-Site" page layout from dropdown
    And I click on the "edit" action panel button
    And I switch to visible frame
    And I click '+ Add' button to add line items
    And I enter row values in grid "<GRID>" by the following values
      | Date       | Item name | Quantity | Price |
      | 10/12/2016 | Carpet    | 10       | 1000  |
    And I select following radio by label
      | name |
      | No   |
    And I click "Update" button

    And I click '+ Add' button to add line items
    And I enter row values in grid "<GRID>" by the following values
      | Date       | Item name | Quantity | Price |
      | 10/10/2016 | Doors     | 20       | 500   |
    And I select following radio by label
      | name |
      | Yes  |
    And I click "Update" button
    And I click on the "Save Changes" action panel button
    Then I verify the following values in frame grid "<GRID>"
      | Date       | Item name | Quantity | Price     | Total      | DeliveryDate | Delivered |
      | 10/12/2016 | Carpet    | 10       | $1,000.00 | $10,000.00 | 10/14/2016   | No        |
      | 10/10/2016 | Doors     | 20       | $500.00   | $10,000.00 | 10/12/2016   | Yes       |

#    When I navigate to the reports dashboard
#    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
#      | name        | value         |
#      | Report Name | <Report Name> |

  Examples:
    | Login User   | Login full username  | Entity Name        | GRID            | Report Name       |
    | DeleteAccess | Delete Access Access| CL Site for Report | ^customListGrid | Report on CL Site |



  Scenario Outline: Custom List on Report1
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "report" child window
    And I expand "<Entity Name>" entity report
    And I verify a custom list "<Entity Name>" on reports grid "popupBody" having the following header and cell value pair
      | name         | value      |
      | Date         | 10/12/2016 |
      | Item name    | Carpet     |
      | Quantity     | 10         |
      | Price        | $1,000.00  |
      | Total        | $10,000.00 |
      | DeliveryDate | 10/14/2016 |
      | Delivered    | No         |

    And I verify a custom list "<Entity Name>" on reports grid "popupBody" having the following header and cell value pair
      | name         | value      |
      | Date         | 10/10/2016 |
      | Item name    | Doors      |
      | Quantity     | 20         |
      | Price        | $500.00    |
      | Total        | $10,000.00 |
      | DeliveryDate | 10/12/2016 |
      | Delivered    | Yes        |
    And I close the "Report" child window
    And I wait for browser windows count to be equal to "1"
    Then I switch to main window

    Examples:
      | Login User   | Login full username  | Entity Name        | GRID            | Report Name       |
      | DeleteAccess | Delete Access Access| CL Site for Report | ^customListGrid | Report on CL Site |
