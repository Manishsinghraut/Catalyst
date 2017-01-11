@all @smoke @smoke4Dot1
Feature: Space Management Spreadsheet - Create/Update (Ref : Jira Ticket No : AUTOMATION-1162)

  Scenario Outline: I import the Facility entity and space Record id report
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Facility/SpaceManagement/"
    And I import following file name:
      | Facility_A-1162.xml       |
      | SpaceRecIDReport-1162.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Space Management Spreadsheet - Create
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Facility/SpaceManagement/"
    And I import following file name:
      | CreateSpaces-1162.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "Retail" under column header "Group"
      | name          | value  |
      | Group         | Retail |
      | Room          | 12     |
      | Suite         | 120    |
      | Rentable Area | 2,500  |
      | Space Use     | Store  |
      | Type          | Store  |
      | Status        | Active |
    And I verify a row from grid "<grid>" having unique value "Retail Space" under column header "Group"
      | name          | value        |
      | Group         | Retail Space |
      | Room          | 13           |
      | Suite         | 121          |
      | Rentable Area | 1,500        |
      | Space Use     |              |
      | Type          | Store Space  |
      | Status        | Active       |
    And I switch to default frame
    And I logout

    Examples:
      | Entity Name | Secondary Tab    | Third Level Tab  | grid    |
      | Facility A  | Space Management | Space Management | thisDiv |


  Scenario Outline: Space Management Spreadsheet - Update
    Given I Login to IWMS using "EditAccess" access credentials
    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "<Reports Grid ID>" having the following header and cell values
      | name        | value        |
      | Report Name | Space Rec ID |
    And I switch to "build layout" child window
    And I verify Name "Facility A", Space Name "Selenium Space Management1" and extract Space RecID and Tenant RecID on report window
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/SpaceManagement/UpdateSpace-1162.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/SpaceManagement/UpdateSpace-1162.xlsx"
    And I set cell value in spread sheet of type "Tenant" row "7" under header "LxRecID" of column index "3"
    And I close report window
    And I switch to main window
    When I used data files from "Data/ImportDataFiles/iwms/Facility/SpaceManagement/"
    And I import following file name:
      | UpdateSpace-1162.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "2,500" under column header "Rentable Area"
      | name          | value        |
      | Group         | Retail Space |
      | Room          | 12           |
      | Suite         | 120          |
      | Rentable Area | 2,500        |
      | Space Use     | Store        |
      | Type          | Store Space  |
      | Status        | Active       |
    And I verify the following fields value on editable page
      | name                   | value                      |
      | Space_CodeSpaceGroupID | Retail Space               |
      | Space_CodeSpaceTypeID  | Store Space                |
      | Space_EffectiveDate    | 01/01/2002                 |
      | Space_SpaceName        | Selenium Space Management1 |
      | Space_Notes            | Updating  Spaces           |
    And I click on "edit" row action in the grid "BOGridTenant" having the following header "Tenant Group" and cell value "Retail"
      | name            | value      |
      | Tenant Group    | Retail     |
      | Tenant Type     | Store      |
      | Tenant Category | Store      |
      | Tenant Name     | Joan       |
      | Move In Date    | 01/10/2015 |
      | Tenant Status   | Active     |
    And I switch to default frame
    And I verify the following fields value on editable page
      | name             | value   |
      | Tenant_Capacity1 | 11      |
      | Tenant_Capacity2 | 22      |
      | Tenant_Capacity3 | 23      |
      | Tenant_Capacity4 | 4       |
      | Tenant_Notes     | Updated |
    And I click "Cancel" button
    And I switch to visible frame
    And I verify a row from grid "<grid>" having unique value "1,500" under column header "Rentable Area"
      | name          | value        |
      | Group         | Retail Space |
      | Room          | 13           |
      | Suite         | 121          |
      | Rentable Area | 1,500        |
      | Space Use     |              |
      | Type          | Store Space  |
      | Status        | Active       |

    And I switch to default frame
    And I logout

    Examples:
      | Entity Name | Secondary Tab    | Third Level Tab  | grid    | Reports Grid ID |
      | Facility A  | Space Management | Space Management | thisDiv | ^editBOGrid     |

#@all @smoke @smoke3
#Feature: (Jira Ref: AUTOMATION-407) I create and update space management and verify them in Facility > Space Management > Space Management page
#
#  Scenario Outline: I create space management through spreadsheet import
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Facility/SpaceManagement/SpaceManagement/"
#    And I import following file name:
#      | Create_Space_Management.xls |
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "<Second Level Tab>"
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/SpaceManagement/SpaceManagement/Create_Space_Management.xls"
#    Then I verify in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#      | name          | value                   |
#      | Group         | Space.CodeSpaceGroupID  |
#      | Room          | Space.RoomNumber        |
#      | Suite         | Space.SuiteNumber       |
#      | Rentable Area | Space.RentableArea      |
#      | Space Use     | Space.CodeSpaceUseID    |
#      | Type          | Space.CodeSpaceTypeID   |
#      | Status        | Space.CodeSpaceStatusID |
#
#    And I click in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#      | name  | value                  |
#      | Group | Space.CodeSpaceGroupID |
#    And I click "edit" link of the row "1" in grid "BOGridTenant"
#    Then I verify all fields values on editable page comparing with "<Spreadsheet Row>" th row of spreadsheet
#      | name                     | value                    |
#      | Tenant_CodeTenantGroupID | Tenant.CodeTenantGroupID |
#      | Tenant_CodeTenantTypeID  | Tenant.CodeTenantTypeID  |
#    And I click on the "Cancel" button
#    And I logout
#
#    Examples:
#      | Login User   | Login full username  | Item     | Second Level Tab | Entity Name       | Spreadsheet Row | Grid Row | Grid ID |
#      | DeleteAccess | Delete Access Access | Facility | Space Management | Lucernex-Facility | 6               | 2        | thisDiv |
#
#  Scenario Outline: I update space management through spreadsheet import
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#
#    When I used data files from "Data/ImportDataFiles/iwms/Facility/SpaceManagement/SpaceManagement/"
#    And I import following file name:
#      | Update_Space_Management.xls |
##    When I navigate to entity type "<Item>" named "<Entity Name>"
##    Then I navigate to "<Second Level Tab>"
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "<Second Level Tab>"
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/SpaceManagement/SpaceManagement/Create_Space_Management.xls"
#    And I click in grid "<Grid ID>" in row "<Grid Row>" by reading data from spread sheet row "<Spreadsheet Row>"
#      | name  | value                  |
#      | Group | Space.CodeSpaceGroupID |
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/SpaceManagement/SpaceManagement/Update_Space_Management.xls"
#    Then I compare attribute value on editable page by reading data from spread sheet row "<Spreadsheet Row>"
#      | name               | value              |
#      | Space_RentableArea | Space.RentableArea |
#      | Space_FloorNumber  | Space.FloorNumber  |
#    And I logout
#
#    Examples:
#      | Login User | Login full username | Item     | Second Level Tab | Entity Name       | Spreadsheet Row | Grid Row | Grid ID |
#      | EditAccess | Edit Access Access  | Facility | Space Management | Lucernex-Facility | 6               | 2        | thisDiv |
#

