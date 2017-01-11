@all
Feature: (Ref : Jira Ticket No : AUTOMATION-618) As a Delete user I Add Holiday Calendar - Adding One time Holiday and Recurring Holidays

  Scenario Outline:I Add Holiday Calendar
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Holiday Calendar" link
    And I click on the "Add Holiday Calendar"
    Then I set following fields value on editable page
      | name                | value           |
      | HolidayScheduleName | <Calender Name> |
    And I click on the "Add" button
    And I verify the following message "Successfully added Holiday Schedule"
    And I logout
    Examples:
      | Login User   | Login full username  | Calender Name                   |
      | DeleteAccess | Delete Access Access | Auto-Firm-Holiday Calender      |
      | DeleteAccess | Delete Access Access | Auto-Entity-Holiday Calender    |
      | DeleteAccess | Delete Access Access | Auto-Portfolio-Holiday Calender |
#    | DeleteAccess | Delete Access Access | Firm-Holiday Calender      |
#    | DeleteAccess | Delete Access Access | Entity-Holiday Calender    |
#    | DeleteAccess | Delete Access Access | Portfolio-Holiday Calender |


  Scenario Outline:Adding One time holidays-These are specific to a particular year they are occurring in
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Holiday Calendar" link
    And I click on the row of "<Calender Name>" of column "0" from holiday calendar grid
    And I click on the "Add Holiday"
    Then I set following fields value on editable page
      | name            | value                |
      | HolidayDateName | One Time Holiday - 1 |
      | Year            | 2016                 |
      | Month           | February             |
      | Day             | 5                    |
    And I click on the "Add" button
    And I click on the "Add Holiday"
    Then I set following fields value on editable page
      | name            | value                |
      | HolidayDateName | One Time Holiday - 2 |
      | Year            | 2016                 |
      | Month           | March                |
      | Day             | 7                    |
    And I click on the "Add" button
    And I click on the "Add Holiday"
    Then I set following fields value on editable page
      | name            | value                |
      | HolidayDateName | One Time Holiday - 3 |
      | Year            | 2016                 |
      | Month           | April                |
      | Day             | 15                   |
    And I click on the "Add" button
    And I click on the "Add Holiday"
    Then I set following fields value on editable page
      | name            | value                |
      | HolidayDateName | One Time Holiday - 4 |
      | Year            | 2016                 |
      | Month           | May                  |
      | Day             | 20                   |
    And I click on the "Add" button
    And I logout

    Examples:
      | Login User   | Login full username  | Calender Name                   |
      | DeleteAccess | Delete Access Access | Auto-Firm-Holiday Calender      |
      | DeleteAccess | Delete Access Access | Auto-Entity-Holiday Calender    |
      | DeleteAccess | Delete Access Access | Auto-Portfolio-Holiday Calender |
#      | DeleteAccess | Delete Access Access | Firm-Holiday Calender      |
#      | DeleteAccess | Delete Access Access | Entity-Holiday Calender    |
#      | DeleteAccess | Delete Access Access | Portfolio-Holiday Calender |

  Scenario Outline:Adding Recurring holidays-These are recurring as year is not specified
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the admin dashboard
    And I click on the "Manage Holiday Calendar" link
    And I click on the row of "<Calender Name>" of column "0" from holiday calendar grid
    And I click on the "Add Holiday"
    Then I set following fields value on editable page
      | name            | value                 |
      | HolidayDateName | Recurring Holiday - 1 |
      | Month           | February              |
      | Day             | 5                     |
    And I click on the "Add" button
    And I click on the "Add Holiday"
    Then I set following fields value on editable page
      | name            | value                 |
      | HolidayDateName | Recurring Holiday - 2 |
      | Month           | March                 |
      | Day             | 7                     |
    And I click on the "Add" button
    And I click on the "Add Holiday"
    Then I set following fields value on editable page
      | name            | value                 |
      | HolidayDateName | Recurring Holiday - 3 |
      | Month           | April                 |
      | Day             | 15                    |
    And I click on the "Add" button
    And I click on the "Add Holiday"
    Then I set following fields value on editable page
      | name            | value                 |
      | HolidayDateName | Recurring Holiday - 4 |
      | Month           | May                   |
      | Day             | 20                    |
    And I click on the "Add" button
    And I logout

    Examples:
      | Login User   | Login full username  | Calender Name                   |
      | DeleteAccess | Delete Access Access | Auto-Firm-Holiday Calender      |
      | DeleteAccess | Delete Access Access | Auto-Entity-Holiday Calender    |
      | DeleteAccess | Delete Access Access | Auto-Portfolio-Holiday Calender |
#      | DeleteAccess | Delete Access Access | Firm-Holiday Calender      |
#      | DeleteAccess | Delete Access Access | Entity-Holiday Calender    |
#      | DeleteAccess | Delete Access Access | Portfolio-Holiday Calender |