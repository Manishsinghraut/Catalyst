@all
Feature: (Jira Ref: AUTOMATION-1350) XML imports when number format uses comma and decimals

  Scenario Outline: I import the following xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following files:
      | Portfolio_1350.xml |
      | Location_1350.xml  |
    And I import following file name:
      | Testing_6907Entity_1350.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Navigate to Admin Dashboard > Manage Members/Contacts > Click 'Edit' on Delete Access Access and set Number Format to 1,234,567.89
    When I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I click "edit" row action in the non frame grid "BOGridBOListExtGridPerson" having the following header and cell values
      | name | value    |
      | Name | <Member> |
    And I wait for modal window to open
    And I set these field values on editable page
      | name          | value        |
      | NumberPattern | 1,234,567.89 |
    And I click on the "Update" button
    Then I wait for modal window to close

    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following files:
      | Sales_1350.xlsx |
    And I navigate to entity type "Contracts" named "<Entity Name>" through search option
    And I navigate to "Payment Info"
    And I click on the "Sales" tab
    And I wait for the Loading text to disappear
    And I verify a row from grid "thisDiv" having unique value "$1,340,679.89" under column header "Gross Sales Amount"
      | name     | value |
      | Currency | USD   |
    And I verify the following fields value on editable page
      | name                   | value         |
      | Sales_GrossSalesAmount | $1,340,679.89 |

    Examples:
      | Entity Name   | Member               |
      | Contract 6907 | Delete Access Access |


  Scenario Outline:Navigate to Admin Dashboard > Manage Members/Contacts > Click 'Edit' on Delete Access Access and set Number Format to 1.234.567,89
    When I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I click "edit" row action in the non frame grid "BOGridBOListExtGridPerson" having the following header and cell values
      | name | value    |
      | Name | <Member> |
    And I wait for modal window to open
    And I set these field values on editable page
      | name          | value        |
      | NumberPattern | 1.234.567,89 |
    And I click on the "Update" button
    Then I wait for modal window to close

    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following files:
      | Sales2_1350.xlsx |
    And I navigate to entity type "Contracts" named "<Entity Name>" through search option
    And I navigate to "Payment Info"
    And I click on the "Sales" tab
    And I wait for the Loading text to disappear
    And I verify a row from grid "thisDiv" having unique value "$1.340.679,89" under column header "Gross Sales Amount"
      | name     | value |
      | Currency | USD   |
    And I verify the following fields value on editable page
      | name                   | value         |
      | Sales_GrossSalesAmount | $1.340.679,89 |

    Examples:
      | Entity Name   | Member               |
      | Contract 6907 | Delete Access Access |


  Scenario Outline: Navigate to Admin Dashboard > Manage Members/Contacts > Click 'Edit' on Delete Access Access and set Number Format to 1,234,567.89
    When I navigate to the admin dashboard
    And I click on the "Manage Members/Contacts" link
    And I click "edit" row action in the non frame grid "BOGridBOListExtGridPerson" having the following header and cell values
      | name | value    |
      | Name | <Member> |
    And I wait for modal window to open
    And I set these field values on editable page
      | name          | value        |
      | NumberPattern | 1,234,567.89 |
    And I click on the "Update" button
    Then I wait for modal window to close

    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/"
    And I import following file and returns error message "Failed to parse sheet: Spreadsheet cell [Sales.GrossSalesAmount] has a value that is not a number '123.123.456,78' on row 7":
      | Sales3_1350.xlsx |

    And I click "edit" row action in the non frame grid "BOGridBOListExtGridPerson" having the following header and cell values
      | name | value    |
      | Name | <Member> |
    And I wait for modal window to open
    And I set these field values on editable page
      | name          | value         |
      | NumberPattern | <Auto-Detect> |
    And I click on the "Update" button
    Then I wait for modal window to close

    Examples:
      | Member               |
      | Delete Access Access |


