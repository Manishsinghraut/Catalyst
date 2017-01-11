@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1118), Verify email notification for facility and location while saving the document

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | SeleniumFolderTemplate-1118.xml |
      | SavetoDocEntities-1118.xml      |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Verify email notification for location while saving the document
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I click on the "Apply Folder Template"
    And I wait for "" modal window to open in frame page
    And I set following fields value on editable page
      | name                   | value                    |
      | assignFolderTemplateID | Selenium Folder Template |
    And I click on the "Assign Folder Template" button
    And I wait for modal window to close

    And I click on the "Summary" tab
    And I click on the "Save To Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name        | value           |
      | FolderID    | <Folder ID>     |
      | BaseName    | <Document Name> |
      | mailMembers | true            |
    And I add following members
      | Access, Delete Access |
    And I click on "Save" Button
    And I switch to main window
    And I wait for second child window to close

    Given I login to web mail on existing window
    And I search for the mail using subject "[LxRetail] <Entity Name> LxRetail document upload"
    Then I check mail body for the following contents
      | Document Name: <Document Name>.html    |
      | URL for <Entity Type> "<Entity Name>": |
    And I verify subject in the body "[LxRetail] <Entity Name> LxRetail document upload"

    And I click application link within the mail body
    And I switch to "Documents" child window
    And I wait for the Loading text to disappear

    And I select the following
      | <Folder> |
    And I verify the following values in frame grid "resultsPane"
      | File Name            | Description          | Author               | Status    |
      | <Document Name>.html | <Document Name>.html | Delete Access Access | Available |
    And I right click on a document "<Document Name>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame
    And I close the "Documents" child window
    And I switch to main window
    And I wait for second child window to close

    Given I open latest downloaded file
    And I verify the following text in a page
      | Location: SavetoDocLocation |

    And I verify the following details in non editable summary page in non-frame grid
      | Location Summary |                        |           |                   |        |
      | Group            | Type                   | Category  |                   |        |
      | Location ID      | SavetoDocLocation-1118 | Portfolio | Lucernex-Selenium | Status |

    And I verify the following details in non editable summary page in non-frame grid
      | Location General Info |                   |             |
      | Name                  | SavetoDocLocation |             |
      | Description           |                   |             |
      | Center / Complex      |                   |             |
      | Primary Use           | Year Open         |             |
      | Gross Leasable Area   | Area Measurement  | Square Feet |
      | Parcel Area           | Area Measurement  |             |
    And I verify the following details in non editable summary page in non-frame grid
      | Address |

    And I verify the following details in non editable summary page in non-frame grid
      | Region / Area Groups |

    And I verify the following details in non editable summary page in non-frame grid
      | Distribution          |
      | Third-Party Warehouse |

    And I verify the following details in non editable summary page in non-frame grid
      | Organization Information |            |
      | Organization             | Acct. Ref# |

    And I verify the following details in non editable summary page in non-frame grid
      | Parcels |
    And I verify grid "BOGridParcel" is empty with the following message "No rows to display"

    And I verify the following details in non editable summary page in non-frame grid
      | Contracts |
    And I verify grid "BOGridContract" is empty with the following message "No rows to display"

    And I verify the following details in non editable summary page in non-frame grid
      | Facilities |
    And I verify the following values in non frame grid "BOGridFacility"
      | Facility Name          | Facility ID | Facility Group | Facility Type | Facility Category | Rentable Area | Facility Status |
      | SavetoDocEmailFacility |             |                |               |                   |               |                 |

    And I verify the following details in non editable summary page in non-frame grid
      | Comments |

    And I close the "HTML window" child window
    And I switch to main window
    And I wait for second child window to close


    Examples:
      | Login User   | Login full username  | Entity Name       | Document Name    | Folder                      | Folder ID               | Entity Type |
      | DeleteAccess | Delete Access Access | SavetoDocLocation | Location Summary | SeleniumTestRootFolder1 (1) | SeleniumTestRootFolder1 | Location    |


  Scenario Outline: Verify email notification for facility while saving the document
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I click on the "Apply Folder Template"
    And I wait for "" modal window to open in frame page
    And I set following fields value on editable page
      | name                   | value                    |
      | assignFolderTemplateID | Selenium Folder Template |
    And I click on the "Assign Folder Template" button
    And I wait for modal window to close

    And I click on the "Summary" tab
    And I click on the "Save To Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name        | value           |
      | FolderID    | <Folder ID>     |
      | BaseName    | <Document Name> |
      | mailMembers | true            |
    And I add following members
      | Access, Delete Access |
    And I click on "Save" Button
    And I switch to main window
    And I wait for second child window to close

    Given I login to web mail on existing window
    And I search for the mail using subject "[LxRetail] <Entity Name> LxRetail document upload"
    Then I check mail body for the following contents
      | Document Name: <Document Name>.html    |
      | URL for <Entity Type> "<Entity Name>": |
    And I verify subject in the body "[LxRetail] <Entity Name> LxRetail document upload"

    And I click application link within the mail body
    And I switch to "Documents" child window
    And I wait for the Loading text to disappear

    And I select the following
      | <Folder> |
    And I verify the following values in frame grid "resultsPane"
      | File Name            | Description          | Author               | Status    |
      | <Document Name>.html | <Document Name>.html | Delete Access Access | Available |
    And I right click on a document "<Document Name>.html" and select menu option "Download"
    And I wait for the Loading text to disappear in grid
    And I switch to default frame
    And I close the "Documents" child window
    And I switch to main window
    And I wait for second child window to close

    Given I open latest downloaded file
    And I verify the following text in a page
      | Facility: SavetoDocEmailFacility, GA United States |
    And I verify the following details in non editable summary page in non-frame grid
      | Facility Summary |      |          |     |        |
      | Group            | Type | Category | Use | Status |
    And I verify the following details in non editable summary page in non-frame grid
      | General Information |                        |
      | Name                | SavetoDocEmailFacility |

    And I verify the following details in non editable summary page in non-frame grid
      | Property Organization |

    And I verify the fields value on entity non-editable summary tab
      | name     | value             |
      | Location | SavetoDocLocation |

    And I verify the following details in non editable summary page in non-frame grid
      | Management            |
      | No managers assigned. |

#    And I verify the fields value on entity non-editable summary tab
#      | name             | value         |
##      | Center Name      |               |
#      | Cross Street 2   |               |
#      | Cross Street 1   |               |
#      | Street Address   |               |
#      | City             |               |
#      | State / Province | GA            |
#      | Zip / Postal Cd  |               |
#      | Country          | United States |

    Then I verify the following details in non editable summary page in non-frame grid
      | Milestone Timeline  |
      | Baseline Start Date |
      | Current Start Date  |
    And I verify grid "BOGridCompetitor" is empty with the following message "No rows to display"

    And I close the "HTML window" child window
    And I switch to main window
    And I wait for second child window to close


    Examples:
      | Login User   | Login full username  | Entity Name            | Document Name    | Folder                      | Folder ID               | Entity Type |
      | DeleteAccess | Delete Access Access | SavetoDocEmailFacility | Facility Summary | SeleniumTestRootFolder1 (1) | SeleniumTestRootFolder1 | Facility    |