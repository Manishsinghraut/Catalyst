@all
Feature: (Jira Ref : AUTOMATION-1446) Search for Documents With the Same Name

  Scenario Outline: As a delete user i import the files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/DocumentsTab/"
    And I import following files:
      | Portfolio_00020AndLocation_00020-1446.xml |
      | DocumentNameProject_619-1446.xml          |
      | DocumentStructure-619-1446.zip            |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As Delete user, I Search for the documents and verify that have a similar name but exist within different folders
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to entity type "Opening Projects" named "<Entity Name>" through search option
    And I click on the "Documents" tab
    And I wait for the Loading text to disappear
    And I switch to visible frame
    And I expand the following
      | example (3) |
    And I select the following
      | a (1) |
    And I verify the following values in frame grid "resultsPane"
      | File Name              | Description | Author               | Status                | Ver |
      | Finance Lease- 619.txt |             | Delete Access Access | Not Ready for Release | 1   |
    And I select the following
      | b (1) |
    And I verify the following values in frame grid "resultsPane"
      | File Name              | Description | Author               | Status                | Ver |
      | Site projects- 619.txt |             | Delete Access Access | Not Ready for Release | 1   |
    And I select the following
      | c (1) |
    And I verify the following values in frame grid "resultsPane"
      | File Name             | Description | Author               | Status                | Ver |
      | Demographics- 619.txt |             | Delete Access Access | Not Ready for Release | 1   |

    And I click "Search" button
    And I wait for modal window to open
    And I enter "demographics" in search box for search a task in gantt chart grid
    And I click on 'Search' button on the popup
    And I wait for modal window to close
    And I verify "Search results for " with "demographics"
    And I verify the following values in frame grid "resultsPane"
      | File Name             | Description | Author               | Status                | Ver | Size     | Checked Out | Folder     |
      | Demographics- 619.txt |             | Delete Access Access | Not Ready for Release | 1   | 11 bytes |             | /example/c |

    And I click "Search" button
    And I wait for modal window to open
    And I enter "619" in search box for search a task in gantt chart grid
    And I click on 'Search' button on the popup
    And I wait for modal window to close
    And I verify "Search results for " with "619"
    And I verify the following values in frame grid "resultsPane"
      | File Name              | Description | Author               | Status                | Ver | Size     | Checked Out | Folder     |
      | Demographics- 619.txt  |             | Delete Access Access | Not Ready for Release | 1   | 11 bytes |             | /example/c |
      | Finance Lease- 619.txt |             | Delete Access Access | Not Ready for Release | 1   | 11 bytes |             | /example/a |
      | Site projects- 619.txt |             | Delete Access Access | Not Ready for Release | 1   | 11 bytes |             | /example/b |

    Examples:
      | Login User   | Login full username  | Entity Name             |
      | DeleteAccess | Delete Access Access | DocumentNameProject-619 |
