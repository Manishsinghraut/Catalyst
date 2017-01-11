@all
Feature: Critical Path,Toggle baseline task bars, and Time Span (Ref : Jira Ticket No : AUTOMATION-990)

  Scenario Outline: I import file s060 location entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Schedule/"
    And I import following file name:
      | s060-990.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I verify critical path view
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    Then I verify the task "Group 2" of slack "0 days" shall be reflected correctly on spreed sheet
    Then I verify the task "Task 3" of slack "0 days" shall be reflected correctly on spreed sheet
    Then I verify the task "Task 4" of slack "0 days" shall be reflected correctly on spreed sheet
    And I click on the "Highlight critical path" button on the gantt
    And I verify the last part of the schedule bars will start blinking in red while the rest of the schedule bars become blurred
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name |
      | DeleteAccess | Delete Access Access | s060-990    |

  Scenario Outline: As a delete user I verify Time Span view
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I verify the date range on top of the schedule bars "Mon 28 Dec 2020" and "Mon 04 Jan 2021"
    And I click the "Previous timespan" button on the gantt
    And I verify the date range on top of the schedule bars "Mon 21 Dec 2020" and "Mon 28 Dec 2020"
    And I click the "Next timespan" button on the gantt
    And I verify the date range on top of the schedule bars "Mon 28 Dec 2020" and "Mon 04 Jan 2021"
    And I click the "Next timespan" button on the gantt
    And I verify the date range on top of the schedule bars "Mon 04 Jan 2021" and "Mon 11 Jan 2021"
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name |
      | DeleteAccess | Delete Access Access | s060-990    |

  Scenario Outline: As a delete user I verify Toggle baseline task bars view
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I right click on a task "Task 1" and select menu option "Task information..." to open task information pop-up
    And I set following fields value on editable page
      | name              | value      |
      | OriginalStartDate | 01/05/2021 |
      | OriginalEndDate   | 01/05/2021 |
    Then I click "Ok" button
    And I click on the "Toggle baseline task bars"
    And I verify all the orange bars in the timeline will disappear
    And I click on the "Toggle baseline task bars"
    And I verify the orange colored bars on the time line will move to the new dates
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name |
      | DeleteAccess | Delete Access Access | s060-990    |


















#@all @smoke4
#Feature: Critical Path,Toggle baseline task bars, and Time Span (Ref : Jira Ticket No : AUTOMATION-990)
#
#  Scenario Outline: I import file s060 location entity
#    Given I Login to IWMS using "<Login User>" access credentials
#    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Schedule/"
#    And I import following file name:
##      | s060.xml |
#      | s060-990.xml |
#
#    Examples:
#      | Login User   | Login full username  |
#      | DeleteAccess | Delete Access Access |
#
#  Scenario Outline: As a delete user I verify critical path view
#    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "Details"
#    And I click on the "Schedule" tab
#    And I switch to visible frame
#    And I expand gantt chart
#    Then I verify the task "Task 1" of slack "2 days" shall be reflected correctly on spreed sheet
#    Then I verify the task "Task 2" of slack "2 days" shall be reflected correctly on spreed sheet
#    Then I verify the task "Task 3" of slack "0 days" shall be reflected correctly on spreed sheet
#    Then I verify the task "Task 4" of slack "0 days" shall be reflected correctly on spreed sheet
#    And I click on the "Highlight critical path" button on the gantt
#    And I verify the last part of the schedule bars will start blinking in red while the rest of the schedule bars become blurred
#    And I switch to default frame
#
#    Examples:
#      | Login User   | Login full username  | Entity Name |
#      | DeleteAccess | Delete Access Access | s060        |
#
#  Scenario Outline: As a delete user I verify Time Span view
#    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "Details"
#    And I click on the "Schedule" tab
#    And I switch to visible frame
#    And I expand gantt chart
#    And I verify the date range on top of the schedule bars "Mon 28 Dec 2020" and "Mon 04 Jan 2021"
#    And I click the "Previous timespan" button on the gantt
#    And I verify the date range on top of the schedule bars "Mon 21 Dec 2020" and "Mon 28 Dec 2020"
#    And I click the "Next timespan" button on the gantt
#    And I verify the date range on top of the schedule bars "Mon 28 Dec 2020" and "Mon 04 Jan 2021"
#    And I click the "Next timespan" button on the gantt
#    And I verify the date range on top of the schedule bars "Mon 04 Jan 2021" and "Mon 11 Jan 2021"
#    And I switch to default frame
#
#    Examples:
#      | Login User   | Login full username  | Entity Name |
#      | DeleteAccess | Delete Access Access | s060-990    |
#
#  Scenario Outline: As a delete user I verify Toggle baseline task bars view
#    Given I Login to IWMS using "<Login User>" access credentials
#    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
#    When I Search for the "<Entity Name>" that was created
#    And Click on the name of the "<Entity Name>" in the results pop-up
#    Then I see "<Entity Name>" name on the header
#    Then I navigate to "Details"
#    And I click on the "Schedule" tab
#    And I switch to visible frame
#    And I expand gantt chart
#    And I right click on a task "Task 1" and select menu option "Task information..." to open task information pop-up
#    And I set following fields value on editable page
#      | name              | value      |
#      | OriginalStartDate | 01/05/2021 |
#      | OriginalEndDate   | 01/05/2021 |
#    Then I click "Ok" button
#    And I click on the "Toggle baseline task bars"
#    And I verify all the orange bars in the timeline will disappear
#    And I click on the "Toggle baseline task bars"
#    And I verify the orange colored bars on the time line will move to the new dates
#    And I switch to default frame
#
#    Examples:
#      | Login User   | Login full username  | Entity Name |
#      | DeleteAccess | Delete Access Access | s060-990    |