@all
Feature: (Ref : Jira Ticket No : AUTOMATION-1348) Import Key Dates to update days or Period for Notice and Tickler action

  Scenario Outline: I import the following xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/KeyDates/"
    And I import following files:
      | KeyDatesContract_1348.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: I verify contract and keydates are created
    When I navigate to entity type "Contracts" named "<Entity Name>" through search option
    And I navigate to "Abstract Info"
    And I click on the "Key Dates" tab
    And I wait for the Loading text to disappear
    Then I verify grid "<Grid ID>" is empty with the following message "No rows to display"
    And I verify the following fields value on editable page
      | name                                 | value      |
      | KeyDate_CodeKeyDateGroupID           |            |
      | KeyDate_CodeKeyDateTypeID            |            |
      | KeyDate_CodeKeyDateActionID          |            |
      | KeyDate_Description                  |            |
      | KeyDate_ActionDate                   |            |
      | KeyDate_BeginDate                    | 01/01/2016 |
      | KeyDate_EndDate                      | 12/31/2020 |
      | _checkbox_KeyDate_ActionComplete     | false      |
      | _checkbox_KeyDate_NoticeSentFlag     | false      |
      | _checkbox_KeyDate_NoticeReceivedFlag | false      |
      | NoticePeriod                         |            |
      | KeyDate_CodeNoticePeriodUnitID       |            |
      | ActionPeriod                         |            |
      | KeyDate_CodeActionPeriodUnitID       |            |
      | KeyDate_NoticeBeginDate              | 01/01/2016 |
      | KeyDate_NoticeEndDate                | 12/31/2020 |
      | KeyDate_TicklerDate                  |            |
      | KeyDate_CodeFrequencyID              | Monthly    |
      | KeyDate_Notes                        |            |
    And I verify the field "Length" is "5 years" in a same row in "Key Date Information"

    Examples:
      | Entity Name      | Grid ID |
      | KeyDatesContract | thisDiv |


  Scenario Outline: As a Edit user I import the following xml
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Contract/AbstractInfo/KeyDates/"
    And I import following files:
      | KeyDatesContract- Update_1348.xml |

    Examples:
      | Login User | Login full username |
      | EditAccess | Edit Access Access  |

  Scenario Outline: I verify contract and keydates are updated
    When I navigate to entity type "Contracts" named "<Entity Name>" through search option
    And I navigate to "Abstract Info"
    And I click on the "Key Dates" tab
    And I wait for the Loading text to disappear
    Then I verify the following values in frame grid "<Grid ID>"
      | Key Date Group | Key Date Type | Key Date Action | Description               | Begin Date | End Date   | Tickler Date |
      | Lease          | Lease Term    | Renew           | This is to test key dates | 01/01/2016 | 12/31/2020 | 11/25/2015   |
    And I verify the following fields value on editable page
      | name                                 | value                      |
      | KeyDate_CodeKeyDateGroupID           | Lease                      |
      | KeyDate_CodeKeyDateTypeID            | Lease Term                 |
      | KeyDate_CodeKeyDateActionID          | Renew                      |
      | KeyDate_Description                  | This is to test key dates  |
      | KeyDate_ActionDate                   |                            |
      | KeyDate_BeginDate                    | 01/01/2016                 |
      | KeyDate_EndDate                      | 12/31/2020                 |
      | _checkbox_KeyDate_ActionComplete     | false                      |
      | _checkbox_KeyDate_NoticeSentFlag     | false                      |
      | _checkbox_KeyDate_NoticeReceivedFlag | false                      |
      | NoticePeriod                         | 1                          |
      | KeyDate_CodeNoticePeriodUnitID       | Months                     |
      | ActionPeriod                         | 5                          |
      | KeyDate_CodeActionPeriodUnitID       | Days                       |
      | KeyDate_NoticeBeginDate              | 01/01/2016                 |
      | KeyDate_NoticeEndDate                | 11/30/2015                 |
      | KeyDate_TicklerDate                  | 11/25/2015                 |
      | KeyDate_CodeFrequencyID              | Monthly                    |
      | KeyDate_Notes                        | This is to test key dates. |
    And I verify the field "Length" is "5 years" in a same row in "Key Date Information"


    Examples:
      | Entity Name      | Grid ID |
      | KeyDatesContract | thisDiv |