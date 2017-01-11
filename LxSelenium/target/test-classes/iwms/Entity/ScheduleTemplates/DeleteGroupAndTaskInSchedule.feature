@all
Feature: (Ref : Jira Ticket No : Automation-906),Delete Group and Task in Schedule

  Scenario Outline: I import file
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | DeleteGroupandTaskSchedule.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user I Delete Group and Task in Schedule

    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not

    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    And I click on the "Schedule" tab
    And I expand gantt chart
    And I open new task information pop up of "Assignee Task D" task
    And I click on "Predecessors" tab
    And I verify the following text in a page
      | Assignee Task C |
      | Assignee Task A |
    And I click on the "Cancel" button

    And I right click on a task "Assignee Task C" and select menu option "Delete task(s)" to delete the task
    And I click on the "Save Changes" action panel button
    And I expand gantt chart
    And I verify the following task not present
      | Assignee Task C |

    And I open new task information pop up of "Assignee Task D" task
    And I click on "Predecessors" tab
    And I verify the following task not present
      | Assignee Task C |
    And I click on the "Cancel" button

    And I right click on a task "Assignee Task D" and select menu option "Delete task(s)" to delete the task
    And I click on the "Save Changes" action panel button
    And I expand gantt chart
    And I verify the following task not present
      | Assignee Task D |

    And I open new task information pop up of "Assignee Task A" task
    And I click on "Successors" tab
    And I verify the following task not present
      | Assignee Task D |
    And I click on the "Cancel" button

    And I right click on a task "Assignee Sub Group" and select menu option "Delete task(s)" to delete the task
    And I click on the "Save Changes" action panel button
    And I verify the following task not present
      | Assignee Sub Group |

    And I right click on a task "Assignee Group" and select menu option "Delete task(s)" to delete the task
#    And I click on the "Save Changes" action panel button
    And I switch to default frame
    And I switch to visible frame
    And I click on the save icon on the schedule grid
    And I verify the following task not present
      | Assignee Group |
    And I switch to default frame
    And I click on "Schedule" tab
    And I wait for the Loading text to disappear
    Then I see "No schedule information found" message in the header

    Examples:
      | Login User   | Login full username  | Entity Name                |
      | DeleteAccess | Delete Access Access | DeleteGroupandTaskSchedule |