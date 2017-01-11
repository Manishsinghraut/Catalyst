@all @smoke @smoke3Dot1
Feature: Capital Project Spreadsheet - Create/Update (Ref : Jira Ticket No : AUTOMATION-1170)

  Scenario Outline: I import the page layout
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/CapitalProject/Details"
    And I import following file name:
      | Page_layouts-1170.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: Capital Project Spreadsheet - Capital Project A - Create
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/CapitalProject/Details/"
    And I import following file name:
      | CreateCapitalProjects-1170.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify the field "Name" is "<Entity Name>"
    And I verify the field "Store Number" is ""
    And I verify the field "Portfolio" is "Lucernex-Selenium"
    And I verify the field "Region" is "Central Dallas(Operating)"
    And I verify the field "Market Area" is "Legacy Market Area"
    And I verify the field "Prototype" is "Selenium Webdriver Prototype"
    And I verify the field "Project Type" is "Retail Project"
    And I verify the field "Market Type" is "Urban"
    And I verify the field "Trade Area" is "2000"
    And I verify the field "Construction Type" is "Wood"
    And I verify the field "Deal Type" is "Rental"
    And I verify the field "Client ID" is ""
    And I verify the field "Time Zone" is ""
    And I verify the field "Description" is "This will be Created upon import"

    And I verify the field "Facility Number" is "1000" in "Facilty Overview"
    And I verify the field "Facility Status" is "Active" in "Facilty Overview"
    And I verify the field "Location" is "000056" in "Facilty Overview"
    And I verify the field "Project Phase" is "" in "Facilty Overview"
    And I verify the field "Facility Type" is "000098" in "Facilty Overview"
    And I verify the field "Facility Use" is "Retail" in "Facilty Overview"
    And I verify the field "Facility Name" is "Lucernex-Facility" in "Facilty Overview"
    And I verify the field "Project Status" is "" in "Facilty Overview"
    And I verify the field "Gross Area" is "4,000" in "Facilty Overview"
    And I verify the field "Last Years Annual Sales" is "$10,000.00" in "Facilty Overview"
    And I verify the field "Facility Group" is "Retail" in "Facilty Overview"

    And I verify the field "Actual/Forecast Delivery Date" is "12/31/2015"in a same row in "Facilty Overview"
    And I verify the field "Hours Of Operation" is "10 am - 12 pm" in "Facilty Overview"
    And I verify the field "Market Area" is "Legacy Market Area" in "Facilty Overview"
    And I verify the field "Facility Category" is "Retail" in "Facilty Overview"
    And I verify the field "Parent Region" is "Central Dallas (Operating)" in "Facilty Overview"
    And I verify the field "Distribution Center" is "Distribution Center A" in "Facilty Overview"
    And I verify the field "Depth" is "" in "Facilty Overview"
    And I verify the field "Close Date" is "01/05/2016" in "Facilty Overview"
    And I verify the field "Frontage" is "" in "Facilty Overview"
    And I verify the field "Building Area Unit" is "Square Feet" in "Facilty Overview"
    And I verify the field "Actual/Projected Delivery Date" is "" in "Facilty Overview"
    And I verify the field "Rentable Area" is "5,000" in "Facilty Overview"
    And I verify the field "Usable Area" is "2,000" in "Facilty Overview"
    And I verify the field "Trade Area" is "1000" in "Facilty Overview"
    And I verify the field "Third Party Warehouse" is "" in "Facilty Overview"

    And I switch to default frame

  Examples:
    | Entity Name       | Secondary Tab | Third Level Tab |
    | Capital Project A | Details       | Summary         |


  Scenario Outline: Capital Project Spreadsheet - Capital Project B - Create
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I verify the field "Name" is "<Entity Name>"
    And I verify the field "Store Number" is ""
    And I verify the field "Portfolio" is "Lucernex-Selenium"
    And I verify the field "Region" is "Central Dallas(Operating)"
    And I verify the field "Market Area" is "Legacy Market Area"
    And I verify the field "Prototype" is ""
    And I verify the field "Project Type" is "Retail Project"
    And I verify the field "Market Type" is "Urban"
    And I verify the field "Trade Area" is "2000"
    And I verify the field "Construction Type" is "Brick"
    And I verify the field "Deal Type" is "Rental"
    And I verify the field "Client ID" is ""
    And I verify the field "Time Zone" is ""
    And I verify the field "Description" is "This will be Created upon import"

    And I verify the field "Facility Number" is "1000" in "Facilty Overview"
    And I verify the field "Facility Status" is "Active" in "Facilty Overview"
    And I verify the field "Location" is "000056" in "Facilty Overview"
    And I verify the field "Project Phase" is "" in "Facilty Overview"
    And I verify the field "Facility Type" is "000098" in "Facilty Overview"
    And I verify the field "Facility Use" is "Retail" in "Facilty Overview"
    And I verify the field "Facility Name" is "Lucernex-Facility" in "Facilty Overview"

    And I verify the field "Project Status" is "" in "Facilty Overview"
    And I verify the field "Gross Area" is "4,000" in "Facilty Overview"
    And I verify the field "Last Years Annual Sales" is "$10,000.00" in "Facilty Overview"
    And I verify the field "Facility Group" is "Retail" in "Facilty Overview"
    And I verify the field "R.E. Planner Open Date" is "" in "Facilty Overview"

    And I verify the field "Actual/Forecast Delivery Date" is "	01/01/2015"in a same row in "Facilty Overview"
    And I verify the field "Hours Of Operation" is "10 am - 12 pm" in "Facilty Overview"
    And I verify the field "Market Area" is "Legacy Market Area" in "Facilty Overview"
    And I verify the field "Facility Category" is "Retail" in "Facilty Overview"
    And I verify the field "Parent Region" is "Central Dallas (Operating)" in "Facilty Overview"
    And I verify the field "Distribution Center" is "Distribution Center A" in "Facilty Overview"
    And I verify the field "Depth" is "" in "Facilty Overview"
    And I verify the field "Close Date" is "01/05/2016" in "Facilty Overview"
    And I verify the field "Frontage" is "" in "Facilty Overview"
    And I verify the field "Building Area Unit" is "Square Feet" in "Facilty Overview"
    And I verify the field "Actual/Projected Delivery Date" is "" in "Facilty Overview"
    And I verify the field "Rentable Area" is "5,000" in "Facilty Overview"
    And I verify the field "Usable Area" is "2,000" in "Facilty Overview"
    And I verify the field "Trade Area" is "1000" in "Facilty Overview"
    And I verify the field "Third Party Warehouse" is "" in "Facilty Overview"

    And I switch to default frame
    And I logout

  Examples:
    | Entity Name       | Secondary Tab | Third Level Tab |
    | Capital Project B | Details       | Summary         |


  Scenario Outline: Capital Project Spreadsheet - Update
    Given I Login to IWMS using "EditAccess" access credentials
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame
    And I fetch the entity  Lx ID from "Capital Project"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/CapitalProject/Details/UpdateCapitalProject-1170.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "2"
    When I used data files from "Data/ImportDataFiles/iwms/CapitalProject/Details/"
    And I import following file name:
      | UpdateCapitalProject-1170.xlsx |
    And I switch to default frame
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame

    And I verify the field "Name" is "<Entity Name>"
    And I verify the field "Store Number" is ""
    And I verify the field "Portfolio" is "Lucernex-Selenium"
    And I verify the field "Region" is "Central Dallas(Operating)"
    And I verify the field "Market Area" is "Legacy Market Area"
    And I verify the field "Prototype" is ""
    And I verify the field "Project Type" is "Retail Project"
    And I verify the field "Market Type" is "Urban"
    And I verify the field "Trade Area" is "2000"
    And I verify the field "Construction Type" is "Brick"
    And I verify the field "Deal Type" is "Leasing"
    And I verify the field "Client ID" is ""
    And I verify the field "Time Zone" is ""
    And I verify the field "Description" is "This will be Updated upon import"

    And I verify the field "Facility Number" is "1000" in "Facilty Overview"
    And I verify the field "Facility Status" is "Active" in "Facilty Overview"
    And I verify the field "Location" is "000056" in "Facilty Overview"
    And I verify the field "Project Phase" is "" in "Facilty Overview"
    And I verify the field "Facility Type" is "000098" in "Facilty Overview"
    And I verify the field "Facility Use" is "Retail" in "Facilty Overview"
    And I verify the field "Facility Name" is "Lucernex-Facility" in "Facilty Overview"

    And I verify the field "Project Status" is "" in "Facilty Overview"
    And I verify the field "Gross Area" is "4,000" in "Facilty Overview"
    And I verify the field "Last Years Annual Sales" is "$10,000.00" in "Facilty Overview"
    And I verify the field "Facility Group" is "Retail" in "Facilty Overview"
    And I verify the field "R.E. Planner Open Date" is "" in "Facilty Overview"

