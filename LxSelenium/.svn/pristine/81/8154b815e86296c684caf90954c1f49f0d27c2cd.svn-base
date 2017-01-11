@all
Feature: (Ref : Jira Ticket No : AUTOMATION-901) Changing the Task Status to Canceled should change the Duration to Zero

  Scenario Outline: I import file for apply schedule template and S008 location entity
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Facility/Detals/Schedule/"
    And I import following file name:
      | CancelTaskProject.xml    |
      | ScheduleTaskTemplate.xml |

    Examples:
      | Login User   | Login full username  |
      | DeleteAccess | Delete Access Access |


  Scenario Outline: As a delete user Changing the Task Status
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value                   |
      | taskTemplateIDToAssign | Schedule Task Templates |
      | startDate              | 12/31/2020              |
    And I click on the "Append Schedule Template" button
    And I expand gantt chart
    And I open new task information pop up of "A Task Schedule" task
#    And I double click on "A Task Schedule" task
#    And I select task status "Not begun"
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Not begun |
    And I click "Ok" button

    And I switch to default frame
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart

    And I open new task information pop up of "B Task Schedule" task
#    And I double click on "B Task Schedule" task
#    And I select task status "In-process"
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button

    And I switch to default frame
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart

    And I open new task information pop up of "C Task Schedule" task
#    And I double click on "C Task Schedule" task
#    And I select task status "Completed"
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button
    And I verify the following values in "<Grid ID>":
      | name         | value           |
      | Task Name    | A Task Schedule |
      | F/A Start    | 12/31/2020      |
      | F/A End      | 12/31/2020      |
      | F/A Duration | 1 day           |
      | Status       | Not begun       |
      | % Done       | 0               |
    And I verify the following values in "<Grid ID>":
      | name         | value           |
      | Task Name    | B Task Schedule |
      | F/A Start    | [CURRENT DATE]  |
      | F/A End      | [CURRENT DATE]  |
      | F/A Duration | 1 day           |
      | Status       | In-process      |
      | % Done       | 0               |

    And I verify the following values in "<Grid ID>":
      | name         | value           |
      | Task Name    | C Task Schedule |
      | F/A Start    | [CURRENT DATE]  |
      | F/A End      | [CURRENT DATE]  |
      | F/A Duration | 1 day           |
      | Status       | Completed       |
      | % Done       | 100             |


#    Then I verify the task "A Task Schedule" of Status "Not begun" , Done "0" , F/A start date "12/31/2020" ,F/A end date "12/31/2020", F/A Duration "1 day", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
#    Then I verify the task "B Task Schedule" of Status "In-process" , Done "0" , F/A start date "[CURRENTDATE]" ,F/A end date "[CURRENTDATE]", F/A Duration "1 day", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
#    Then I verify the task "C Task Schedule" of Status "Completed" , Done "100" , F/A start date "[CURRENTDATE]" ,F/A end date "[CURRENTDATE]", F/A Duration "1 day", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name         | Grid ID           |
      | DeleteAccess | Delete Access Access | Cancel Task Project | ^Lx-ui-GanttPanel |

  Scenario Outline: As a delete user Changing the Task Status to Canceled should change the Duration to Zero
    Given I Login to IWMS using "<Login User>" access credentials
    And I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart
    And I open new task information pop up of "A Task Schedule" task
#    And I double click on "A Task Schedule" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
#    And I select task status "Canceled"
    And I click "Ok" button

    And I switch to default frame
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart

    And I open new task information pop up of "B Task Schedule" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |

#    And I double click on "B Task Schedule" task
#    And I select task status "Canceled"
    And I click "Ok" button

    And I switch to default frame
    And I click on the "Schedule" tab
    And I switch to visible frame
    And I expand gantt chart

    And I open new task information pop up of "C Task Schedule" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
#    And I double click on "C Task Schedule" task
#    And I select task status "Canceled"
    And I click "Ok" button
    And I switch to default frame

    And I click on the "Schedule" tab
    And I expand gantt chart
    And I verify the following values in "<Grid ID>":
      | name         | value           |
      | Task Name    | A Task Schedule |
      | F/A Start    | 12/31/2020      |
      | F/A End      | 12/31/2020      |
      | F/A Duration | 0 days          |
      | Status       | Canceled        |
      | % Done       | 0               |
    And I verify the following values in "<Grid ID>":
      | name         | value           |
      | Task Name    | B Task Schedule |
      | F/A Start    | 12/31/2020      |
      | F/A End      | 12/31/2020      |
      | F/A Duration | 0 days          |
      | Status       | Canceled        |
      | % Done       | 0               |

    And I verify the following values in "<Grid ID>":
      | name         | value           |
      | Task Name    | C Task Schedule |
      | F/A Start    | 12/31/2020      |
      | F/A End      | 12/31/2020      |
      | F/A Duration | 0 days          |
      | Status       | Canceled        |
      | % Done       | 100             |

#    Then I verify the task "A Task Schedule" of Status "Canceled" , Done "0" , F/A start date "12/31/2020" ,F/A end date "12/31/2020", F/A Duration "0 day", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
#    Then I verify the task "B Task Schedule" of Status "Canceled" , Done "0" , F/A start date "12/31/2020" ,F/A end date "12/31/2020", F/A Duration "0 day", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
#    Then I verify the task "C Task Schedule" of Status "Canceled" , Done "100" , F/A start date "12/31/2020" ,F/A end date "12/31/2020", F/A Duration "0 day", BL start date "12/31/2020" and BL end date "12/31/2020" shall be reflected correctly on spreed sheet
#    And I switch to default frame

    Examples:
      | Login User   | Login full username  | Entity Name         | Grid ID           |
      | DeleteAccess | Delete Access Access | Cancel Task Project | ^Lx-ui-GanttPanel |