@all
Feature: (Jira Ref: AUTOMATION-401, AUTOMATION-1192) I create and update contract and verify them in Contract> Details> Summary page

  Scenario Outline: I create contract through spreadsheet import
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/Summary/"
    And I import following files:
      | ContractPage_Layouts-1192.xml |
      | CreateContracts-1192.xlsx     |

    When I navigate to entity type "Contract" named "Contract A-8479"
    Then I navigate to entity "Contract A-8479"
    Then I see "Contract A-8479" name on the header

    Then I navigate to entity "Contract B-8479"
    Then I see "Contract B-8479" name on the header
    And I select "Contract Summary Page" page layout from dropdown
    And I click on the "Summary" tab

    And I wait for the Loading text to disappear
    And I verify the field "Group" is "Store" in a same row in "Contract Summary"
    And I verify the field "Status" is "Active" in a same row in "Contract Summary"
    And I verify the field "Effective Date" is "01/01/2000" in a same row in "Contract Summary"
    And I verify the field "Type" is "Mall Based" in a same row in "Contract Summary"
    And I verify the field "Portfolio" is "Lucernex-Selenium" in a same row in "Contract Summary"

    And I verify the field "Contract Name" is "Contract B-8479" in a same row in "General Information"
    And I verify the field "Asset Class" is "Operating" in a same row in "General Information"
    And I verify the field "Description" is "This will be created via import" in a same row in "General Information"
    And I verify the field "Category" is "Retail Lease" in a same row in "General Information"
    And I verify the field "Month to Month?" is "No" in a same row in "General Information"
    And I verify the field "Options" is "" in a same row in "General Information"
    And I verify the field "Holding Interest" is "Tenant" in a same row in "General Information"
    And I verify the field "Agreement Type" is "Rental" in a same row in "General Information"
    And I verify the field "Parcel ID" is "" in a same row in "General Information"
    And I verify the field "Facility ID" is "" in a same row in "General Information"
    And I verify the field "In Alternate Rent?" is "No" in "General Information"

    And I verify the field "Commencement Date" is "01/02/2010" in a same row in "Critical Dates"
    And I verify the field "Possession Begin" is "01/02/2000" in a same row in "Critical Dates"
    And I verify the field "Payments Begin" is "01/02/2000" in a same row in "Critical Dates"
    And I verify the field "Expiration Date" is "12/31/2025" in a same row in "Critical Dates"
    And I verify the field "Possession End Date" is "01/01/2036" in a same row in "Critical Dates"
    And I verify the field "Payments End Date" is "01/01/2036" in a same row in "Critical Dates"
    And I verify the field "Term Length" is "15 years 11 months 30 days" in a same row in "Critical Dates"
    And I verify the field "Possession Begin" is "01/02/2000" in a same row in "Critical Dates"
    And I verify the field "Obligation Date" is "01/01/2036" in a same row in "Critical Dates"

    And I verify the field "Master Contract" is "" in a same row in "Organization"
    And I verify the field "Related Contracts (if any)" is "" in a same row in "Organization"
    And I verify the field "Internal Org Code" is "" in a same row in "Organization"

    And I verify grid "BOGridContract" is empty with the following message "No rows to display"

    And I verify the field "Annual Total Amount" is "" in a same row in "Financials"
    And I verify the field "Annual Base Rent" is "" in a same row in "Financials"
    And I verify the field "Monthly Total Rent" is "" in a same row in "Financials"
    And I verify the field "Aggregate Total Amount" is "$0.00" in a same row in "Financials"
    And I verify the field "Aggregate Base Rent" is "$0.00" in a same row in "Financials"
    And I verify the field "Monthly Base Rent" is "" in a same row in "Financials"
    And I verify the field "Rate" is "$0.00" in a same row in "Financials"
    And I verify the field "Currency" is "USD" in a same row in "Financials"
    #And I verify the field "For the Period:" is "July 2016" in "Financials"
    And I verify the field "For the Period:" is "[Month Year]" in "Financials"

    And I verify the field "Rentable Area" is "2,000" in a same row in "Space Information"
    And I verify the field "Pro-Rata Share" is "50.00000%" in a same row in "Space Information"
    And I verify the field "Gross Leasable Area" is "200,000" in a same row in "Space Information"
    And I verify the field "Area Unit" is "Square Feet" in a same row in "Space Information"
    And I verify the field "Primary Use" is "Retail" in a same row in "Space Information"

    And I verify the following details in non editable summary page in frame grid
      | Notes                                  |
      | This is going to be created via import |

    And I verify the following details in non editable summary page in frame grid
      | Management            |
      | No managers assigned. |

    And I fetch entity ID from Contract summary page
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/Details/Summary/UpdateContract-1192.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I update contract through spreadsheet import
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/Summary/"
    And I import following files:
      | UpdateContract-1192.xlsx |
    When I navigate to entity type "<Item>" named "<Entity Name>"
    And I select "Contract Summary Page" page layout from dropdown
    And I click on the "<Third Level Tab>" tab

    And I wait for the Loading text to disappear
    And I verify the field "Group" is "Lease" in a same row in "Contract Summary"
    And I verify the field "Status" is "Review" in a same row in "Contract Summary"
    And I verify the field "Effective Date" is "12/31/2002" in a same row in "Contract Summary"
    And I verify the field "Type" is "Mall Based" in a same row in "Contract Summary"
    And I verify the field "Portfolio" is "Lucernex-Selenium" in a same row in "Contract Summary"

    And I verify the field "Contract Name" is "Contract B-8479" in a same row in "General Information"
    And I verify the field "Asset Class" is "Inactive" in a same row in "General Information"
    And I verify the field "Description" is "This will be updated via import" in a same row in "General Information"
    And I verify the field "Category" is "Retail Lease" in a same row in "General Information"
    And I verify the field "Month to Month?" is "No" in a same row in "General Information"
    And I verify the field "Options" is "" in a same row in "General Information"
    And I verify the field "Holding Interest" is "Tenant" in a same row in "General Information"
    And I verify the field "Agreement Type" is "Rental" in a same row in "General Information"
    And I verify the field "Parcel ID" is "" in a same row in "General Information"
    And I verify the field "Facility ID" is "" in a same row in "General Information"
    And I verify the field "In Alternate Rent?" is "No" in "General Information"

    And I verify the field "Commencement Date" is "01/02/2015" in a same row in "Critical Dates"
    And I verify the field "Possession Begin" is "01/01/2020" in a same row in "Critical Dates"
    And I verify the field "Payments Begin" is "01/01/2002" in a same row in "Critical Dates"
    And I verify the field "Expiration Date" is "12/31/2030" in a same row in "Critical Dates"
    And I verify the field "Possession End Date" is "12/31/2036" in a same row in "Critical Dates"
    And I verify the field "Payments End Date" is "12/31/2020" in a same row in "Critical Dates"
    And I verify the field "Term Length" is "15 years 11 months 30 days" in a same row in "Critical Dates"
    And I verify the field "Possession Begin" is "01/02/2000" in a same row in "Critical Dates"
    And I verify the field "Obligation Date" is "01/01/2036" in a same row in "Critical Dates"

    And I verify the field "Annual Total Amount" is "" in a same row in "Financials"
    And I verify the field "Annual Base Rent" is "" in a same row in "Financials"
    And I verify the field "Monthly Total Rent" is "" in a same row in "Financials"
    And I verify the field "Aggregate Total Amount" is "$0.00" in a same row in "Financials"
    And I verify the field "Aggregate Base Rent" is "$0.00" in a same row in "Financials"
    And I verify the field "Monthly Base Rent" is "" in a same row in "Financials"
    And I verify the field "Rate" is "$0.00" in a same row in "Financials"
    And I verify the field "Currency" is "CAD" in a same row in "Financials"