#    And I verify the field "Actual/Forecast Delivery Date" is "	01/01/2015"in a same row in "Facilty Overview"
    And I verify the field "Actual/Forecast Delivery Date" is "12/31/2015"in a same row in "Facilty Overview"
    And I verify the field "Hours Of Operation" is "10 am - 12 pm" in "Facilty Overview"
    And I verify the field "Market Area" is "Legacy Market Area" in "Facilty Overview"
    And I verify the field "Facility Category" is "Retail" in "Facilty Overview"
    And I verify the field "Parent Region" is "Central Dallas (Operating)" in "Facilty Overview"
    And I verify the field "Distribution Center" is "Distribution Center A" in "Facilty Overview"
    And I verify the field "Depth" is "" in "Facilty Overview"
    And I verify the field "Close Date" is "01/05/2016" in "Facilty Overview"
    And I verify the field "Frontage" is "" in "Facilty Overview"
    And I verify the field "Building Area Unit" is "Square Feet" in "Facilty Overview"
#    And I verify the field "Actual/Projected Delivery Date" is "12/31/2015" in "Facilty Overview"
    And I verify the field "Rentable Area" is "5,000" in "Facilty Overview"
    And I verify the field "Usable Area" is "2,000" in "Facilty Overview"
    And I verify the field "Trade Area" is "1000" in "Facilty Overview"
    And I verify the field "Third Party Warehouse" is "" in "Facilty Overview"
    And I switch to default frame
    And I logout

  Examples:
    | Entity Name       | Secondary Tab | Third Level Tab |
    | Capital Project B | Details       | Summary         |

