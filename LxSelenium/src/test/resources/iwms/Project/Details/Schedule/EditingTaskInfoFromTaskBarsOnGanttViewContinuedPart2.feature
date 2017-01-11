@all
Feature: Editing Task info from Task bars on Gantt view - Continued- part 2 (Ref : Jira Ticket No : AUTOMATION-1001)

  Scenario Outline: Import the following xmls for Task Bar Project entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | TaskBarProject.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete I Adding Predecessor
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I right click on the 2"nd" blue bar in the gantt associated to task "Task Bar Task 1.2" and select menu option "Task information..." to open task information pop-up
    And I click on "Predecessors" tab
    And I click "Add new" button
    And I enter task name "Task Bar Task 1.1"
    And I click "Ok" button
    And I wait for the Loading text to disappear
    And I right click on the 2"nd" blue bar in the gantt associated to task "Task Bar Task 1.2" and select menu option "Task information..." to open task information pop-up
    And I click on "Predecessors" tab
    And I verify the task "Task Bar Task 1.1" will be populated in the grid with "Finish-To-Start" as the type
    And I click "Cancel" button
    And I verify the second blue bar will start after the first blue bar
    And I switch to default frame
  Examples:
    | Login User   | Login full username  | Entity Name      |
    | DeleteAccess | Delete Access Access | Task Bar Project |


  Scenario Outline: As a delete I Adding Successor
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I right click on the 3"rd" blue bar in the gantt associated to task "Task Bar Task 1.3" and select menu option "Task information..." to open task information pop-up
    And I click on "Successors" tab
    And I click "Add new" button
    And I enter task name "Task Bar Task 1.4"
    And I click "Ok" button
    And I right click on the 3"rd" blue bar in the gantt associated to task "Task Bar Task 1.3" and select menu option "Task information..." to open task information pop-up
    And I click on "Successors" tab
    And I verify the task "Task Bar Task 1.4" will be populated in the grid with "Finish-To-Start" as the type
    And I click "Cancel" button
    And I verify the fourth Blue bar will start after the Third blue bar
    And I switch to default frame
  Examples:
    | Login User   | Login full username  | Entity Name      |
    | DeleteAccess | Delete Access Access | Task Bar Project |


  Scenario Outline: As a delete I Adding Assignee
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I right click on the 3"rd" blue bar in the gantt associated to task "Task Bar Task 1.3" and select menu option "Task information..." to open task information pop-up
    Then I click on "Assignees" tab in the popup window of edit task
    And I click "Add new" button
    And I enter task name "Delete Access Access"
    And I click "Ok" button
    And I drag the vertical split bar to right
    Then I verify the task "Task Bar Task 1.3" of Assignees "Delete Access Access" shall be reflected correctly on the spreed sheet
    And I switch to default frame
  Examples:
    | Login User   | Login full username  | Entity Name      |
    | DeleteAccess | Delete Access Access | Task Bar Project |