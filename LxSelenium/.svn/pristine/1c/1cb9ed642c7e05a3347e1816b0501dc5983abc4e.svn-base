@all @smoke @smoke3
Feature: Facility Spreadsheet - Create/Update (Ref : Jira Ticket No : AUTOMATION-1164)

  Scenario Outline: I import the Facility entity and page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Facility/Detals/"
    And I import following file name:
      | FacLocation-1164.xml |
      | FacilitySP-1164.xml  |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: Facility Spreadsheet - CreatedFacilityA - Create
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Facility/Detals/"
    And I import following file name:
      | CreateFacilities-1164.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear
    And I verify the field "Name" is "<Entity Name>"
    And I verify the field "Region" is "Central Dallas(Operating)"
    And I verify the field "Market Area" is "Central"
    And I verify the field "Status" is "Active"

    And I verify the field "City" is "Alpharetta"
    And I verify the field "State / Province" is "GA"
    And I verify the field "Zip / Postal Cd" is "30004"
    And I verify the field "Country" is "United States"
    And I switch to default frame

  Examples:
    | Entity Name      | Secondary Tab | Third Level Tab |
    | CreatedFacilityA | Details       | Summary         |


  Scenario Outline: Facility Spreadsheet - CreatedFacilityB - Create
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear

    And I verify the field "Name" is "<Entity Name>"
    And I verify the field "Region" is "Central Dallas(Operating)"
    And I verify the field "Market Area" is "Legacy Market Area"
    And I verify the field "Status" is "Active"

    And I verify the field "City" is "Frisco"
    And I verify the field "State / Province" is "TX"
    And I verify the field "Zip / Postal Cd" is "75035"
    And I verify the field "Country" is "United States"
    And I switch to default frame
    And I logout

  Examples:
    | Entity Name      | Secondary Tab | Third Level Tab |
    | CreatedFacilityB | Details       | Summary         |


  Scenario Outline: Facility Spreadsheet - Update
    Given I Login to IWMS using "EditAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear
    And I fetch the entity  Lx ID from "Facility"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/Detals/UpdateFacility-1164.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "2"
    When I used data files from "Data/ImportDataFiles/iwms/Facility/Detals/"
    And I import following file name:
      | UpdateFacility-1164.xlsx |
    And I switch to default frame
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear
    And I verify the field "Name" is "<Entity Name>"
    And I verify the field "Region" is "Central Dallas(Operating)"
    And I verify the field "Market Area" is "Legacy Market Area"
    And I verify the field "Status" is "Active"
    And I verify the field "Trade Area" is "Dallas"
    And I verify the field "Description" is "This is to update facility"

    And I verify the field "City" is "Plano"
    And I verify the field "State / Province" is "TX"
    And I verify the field "Zip / Postal Cd" is "75035"
    And I verify the field "Country" is "United States"

    And I switch to default frame
    And I logout

  Examples:
    | Entity Name      | Secondary Tab | Third Level Tab |
    | CreatedFacilityA | Details       | Summary         |

#Feature: (Jira Ref: AUTOMATION-410) I create and update facility and verify them in  Facility > Details > Summary page
#
#  Background:
#    Given I Login to IWMS using "EditAccess" access credentials
#    Then I check previous user login "Edit Access Access" and continue if user "EditAccess" same or logout and login if not
#
#  Scenario Outline: I create and update facility and verify them in  Facility > Details > Summary page
#    When I used data files from "Data/ImportDataFiles/iwms/Facility/Detals"
#    And I import following file name:
#      | Create_Facility.xlsx |
##    When I navigate to "<Item>, <Secondary Tab>" entity
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    And I navigate to "<Secondary Tab>"
#    And I click on the "<Third Level Tab>" tab
##    And I navigate from left panel tree to "<Entity Name>"
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/Detals/Create_Facility.xlsx"
#    Then I verify pair of values on non editable summary page by reading data from spreadsheet row "6"
#      | name           | value                   |
#      | Street Address | Facility.StreetAddress1 |
#      | Frontage       | Facility.Frontage       |
#    When I used data files from "Data/ImportDataFiles/iwms/Facility/Detals"
#    And I import following file name:
#      | Update_Facility.xlsx |
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Facility/Detals/Create_Facility.xlsx"
#    Then I verify pair of values on non editable summary page by reading data from spreadsheet row "6"
#      | name           | value                   |
#      | Street Address | Facility.StreetAddress1 |
#      | Frontage       | Facility.Frontage       |
#    And I switch to default frame
#
#  Examples:
#    | Item     | Secondary Tab | Third Level Tab | Entity Name       |
#    | Facility | Details       | Summary         | Imported-Facility |
