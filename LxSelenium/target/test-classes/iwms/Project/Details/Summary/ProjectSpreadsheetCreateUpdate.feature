@all @smoke @smoke4Dot1
Feature: (Ref : Jira Ticket No : Automation-414, Automation-1168) I create and update project and verify them in  Project > Details > Summary page

  Scenario: I import the project entity
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Summary/"
    And I import following files:
      | ProjLocation-1168.xml    |
      | ProjectSP-1168.xml       |
      | CreateProjects-1168.xlsx |

  Scenario Outline: I create project and verify them in  Project > Details > Summary page
    Given I navigate to entity type "Opening Projects" named "CreatedProjectB" through search option
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "ProjectSP" page layout from dropdown
    And I wait for the Loading text to disappear

    And I verify the following details in non editable summary page in frame grid
      | General Information |                                                     |
      | Name                | CreatedProjectB                                     |
      | Region              | Central (Central region - preOpen) Frisco(Pre-Open) |
      | Market Area         | Legacy Market Area                                  |

    And I verify the field "Store Number" is "" in a same row in "General Information"
    And I verify the field "Prototype" is "" in a same row in "General Information"
    And I verify the field "Market Type" is "" in a same row in "General Information"
    And I verify the field "Construction Type" is "" in a same row in "General Information"
    And I verify the field "Client ID" is "" in a same row in "General Information"
    And I verify the field "Description" is "Created project" in a same row in "General Information"
    And I verify the field "Portfolio" is "Lucernex-Selenium" in a same row in "General Information"
    And I verify the field "Project Type" is "" in a same row in "General Information"
    And I verify the field "Trade Area" is "" in a same row in "General Information"
    And I verify the field "Deal Type" is "" in a same row in "General Information"
    And I verify the field "Time Zone" is "" in a same row in "General Information"

    And I verify the following details in non editable summary page in frame grid
      | Management    |                      |
      | Delete Access | Delete Access Access |

    And I verify the field "Center Name" is "" in a same row in "Location"
    And I verify the field "Cross Street 1" is "" in a same row in "Location"
    And I verify the field "Street Address" is "" in a same row in "Location"
    And I verify the field "City" is "Frisco" in a same row in "Location"
    And I verify the field "Zip / Postal Cd" is "75035" in a same row in "Location"
    And I verify the field "County" is "" in a same row in "Location"
    And I verify the field "Latitude" is "" in a same row in "Location"
    And I verify the field "Cross Street 2" is "" in a same row in "Location"
    And I verify the field "State / Province" is "TX" in a same row in "Location"
    And I verify the field "Country" is "United States" in a same row in "Location"
    And I verify the field "Longitude" is "" in a same row in "Location"

    And I verify the field "Project Phase" is "" in a same row in "Key Dates"
    And I verify the field "Project Status" is "" in a same row in "Key Dates"
    And I verify the field "Actual/Forecast Delivery Date" is "03/31/2030" in a same row in "Key Dates"
    And I verify the field "R.E. Planner Open Date" is "" in a same row in "Key Dates"

    And I verify the following details in non editable summary page in frame grid
      | Milestone Timeline  |            |
      | Baseline Start Date | 03/31/2030 |
      | Current Start Date  | 03/31/2030 |

    When I navigate to entity type "Opening Projects" named "CreatedProjectA" through search option
    Then I see "CreatedProjectA" name on the header
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "ProjectSP" page layout from dropdown
    And I wait for the Loading text to disappear

    And I verify the following details in non editable summary page in frame grid
      | General Information |                                    |
      | Name                | CreatedProjectA                    |
      | Region              | Central(Central region - preOpen)) |
      | Market Area         | Central                            |

    And I verify the field "Store Number" is "" in a same row in "General Information"
    And I verify the field "Prototype" is "" in a same row in "General Information"
    And I verify the field "Market Type" is "" in a same row in "General Information"
    And I verify the field "Construction Type" is "" in a same row in "General Information"
    And I verify the field "Client ID" is "" in a same row in "General Information"
    And I verify the field "Description" is "Created project" in a same row in "General Information"
    And I verify the field "Portfolio" is "Lucernex-Selenium" in a same row in "General Information"
    And I verify the field "Project Type" is "" in a same row in "General Information"
    And I verify the field "Trade Area" is "" in a same row in "General Information"
    And I verify the field "Deal Type" is "" in a same row in "General Information"
    And I verify the field "Time Zone" is "" in a same row in "General Information"

    And I verify the following details in non editable summary page in frame grid
      | Management    |                      |
      | Delete Access | Delete Access Access |

    And I verify the field "Center Name" is "" in a same row in "Location"
    And I verify the field "Cross Street 1" is "" in a same row in "Location"
    And I verify the field "Street Address" is "" in a same row in "Location"
    And I verify the field "City" is "Alpharetta" in a same row in "Location"
    And I verify the field "Zip / Postal Cd" is "30004" in a same row in "Location"
    And I verify the field "County" is "" in a same row in "Location"
    And I verify the field "Latitude" is "" in a same row in "Location"
    And I verify the field "Cross Street 2" is "" in a same row in "Location"
    And I verify the field "State / Province" is "GA" in a same row in "Location"
    And I verify the field "Country" is "United States" in a same row in "Location"
    And I verify the field "Longitude" is "" in a same row in "Location"

    And I verify the field "Project Phase" is "" in a same row in "Key Dates"
    And I verify the field "Project Status" is "" in a same row in "Key Dates"
    And I verify the field "Actual/Forecast Delivery Date" is "12/31/2030" in a same row in "Key Dates"
    And I verify the field "R.E. Planner Open Date" is "" in a same row in "Key Dates"

    And I verify the following details in non editable summary page in frame grid
      | Milestone Timeline  |            |
      | Baseline Start Date | 12/31/2030 |
      | Current Start Date  | 12/31/2030 |

    And I fetch entity ID from project summary page
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Project/Details/Summary/UpdateProject-1168.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"


    Examples:
      | Secondary Tab | Third Level Tab |
      | Details       | Summary         |

  Scenario Outline: I update project and verify them in  Project > Details > Summary page
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Summary/"
    And I import following files:
      | UpdateProject-1168.xlsx |

    When I navigate to entity type "Opening Projects" named "CreatedProjectA" through search option
    Then I navigate to "<Secondary Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select "ProjectSP" page layout from dropdown
    And I wait for the Loading text to disappear

    And I verify the following details in non editable summary page in frame grid
      | General Information |                                                     |
      | Name                | CreatedProjectA                                     |
      | Region              | Central (Central region - preOpen) Frisco(Pre-Open) |
      | Market Area         | Legacy Market Area                                  |

    And I verify the field "Store Number" is "" in a same row in "General Information"
    And I verify the field "Prototype" is "" in a same row in "General Information"
    And I verify the field "Market Type" is "" in a same row in "General Information"
    And I verify the field "Construction Type" is "" in a same row in "General Information"
    And I verify the field "Client ID" is "" in a same row in "General Information"
    And I verify the field "Description" is "Updated project" in a same row in "General Information"
    And I verify the field "Portfolio" is "Lucernex-Selenium" in a same row in "General Information"
    And I verify the field "Project Type" is "" in a same row in "General Information"
    And I verify the field "Trade Area" is "" in a same row in "General Information"
    And I verify the field "Deal Type" is "" in a same row in "General Information"
    And I verify the field "Time Zone" is "" in a same row in "General Information"

    And I verify the following details in non editable summary page in frame grid
      | Management    |                      |
      | Delete Access | Delete Access Access |

    And I verify the field "Center Name" is "" in a same row in "Location"
    And I verify the field "Cross Street 1" is "" in a same row in "Location"
    And I verify the field "Street Address" is "" in a same row in "Location"
    And I verify the field "City" is "Plano" in a same row in "Location"
    And I verify the field "Zip / Postal Cd" is "75035" in a same row in "Location"
    And I verify the field "County" is "" in a same row in "Location"
    And I verify the field "Latitude" is "" in a same row in "Location"
    And I verify the field "Cross Street 2" is "" in a same row in "Location"
    And I verify the field "State / Province" is "TX" in a same row in "Location"
    And I verify the field "Country" is "United States" in a same row in "Location"
    And I verify the field "Longitude" is "" in a same row in "Location"

    And I verify the field "Project Phase" is "" in a same row in "Key Dates"
    And I verify the field "Project Status" is "" in a same row in "Key Dates"
    And I verify the field "Actual/Forecast Delivery Date" is "01/01/2030" in a same row in "Key Dates"
    And I verify the field "R.E. Planner Open Date" is "" in a same row in "Key Dates"

    And I verify the following details in non editable summary page in frame grid
      | Milestone Timeline  |            |
      | Baseline Start Date | 01/01/2030 |
      | Current Start Date  | 01/01/2030 |

    Examples:
      | Secondary Tab | Third Level Tab |
      | Details       | Summary         |


