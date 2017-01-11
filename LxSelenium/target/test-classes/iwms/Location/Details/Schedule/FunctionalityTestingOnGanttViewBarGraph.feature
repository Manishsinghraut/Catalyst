@all
Feature: Functionality Testing on Gantt view bar graph (Ref : Jira Ticket No : AUTOMATION-1000)

  Scenario Outline: I import file s0061 location entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Location/Details/Schedule/"
    And I import following file name:
      | s0061.xml |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I Creating successor in the bar graph/timeline
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
    And I click on "Successors" tab of editing task pop-up window
    And I verify that "Successors" tab grid is blank and no items exist
    And I click "Cancel" button
    And I click and drag the end of the first blue bar Task 1 bubble downwards till the beginning of the second blue bar Task 2 just below and connect the two bubbles together
    And I verify The second blue bar Task 2 will move down the timeline and will now start at the end of Task 1 January 2nd
    Then I verify the task "Task 2" of Status "Not begun" , Done "0" , F/A start date "01/02/2020" ,F/A end date "01/02/2020", F/A Duration "1 day", BL start date "01/01/2020" and BL end date "01/01/2020" shall be reflected correctly on the spreed sheet
    And I right click on a task "Task 1" and select menu option "Task information..." to open task information pop-up
    And I click on "Successors" tab of editing task pop-up window
    And I verify the task "Task 2" will be populated in the grid with "Finish-To-Start" as the type
    And I click "Cancel" button
    And I switch to default frame
    And I click on the "Save Changes" action panel button

  Examples:
    | Login User   | Login full username  | Entity Name |
    | DeleteAccess | Delete Access Access | s0061       |

  Scenario Outline: As a delete user I Changing F/A Start/end date in the bar graph/timeline
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I click and drag the last blue bar Task 4 and move it one day in the past
    Then I verify the task "Task 4" of Status "Not begun" , Done "0" , F/A start date "01/02/2020" ,F/A end date "01/02/2020", F/A Duration "1 day", BL start date "01/03/2020" and BL end date "01/03/2020" shall be reflected correctly on the spreed sheet
    And I switch to default frame
    And I click on the "Save Changes" action panel button

  Examples:
    | Login User   | Login full username  | Entity Name |
    | DeleteAccess | Delete Access Access | s0061       |

  Scenario Outline: As a delete user I Extending F/A Start/End date in the bar graph/timeline
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I click and drag the last blue bar Task 4 and move it one day in the past
    And I Hover over the start of the last blue bar task 4 and drag the task to match the blue bar before it
    Then I verify the task "Task 4" of Status "Not begun" , Done "0" , F/A start date "01/01/2020" ,F/A end date "01/01/2020", F/A Duration "1 day", BL start date "01/03/2020" and BL end date "01/03/2020" shall be reflected correctly on spreed sheet
    And I drag the end of the blue bar to extend to Jan 03
    Then I verify the task "Task 4" of Status "Not begun" , Done "0" , F/A start date "01/01/2020" ,F/A end date "01/03/2020", F/A Duration "2.25 days", BL start date "01/03/2020" and BL end date "01/03/2020" shall be reflected correctly on spreed sheet
    And I switch to default frame
    And I click on the "Save Changes" action panel button

  Examples:
    | Login User   | Login full username  | Entity Name |
    | DeleteAccess | Delete Access Access | s0061       |