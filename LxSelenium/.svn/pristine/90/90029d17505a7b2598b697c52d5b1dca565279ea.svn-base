@all
Feature: Calendar (Ref : Jira Ticket No : AUTOMATION-794)

  Scenario Outline: Calendar
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    And I navigate to the calendar dashboard
    And I click on the "Week" tab
    And I verify date header on the week view page
    And I click on the "Month" tab
    And I verify date header on the month view page

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |