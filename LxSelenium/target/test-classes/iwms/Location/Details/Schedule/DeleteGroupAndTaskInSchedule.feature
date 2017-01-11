@all
Feature:  (Ref : Jira Ticket No : AUTOMATION-999) Delete Group and Task in Schedule

  Scenario Outline: I import file s021 location entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Schedule/"
    And I import following file name:
      | s021.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I  Deleting task - Before Task Complete Notification
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I right click on a task "Before Task Complete Notification" and select menu option "Delete task(s)" to delete the task
    Then I verify the task "Before Task Complete Notification" does not exist in the spreed sheet
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name |
    | DeleteAccess | Delete Access Access | s021        |

  Scenario Outline: As a delete user I  Deleting task - After Task Complete Notifications
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I right click on a task "Before/After Task Complete Notifications" and select menu option "Delete task(s)" to delete the task
    Then I verify the task "Before/After Task Complete Notifications" does not exist in the spreed sheet
    And I switch to default frame

  Examples:
    | Login User   | Login full username  | Entity Name |
    | DeleteAccess | Delete Access Access | s021        |