@all
Feature: Multiple Predecessor Template Scenario 1 - Finish on date in future (Ref : Jira Ticket No : AUTOMATION-1323)

  Scenario Outline: I import the following files
    Given I Login to IWMS using "<Login User>" access credentials
    Then I check previous user login "<Login full username>" and continue if user "<Login User>" same or logout and login if not
    When I used data files from "Data/ImportDataFiles/iwms/Project/Details/Schedule/"
    And I import following file name:
      | AMultiplePredecessorTemplate_1323.xml |
      | 10940Project_1323.xml                 |

  Examples:
    | Login User   | Login full username  |
    | DeleteAccess | Delete Access Access |

  Scenario Outline: As a delete user I applying a "A Multiple Predecessor Relationship" Template to Testing 10940 Project entity
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I click on the "Apply Template" action panel button
    When I set following fields value on editable page
      | name                   | value                               |
      | taskTemplateIDToAssign | A Multiple Predecessor Relationship |
      | stopDate               | 12/31/2020                          |
    And I click on the "Append Schedule Template" button

  Examples:
    | Entity Name           |
    | Testing 10940 Project |

  Scenario Outline: As a delete user I verify the One Predecessor is Not begun and one is In-process - complete the successor in future
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Multiple Predecessor 1.1" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Not begun |
    And I click "Ok" button

    And I double click on "Multiple Predecessor 1.2" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button

    And I double click on "Multiple Successor 1" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "Multiple Group 1", status "In-process", % Done "33", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "12/24/2020" pluse 0 days,BL Start "12/24/2020" and BL End "12/30/2020"
    And I verify the task name "Multiple Predecessor 1.1", status "Not begun", % Done "0", F/A Start is "12/24/2020" pluse 0 days,F/A End is "12/24/2020" pluse 0 days, F/A Duration "1 day", BL Start "12/24/2020" and BL End "12/24/2020"
    And I verify the task name "Multiple Predecessor 1.2", status "In-process", % Done "0", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/28/2020" and BL End "12/28/2020"
    And I verify the task name "Multiple Successor 1", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/30/2020" and BL End "12/30/2020"

    And I switch to default frame

  Examples:
    | Entity Name           |
    | Testing 10940 Project |

  Scenario Outline: As a delete user I verify the One Predecessor is Canceled and one is In-process - Complete Successor In Future
    Given I Login to IWMS using "DeleteAccess" access credentials
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Multiple Predecessor 2.1" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I double click on "Multiple Predecessor  2.2" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button

    And I double click on "Multiple Successor 2" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "Multiple Group 2", status "In-process", % Done "33", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 1 days, F/A Duration "2 days", BL Start "12/28/2020" and BL End "12/31/2020"
    And I verify the task name "Multiple Predecessor 2.1", status "Canceled", % Done "0", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "0 days", BL Start "12/24/2020" and BL End "12/24/2020"
    And I verify the task name "Multiple Predecessor  2.2", status "In-process", % Done "0", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 1 days, F/A Duration "2 days", BL Start "12/28/2020" and BL End "12/29/2020"
    And I verify the task name "Multiple Successor 2", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/31/2020" and BL End "12/31/2020"

    And I switch to default frame

  Examples:
    | Entity Name           |
    | Testing 10940 Project |


  Scenario Outline: As a delete user I verify the One Predecessor is Canceled and one is Not Begun - Complete Successor In Future
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Multiple Predecessor  3.1" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I double click on "Multiple Predecessor 3.2" task
    And I set task Status on edit popup of a task
      | name             | value      |
      | CodeTaskStatusID | In-process |
    And I click "Ok" button

    And I double click on "Multiple Successor 3" task
    And I set task Status on edit popup of a task
      | name             | value     |
        | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "Multiple Group 3", status "In-process", % Done "33", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 1 days, F/A Duration "2 days", BL Start "12/28/2020" and BL End "12/30/2020"
    And I verify the task name "Multiple Predecessor  3.1", status "Canceled", % Done "0", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "0 days", BL Start "12/24/2020" and BL End "12/25/2020"
    And I verify the task name "Multiple Predecessor 3.2", status "In-process", % Done "0", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 1 days, F/A Duration "2 days", BL Start "12/28/2020" and BL End "12/29/2020"
    And I verify the task name "Multiple Successor 3", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/30/2020" and BL End "12/30/2020"

    And I switch to default frame

  Examples:
    | Entity Name           |
    | Testing 10940 Project |


  Scenario Outline: As a delete user I verify the One Predecessor is Completed and one is Canceled - Complete Successor In Future
    When I Search for the "<Entity Name>" that was created
    And Click on the name of the "<Entity Name>" in the results pop-up
    Then I see "<Entity Name>" name on the header
    Then I navigate to "Details"
    And I click on the "Schedule" tab
    And I expand gantt chart

    And I double click on "Multiple Predecessor 4.1" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I double click on "Multiple Predecessor 4.2" task
    And I set task Status on edit popup of a task
      | name             | value    |
      | CodeTaskStatusID | Canceled |
    And I click "Ok" button

    And I double click on "Multiple Successor 4" task
    And I set task Status on edit popup of a task
      | name             | value     |
      | CodeTaskStatusID | Completed |
    And I click "Ok" button

    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I drag the vertical split bar to right
    And I verify the task name "Multiple Group 4", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/24/2020" and BL End "12/28/2020"
    And I verify the task name "Multiple Predecessor 4.1", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/24/2020" and BL End "12/24/2020"
    And I verify the task name "Multiple Predecessor 4.2", status "Canceled", % Done "0", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "0 days", BL Start "12/28/2020" and BL End "12/29/2020"
    And I verify the task name "Multiple Successor 4", status "Completed", % Done "100", F/A Start is "[CURRENT DATE]" pluse 0 days,F/A End is "[CURRENT DATE]" pluse 0 days, F/A Duration "1 day", BL Start "12/28/2020" and BL End "12/28/2020"

    And I switch to default frame

  Examples:
    | Entity Name           |
    | Testing 10940 Project |