#@all @smoke @smoke4Dot1
#Feature: (Ref : Jira Ticket No : Automation-414, Automation-1168) I create and update project and verify them in  Project > Details > Summary page
#
#  Scenario: I import the project entity
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Project/Details"
#    And I import following file name:
#      | Create_Project.xls |
#
#  Scenario Outline: I create project and verify them in  Project > Details > Summary page
#    Given I Login to IWMS using "DeleteAccess" access credentials
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Project/Details/Create_Project.xls"
#    Then I verify row pair of values on non editable summary page by reading data from spreadsheet row "6"
#      | name             | value                        |
#      | Name             | ProjectEntity.ProjectName    |
#      | Center Name      | ProjectEntity.ComplexID      |
#      | Cross Street 1   | Location.CrossStreet1        |
#      | Street Address   | ProjectEntity.StreetAddress1 |
#      | City             | ProjectEntity.City           |
#      | Cross Street 2   | Location.CrossStreet2        |
#      | Zip / Postal Cd  | ProjectEntity.PostalCode     |
#      | State / Province | ProjectEntity.State          |
#    And I logout
#
#    Examples:
#      | Secondary Tab | Third Level Tab | Entity Name           |
#      | Details       | Summary         | Create-Import-Project |
#
#  Scenario Outline: I update project and verify them in  Project > Details > Summary page
#    Given I Login to IWMS using "EditAccess" access credentials
#    Then I check previous user login "Edit Access Access" and continue if user "EditAccess" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Project/Details"
#    And I import following file name:
#      | Update_Project.xls |
#    And I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "<Secondary Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Project/Details/Update_Project.xls"
#    Then I verify row pair of values on non editable summary page by reading data from spreadsheet row "6"
#      | name             | value                        |
#      | Name             | ProjectEntity.ProjectName    |
#      | Center Name      | ProjectEntity.ComplexID      |
#      | Cross Street 1   | Location.CrossStreet1        |
#      | Street Address   | ProjectEntity.StreetAddress1 |
#      | City             | ProjectEntity.City           |
#      | Cross Street 2   | Location.CrossStreet2        |
#      | Zip / Postal Cd  | ProjectEntity.PostalCode     |
#      | State / Province | ProjectEntity.State          |
#    And I logout
#
#    Examples:
#      | Secondary Tab | Third Level Tab | Entity Name             |
#      | Details       | Summary         | Lucernex-Project Update |