#    And I verify the field "For the Period:" is "July 2016" in "Financials"
    And I verify the field "For the Period:" is "[Month Year]" in "Financials"

    And I verify the field "Rentable Area" is "2,500" in a same row in "Space Information"
    And I verify the field "Pro-Rata Share" is "75.00000%" in a same row in "Space Information"
    And I verify the field "Gross Leasable Area" is "200,000" in a same row in "Space Information"
    And I verify the field "Area Unit" is "Square Feet" in a same row in "Space Information"
    And I verify the field "Primary Use" is "Retail" in a same row in "Space Information"

    And I verify the following details in non editable summary page in frame grid
      | Notes                                  |
      | This is going to be updated via import |

    And I verify the following details in non editable summary page in frame grid
      | Management            |
      | No managers assigned. |

    Examples:
      | Login User | Login full username | Item     | Third Level Tab | Entity Name     |
      | EditAccess | Edit Access Access  | Contract | Summary         | Contract B-8479 |


#@all
#Feature: (Jira Ref: AUTOMATION-401) I create and update contract and verify them in Contract> Details> Summary page
#
#  Scenario Outline: I create contract through spreadsheet import
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/Summary/"
#    And I import following file name:
#      | Create_Contract.xls |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/Details/Summary/Create_Contract.xls"
#    Then I verify pair of values on non editable summary page by reading data from spreadsheet row "<Spreadsheet Row>"
#      | name            | value                       |
#      | Description     | Contract.ProjectDescription |
#      | Month to Month? | Contract.MonthToMonth       |
#      | Rentable Area   | Contract.RentableArea       |
#    And I logout
#
#    Examples:
#      | Login User   | Login full username  | Item     | Second Level Tab | Third Level Tab | Entity Name       | Spreadsheet Row |
#      | DeleteAccess | Delete Access Access | Contract | Details          | Summary         | Imported_Contract | 6               |
#
#  Scenario Outline: I update contract through spreadsheet import
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#
#    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/Summary/"
#    And I import following file name:
#      | Update_Contract.xls |
#    When I navigate to entity type "<Item>" named "<Entity Name>"
#    Then I navigate to "<Second Level Tab>"
#    And I click on the "<Third Level Tab>" tab
#
#    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Contract/Details/Summary/Update_Contract.xls"
#    Then I verify pair of values on non editable summary page by reading data from spreadsheet row "<Spreadsheet Row>"
#      | name            | value                       |
#      | Description     | Contract.ProjectDescription |
#      | Month to Month? | Contract.MonthToMonth       |
#      | Rentable Area   | Contract.RentableArea       |
#    And I logout
#
#    Examples:
#      | Login User | Login full username | Item     | Second Level Tab | Third Level Tab | Entity Name       | Spreadsheet Row |
#      | EditAccess | Edit Access Access  | Contract | Details          | Summary         | Imported_Contract | 6               |
