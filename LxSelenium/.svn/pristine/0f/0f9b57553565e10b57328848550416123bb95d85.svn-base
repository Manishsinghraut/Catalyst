@all
Feature: Save Location - ComplexCenter page to documents (Ref : Jira Ticket No : AUTOMATION-1357)

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | Testing_8455_1357.xml |
      | Complex_1357.xlsx     |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user, I verify displaying dropdown and Management dropdown as Pre-open - Vertically
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value               |
      | FolderID | Testing 8455 Folder |
      | BaseName | <Document>          |
    And I click on "Save" Button
    And I switch to main window
  Examples:
    | Login User   | Login full username  | Entity Name  | Second Level Tab | Document            |
    | DeleteAccess | Delete Access Access | Testing 8455 | Complex/Center   | Testing8455FileName |

  Scenario Outline: As a delete user, I verify the saved document
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "Details" tab
    And I click on the "Documents" tab

    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | Testing 8455 Folder (1) |
    And I verify the following values in frame grid "resultsPane"
      | File Name       | Description     | Author               | Status    |
      | <Document>.html | <Document>.html | Delete Access Access | Available |
    And I right click on a document "<Document>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | <Entity Name> |
    And I verify the field "Location Group" values has "Lease"
    And I verify the field "Location Type" values has "90909"
    And I verify the field "Location Category" values has "New"
    And I verify the field "Location ID" values has "Testing 8455 1"
    And I verify the field "Location Name" values has "Testing 8455"
    And I verify the field "Location Status" values has "Test"
    And I verify the field "Description" values has "Testing 8455 Description"
    And I verify the field "Location Use" values has "Retail"
    And I verify the field "Name" values is "Testing 8455 Information Name"
    And I verify the field "Status" values is "Newly Opened"
    And I verify the field "Developer" values is "Delete Access"
    And I verify the field "Format" values is "Mall"
    And I verify the field "Property Manager" values is "Edit Access"
    And I verify the field "Property Manager" values is "5601 Democracy Dr, Building A"
    And I verify the field "Property Manager" values is "Plano, TX 75026"
    And I verify the field "Scheme" values is "Class"
    And I verify the field "Landlord" values is "Delete Access Access"
    And I verify the field "Landlord" values is "Suite 120, 5601 Democracy Drive"
    And I verify the field "Landlord" values is "Plano, TX 75024"
    And I verify the field "Hours of Operation" values is "9 am - 10pm"
    And I verify the field "Notable Tenants" values is "2 Blocks away"
    And I verify the field "Year Built" values is "1995"
    And I verify the field "Gross Lease Area (GLA)" values is "150,000"
    And I verify the field "Area Unit" values is "Square Feet"
    And I verify the field "Number of Levels" values is "3"
    And I verify the field "Gla Excluding Anchors" values is "200,000"
    And I verify the field "Occupancy Percentage" values is "76.00000%"
    And I verify the field "Number of Stores" values is "56"
    And I verify the field "Sales Per Area" values is "$1,300.00"
    And I verify the field "Vacancy Rate" values is "24"
    And I verify the field "Number of Outparcels" values is "5"
    And I verify the field "Is Space Available?" values is "Yes"
    And I verify the field "Has Food Court?" values is "Yes"
    And I verify the field "Is Enclosed?" values is "Yes"
    And I verify the field "Number Parking Spaces" values is "300"
    And I verify the field "Last Renovation Date" values is "1995"
    And I verify the field "Is Renovation Planned?" values is "Yes"
    And I verify the field "Renovation Plan Date" values is "01/01/2020"
    And I verify the field "Is Expansion Planned?" values is "Yes"
    And I verify the field "Expansion Plan Date" values is "01/01/2020"
    And I close the "HTML window" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name  | Second Level Tab | Document            |
    | DeleteAccess | Delete Access Access | Testing 8455 | Complex/Center   | Testing8455FileName |

