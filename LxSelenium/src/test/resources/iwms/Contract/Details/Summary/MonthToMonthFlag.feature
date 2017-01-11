@all
Feature: Month To Month Flag (Ref : Jira Ticket No : Automation-762)

  Scenario Outline: Import the following spreadsheet
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/Details/Summary/"
    And I import following file name:
      | MonthMonthContract.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete I verify sales record. Should show Canadian Dollar for the currency type

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I navigate to entity type "<Item>" named "<Entity Name>"
    Then I navigate to "Details"
    And I click on the "Summary" tab
    #Check the box on Month to Month flag
    And I verify the summary fields value on non-editable contract summary tab
      | name            | value |
      | Month to Month? | No    |
    And I click on the "Edit" action panel button
    And I check for complete frame 'loading...'
    And I verify the following fields value on editable page
      | name                            | value |
      | _checkbox_Contract_MonthToMonth | false |
    And I set fields values on editable page
      | name                            | value |
      | _checkbox_Contract_MonthToMonth | true  |
    And I click on the "Save Changes" action panel button
    And I verify action message "Successfully updated Contract" in the left top corner
    And I verify the summary fields value on non-editable contract summary tab
      | name            | value |
      | Month to Month? | Yes   |

   #UnCheck the box on Month to Month flag
    And I click on the "Edit" action panel button
    And I check for complete frame 'loading...'
    And I verify the following fields value on editable page
      | name                            | value |
      | _checkbox_Contract_MonthToMonth | true  |
    And I set fields values on editable page
      | name                            | value |
      | _checkbox_Contract_MonthToMonth | false |
    And I click on the "Save Changes" action panel button
    And I verify action message "Successfully updated Contract" in the left top corner
    And I verify the summary fields value on non-editable contract summary tab
      | name            | value |
      | Month to Month? | No    |

    Examples:
      | Login User   | Login full username  | Item     | Entity Name          |
      | DeleteAccess | Delete Access Access | Contract | Month-Month Contract |

