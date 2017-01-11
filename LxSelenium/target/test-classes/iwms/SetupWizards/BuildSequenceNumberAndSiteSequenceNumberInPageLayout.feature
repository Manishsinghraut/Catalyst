@all
Feature: (Jira Ref. AUTOMATION-1420) Ability to Format numbers to red in negative value

  Scenario Outline: I import file and verify the sequence number of project
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/SetupWizards/"
    And I import following files:
      | PortfolioAndLocation-1424.xml |
      | PageLayout-1424.xml           |
      | Project-1424.xml              |
    And I navigate to entity type "Opening Projects" named "<Project Name>" through search option
    And I click on "Summary" tab
    And I select "<Page Layout>" page layout from dropdown
    And I click on the "Edit" action panel button
    And I fetch "ProjectEntity_SequenceNumber" entity sequence number
    And I click on the "View" action panel button
    Then I verify the "Sequence Number" in entity summary page
    And I verify the field "Site Sequence Number" is "" in "Project Summary Page"

    Examples:
      | Login User   | Login full username  | Project Name               | Page Layout                       |
      | DeleteAccess | Delete Access Access | Build Sequence Number-1424 | Build Sequence Number Page Layout |


  Scenario Outline: I import file and verify the site sequence number
    When I used data files from "Data/ImportDataFiles/iwms/SetupWizards/"
    And I import following files:
      | Site-1424.xml |
    And I navigate to entity type "Sites" named "<Site Name>" through search option
    And I click on the "Convert to Project" action panel button
    Then I wait for "Convert " modal window to open in non frame page
    And I wait for " to a Project" modal window to open in non frame page
    And I wait for "<Site Name>" modal window to open in non frame page
    And I set following fields value on editable page
      | name        | value               |
      | locationSel | true                |
      | locationID  | 00018 Location-1424 |
    And I click on the "Convert Site to Project" button
    Then I wait for modal window to close
    Then I see "Project: <Site Name>" name on the header
    And I select "<Page Layout>" page layout from dropdown

    And I click on the "Edit" action panel button
    And I fetch "Project_SiteSequenceNumber" entity sequence number
    And I click on the "View" action panel button
    Then I verify the "Site Sequence Number" in entity summary page

    And I click on the "Edit" action panel button
    And I fetch "ProjectEntity_SequenceNumber" entity sequence number
    And I click on the "View" action panel button
    Then I verify the "Sequence Number" in entity summary page

    Examples:
      | Site Name                 | Page Layout                       |
      | Site Sequence Number-1424 | Build Sequence Number Page Layout |
