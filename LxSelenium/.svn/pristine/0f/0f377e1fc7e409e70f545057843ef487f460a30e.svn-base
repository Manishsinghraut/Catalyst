@all @smoke @smoke4Dot1
Feature: Complex Spreadsheet - Create/Update (Ref : Jira Ticket No : AUTOMATION-1161)

  Scenario Outline: I import the page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CostManagement/"
    And I import following file name:
      | ComplexPageLayout-1161.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: I Complex Spreadsheet - Create
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CostManagement/"
    And I import following file name:
      | CreateComplex-1161.xlsx |
    And I navigate to the admin dashboard
    And I click on the "Manage Complex/Center Details" link
    And I verify a row from non frame grid "<grid>" having unique value "Cielo Vista Mall" under column header "Name"
      | name                 | value              |
      | Name                 | Cielo Vista Mall   |
      | Format               | Mall               |
      | Scheme               | Class              |
      | Gross Lease Area     | 150,000.00         |
      | Number Stores        | 56                 |
      | Number Outparcels    | 5                  |
      | Number of Levels     | 3                  |
      | Occupancy Percentage | 76.00000%          |
      | Landlord             | View Access Access |
      | Year Built           | 1995               |
      | Status               | Open               |
    And I verify a row from non frame grid "<grid>" having unique value "Stonebriar" under column header "Name"
      | name                 | value              |
      | Name                 | Stonebriar         |
      | Format               | Mall               |
      | Scheme               | Class              |
      | Gross Lease Area     | 150,000.00         |
      | Number Stores        | 56                 |
      | Number Outparcels    | 5                  |
      | Number of Levels     | 3                  |
      | Occupancy Percentage | 76.00000%          |
      | Landlord             | View Access Access |
      | Year Built           | 1995               |
      | Status               | Newly Opened       |
    And I logout

  Examples:
    | grid          |
    | BOGridComplex |

  Scenario Outline: I Complex Spreadsheet - Update
    Given I Login to IWMS using "EditAccess" access credentials
    And I extract LxID of the name "Stonebriar" of type "Complex" from rest API
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/AdminPage/CostManagement/UpdateComplex-1161.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"
    When I used data files from "Data/ImportDataFiles/iwms/AdminPage/CostManagement/"
    And I import following file name:
      | UpdateComplex-1161.xlsx |
    And I navigate to the admin dashboard
    And I click on the "Manage Complex/Center Details" link
    And I click on "edit" row action in the grid "<grid>" having the following header "Name" and cell value "Stonebriar"
      | name                 | value                |
      | Name                 | Stonebriar           |
      | Format               | Mall                 |
      | Scheme               | Class                |
      | Gross Lease Area     | 150,000.00           |
      | Number Stores        | 56                   |
      | Number Outparcels    | 5                    |
      | Number of Levels     | 3                    |
      | Occupancy Percentage | 76.00000%            |
      | Landlord             | Delete Access Access |
      | Year Built           | 1995                 |
      | Status               | Newly Opened         |

    And I verify the following fields value on editable page
      | name                           | value           |
      | Complex_StreetAddress1         | 7500 Dove Drive |
      | Complex_City                   | Frisco          |
      | Complex_ExpansionPlanDate      | 02/02/2050      |
      | Complex_CodeBuildingAreaUnitID | SF              |
    And I click "Cancel" button
    And I logout

  Examples:
    | grid          |
    | BOGridComplex |