@all
Feature: Save to Documents Budget (Ref : Jira Ticket No : AUTOMATION-1360)

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | Columns_1360.xml                 |
      | BudgetSummaryPagelayout_1360.xml |
      | 15290_Project_1360.xml           |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Manage Budget Summary Page
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to the admin dashboard
    And I click on the "Manage Budget Summary Page" link
    And I click "edit" action of "15290" sub row in the grid "main"
    And I wait for the Loading text to disappear in grid
    And I wait for "Page Layout Name" is visible
    And I verify the "Page Layout Name" "on Manage Budget Summary Page"
    And I switch to "Page Layout" child window
    And I set following fields value on editable page
      | name                      | value |
      | _checkbox_ValidForProject | true  |
    And I click on the update button
    And I switch to main window

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |


  Scenario Outline: As Delete user, I verify the Save to Documents Budget
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I switch to visible frame

    And I wait for the Loading text to disappear
    And I click on "<Expand All>" link
    And I verify the "Name" "Exterior" of "PreConstruction" "$500.00","PreCuring" "$340.00" and "PreLevelling" "$333.00"
    And I verify the "Name" "Carpet" of "PreConstruction" "$200.00","PreCuring" "$120.00" and "PreLevelling" "$111.00"
    And I verify the "Name" "Doors" of "PreConstruction" "$300.00","PreCuring" "$220.00" and "PreLevelling" "$222.00"
    And I verify the "Name" "Interior" of "PreConstruction" "$700.00","PreCuring" "$740.00" and "PreLevelling" "$740.00"
    And I verify the "Name" "Playground" of "PreConstruction" "$400.00","PreCuring" "$320.00" and "PreLevelling" "$0.00"
    And I verify the "Name" "Patio Furniture" of "PreConstruction" "$300.00","PreCuring" "$420.00" and "PreLevelling" "$0.00"
    And I verify the Total of the "PreConstruction" "$1,200.00","PreCuring" "$1,080.00" and "PreLevelling" "$678.00"

    And I switch to default frame

    And I click on the "<Third Level Tab>" tab
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | <Document>              |
    And I verify the following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | <Document>              |

    And I click on "Save" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | SeleniumTestRootFolder1 (1) |

    And I verify the following values in frame grid "resultsPane"
      | File Name       | Description     | Author               | Status    |
      | <Document>.html | <Document>.html | Delete Access Access | Available |
    And I right click on a document "<Document>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | <Entity Name> |
    And I click on "<Expand All>" link
    And I verify the "Name" "Exterior" of "PreConstruction" "$500.00","PreCuring" "$340.00" and "PreLevelling" "$333.00"
    And I verify the "Name" "Carpet" of "PreConstruction" "$200.00","PreCuring" "$120.00" and "PreLevelling" "$111.00"
    And I verify the "Name" "Doors" of "PreConstruction" "$300.00","PreCuring" "$220.00" and "PreLevelling" "$222.00"
    And I verify the "Name" "Interior" of "PreConstruction" "$700.00","PreCuring" "$740.00" and "PreLevelling" "$740.00"
    And I verify the "Name" "Playground" of "PreConstruction" "$400.00","PreCuring" "$320.00" and "PreLevelling" "$0.00"
    And I verify the "Name" "Patio Furniture" of "PreConstruction" "$300.00","PreCuring" "$420.00" and "PreLevelling" "$0.00"
    And I verify the Total of the "PreConstruction" "$1,200.00","PreCuring" "$1,080.00" and "PreLevelling" "$678.00"

#    And I click on "<Expand All>" link
#    And I verify the following values in non frame grid
#      | Name  <Collapse All>  <Hide Empty> | PreConstruction | PreCuring | PreLevelling |
#      | Exterior                           | $500.00         | $340.00   | $333.00      |
#      | Carpet                             | $200.00         | $120.00   | $111.00      |
#      | Doors                              | $300.00         | $220.00   | $222.00      |
#      | Interior                           | $700.00         | $740.00   | $740.00      |
#      | Playground                         | $400.00         | $320.00   | $0.00        |
#      | Patio Furniture                    | $300.00         | $420.00   | $0.00        |
#      | Total                              | $1,200.00       | $1,080.00 | $678.00      |

    And I close the "HTML window" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name   | Second Level Tab | Third Level Tab | Document               |
    | DeleteAccess | Delete Access Access | 15290 Project | Details          | Budget          | 15290BudgetSummaryFile |


  Scenario Outline: As Delete user, I verify the Save to Documents Budget - Budget Creation
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I click on the "Budget Creation" action panel button
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | <Document>              |

    And I click on "Save" Button
    And I wait for browser windows count to be equal to "1"
    And I switch to main window

    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | SeleniumTestRootFolder1 (2) |

    And I verify the following values in frame grid "resultsPane"
      | File Name       | Description     | Author               | Status    |
      | <Document>.html | <Document>.html | Delete Access Access | Available |
    And I right click on a document "<Document>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame

    Given I open latest downloaded file
    And I verify the following text in a page
      | <Entity Name> |
    And I verify budget name "PreConstruction #01" and Total "$1,200.00" on template
    And I verify budget name "PreCuring #01" and Total "$1,080.00" on template
    And I verify budget name "PreLevelling #01" and Total "$678.00" on template
    And I close the "HTML window" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name   | Second Level Tab | Third Level Tab | Document                |
    | DeleteAccess | Delete Access Access | 15290 Project | Details          | Budget          | 15290BudgetCreationFile |