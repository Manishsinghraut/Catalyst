@all @smoke @smoke4
Feature: (Jira Ref: AUTOMATION-412, AUTOMATION-1166 ) I create and update parcel and verify them in Parcel> Details> Summary page

  Scenario: I create parcel through spreadsheet import
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Parcel/Details/Summary/"
    And I import following files:
      | Page_layouts-1166.xml |
    And I import following files:
      | CreateParcel-1166.xlsx |

  Scenario Outline: I verify Parcel A
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "Parcel A" that was created
    And Click on the name of the "Parcel A" in the results pop-up
    Then I see "Parcel A" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" sub tab
    And I select "Parcel Layout" page layout from dropdown
    And I wait for the Loading text to disappear

    And I verify the field "Group" is "Retail" in a same row in "General Information"
    And I verify the field "Parcel ID" is "" in a same row in "General Information"
    And I verify the field "Parcel Name" is "Parcel A" in a same row in "General Information"
    And I verify the field "Parcel Public Name" is "" in a same row in "General Information"
    And I verify the field "Description" is "This parcel will be created via import" in a same row in "General Information"
    And I verify the field "Master Parcel" is "" in a same row in "General Information"
    And I verify the field "Type" is "Commercial" in a same row in "General Information"
    And I verify the field "Location ID" is "Lucernex-Project" in a same row in "General Information"
    And I verify the field "Category" is "" in a same row in "General Information"
    And I verify the field "Status" is "" in a same row in "General Information"
    And I verify the field "Parcel Use" is "" in a same row in "General Information"
    And I verify the field "Currency Type" is "" in a same row in "General Information"
    And I verify the field "Parcel Area" is "" in a same row in "General Information"
    And I verify the field "Area Unit" is "" in a same row in "General Information"
    And I verify the field "Time Zone" is "" in a same row in "General Information"

    And I verify the following text in a page
      | Suite 120 |
    And I verify the field "City" is "Plano" in a same row in "Parcel Location"
    And I verify the field "Zip / Postal Code" is "75024" in a same row in "Parcel Location"
    And I verify the field "Cross Street 1" is "Alameda" in a same row in "Parcel Location"
    And I verify the field "State / Province" is "TX" in a same row in "Parcel Location"
    And I verify the field "Country" is "United States" in a same row in "Parcel Location"
    And I verify the field "Cross Street 2" is "Buena Vista" in a same row in "Parcel Location"

    And I verify the field "Tax Jurisdiction" is "" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax Authority" is "" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Owner Name" is "" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax Responsibility" is "" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax Begin Period" is "" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Block" is "" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Is Tax Exempt?" is "No" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax ID Number" is "565656" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax End Period" is "" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Lot" is "" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Has Improvements?" is "No" in a same row in "Jurisdiction, Tax Parcel Information"

    And I verify the field "Purchase Date" is "" in a same row in "Parcel Key Dates"
    And I verify the field "Acquired Date" is "01/20/2015" in a same row in "Parcel Key Dates"
    And I verify the field "Survey Date" is "" in a same row in "Parcel Key Dates"

    And I verify the following details in non editable summary page in frame grid
      | Parcel Tax Assessment |                |                |
      | Type of Assessment    | Market Value   | Assessed Value |
      | Primary Assessment    |                |                |
      | Secondary Assessment  |                |                |
      | Assessment Details    |                |                |
      | Land                  |                |                |
      | Improvements          |                |                |
      | Other                 |                |                |
      | Source                | Effective Date |                |

    Examples:
      | Second Level Tab | Third Level Tab |
      | Details          | Summary         |

  Scenario Outline: I verify Parcel B
    Given I Login to IWMS using "DeleteAccess" access credentials
    And I Search for the "Parcel B" that was created
    And Click on the name of the "Parcel B" in the results pop-up
    Then I see "Parcel B" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" sub tab
    And I select "Parcel Layout" page layout from dropdown
    And I wait for the Loading text to disappear
    And I fetch entity ID from parcel summary page
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Parcel/Details/Summary/UpdateParcel-1166.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"

    And I verify the field "Group" is "Retail" in a same row in "General Information"
    And I verify the field "Parcel ID" is "23" in a same row in "General Information"
    And I verify the field "Parcel Name" is "Parcel B" in a same row in "General Information"
    And I verify the field "Parcel Public Name" is "Parcel on the Left" in a same row in "General Information"
    And I verify the field "Description" is "This parcel will be created via import" in a same row in "General Information"
    And I verify the field "Master Parcel" is "" in a same row in "General Information"
    And I verify the field "Type" is "Commercial" in a same row in "General Information"
    And I verify the field "Location ID" is "Lucernex-Project" in a same row in "General Information"
    And I verify the field "Category" is "Leased" in a same row in "General Information"
    And I verify the field "Status" is "Active" in a same row in "General Information"
    And I verify the field "Parcel Use" is "Office" in a same row in "General Information"
    And I verify the field "Currency Type" is "" in a same row in "General Information"
    And I verify the field "Parcel Area" is "2" in a same row in "General Information"
    And I verify the field "Area Unit" is "Acres" in a same row in "General Information"
    And I verify the field "Time Zone" is "" in a same row in "General Information"

    And I verify the field "Address" is "5601 Democracy Dr" in a same row in "Parcel Location"
    And I verify the field "City" is "Plano" in a same row in "Parcel Location"
    And I verify the field "Zip / Postal Code" is "75024" in a same row in "Parcel Location"
    And I verify the field "Cross Street 1" is "Alameda" in a same row in "Parcel Location"
    And I verify the field "State / Province" is "TX" in a same row in "Parcel Location"
    And I verify the field "Country" is "United States" in a same row in "Parcel Location"
    And I verify the field "Cross Street 2" is "Buena Vista" in a same row in "Parcel Location"

    And I verify the field "Tax Jurisdiction" is "" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax Authority" is "Collin County Assessors" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Owner Name" is "Mr Selenium" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax Responsibility" is "Landlord" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax Begin Period" is "01/01/2010" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Block" is "A18" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Is Tax Exempt?" is "No" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax ID Number" is "767654" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax End Period" is "12/31/2030" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Lot" is "LotA" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Has Improvements?" is "Yes" in a same row in "Jurisdiction, Tax Parcel Information"

    And I verify the field "Purchase Date" is "01/01/2010" in a same row in "Parcel Key Dates"
    And I verify the field "Acquired Date" is "01/01/2010" in a same row in "Parcel Key Dates"
    And I verify the field "Survey Date" is "01/01/2010" in a same row in "Parcel Key Dates"

    And I verify the following details in non editable summary page in frame grid
      | Parcel Tax Assessment |                 |                |            |
      | Type of Assessment    | Market Value    | Assessed Value |            |
      | Primary Assessment    | $300,000.00     | $230,000.00    |            |
      | Secondary Assessment  | $23,000.00      | $20,000.00     |            |
      | Assessment Details    |                 |                |            |
      | Land                  | $203,000.00     | $200,000.00    |            |
      | Improvements          | $20,000.00      | $15,000.00     |            |
      | Other                 | $20,000.00      | $30,000.00     |            |
      | Source                | AI Developoment | Effective Date | 01/01/2010 |

    And I fetch entity ID from parcel summary page
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Parcel/Details/Summary/UpdateParcel-1166.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"

    Examples:
      | Second Level Tab | Third Level Tab |
      | Details          | Summary         |

  Scenario Outline: I update parcel through spreadsheet import
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I used data files from "Data/ImportDataFiles/iwms/Parcel/Details/Summary/"
    And I import following files:
      | UpdateParcel-1166.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" sub tab
    And I select "Parcel Layout" page layout from dropdown
    And I wait for the Loading text to disappear

    And I verify the field "Group" is "Retail" in a same row in "General Information"
    And I verify the field "Parcel ID" is "23" in a same row in "General Information"
    And I verify the field "Parcel Name" is "Parcel B" in a same row in "General Information"
    And I verify the field "Parcel Public Name" is "Parcel on the Left" in a same row in "General Information"
    And I verify the field "Description" is "This parcel will be updated via import " in a same row in "General Information"
    And I verify the field "Master Parcel" is "" in a same row in "General Information"
    And I verify the field "Type" is "Commercial" in a same row in "General Information"
    And I verify the field "Location ID" is "Lucernex-Project" in a same row in "General Information"
    And I verify the field "Category" is "Leased" in a same row in "General Information"
    And I verify the field "Status" is "Active" in a same row in "General Information"
    And I verify the field "Parcel Use" is "Office" in a same row in "General Information"
    And I verify the field "Currency Type" is "" in a same row in "General Information"
    And I verify the field "Parcel Area" is "3,000" in a same row in "General Information"
    And I verify the field "Area Unit" is "Acres" in a same row in "General Information"
    And I verify the field "Time Zone" is "" in a same row in "General Information"

    And I verify the field "Address" is "5601 Democracy Dr" in a same row in "Parcel Location"
    And I verify the field "City" is "Plano" in a same row in "Parcel Location"
    And I verify the field "Zip / Postal Code" is "75024" in a same row in "Parcel Location"
    And I verify the field "Cross Street 1" is "Alameda" in a same row in "Parcel Location"
    And I verify the field "State / Province" is "TX" in a same row in "Parcel Location"
    And I verify the field "Country" is "United States" in a same row in "Parcel Location"
    And I verify the field "Cross Street 2" is "Buena Vista" in a same row in "Parcel Location"

    And I verify the field "Tax Jurisdiction" is "Collin" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax Authority" is "Collin County Assessors" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Owner Name" is "Mr Selenium" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax Responsibility" is "Developer" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax Begin Period" is "01/01/2010" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Block" is "A18" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Is Tax Exempt?" is "No" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax ID Number" is "111224" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Tax End Period" is "12/31/2035" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Lot" is "LotA" in a same row in "Jurisdiction, Tax Parcel Information"
    And I verify the field "Has Improvements?" is "Yes" in a same row in "Jurisdiction, Tax Parcel Information"

    And I verify the field "Purchase Date" is "01/01/2010" in a same row in "Parcel Key Dates"
    And I verify the field "Acquired Date" is "01/01/2010" in a same row in "Parcel Key Dates"
    And I verify the field "Survey Date" is "01/01/2010" in a same row in "Parcel Key Dates"

    And I verify the following details in non editable summary page in frame grid
      | Parcel Tax Assessment |                 |                |            |
      | Type of Assessment    | Market Value    | Assessed Value |            |
      | Primary Assessment    | $300,000.00     | $230,000.00    |            |
      | Secondary Assessment  | $23,000.00      | $20,000.00     |            |
      | Assessment Details    |                 |                |            |
      | Land                  | $203,000.00     | $200,000.00    |            |
      | Improvements          | $20,000.00      | $15,000.00     |            |
      | Other                 | $88,888.00      | $99,999.00     |            |
      | Source                | AI Developoment | Effective Date | 01/01/2010 |


    Examples:
      | Second Level Tab | Third Level Tab | Entity Name |
      | Details          | Summary         | Parcel B    |