#@all
#Feature: (Jir Ref: AUTOMATION-416) I create and update project and verify them in  Capital Projects > Details > Summary page
#
#  Scenario Outline: I create project and verify them in  Capital Projects > Details > Summary page
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/CapitalProject/Details"
#    And I import following file name:
#      | Create_CapitalProject.xlsx |
##    When I navigate to "<Item>, <Second Level Tab>, <Third Level Tab>" entity
##    And I navigate from left panel tree to "<Entity Name>"
##    When I navigate to entity type "<Item>" named "<Entity Name>"
##    Then I navigate to "<Second Level Tab>"
##    And I click on the "<Third Level Tab>" sub tab
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/CapitalProject/Details/Create_CapitalProject.xlsx"
#    Then I verify row pair of values on non editable summary page by reading data from spreadsheet row "6"
#      | name        | value                            |
#      | Name        | ProjectEntity.ProjectName        |
#      | Market Type | ProjectEntity.CodeMarketAreaID   |
#      | Description | ProjectEntity.ProjectDescription |
#    And I logout
#
#  Examples:
#    | Item           | Second Level Tab | Third Level Tab | Entity Name              |
#    | CapitalProject | Details          | Summary         | Imported Capital Project |
#
#  Scenario Outline: I update project and verify them in  Capital Projects > Details > Summary page
#    Given I Login to IWMS using "EditAccess" access credentials
#    When I used data files from "Data/ImportDataFiles/iwms/CapitalProject/Details"
#    And I import following file name:
#      | Update_CapitalProject.xlsx |
##    When I navigate to "<Item>, <Secondary Tab>"
##    And I click on the "<Third Level Tab>" sub tab
##    And I click on the "<Entity Name>" on the page button
##    When I navigate to entity type "<Item>" named "<Entity Name>"
##    Then I navigate to "<Second Level Tab>"
##    And I click on the "<Third Level Tab>" sub tab
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/CapitalProject/Details/Update_CapitalProject.xlsx"
#    Then I verify row pair of values on non editable summary page by reading data from spreadsheet row "6"
#      | name        | value                            |
#      | Name        | ProjectEntity.ProjectName        |
#      | Market Type | ProjectEntity.CodeMarketAreaID   |
#      | Description | ProjectEntity.ProjectDescription |
#    And I logout
#
#  Examples:
#    | Item           | Second Level Tab | Third Level Tab | Entity Name              |
#    | CapitalProject | Details          | Summary         | Imported Capital Project |
