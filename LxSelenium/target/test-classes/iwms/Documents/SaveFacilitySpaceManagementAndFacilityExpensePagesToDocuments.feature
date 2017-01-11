@all
Feature: Save Facility - Space Management and Facility Expense pages to documents (Ref : Jira Ticket No : AUTOMATION-1359)

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | 8457_Facility_1359.xml |


  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As Delete user, I verify the Space Management
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | <Document>              |
    And I click on "Save" Button
    And I switch to main window

    And I click on the "Details" tab
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

    And I verify a row from non frame grid "thisDiv" having unique value "Retail" under column header "Group"
      | name          | value  |
      | Group         | Retail |
      | Room          | 101    |
      | Suite         | 12     |
      | Rentable Area | 3,000  |
      | Space Use     | Retail |
      | Type          | Store  |
      | Status        | Active |

    And I verify the field "Group" values is "Retail"
    And I verify the field "Type" values is "Store"
    And I verify the field "Status" values is "Active"
    And I verify the field "Effective Date" values is "01/01/2002"
    And I verify the field "Name" values is "Test facility"
    And I verify the field "Floor" values is "34"
    And I verify the field "Suite" values is "12"
    And I verify the field "Room" values is "101"
    And I verify the field "Space ID" values is "123"
    And I verify the field "Space Use" values is "Retail"
    And I verify the field "Area Unit" values is "Square Feet"
    And I verify the field "Rentable Area" values is "3,000"
    And I verify the field "Usable Area" values is "2,500"
    And I verify the field "Gross Area" values is "1,000"
    And I verify the field "Group" values is "Retail"
    And I verify the field "Group" values is "Retail"

    And I verify a row from non frame grid "BOGridTenant" having unique value "Retail" under column header "Tenant Group"
      | name            | value      |
      | Tenant Group    | Retail     |
      | Tenant Type     | Sales      |
      | Tenant Category | Store      |
      | Tenant Name     | Tenant 1   |
      | Move In Date    | 01/01/2000 |
      | Tenant Status   | Active     |

    And I close the "HTML window" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name   | Second Level Tab | Third Level Tab  | Document                |
    | DeleteAccess | Delete Access Access | 8457 Facility | Space Management | Space Management | 8457SpaceManagementFile |


  Scenario Outline: As Delete user, I verify the Facility Expense page
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    And I click on the "<Second Level Tab>" tab
    And I click on the "<Third Level Tab>" tab
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value                   |
      | FolderID | SeleniumTestRootFolder1 |
      | BaseName | <Document>              |
    And I click on "Save" Button
    And I switch to main window

    And I click on the "Details" tab
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

    And I verify a row from non frame grid "thisDiv" having unique value "CAM" under column header "Expense Group"
      | name            | value                                                                                                                          |
      | Expense Group   | CAM                                                                                                                            |
      | Expense Type    | CAM                                                                                                                            |
      | Effective Date  | 08/05/2016                                                                                                                     |
      | Planned Amount  | $25,000.00                                                                                                                     |
      | Revised Amount  | $23,000.00                                                                                                                     |
      | Actual Amount   | $2,000.00                                                                                                                      |
      | Budgeted Amount | $1,000.00                                                                                                                      |
      | Notes           | Regular, preventive maintenance helps maintain a clean, consistent appearance in your locations,while optimizing functionality |

    And I verify the field "Effective Date" values is "08/05/2016"
    And I verify the field "Expense Group" values is "CAM"
    And I verify the field "Expense Type" values is "CAM"
    And I verify the field "Description" values is "This is a Test"
    And I verify the field "Planned Amount" values is "$25,000.00"
    And I verify the field "Budgeted Amount" values is "$1,000.00"
    And I verify the field "Revised Amount" values is "$23,000.00"
    And I verify the field "Actual Amount" values is "$2,000.00"

    And I close the "HTML window" child window
    And I switch to main window

  Examples:
    | Login User   | Login full username  | Entity Name   | Second Level Tab | Third Level Tab  | Document                |
    | DeleteAccess | Delete Access Access | 8457 Facility | Facility Expense | Facility Expense | 8457FacilityExpenseFile |