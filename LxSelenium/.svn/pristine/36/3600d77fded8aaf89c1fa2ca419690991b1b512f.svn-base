@all @smoke @smoke4
Feature: (Jira Ref : AUTOMATION-411, AUTOMATION-1165) I create and update location and verify them in Location> Details> Summary page

  Scenario Outline: I create Location through spreadsheet import
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Summary/"
    And I import following files:
      | Pagelayout-1165.xml      |
      | CreateLocation-1165.xlsx |

    When I navigate to entity type "Location" named "Location B"
    Then I navigate to "Details"
    And I click on the "<Third Level Tab>" tab

    When I navigate to entity type "Location" named "Location A"
    Then I navigate to "Details"
    And I click on the "<Third Level Tab>" tab
    And I select "Location Page Layout" page layout from dropdown
    And I fetch entity ID from location summary page
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Location/Details/Summary/UpdateLocation-1165.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"

    And I verify the field "Group" is "Retail" in a same row in "Location Summary"
    And I verify the field "Location ID" is "" in a same row in "Location Summary"
    And I verify the field "Type" is "" in a same row in "Location Summary"
    And I verify the field "Portfolio" is "Lucernex-Selenium" in a same row in "Location Summary"
    And I verify the field "Category" is "" in a same row in "Location Summary"
    And I verify the field "Status" is "" in a same row in "Location Summary"

    And I verify the following details in non editable summary page in frame grid
      | Location General Info |            |
      | Name                  | Location A |

    And I verify the field "Description" is "" in a same row in "Location General Info"
    And I verify the field "Center / Complex" is "" in a same row in "Location General Info"
    And I verify the field "Primary Use" is "" in a same row in "Location General Info"
    And I verify the field "Gross Leasable Area" is "200,000" in a same row in "Location General Info"
    And I verify the field "Parcel Area" is "" in a same row in "Location General Info"
    And I verify the field "Year Open" is "" in a same row in "Location General Info"
    And I verify the field "Area Measurement" is "" in a same row in "Location General Info"
    And I verify the field "Area Measurement" is "" in a same row in "Location General Info"
    And I verify the field "City" is "" in "Location General Info"
    And I verify the field "State" is "" in "Location General Info"


    And I verify the field "Region" is "" in a same row in "Region / Area Groups"
    And I verify the field "Sub Region1" is "" in a same row in "Region / Area Groups"
    And I verify the field "Sub Region2" is "" in a same row in "Region / Area Groups"
    And I verify the field "Longitude" is "" in a same row in "Region / Area Groups"
    And I verify the field "Zip" is "" in "Region / Area Groups"
    And I verify the field "Country" is "United States" in "Region / Area Groups"
    And I verify the field "Market" is "" in a same row in "Region / Area Groups"
    And I verify the field "Sub Area1" is "" in a same row in "Region / Area Groups"
    And I verify the field "Sub Area2" is "" in a same row in "Region / Area Groups"
    And I verify the field "Latitude" is "" in a same row in "Region / Area Groups"
    And I verify the field "Currency" is "" in a same row in "Region / Area Groups"

    And I verify grid "BOGridParcel" is empty with the following message "No rows to display"
    And I verify grid "BOGridFacility" is empty with the following message "No rows to display"
    And I verify grid "BOGridContract" is empty with the following message "No rows to display"

    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Summary/"
    And I import following files:
      | UpdateLocation-1165.xlsx |
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Location/Details/Summary/UpdateLocation-1165.xlsx"
    And I click on the "<Third Level Tab>" tab
    And I select "Location Page Layout" page layout from dropdown
    And I wait for the Loading text to disappear

    And I verify the field "Group" is "Lease" in a same row in "Location Summary"
    And I verify the field "Location ID" is "" in a same row in "Location Summary"
    And I verify the field "Type" is "" in a same row in "Location Summary"
    And I verify the field "Portfolio" is "Lucernex-Selenium" in a same row in "Location Summary"
    And I verify the field "Category" is "" in a same row in "Location Summary"
    And I verify the field "Status" is "Active" in a same row in "Location Summary"

    And I verify the following details in non editable summary page in frame grid
      | Location General Info |            |
      | Name                  | Location A |

    And I verify the field "Description" is "" in a same row in "Location General Info"
    And I verify the field "Center / Complex" is "" in a same row in "Location General Info"
    And I verify the field "Primary Use" is "" in a same row in "Location General Info"
    And I verify the field "Gross Leasable Area" is "50,000" in a same row in "Location General Info"
    And I verify the field "Parcel Area" is "" in a same row in "Location General Info"
    And I verify the field "Year Open" is "" in a same row in "Location General Info"
    And I verify the field "Area Measurement" is "" in a same row in "Location General Info"
    And I verify the field "City" is "Sao Paulo" in "Location General Info"
    And I verify the field "State" is "" in "Location General Info"

    And I verify the field "Region" is "" in a same row in "Region / Area Groups"
    And I verify the field "Sub Region1" is "" in a same row in "Region / Area Groups"
    And I verify the field "Sub Region2" is "" in a same row in "Region / Area Groups"
    And I verify the field "Longitude" is "" in a same row in "Region / Area Groups"
    And I verify the field "Zip" is "01046" in "Region / Area Groups"
    And I verify the field "Country" is "Brazil" in "Region / Area Groups"
    And I verify the field "Market" is "" in a same row in "Region / Area Groups"
    And I verify the field "Sub Area1" is "" in a same row in "Region / Area Groups"
    And I verify the field "Sub Area2" is "" in a same row in "Region / Area Groups"
    And I verify the field "Latitude" is "" in a same row in "Region / Area Groups"
    And I verify the field "Currency" is "" in a same row in "Region / Area Groups"

    And I verify grid "BOGridParcel" is empty with the following message "No rows to display"
    And I verify grid "BOGridFacility" is empty with the following message "No rows to display"
    And I verify grid "BOGridContract" is empty with the following message "No rows to display"

    Examples:
      | Login User   | Login full username  | Third Level Tab |
      | DeleteAccess | Delete Access Access | Summary         |


