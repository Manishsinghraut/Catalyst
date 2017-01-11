@all
Feature: (Ref : Jira Ticket No : Automation-1382) Extend Contracts to non-MTM Contracts

  Scenario Outline: Import the following spreadsheet
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/Summary/"
    And I import following files:
      | ECLocationClean-1382.xml  |
      | ECContract-Clean-1382.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete I Extend Contracts to non-MTM Contracts
    When I navigate to entity type "<Item>" named "<Entity Name>" through search option
    And I click on the "Summary" tab
    And I wait for the Loading text to disappear
    And I verify the field "Month to Month?" is "No" in a same row in "Summary Page"
    And I click on the "Extend Contracts" action panel button
    And I wait for "Extend Contracts" modal window to open in non frame page
    And I set following fields value on editable page
      | name             | value      |
      | showMonthToMonth | All        |
      | expirationDate   | 12/31/2020 |
      | dateToExtend     | 12/31/2030 |
    And I wait for the Loading text to disappear in grid
    And I click "<Apply>" row action in the non frame grid "entitySelect" having the following header and cell values
      | name        | value                       |
      | Name        | EC Contract-AUTOMATION-1382 |
      | Contract ID | EC Contract-AUTOMATION-1382 |
    And I click on "Extend Leases" Button
    Then I verify success message appear in top left corner of page
      | Finished processing                                                        |
      | Total Entities Modified: 1                                                 |
      | No Errors encountered                                                      |
      | Details:                                                                   |
      | Extending Dates for '<Entity Name>' contract from 12/31/2020 to 12/31/2030 |
      | Updated Payment End Date for '<Entity Name>' (<Entity Name>) contract     |
    And I click on "Done" Button

    And I navigate to entity type "<Item>" named "<Entity Name>" through search option
    And I click on the "Summary" tab
    And I wait for the Loading text to disappear
    Then I verify the field "Payments End Date" is "12/31/2030" in a same row in "Summary Page"


    Examples:
      | Item      | Entity Name                 |
      | Contracts | EC Contract-AUTOMATION-1382 |

