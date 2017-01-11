@all
Feature: (Jira Ref: Automation-1423) Apostrophe character in Region or Sub Region Name Causes Inability to Edit or Delete Entity Information.

  Scenario Outline: I import xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Portfolio/OrgChart/"
    And I import following files:
      | Portfolio_Testing_15629 (1)-1423.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I verify org chart
    Given I navigate to entity type "Portfolios" named "<Portfolio Name>" through search option
    And I navigate to "Org Chart"
    And I wait for the Loading text to disappear
    Then I set following fields value on editable page
      | name            | value              |
      | OperatingStatus | <Operating Status> |
    Then I verify horizontally organized regions "Central Dallas,Central,Apostrophe' Testing"
    And I verify organization chart "Apostrophe' Testing"
    And I verify organization chart "Frisco'"

    Examples:
      | Operating Status | Portfolio Name          |
      | Operating        | Portfolio Testing 15629 |


  Scenario Outline: Facility 15629 will be created with the Region field as 'Apostrophe' Testing'
    Given I navigate to "Tools,Setup Wizards"
    Then I see the "Setup Wizard" modal window
    And I delete incomplete setup wizard if exist
    And I select "Facility" from the list
    And I select "<Portfolio Name>" from the Program List
    Then I click on the "Next" button
    And I verify the following fields value on editable page
      | name                    | value            |
      | ProjectEntity_ProgramID | <Portfolio Name> |

    And I set following fields value on editable page
      | name                      | value              |
      | Facility_FacilityName     | <Facility Name>    |
      | Facility_LocationID       | Lucernex-Project   |
      | Facility_RegionID         | <Region Name>      |
      | Facility_CodeMarketAreaID | Legacy Market Area |
    And I click on the "Next" button
    Then I see the "Facility Setup Wizard -> <Facility Name> -> Folder Set-up" modal window
    And I click on the "Next" button
    Then I see the "Facility Setup Wizard -> <Facility Name> -> Assign Members" modal window
    And I click on the "Next" button
    Then I see the "Facility Setup Wizard -> <Facility Name> -> Schedule Set-up" modal window
    And I click on the "Finish" button
    Then I see "Facility: <Facility Name>" name on the header
    And I verify the following details in non editable summary page in frame grid
      | General Information |               |
      | Region              | <Region Name> |

    And I click on the "Edit" action panel button
    And I set following fields value on editable frame page
      | name                         | value          |
      | ProjectEntity_ClientEntityID | <Store Number> |
    And I click on the "Save Changes" action panel button
    Then I see "Successfully updated Facility" message in the frame grid
    And I verify the following details in non editable summary page in frame grid
      | General Information |                |
      | Store Number        | <Store Number> |

    Examples:
      | Facility Name  | Portfolio Name          | Region Name         | Store Number |
      | Facility 15629 | Portfolio Testing 15629 | Apostrophe' Testing | 12345        |
