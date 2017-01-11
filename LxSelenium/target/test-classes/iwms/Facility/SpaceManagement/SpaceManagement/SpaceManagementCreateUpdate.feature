@all @smoke @smoke3
Feature: (Jira Ref: AUTOMATION-407) I create and update space management and verify them in Facility > Space Management > Space Management page

  Scenario Outline: I create space management through spreadsheet import
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Facility/SpaceManagement/SpaceManagement/"
    And I import following file name:
      | Create_Space_Management.xls |
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/SpaceManagement/SpaceManagement/Create_Space_Management.xls"
    Then I verify in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
      | name          | value                   |
      | Group         | Space.CodeSpaceGroupID  |
      | Room          | Space.RoomNumber        |
      | Suite         | Space.SuiteNumber       |
      | Rentable Area | Space.RentableArea      |
      | Space Use     | Space.CodeSpaceUseID    |
      | Type          | Space.CodeSpaceTypeID   |
      | Status        | Space.CodeSpaceStatusID |

    And I click in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
      | name  | value                  |
      | Group | Space.CodeSpaceGroupID |
    And I click "edit" link of the row "1" in grid "BOGridTenant"
    Then I verify all fields values on editable page comparing with "<Spreadsheet Row>" th row of spreadsheet
      | name                     | value                    |
      | Tenant_CodeTenantGroupID | Tenant.CodeTenantGroupID |
      | Tenant_CodeTenantTypeID  | Tenant.CodeTenantTypeID  |
    And I click on the "Cancel" button
    And I logout

    Examples:
      | Login User   | Login full username  | Item     | Second Level Tab | Entity Name       | Spreadsheet Row | Grid Row | Grid ID |
      | DeleteAccess | Delete Access Access | Facility | Space Management | Lucernex-Facility | 6               | 2        | thisDiv |

  Scenario Outline: I update space management through spreadsheet import
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    When I used data files from "Data/ImportDataFiles/iwms/Facility/SpaceManagement/SpaceManagement/"
    And I import following file name:
      | Update_Space_Management.xls |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/SpaceManagement/SpaceManagement/Create_Space_Management.xls"
    And I click in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
      | name  | value                  |
      | Group | Space.CodeSpaceGroupID |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/SpaceManagement/SpaceManagement/Update_Space_Management.xls"
    Then I compare attribute value on editable page by reading data from spread sheet row "<Spreadsheet Row>"
      | name               | value              |
      | Space_RentableArea | Space.RentableArea |
      | Space_FloorNumber  | Space.FloorNumber  |
    And I logout

    Examples:
      | Login User | Login full username | Item     | Second Level Tab | Entity Name       | Spreadsheet Row | Grid Row | Grid ID |
      | EditAccess | Edit Access Access  | Facility | Space Management | Lucernex-Facility | 6               | 2        | thisDiv |