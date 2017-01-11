@all @smoke @smoke3Dot1
Feature: Site Spreadsheet - Create/Update (Ref : Jira Ticket No : AUTOMATION-1172)

  Scenario Outline: I import the page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Site/Details/Summary/"
    And I import following file name:
      | SiteSP-1172.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Site Spreadsheet -  CreatedSiteA - Create
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Site/Details/Summary/"
    And I import following file name and stop on first error:
      | CreateSites-1172.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear
    And I verify the following details in non editable summary page in frame grid
      | General Information |               |
      | Name                | <Entity Name> |
#    And I verify the field "Name" is "<Entity Name>"
    And I verify the field "Store Number" is ""
    And I verify the field "Portfolio" is "Lucernex-Selenium"
    And I verify the field "Region" is "Central(Central region - preOpen))"
    And I verify the field "Market Area" is "Central"
    And I verify the field "Project Type" is "Retail Project"
    And I verify the field "Market Type" is ""
    And I verify the field "Trade Area" is ""
    And I verify the field "Construction Type" is ""
    And I verify the field "Deal Type" is ""
    And I verify the field "Client ID" is ""
    And I verify the field "Time Zone" is ""
    And I verify the field "Description" is "This is to create SiteA"
    And I verify the field "Delete Access" is "	Delete Access Access"in a same row in "Management"

    And I verify the field "City" is "Alpharetta"
    And I verify the field "State / Province" is "GA"
    And I verify the field "Zip / Postal Cd" is "30004"
    And I verify the field "Country" is "United States"
    And I verify the field "Actual/Forecast Delivery Date" is "12/31/2030"
#    And I verify the field "Actual/Projected Delivery Date" is "12/31/2030" in "Key Dates"

    And I switch to default frame

    Examples:
      | Entity Name  | Secondary Tab | Third Level Tab | Login User   | Login full username  |
      | CreatedSiteA | Details       | Summary         | DeleteAccess | Delete Access Access |


  Scenario Outline: Site Spreadsheet - CreatedSiteB - Create
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I wait for the Loading text to disappear
#    And I verify the field "Name" is "<Entity Name>"
    And I verify the following details in non editable summary page in frame grid
      | General Information |               |
      | Name                | <Entity Name> |
    And I verify the field "Store Number" is ""
    And I verify the field "Portfolio" is "Lucernex-Selenium"
    And I verify the field "Region" is "Central (Central region - preOpen) Frisco(Pre-Open"
    And I verify the field "Market Area" is "Legacy Market Area"
    And I verify the field "Project Type" is "Retail Project"
    And I verify the field "Market Type" is ""
    And I verify the field "Trade Area" is ""
    And I verify the field "Construction Type" is ""
    And I verify the field "Deal Type" is ""
    And I verify the field "Client ID" is ""
    And I verify the field "Time Zone" is ""
    And I verify the field "Description" is "This is to create SiteB"
    And I verify the field "Delete Access" is "	Delete Access Access"in a same row in "Management"

    And I verify the field "City" is "Frisco"
    And I verify the field "State / Province" is "TX"
    And I verify the field "Zip / Postal Cd" is "75035"
    And I verify the field "Country" is "United States"
    And I verify the field "Actual/Forecast Delivery Date" is "12/31/2030"
#    And I verify the field "Actual/Projected Delivery Date" is "12/31/2030"
#    And I verify the field "Actual/Projected Delivery Date" is "12/31/2030" in "Key Dates"

    And I switch to default frame
