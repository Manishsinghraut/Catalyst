@all
Feature: (Jira - AUTOMATION-1428) Change Location on Project

  Scenario Outline: I import files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/SetupWizards/"
    And I import following files:
      | 00018_PortfolioAndLocation-1428.xml |
      | ProjectLocationChange-2206-1428.xml |
      | ProjectSPWithLocation-1428.xml      |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: Change Location on Project
    Given I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I navigate to second level tab "Details" and third level "Summary" tab of entity "Project"
    And I wait for the Loading text to disappear
    Then I verify the following fields in "General Information"
      | Location | <Location A> |

    And I click on the "Edit" action panel button
    And I set following fields value on editable frame page
      | name                     | value        |
      | ProjectEntity_LocationID | <Location B> |
    And I click on the "Save Changes" action panel button
    And I wait for the Loading text to disappear
    Then I see "Successfully updated Project" message in the grid
    And I verify the following fields in "General Information"
      | Location | <Location B> |

    Examples:
      | Project Name               | Location A                     | Location B      |
      | ProjectLocationChange-2206 | 00018 Location-AUTOMATION-1428 | Location B-2206 |