@all
Feature: (Ref : Jira Ticket No : Automation-905),Negative Testing-Adding task /group with the same name

  Scenario Outline: I import file for Negative Testing-Adding task /group with the same name
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | s0905.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I ADD group with the same name

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    And I click on the "Schedule" tab
    And I expand gantt chart
    And I open new task information pop up of "SN Group 2" task
    And I set following fields value on editable page
      | name     | value      |
      | TaskName | SN Group 1 |
    And I click "Ok" button
    And I see "Failed: The name (SN Group 1) already exists in this schedule. Please enter a different name." message in the header
    And I click "OK" button

    Examples:
      | Login User   | Login full username  | Entity Name |
      | DeleteAccess | Delete Access Access | s0905       |

  Scenario Outline: As a delete user I ADD task with the same name

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    And I click on the "Schedule" tab
    And I expand gantt chart

    And I open new task information pop up of "SN Task 2" task
    And I set following fields value on editable page
      | name     | value     |
      | TaskName | SN Task 1 |
    And I click "Ok" button
    And I see "Failed: The name (SN Task 1) already exists in this schedule. Please enter a different name." message in the header


    Examples:
      | Login User   | Login full username  | Entity Name |
      | DeleteAccess | Delete Access Access | s0905       |