@all
Feature: Save Schedule Details Page to Document for Project (Ref : Jira Ticket No : AUTOMATION-1120)

  Scenario Outline: As a delete user I import xmls
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Documents/"
    And I import following file name:
      | DetailsPageProject.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: Save Project - Workflow to documents with different status
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "<Second Level Tab>"
    And I click on the "<Third Level Tab>" tab
    And I click on the "Save to Documents" action panel button
    And I switch to "Save Documents" child window
    And I set following fields value on editable page
      | name     | value           |
      | FolderID | <FolderID>      |
      | BaseName | <Document Name> |
    And I click on "Save" Button
    And I wait for the Loading text to disappear in grid
    And I switch to main window

    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I select the following
      | STDDetails (1) |

    And I select and right click on "Schedules.html" and click on "Download" option
    Then I Open "Schedules.html" downloaded file and verify the content
      | Construction       |
      | Initiation Project |
      | Pre-Construction   |

    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name        | Second Level Tab | Third Level Tab | FolderID   | Document Name |
    | DeleteAccess | Delete Access Access | DetailsPageProject | Details          | Schedule        | STDDetails | Schedules     |