#@all @smoke @smoke4
#Feature: (Jira Ref : AUTOMATION-411) I create and update location and verify them in Location> Details> Summary page
#
#  Scenario Outline: I create Location through spreadsheet import
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#
#    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Summary/"
#    And I import following file name:
#      | Create_Location.xls |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Location/Details/Summary/Create_Location.xls"
#    Then I verify row pair of values on non editable summary page by reading data from spreadsheet row "<Spreadsheet Row>"
#      | name        | value                        |
#      | Name        | Location.LocationName        |
#      | Group       | Location.CodeLocationGroupID |
#      | Type        | Location.CodeLocationTypeID  |
#      | Portfolio   | Location.ProgramID           |
#      | Location ID | Location.ClientEntityID      |
#      | City        | Location.City                |
#      | State       | Location.State               |
#      | Zip         | Location.PostalCode          |
#      | Country     | Location.Country             |
#      | Description | Location.ProjectDescription  |
#      | Region      | Location.StreetAddress1      |
#      | Market      | Location.CodeMarketAreaID    |
#    And I logout
#
#    Examples:
#      | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name       | Spreadsheet Row |
#      | DeleteAccess | Delete Access Access | Location | Details          | Summary         | Imported-Location | 6               |
#
#  Scenario Outline: I update Location through spreadsheet import
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#
#    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Summary/"
#    And I import following file name:
#      | Update_Location.xls |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Location/Details/Summary/Update_Location.xls"
#    Then I verify row pair of values on non editable summary page by reading data from spreadsheet row "<Spreadsheet Row>"
#      | name   | value                   |
#      | City   | Location.City           |
#      | Region | Location.StreetAddress1 |
#    And I logout
#
#    Examples:
#      | Login User | Login full username | Item     | Second Level Tab | Third Level Tab | Entity Name       | Spreadsheet Row |
#      | EditAccess | Edit Access Access  | Location | Details          | Summary         | Imported-Location | 6               |