#    And I logout

    Examples:
      | Entity Name  | Secondary Tab | Third Level Tab | Login User   | Login full username  |
      | CreatedSiteB | Details       | Summary         | DeleteAccess | Delete Access Access |


  Scenario Outline: Site Spreadsheet - Update
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I fetch the entity  Lx ID from "Site"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Site/Details/Summary/UpdatedSite-1172.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "2"
    When I used data files from "Data/ImportDataFiles/iwms/Site/Details/Summary/"
    And I import following file name:
      | UpdatedSite-1172.xlsx |
    And I switch to default frame
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame

    And I verify the field "Name" is "<Entity Name>"
    And I verify the field "Store Number" is ""
    And I verify the field "Portfolio" is "Lucernex-Selenium"
    And I verify the field "Region" is "Selenium-Parent-Region(Parent Region)"
    And I verify the field "Market Area" is "Legacy Market Area"
    And I verify the field "Project Type" is "Retail Project"
    And I verify the field "Market Type" is ""
    And I verify the field "Trade Area" is ""
    And I verify the field "Construction Type" is ""
    And I verify the field "Deal Type" is ""
    And I verify the field "Client ID" is ""
    And I verify the field "Time Zone" is ""
    And I verify the field "Description" is "This is to update SiteA"
    And I verify the field "Delete Access" is "	Delete Access Access"in a same row in "Management"

    And I verify the field "City" is "Plano"
    And I verify the field "State / Province" is "TX"
    And I verify the field "Zip / Postal Cd" is "75023"
    And I verify the field "Country" is "United States"
    And I verify the field "Actual/Forecast Delivery Date" is "11/03/2030"
#    And I verify the field "Actual/Projected Delivery Date" is "11/03/2030"
#    And I verify the field "Actual/Projected Delivery Date" is "11/03/2030" in "Key Dates"

    And I switch to default frame
    And I logout

    Examples:
      | Entity Name  | Secondary Tab | Third Level Tab | Login User | Login full username |
      | CreatedSiteA | Details       | Summary         | EditAccess | Edit Access Access  |


#@all @smoke @smoke4Dot1
#Feature: (Jira Ref: AUTOMATION-418) I create and update site and verify them in Site> Details> Summary page
#
#  Scenario Outline: I create site through spreadsheet import
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not
#
#    When I used data files from "Data/ImportDataFiles/iwms/Site/Details/Summary/"
#    And I import following file name:
#      | Create_Site.xls |
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Site/Details/Summary/Create_Site.xls"
#    Then I verify pair of values on non editable summary page by reading data from spreadsheet row "<Spreadsheet Row>"
#      | name              | value                                |
#      | Name              | ProjectEntity.PotentialProjectName   |
#      | Region            | ProjectEntity.RegionID               |
#      | Portfolio         | ProjectEntity.ProgramID              |
#      | Project Type      | ProjectEntity.CodeProjectTypeID      |
#      | Market Area       | ProjectEntity.CodeMarketAreaID       |
#      | Construction Type | ProjectEntity.CodeConstructionTypeID |
#      | Deal Type         | ProjectEntity.CodeDealTypeID         |
#      | Cross Street 1    | ProjectEntity.CrossStreet1           |
#      | Cross Street 2    | ProjectEntity.CrossStreet2           |
#      | City              | ProjectEntity.City                   |
#      | State / Province  | ProjectEntity.State                  |
#
#  Examples:
#    | Second Level Tab | Third Level Tab | Entity Name   | Spreadsheet Row |
#    | Details          | Summary         | Imported Site | 6               |
#
#  Scenario Outline: I update site through spreadsheet import
#    Given I Login to IWMS using "EditAccess" access credentials
#    Then I check previous user login "Edit Access Access" and continue if user "EditAccess" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Site/Details/Summary/"
#    And I import following file name:
#      | Update_Site.xls |
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Site/Details/Summary/Update_Site.xls"
#    Then I verify pair of values on non editable summary page by reading data from spreadsheet row "<Spreadsheet Row>"
#      | name              | value                                |
#      | Name              | ProjectEntity.PotentialProjectName   |
#      | Region            | ProjectEntity.RegionID               |
#      | Portfolio         | ProjectEntity.ProgramID              |
#      | Project Type      | ProjectEntity.CodeProjectTypeID      |
#      | Market Area       | ProjectEntity.CodeMarketAreaID       |
#      | Construction Type | ProjectEntity.CodeConstructionTypeID |
#      | Deal Type         | ProjectEntity.CodeDealTypeID         |
#      | Cross Street 1    | ProjectEntity.CrossStreet1           |
#      | Cross Street 2    | ProjectEntity.CrossStreet2           |
#      | City              | ProjectEntity.City                   |
#      | State / Province  | ProjectEntity.State                  |
#
#  Examples:
#    | Second Level Tab | Third Level Tab | Entity Name   | Spreadsheet Row |
#    | Details          | Summary         | Imported Site | 6               |
