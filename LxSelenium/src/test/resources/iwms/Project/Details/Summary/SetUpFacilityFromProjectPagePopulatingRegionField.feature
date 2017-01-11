@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1023) Set Up Facility from Project page - Populating Region field

  Scenario Outline: I import file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Summary/"
    And I import following file name:
      | OrgChart-1023.xml |
      | Project-1023.xml  |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I'm able to Set Up Facility from Project page - Populating Region field
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
#    Then I navigate to "Details"
#    And I click on the "Summary" tab
    And I click on the "Setup Facility" action panel button
    Then I verify the following fields value on editable page
      | name              | value |
      | Facility_RegionID |       |
    And I set following fields value on editable page
      | name              | value                    |
      | Facility_RegionID | Central Dallas(Pre-Open) |
    And I click on the "Close" button

  Examples:
    | Login User   | Login full username  | Entity Name  |
    | DeleteAccess | Delete Access Access | Project-1023 |
