@all
Feature: (Ref : Jira Ticket No : Automation-879), Schedule - Tooltip

  Scenario Outline: I import file for Schedule - Tooltip

    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Entity/ScheduleTemplates/"
    And I import following file name:
      | RegressionIndependent-879.xml |
      | ScheduleToolTipTest-879.xml   |

#    And I navigate to entity type "<Item>" named "<Entity Name>"
    And I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header

    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value      |
      | taskTemplateIDToAssign | <Template> |
      | startDate              | 12/31/2030 |
    And I click on the "Append Schedule Template" button
    And I wait for modal window to close
    And I expand gantt chart

    And I open new task information pop up of "On Hold" task
    And I click on "Predecessors" tab in the popup window of edit task
    And I click "Add new" button
    And I enter task name "TaskAdded"
    And I click "Ok" button

    And I open new task information pop up of "On Hold" task
    And I click on "Successors" tab in the popup window of edit task
    And I click "Add new" button
    And I enter task name "Punchlist Complete"
    And I click "Ok" button

    And I open new task information pop up of "On Hold" task
    And I click on "Comments" tab in the popup window of edit task
    And I add "Test 879" comments
    And I click "Ok" button
    And I verify the following schedule tool tip values for the task "On Hold"
      | name           | value              |
      | Comments:      | Test 879           |
      | Successors :   | Punchlist Complete |
      | Predecessors : | TaskAdded          |

#    And I verify the following schedule tool tip values for the task "On Hold" on time line
#      | name           | value              |
#      | Comments:      | Test 879           |
#      | Successors :   | Punchlist Complete |
#      | Predecessors : | TaskAdded          |

    Examples:
      | Login User   | Login full username  | Entity Name                | Template                   | Item     |
      | DeleteAccess | Delete Access Access | Schedule Tool Tip test-879 | Regression Independent-879 | Facility |