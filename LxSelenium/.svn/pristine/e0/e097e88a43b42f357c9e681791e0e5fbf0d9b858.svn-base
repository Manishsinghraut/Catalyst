@all @smoke @smoke4
Feature: (Jira Ref: AUTOMATION-415, AUTOMATION-1169) I update and verify site survey in Site > Details > Survey page

  Background:
    Given I Login to IWMS using "DeleteAccess" access credentials
    Then I check previous user login "Delete Access Access" and continue if user "DeleteAccess" same or logout and login if not

  Scenario Outline: I update site survey through spreadsheet import
    When I used data files from "Data/ImportDataFiles/iwms/Site/Details/Survey/"
    And I import following files:
      | Site_Survey_TESTING-1169.xml |
      | Recid-1169.xml               |
    And I navigate to the reports dashboard
    And I click "run" row action in the non frame grid "^editBOGrid" having the following header and cell values
      | name        | value |
      | Report Name | Recid |
    And I switch to "Report" child window
    And I wait for the Loading text to disappear in grid
    And I fetch entity ID from report for entity "<Entity Name>"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Site/Details/Survey/CreateSiteSurvey-1169.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Site/Details/Survey/UpdateSiteSurvey-1169.xlsx"
    And I set cell value in spread sheet row "6" under header "LxRecID" of column index "3"
    And I close the "Report" child window
    And I switch to main window

    When I used data files from "Data/ImportDataFiles/iwms/Site/Details/Survey/"
    And I import following files:
      | CreateSiteSurvey-1169.xlsx |

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I verify entity "<Entity Name>" in left panel
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I select an option "Survey"
    And I wait for the Loading text to disappear

    And I verify the field "Landlord Work Description" is "No" in a same row in "Condition of Premises Exterior"
    And I verify the field "Number Of Building Sides" is "10" in a same row in "Condition of Premises Exterior"
    And I verify the field "Parking Lot Condition" is "Excellent" in a same row in "Condition of Premises Exterior"
    And I verify the field "Visibility" is "Excellent" in a same row in "Condition of Premises Exterior"
    And I verify the field "Monument Signage" is "Yes" in a same row in "Condition of Premises Exterior"
    And I verify the field "Canopy Lighting" is "No" in a same row in "Condition of Premises Exterior"
    And I verify the field "Condition of Neighborhood" is "" in a same row in "Condition of Premises Exterior"
    And I verify the field "Current Or Former Tenants" is "" in a same row in "Condition of Premises Exterior"
    And I verify the field "Anchor Tenants" is "site Survey Anchor" in a same row in "Condition of Premises Exterior"
    And I verify the field "Pylon Signage" is "Yes" in a same row in "Condition of Premises Exterior"
    And I verify the field "Parking Lot Lighting" is "No" in a same row in "Condition of Premises Exterior"
    And I verify the field "Signalized Access" is "No" in a same row in "Condition of Premises Exterior"
    And I verify the field "Which Sides" is "" in a same row in "Condition of Premises Exterior"
    And I verify the field "Handicap Accessible" is "No" in a same row in "Condition of Premises Exterior"
    And I verify the field "Building Signage" is "No" in a same row in "Condition of Premises Exterior"

    And I verify the field "Approx Building Length(ft)" is "11,000" in "Condition of Premises Interior"
    And I verify the field "Existing Floor Condition" is "" in "Condition of Premises Interior"
    And I verify the field "Ceiling Condition" is "" in "Condition of Premises Interior"
    And I verify the field "Approx Building Width(ft)" is "2,000" in "Condition of Premises Interior"
    And I verify the field "Number Of Restrooms" is "11" in "Condition of Premises Interior"
    And I verify the field "Fire Sprinkler" is "No" in "Condition of Premises Interior"

    And I verify the field "LOD" is "No" in a same row in "Availability Of"
    And I verify the field "Building Plan" is "No" in a same row in "Availability Of"
    And I verify the field "CLEC" is "No" in a same row in "Availability Of"
    And I verify the field "Sent To Construction Date" is "" in a same row in "Availability Of"
    And I verify the field "Landlord Work Description" is "No" in a same row in "Availability Of"
    And I verify the field "Construction Criteria" is "No" in a same row in "Availability Of"
    And I verify the field "Roof Access" is "No" in a same row in "Availability Of"
    And I verify the field "Sign Criteria" is "No" in a same row in "Availability Of"

    When I used data files from "Data/ImportDataFiles/iwms/Site/Details/Survey/"
    And I import following files:
      | UpdateSiteSurvey-1169.xlsx |

    And I click on the "<Third Level Tab>" tab
    And I select an option "Survey"
    And I wait for the Loading text to disappear
    And I use this spreadsheet to compare "Data/ImportDataFiles/iwms/Site/Details/Survey/1UpdateSiteSurvey-1169.xlsx"
    And I verify the field "Number Of Building Sides" is "0" in a same row in "Sitesurvey page"
    And I verify the field "Parking Lot Condition" is "Poor" in a same row in "Sitesurvey page"
    And I verify the field "Visibility" is "Poor" in a same row in "Sitesurvey page"
    And I verify the field "Number of Floors" is "0" in a same row in "Sitesurvey page"

    Examples:
      | Second Level Tab | Third Level Tab | Entity Name                |
      | Details          | Summary         | Site Survey TESTING - 8494 |