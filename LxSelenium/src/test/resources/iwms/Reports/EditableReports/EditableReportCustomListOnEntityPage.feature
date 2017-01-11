@all
Feature: Editable Report - Custom List on Entity Page - [Jira Ref. : AUTOMATION-1397]

  Scenario Outline: As Delete User, I Import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Reports/EditableReports/"
    And I import the following files:
      | SiteEntityForCL_1397.xml              |
      | ReportOnCustomListEntityPage_1397.xml |
      | SiteEntityPageLayout_1397.xml         |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As Delete user, I verify the Data should be saved successfully
    Given I navigate to entity type "Sites" named "<Entity Name>" through search option
    And I click on the "<Third Level Tab>" tab
    And I click on the "Edit" action panel button
    And I switch to visible frame
    And I click '+ Add' button to add line items
    And I enter row values in grid "<GRID>" by the following values
      | Date       | Item Name | Quantity | Price | Completed |
      | 02/09/2016 | Carpet    | 10       | 1500  | true      |
    And I click "Update" button

    And I click '+ Add' button to add line items
    And I enter row values in grid "<GRID>" by the following values
      | Date       | Item Name | Quantity | Price |
      | 02/16/2016 | Door      | 25       | 800   |
    And I click "Update" button
    And I switch to default frame
    And I click on the "Save Changes" action panel button

    And I switch to visible frame
    And I view a unique row in grid "<GRID>" having unique value "Carpet" under column header "Item Name"
      | name               | value      |
      | Date               | 02/09/2016 |
      | Item Name          | Carpet     |
      | Quantity           | 10         |
      | Price              | $1,500.00  |
      | TotalPrice         | $15,000.00 |
      | Completed          |            |
      | Item Delivery Date | 02/14/2016 |

    And I view a unique row in grid "<GRID>" having unique value "Door" under column header "Item Name"
      | name               | value      |
      | Date               | 02/16/2016 |
      | Item Name          | Door       |
      | Quantity           | 25         |
      | Price              | $800.00    |
      | TotalPrice         | $20,000.00 |
      | Completed          |            |
      | Item Delivery Date | 02/21/2016 |
    And I switch to default frame


    Examples:
      | Entity Name     | Third Level Tab | GRID            |
      | SiteEntityForCL | Summary         | ^customListGrid |


  Scenario Outline: As Delete user, I verify the Custom List row should be updated successfully and added successfully
    Given I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value         |
      | Report Name | <Report Name> |
    And I switch to "report" child window
    And I verify the following values in non frame grid
      | Name            |
      | SiteEntityForCL |

    And I expand "SiteEntityForCL" entity report
    And I click on the custom list entity "EntityCL" to update the value on the report

    And I verify a row from non frame grid "^customListGrid" having unique value "Door" under column header "Item Name"
      | name     | value |
      | Quantity | 25    |

    And I enter row values in grid "^customListGrid" by the following values
      | Date       | Item Name | Quantity | Price |
      | 02/16/2016 | Door      | 25       | 900   |
    And I click "Update" button

    And I click '+ Add' button to add line items
    And I enter row values in grid "^customListGrid" by the following values
      | Date       | Item Name | Quantity | Price |
      | 02/23/2016 | Window    | 20       | 500   |
    And I click "Update" button
    And I click on the green check-mark
    And I wait for modal window to close

    And I click on the "Rerun Report" link
    And I expand "SiteEntityForCL" entity report
    And I click on the custom list entity "EntityCL" to update the value on the report

    And I verify a row from non frame grid "^customListGrid" having unique value "Carpet" under column header "Item Name"
      | name               | value      |
      | Date               | 02/09/2016 |
      | Item Name          | Carpet     |
      | Quantity           | 10         |
      | Price              | $1,500.00  |
      | TotalPrice         | $15,000.00 |
      | Completed          |            |
      | Item Delivery Date | 02/14/2016 |

    And I click "Cancel" button

    And I verify a row from non frame grid "^customListGrid" having unique value "Door" under column header "Item Name"
      | name               | value      |
      | Date               | 02/16/2016 |
      | Item Name          | Door       |
      | Quantity           | 25         |
      | Price              | $900.00    |
      | TotalPrice         | $22,500.00 |
      | Completed          |            |
      | Item Delivery Date | 02/21/2016 |
    And I click "Cancel" button

    And I verify a row from non frame grid "^customListGrid" having unique value "Window" under column header "Item Name"
      | name               | value      |
      | Date               | 02/23/2016 |
      | Item Name          | Window     |
      | Quantity           | 20         |
      | Price              | $500.00    |
      | TotalPrice         | $10,000.00 |
      | Completed          |            |
      | Item Delivery Date | 02/28/2016 |

    And I click "Cancel" button

    And I close the "Report" child window
    And I switch to main window


    Examples:
      | Report Name                       |
      | Report on Custom List Entity Page |


  Scenario Outline: As Delete user, I verify Custom list on summary page should be displayed with 3 line items successfully
    Given I navigate to entity type "Sites" named "<Entity Name>" through search option
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from non frame grid "^customListGrid" having unique value "Carpet" under column header "Item Name"
      | name               | value      |
      | Date               | 02/09/2016 |
      | Item Name          | Carpet     |
      | Quantity           | 10         |
      | Price              | $1,500.00  |
      | TotalPrice         | $15,000.00 |
      | Completed          |            |
      | Item Delivery Date | 02/14/2016 |

    And I verify a row from non frame grid "^customListGrid" having unique value "Door" under column header "Item Name"
      | name               | value      |
      | Date               | 02/16/2016 |
      | Item Name          | Door       |
      | Quantity           | 25         |
      | Price              | $900.00    |
      | TotalPrice         | $22,500.00 |
      | Completed          |            |
      | Item Delivery Date | 02/21/2016 |


    And I verify a row from non frame grid "^customListGrid" having unique value "Window" under column header "Item Name"
      | name               | value      |
      | Date               | 02/23/2016 |
      | Item Name          | Window     |
      | Quantity           | 20         |
      | Price              | $500.00    |
      | TotalPrice         | $10,000.00 |
      | Completed          |            |
      | Item Delivery Date | 02/28/2016 |

    And I switch to default frame


    Examples:
      | Entity Name     | Third Level Tab |
      | SiteEntityForCL | Summary         |